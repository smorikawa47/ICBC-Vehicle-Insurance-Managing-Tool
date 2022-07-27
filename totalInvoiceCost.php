<?php
    include 'connect.php';
    $conn = OpenCon();

    if(isset($_POST['submit'])){    
        $eventNo = $_POST['eventNo'];

        // Enter eventNo, fetch the SUM of all Invoice records that match the eventNo
        // $sql = "SELECT * FROM Incurs INNER JOIN Bill ON Incurs.invoiceNo = Bill.invoiceNo WHERE eventNo = $eventNo"; 
        // $result = $conn->query($sql);
        // //display data on web page
        // while($row = mysqli_fetch_array($result)){
        //     echo " EVENT NUMBER : ". $row['eventNo'], " ----- INVOICE NUBMBER : ". $row['invoiceNo'] ," ----- AMOUNT : ". $row['amount'] ;
        //     echo "<br>";
              
        // }

        $sql =
        "SELECT SUM(amount) AS res FROM Incurs INNER JOIN Bill ON Incurs.invoiceNo = Bill.invoiceNo WHERE eventNo = $eventNo";
        $result = $conn->query($sql);

        if(mysqli_query($conn, $sql)){
            $row = mysqli_fetch_array($result);
            echo "The total amount is: " . $row['res'];
        } 
        else{
            echo "Error: " . $sql . ":-" . mysqli_error($conn);
        }
        mysqli_close($conn);
    }
?>