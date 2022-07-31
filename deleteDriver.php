<?php
    include 'connect.php';
    $conn = OpenCon();

    if(isset($_POST['submit'])){    
        $licenseNo = $_POST['licenseNo'];
        
        $sql =
        "DELETE FROM License WHERE licenseNo = $licenseNo";

        if(mysqli_query($conn, $sql)){
            echo "Driver deleted successfully!" . "<br>" . "License No: $licenseNo"; 
        } 
        else{
            echo "Error: " . $sql . ":-" . mysqli_error($conn);
        }
        mysqli_close($conn);
    }
?>