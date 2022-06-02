<?php
    include_once("configDB.php");
    session_start();

    if ($_SERVER['REQUEST_METHOD'] == 'POST'){
        if (isset($_POST['name']) && isset($_POST['surname']) && isset($_POST['email']) && isset($_POST['psw'])){
            $_SESSION['name'] = $_POST["name"];
            $_SESSION['surname'] = $_POST["surname"];
            $_SESSION['email'] = $_POST["email"];
            $_SESSION['psw'] = $_POST["psw"];
            $_SESSION['dateOfBirth'] = $_POST['dateOfBirth'];
            $_SESSION['country'] = $_POST['country'];
            $_SESSION['handicap'] = $_POST['handicap'];
            $_SESSION['initials'] = $_POST['initials'];
            $_SESSION['telNo'] = $_POST['telNo'];
            if (isset($_POST['genderMale'])){
                $_SESSION['genderType'] = $_POST['genderMale'];
            }
            else if (isset($_POST['genderFemale'])){
                $_SESSION['genderType'] = $_POST['genderFemale'];
            }
            else if (isset($_POST['genderOther'])){
                $_SESSION['genderType'] = $_POST['genderOther'];
            }
            else{
                $_SESSION['genderType'] = "";
            }

            if (isset($_POST['adminType'])){
                $_SESSION['userType'] = $_POST['adminType'];
            }
            else if (isset($_POST['playerType'])){
                $_SESSION['userType'] = $_POST['playerType'];
            }
            else{
                $_SESSION['userType'] = "";
            }
            
            if (!preg_match("/^[A-Z][a-z]+$/",$_SESSION['name']) ){
                $_SESSION['messages'] = 'Invalid Name. The name must start with a capital and can only contain characters [a-z].';
                header("Location: ../signup.php");
            }
            else if(!preg_match("/^[A-Z][a-z]+$/",$_SESSION['surname'])){
                $_SESSION['messages'] = 'Invalid Surname. The surname must start with a capital and can only contain characters [a-z].';
                header("Location: ../signup.php");
            }
            else if(!preg_match("/^[0-9]{4}\/(0[1-9]|1[0-2])\/(0[1-9]|[1-2][0-9]|3[0-1])$/",$_SESSION['dateOfBirth'])){
                $_SESSION['messages'] = "Invalid Date format. Format needs to be in YYYY/MM/DD.";
                header("Location: ../signup.php");
            }
            else if (!preg_match("/^[A-Z][a-z]+$/",$_SESSION['country']) ){
                $_SESSION['messages'] = 'Invalid Country. The country must start with a capital and must only contain characters [a-z].';
                header("Location: ../signup.php");
            }
            else if(!preg_match("/^[0-9]|[1-4][0-9]|[5][0-4]$/")){ //test valid range 0-54
                $_SESSION['messages'] = 'Invalid handicap value. The value must be a whole number between [0-54].';
                header("Location: ../signup.php");
            }
            else if(!preg_match("/^\w*@\w+([\.-]?\w+)*(\.[A-Za-z]{2,4})+$/",$_SESSION['email'])){
                $_SESSION['messages'] = 'Invalid Email. The email must be in the format: something@example.com';
                header("Location: ../signup.php");
            }
            else if(!preg_match("/^(?=.{8,}$)(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W).*$/",$_SESSION['psw'])){
                $_SESSION['messages'] = 'Invalid Password. It needs to contain: at least 8 characters, uppercase and lowercase characters, numeric digits and at least one symbol [&,%,$,etc.]';
                header("Location: ../signup.php");
            }
            else if($_SESSION['initials'] != "" && !preg_match(/^[A-Z]+$)){
                $_SESSION['messages'] = 'Invalid input for Initials. Initials must be in captitals [A-Z].';
                header("Location: ../signup.php");
            }
            else if(!preg_match("/^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$/",$_SESSION['telNo'])){
                $_SESSION['messages'] = "Invalid telephone number. Please ensure that your telephone number only contains digits.";
                header("Location: ../signup.php");
            }
            else if($_SESSION['genderType'] == ""){
                $_SESSION['messages'] = "You did not select a Gender. Please do so.";
                header("Location: ../signup.php");
            }
            else if($_SESSION['userType']==""){
                $_SESSION['messages'] = "You did specify whether you are a player or an admin. Please do so.";
                header("Location: ../signup.php");
            }
            else{
                $name = $_POST['name'];
                $surname = $_POST['surname'];
                $email = $_POST['email'];
                $password = $_POST['psw'];
                $dateOfBirth = $_POST['dateOfBirth'];
                $country = $_POST['country'];
                $telNo = $_POST['telNo'];
                $userType = $_POST['userType'];
                $initials = $_POST['initials'];
                //first check if the email address exists
                $select = mysqli_query($conn, "SELECT * FROM usersTBL WHERE Email = ?");
                $select->bind_param("s",$email);
                $select->execute();
                $result = $select->get_result();

                if(mysqli_num_rows($result) > 0) {
                    $_SESSION['messages'] = 'That email address is already in use.';
                    header("Location: ../signup.php");
                }      
                else{          
                    //encrypt the password
                    $hashed_psw = password_hash($password, PASSWORD_DEFAULT, array('cost' => 10));
                    
                    //insert user into database
                    $query = "INSERT INTO usersTBL (Email, Password, TelNo, Type, FirstName, Init, LastName) 
                    VALUES (?,?,?,?,?,?,?)";
                    $query->bind_param("sss", $email, $password, $telNo, $userType, $name, $initials, $surname);
                    $query->execute();
                    $result = $query->get_result();
                    
                    if ($query){
                        //Success
                        //we don't want to be redirected to another page, we just want a popup to display
                        echo "
                            <script> 
                                document.getElementById("SuccessfulRegPopup").style.visibility = "visible"; 
                                $("'#'SuccessfulRegPopup").fadeIn("slow");
                            </script>
                        ";
                    }
                    else{
                        $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                        error_reporting(E_ALL);
                        header("Location: ../signup.php");
                        // echo "Error connecting to database: " . $conn->error;
                    }

                    $conn->close();
                }
            }
        }
    }

?>