<?php
    include 'connect.php';
    $conn = OpenCon();

    if(isset($_POST['submit'])){    
        $licenseNo = $_POST['licenseNo'];
        $ownerName = $_POST['ownerName'];
        $age = $_POST['age'];
        $householdAddress = $_POST['householdAddress'];
        $noCarsHH = $_POST['noCarsHH'];
        $noDriversHH = $_POST['noDriversHH'];
        $licenseClass = $_POST['licenseClass'];
        $restrictions = $_POST['restrictions'];
        $noCars = $_POST['noCars'];


        $sql = "INSERT INTO License VALUES ('$licenseNo', '$licenseClass', '$restrictions');
                INSERT INTO CarOwner VALUES ('$licenseNo', '$ownerName', '$age', '$noCars'); 
                INSERT INTO Household VALUES ('$householdAddress', '$noCarsHH', $noDriversHH);
                INSERT INTO belongTo VALUES ('$householdAddress', '$licenseNo')";

        if(mysqli_multi_query($conn, $sql)){
            echo "Driver registered successfully!" . "<br>" . "$ownerName, $age year(s) old, with license number $licenseNo, residential address $householdAddress" . "<br>" . "License Class: $licenseClass, Restrictions: $restrictions"; 
        } 
        else{
            echo "Error: " . $sql . ":-" . mysqli_error($conn);
        }
        mysqli_close($conn);
    }
?>