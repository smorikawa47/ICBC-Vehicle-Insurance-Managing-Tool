<?php
    include 'connect.php';
    $conn = OpenCon();

    if(isset($_POST['submit'])){
        $sql = 
        "SELECT MAX(AveragesByLocation.avg) AS average, eventLoc AS loc
        FROM (SELECT AVG(amount) AS avg, eventLoc 
        FROM Bill 
        INNER JOIN Incurs ON Incurs.invoiceNo = Bill.invoiceNo 
        INNER JOIN Incident ON Incident.eventNo = Incurs.eventNo 
        GROUP BY eventLoc) AveragesByLocation";
        
        $result = $conn->query($sql);

        if(mysqli_query($conn, $sql)){
            $row = mysqli_fetch_array($result);
            echo "'" . $row['loc'] . "'" . " has the highest average invoice cost of $" . $row['average'];
        } 
        else{
            echo "Error: " . $sql . ":-" . mysqli_error($conn);
        }
        mysqli_close($conn);
    }
?>