<?php
    require_once("setDBEnvVar.php");
    include_once("configDB.php");
    session_start();

    if ($_SERVER['REQUEST_METHOD'] == 'POST'){
        if (isset($_POST['name']) && isset($_POST['surname']) && isset($_POST['email']) && isset($_POST['psw'])){
            $_SESSION['name'] = $_POST["name"];
            $_SESSION['surname'] = $_POST["surname"];
            $_SESSION['email'] = $_POST["email"];
            $_SESSION['psw'] = $_POST["psw"];
            
            
            $name = $_POST['name'];
            $surname = $_POST['surname'];
            $email = $_POST['email'];
            $password = $_POST['psw'];

            $invalidDetails = false;
            //first check if the name exists
            $select = $conn->prepare("SELECT * FROM users WHERE first_name = ?");
            $select->bind_param("s", $name);
            $select->execute();
            $result = $select->get_result();

            if(mysqli_num_rows($result) == 0) { //check to see if any records returned
                $_SESSION['error'] = "Errors found.";
                $_SESSION['errorName'] = 'No user exists with First Name: '.$name;
                $invalidDetails = true;
            }  
            //check if the surname exists
            $select = $conn->prepare("SELECT * FROM users WHERE last_name = ?");
            $select->bind_param("s", $surname);
            $select->execute();
            $result = $select->get_result();

            if(mysqli_num_rows($result) == 0) { //check to see if any records returned
                $_SESSION['error'] = "Errors found.";
                $_SESSION['errorSurname'] = 'No user exists with Last Name: '.$surname;
                $invalidDetails = true;
            }
            // check if the email address exists
            $select = $conn->prepare("SELECT * FROM users WHERE email = ?");
            $select->bind_param("s", $email);
            $select->execute();
            $result = $select->get_result();

            if(mysqli_num_rows($result) == 0) { //check to see if any records returned
                $_SESSION['error'] = "Errors found.";
                $_SESSION['errorEmail'] = 'No user exists with Email: '.$email;
                $invalidDetails = true;
            }  
            
            if ($invalidDetails == true){
                header("Location: login.php"); //redirect with the errors back to the login page
            }
            else{   
                //now get the hashed pw from the DB since all other fields are correct
                // check if password exists
                $select = $conn->prepare("SELECT * FROM users WHERE first_name = ? AND last_name = ? AND email = ?");
                $select->bind_param("sss", $name, $surname, $email);
                $select->execute();
                $result = $select->get_result();
                
                $row = mysqli_fetch_assoc($result); //fetch records returned
                
                //check if input password matched unhashed password
                if(!($password === $row['password'])) {
                    $_SESSION['error'] = "Errors found.";
                    $_SESSION['errorPsw'] = 'Password incorrect or does not exist!';
                    header("Location: login.php"); //redirect with the errors back to the login page
                }  
                else if($row['user_type'] != "Admin"){ //test if returned record's type attribute == Admin
                    $_SESSION['error'] = "Errors found";
                    $_SESSION['errorAccessDenied'] = "Access Denied! Only Admins are allowed to login.";
                }
                else{                         
                    //set session login status to success
                    setcookie('loginStatus',"success",0,'/');
                    setcookie('userName',$name.' '.$surname,0,'/');
                    //finally return to Login successful page
                    header("Location: login.php");

                    $conn->close();
                }
            }
        }
    }

?>