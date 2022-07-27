<?php
    include 'connect.php';
    $conn = OpenCon();

    if(isset($_POST['submit'])){    
        $eventNo = $_POST['eventNo'];
        
        $sql =
        "DELETE FROM Incident WHERE eventNo = $eventNo";

        if(mysqli_query($conn, $sql)){
            echo "Incident deleted successfully!" . "<br>" . "Event No: $eventNo"; 
        } 
        else{
            echo "Error: " . $sql . ":-" . mysqli_error($conn);
        }
        mysqli_close($conn);
    }
?>