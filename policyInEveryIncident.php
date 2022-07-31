<?php
    function myTable($obConn,$sql){
        $rsResult = mysqli_query($obConn,
        $sql) or die(mysqli_error($obConn));
        if(mysqli_num_rows($rsResult)>0){
            echo "<table width=\"100%\" border=\"0\" cellspacing=\"2\"
                    cellpadding=\"0\"><tr align=\"center\" bgcolor=\"#CCCCCC\">";
            $i = 0;
            while ($i < mysqli_num_fields($rsResult)){
                $field = mysqli_fetch_field_direct($rsResult, $i);
                $fieldName=$field->name;
                echo "<td><strong>$fieldName</strong></td>";
                $i = $i + 1;
            }
            echo "</tr>";

            $bolWhite=true;
            while ($row = mysqli_fetch_assoc($rsResult)) {
                echo $bolWhite ? "<tr bgcolor=\"#CCCCCC\">" : "<tr bgcolor=\"#FFF\">";
                $bolWhite=!$bolWhite; 
                foreach($row as $data) {
                    echo "<td>$data</td>";
                }
                echo "</tr>";
            }
            echo "</table>";
        }
    }

    include 'connect.php';
    $conn = OpenCon();

    if(isset($_POST['submit'])){    
        
        # Get insurance policies that are used in every incident
            # i.e. Basic insurance may apply to every incident, regardless of the exact details. We can think of this as a minimum.
        # Big picture idea: From the list of all insurance policies (Insurance.policyNo), subtract the bad insurance policies
            # Bad insurance policies are defined to be any insurance policy that was not used in an incident
            # We derive bad insurance policies as follows: 
                # From Incurs, subtract the list of distinct list of insurance policies from PaysFor

        $sql = 
        "SELECT Insurance.policyNo FROM Insurance WHERE Insurance.policyNo NOT IN 
        (SELECT DISTINCT allIncidentAndPolicy.policyNo FROM allIncidentAndPolicy WHERE NOT EXISTS 
        (SELECT policyUsedInIncident.policyNo  
            FROM policyUsedInIncident 
                WHERE policyUsedInIncident.eventNo = allIncidentAndPolicy.eventNo 
                    AND policyUsedInIncident.policyNo = allIncidentAndPolicy.policyNo));";

        myTable($conn,$sql);

        // if(mysqli_query($conn, $sql)){
        //     $row = mysqli_fetch_array($result);
        //     echo "The total amount is: " . $row['res'];
        // } 
        // else{
        //     echo "Error: " . $sql . ":-" . mysqli_error($conn);
        // }
        mysqli_close($conn);
    }
?>