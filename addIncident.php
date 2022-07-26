<?php
    include 'connect.php';
    $conn = OpenCon();

    if(isset($_POST['submit'])){    
        $eventNo = $_POST['eventNo'];
        $time = $_POST['time'];
        $location = $_POST['location'];
        $noCars = $_POST['noCars'];

        $sql = 
        "INSERT INTO Incident VALUES ('$eventNo', '$noCars', '$time','$location')";

        if(mysqli_query($conn, $sql)){
            echo "Incident added successfully!" . "<br>" . "Event No: $eventNo, No. Cars: $noCars, Timestamp: $time, Location: $location"; 
        } 
        else{
            echo "Error: " . $sql . ":-" . mysqli_error($conn);
        }
        mysqli_close($conn);
    }
?>