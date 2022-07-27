<?php
    include 'connect.php';
    $conn = OpenCon();

    if(isset($_POST['submit'])){    
        $licenseNo = $_POST['licenseNo'];
        $companyID = $_POST['companyID'];
        $licensePlate = $_POST['licensePlate'];
        $make = $_POST['make'];
        $model = $_POST['model'];
        $modelYear = $_POST['modelYear'];

        $policyNo = $_POST['policyNo'];
        $cost = $_POST['cost'];
        $coverage = $_POST['coverage'];

        if($licenseNo){
            $sql = "INSERT INTO Vehicle VALUES ('$licensePlate', '$make', '$model', '$modelYear'); 
                    INSERT INTO Vehicle_OwnedByDriver VALUES ('$licenseNo', '$licensePlate');
                    
                    INSERT INTO Insurance VALUES ('$policyNo', '$cost', '$coverage');
                    INSERT INTO coveredBy VALUES ('$policyNo', '$licensePlate');";
        }
        else{
            $sql = "INSERT INTO Vehicle VALUES ('$licensePlate', '$make', '$model', '$modelYear'); 
                    INSERT INTO Vehicle_OwnedByCompany VALUES ('$companyID', '$licensePlate');

                    INSERT INTO Insurance VALUES ('$policyNo', '$cost', '$coverage');
                    INSERT INTO coveredBy VALUES ('$policyNo', '$licensePlate');";
        }

        if(mysqli_multi_query($conn, $sql)){
            echo "Vehicle registered successfully!" . "<br>" . "License Plate: $licensePlate, Vehicle: $modelYear $make $model, registered to $licenseNo $companyID" . "<br>" . "Insurance Policy No. $policyNo for $$cost/mo with $coverage."; 
        } 
        else{
            echo "Error: " . $sql . ":-" . mysqli_error($conn);
        }
        mysqli_close($conn);
    }
?>