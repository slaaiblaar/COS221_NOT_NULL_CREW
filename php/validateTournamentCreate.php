<?php
    include_once("configDB.php");
    session_start();

    if ($_SERVER['REQUEST_METHOD'] == 'POST'){
        if (!(isset($_POST['eventKey']) && isset($_POST['startDate']) && isset($_POST['endDate']) && isset($_POST['duration']) && isset($_POST['status']) && isset($_POST['gender']) && isset($_POST['year']))){
            $_SESSION['eventKey'] = $_POST['eventKey'];
            $_SESSION['startDate'] = $_POST['startDate'];
            $_SESSION['endDate'] = $_POST['endDate'];
            $_SESSION['duration'] = $_POST['duration'];            
            $_SESSION['gender'] = $_POST['gender'];          
            $_SESSION['status'] = $_POST['status'];          
            $_SESSION['year'] = $_POST['year'];
            
            if(!preg_match("/^[A-Z][a-z]+\s([a-z]+|[A-Z][a-z]+)$/",$_SESSION['eventKey'])){
                $_SESSION['messages'] = "Invalid event name format. Format needs to start with a capital letter and only contain characters.";
                header("Location: viewTournaments.php");
            }
            else if ($_SESSION['endDate'] < $_SESSION['startDate'])
            {
                $_SESSION['messages'] = "Invalid dates. Please make sure the end date is after the chosen start date.";
                header("Location: viewTournaments.php");
            }
            else{
                $eventName = $_POST['eventKey'];
                $startDate = $_POST['startDate'];
                $endDate = $_POST['endDate'];
                $duration = $_POST['duration'];                
                $gender = $_POST['gender'];
                $status = $_POST['status'];
                $year = $_POST['year'];
                
                //insert user into database
                $query = "INSERT INTO events (event_key, start_date_time, end_date_time, duration, `status`, gender, `year`) 
                VALUES (?,?,?,?,?,?)";
                $query->bind_param("sssissi", $eventName, $startDate, $endDate, $duration, $status, $gender, $year);
                $query->execute();
                $result = $query->get_result();
                
                if ($query){
                    //Success
                    //we don't want to be redirected to another page, we just want a popup to display
                    header("Location: viewTournaments.php")
                }
                else{
                    $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                    error_reporting(E_ALL);
                    header("Location: viewTournaments.php");
                    // echo "Error connecting to database: " . $conn->error;
                }

                $conn->close();
            }
        }
    }
    // function validateID_DoB($ID,$DoB){
    //     if (substr($ID, 0,2) != substr($DoB,8) || substr($ID, 2,4) != substr($DoB,0,2) || substr($ID, 4,6) != substr($DoB,3,5)){
    //         return FALSE;
    //     }
    //     return TRUE;
    // }
?>