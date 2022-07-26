<?php
    include 'connect.php';
    $conn = OpenCon();

    if(isset($_POST['submit'])){    
        $eventNo = $_POST['eventNo'];
        $licensePlate = $_POST['licensePlate'];
        $atFault = $_POST['atFault'];

        $sql = 
        "INSERT INTO involvedIn VALUES ('$eventNo', '$licensePlate', '$atFault')";

        if(mysqli_query($conn, $sql)){
            echo "Incident linked successfully!" . "<br>" . "License Plate $licensePlate was involved in Event $eventNo and is $atFault% at fault."; 
        } 
        else{
            echo "Error: " . $sql . ":-" . mysqli_error($conn);
        }
        mysqli_close($conn);
    }
?>