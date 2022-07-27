<?php
    include 'connect.php';
    $conn = OpenCon();

    if(isset($_POST['submit'])){    
        $policyNo = $_POST['policyNo'];
        $newCost = $_POST['newCost'];
        $newCoverage = $_POST['newCoverage'];

        $sql = "UPDATE Insurance
                       SET cost = '$newCost', coverage = '$newCoverage'
                       WHERE policyNo = '$policyNo'";

        if(mysqli_query($conn, $sql)){
            echo "Insurance coverage updated successfully!" . "<br>" . "$policyNo now costs $$newCost/mo with $newCoverage."; 
        } 
        else{
            echo "Error: " . $sql . ":-" . mysqli_error($conn);
        }
        mysqli_close($conn);
    }
?>