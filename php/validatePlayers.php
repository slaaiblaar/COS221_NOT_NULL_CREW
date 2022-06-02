<?php
    include_once("configDB.php");
    session_start();

    if ($_SERVER['REQUEST_METHOD'] == 'POST'){
        if (!(isset($_POST['dateOfBirth']) && isset($_POST['handicap']) && isset($_POST['age']) && isset($_POST['gender']) && isset($_POST['idNumber']) )){
            $_SESSION['dateOfBirth'] = $_POST['dateOfBirth'];
            $_SESSION['handicap'] = $_POST['handicap'];
            $_SESSION['age'] = $_POST['age'];
            $_SESSION['gender'] = $_POST['gender'];
            $_SESSION['idNumber'] = $_POST['idNumber'];
            
            if(!preg_match("/^(0[1-9]|1[0-2])\/(0[1-9]|[1-2][0-9]|3[0-1])\/[0-9]{4}$/",$_SESSION['dateOfBirth'])){
                $_SESSION['messages'] = "Invalid Date format. Format needs to be in MM/DD/YYY.";
                header("Location: ../managePlayers.php");
            }
            else if(!preg_match("/^[0-9]|[1-4][0-9]|[5][0-4]$/")){ //test valid range 0-54
                $_SESSION['messages'] = 'Invalid handicap value. The value must be a whole number between [0-54].';
                header("Location: ../managePlayers.php");
            }
            else if($_SESSION['gender'] == ""){
                $_SESSION['messages'] = "You did not select a Gender. Please do so.";
                header("Location: ../managePlayers.php");
            }
            else if(!preg_match("/^[0-9]{13}$/",$_SESSION['idNumber']) && !validateID_DoB()){
                $_SESSION['messages'] = "Invalid ID or Date of Birth. Ensure the the ID's first 6 digits reflect the Date of Birth.";
                header("Location: ../managaePlayers.php")
            }
            else{
                $dateOfBirth = $_POST['dateOfBirth'];
                $handicap = $_POST['handicap'];
                $age = $_POST['age'];
                $gender = $_POST['gender'];
                $idNumber = $_POST['idNumber'];
                
                //insert user into database
                $query = "INSERT INTO persons (person_key, gender, birth_date, death_date, age, handicap) 
                VALUES (?,?,?,?,?,?)";
                $query->bind_param("ssssii", $idNumber, $gender, $dateOfBirth, null, $age, $handicap);
                $query->execute();
                $result = $query->get_result();
                
                if ($query){
                    //Success
                    //we don't want to be redirected to another page, we just want a popup to display
                    echo "
                        <script> 
                            document.getElementById("fullScreenPopupReg").style.visibility = "visible"; 
                            $("'#'fullScreenPopupReg").fadeIn("slow");
                            document.getElementById("fullScreenPopupAdd").style.visisbility = "hidden";
                            $("'#'fullScreenPopupAdd").fadeOut("slow");
                        </script>
                    ";
                }
                else{
                    $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                    error_reporting(E_ALL);
                    header("Location: ../managePlayers.php");
                    // echo "Error connecting to database: " . $conn->error;
                }

                $conn->close();
            }
        }
    }
    function validateID_DoB($ID,$DoB){
        if (substr($ID, 0,2) != substr($DoB,8) || substr($ID, 2,4) != substr($DoB,0,2) || substr($ID, 4,6) != substr($DoB,3,5)){
            return FALSE;
        }
        return TRUE;
    }
MM/DD/YYYY
?>