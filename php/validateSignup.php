<?php
    include_once("configDB.php");
    session_start();

    if ($_SERVER['REQUEST_METHOD'] == 'POST'){
        if (isset($_POST['name']) && isset($_POST['surname']) && isset($_POST['email']) && isset($_POST['psw'])){
            $_SESSION['name'] = $_POST["name"];
            $_SESSION['surname'] = $_POST["surname"];
            $_SESSION['email'] = $_POST["email"];
            $_SESSION['psw'] = $_POST["psw"];
            // $_SESSION['dateOfBirth'] = $_POST['dateOfBirth'];
            // $_SESSION['country'] = $_POST['country'];
            // $_SESSION['handicap'] = $_POST['handicap'];
            $_SESSION['initials'] = $_POST['initials'];
            $_SESSION['telNo'] = $_POST['telNo'];
            // if (isset($_POST['genderMale'])){
            //     $_SESSION['genderType'] = $_POST['genderMale'];
            // }
            // else if (isset($_POST['genderFemale'])){
            //     $_SESSION['genderType'] = $_POST['genderFemale'];
            // }
            // else if (isset($_POST['genderOther'])){
            //     $_SESSION['genderType'] = $_POST['genderOther'];
            // }
            // else{
            //     $_SESSION['genderType'] = "";
            // }
            $_SESSION['userType'] = $_POST['userType'];
            
            if ($_COOKIE['InsideUsers']=="True" && !preg_match("/^[A-Z][a-z]+$/",$_SESSION['name']) ){
                $_SESSION['messages'] = 'Invalid Name. The name must start with a capital and can only contain characters [a-z].';
               $_SESSION['showAddMenu'] = "true";
                header("Location: manageUsers.php");
            }
            else if ($_COOKIE['InsideSignup']=="True" && !preg_match("/^[A-Z][a-z]+$/",$_SESSION['name']) ){
                $_SESSION['messages'] = 'Invalid Name. The name must start with a capital and can only contain characters [a-z].';
               $_SESSION['showAddMenu'] = "true";
                header("Location: signup.php");
            }
            else if($_COOKIE['InsideUsers']=="True" && !preg_match("/^[A-Z][a-z]+$/",$_SESSION['surname'])){
                $_SESSION['messages'] = 'Invalid Surname. The surname must start with a capital and can only contain characters [a-z].';
               $_SESSION['showAddMenu'] = "true";
                header("Location: manageUsers.php");
            }
            else if($_COOKIE['InsideSignup']=="True" && !preg_match("/^[A-Z][a-z]+$/",$_SESSION['surname'])){
                $_SESSION['messages'] = 'Invalid Surname. The surname must start with a capital and can only contain characters [a-z].';
               $_SESSION['showAddMenu'] = "true";
                header("Location: signup.php");
            }
            else if($_COOKIE['InsideUsers']=="True" && !empty($_SESSION['initials'])&&!preg_match("/^[A-Z]+$/",$_SESSION['initials'])){
                $_SESSION['messages'] = 'Invalid initials. The initials must start with a capital and can only contain characters [a-z].';
               $_SESSION['showAddMenu'] = "true";
                header("Location: manageUsers.php");
            }
            else if($_COOKIE['InsideSignup']=="True" && !empty($_SESSION['initials'])&&!preg_match("/^[A-Z]+$/",$_SESSION['initials'])){
                $_SESSION['messages'] = 'Invalid initials. The initials must start with a capital and can only contain characters [a-z].';
               $_SESSION['showAddMenu'] = "true";
                header("Location: signup.php");
            }
            // else if(!preg_match("/^[0-9]{4}\/(0[1-9]|1[0-2])\/(0[1-9]|[1-2][0-9]|3[0-1])$/",$_SESSION['dateOfBirth'])){
            //     $_SESSION['messages'] = "Invalid Date format. Format needs to be in YYYY/MM/DD.";
            //     header("Location: manageUsers.php");
            // }
            // else if (!preg_match("/^[A-Z][a-z]+$/",$_SESSION['country']) ){
            //     $_SESSION['messages'] = 'Invalid Country. The country must start with a capital and must only contain characters [a-z].';
            //     header("Location: manageUsers.php");
            // }
            // else if(!preg_match("/^[0-9]|[1-4][0-9]|[5][0-4]$/")){ //test valid range 0-54
            //     $_SESSION['messages'] = 'Invalid handicap value. The value must be a whole number between [0-54].';
            //     header("Location: manageUsers.php");
            // }
            else if($_COOKIE['InsideUsers']=="True" && !preg_match("/^\w*@\w+([\.-]?\w+)*(\.[A-Za-z]{2,4})+$/",$_SESSION['email'])){
                $_SESSION['messages'] = 'Invalid Email. The email must be in the format: something@example.com';
               $_SESSION['showAddMenu'] = "true";
                header("Location: manageUsers.php");
            }
            else if($_COOKIE['InsideSignup']=="True" && !preg_match("/^\w*@\w+([\.-]?\w+)*(\.[A-Za-z]{2,4})+$/",$_SESSION['email'])){
                $_SESSION['messages'] = 'Invalid Email. The email must be in the format: something@example.com';
               $_SESSION['showAddMenu'] = "true";
                header("Location: signup.php");
            }
            else if($_COOKIE['InsideUsers']=="True" && !preg_match("/^(?=.{8,}$)(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W).*$/",$_SESSION['psw'])){
                $_SESSION['messages'] = 'Invalid Password. It needs to contain: at least 8 characters, uppercase and lowercase characters, numeric digits and at least one symbol [&,%,$,etc.]';
               $_SESSION['showAddMenu'] = "true";
                header("Location: manageUsers.php");
            }
            else if($_COOKIE['InsideSignup']=="True" && !preg_match("/^(?=.{8,}$)(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W).*$/",$_SESSION['psw'])){
                $_SESSION['messages'] = 'Invalid Password. It needs to contain: at least 8 characters, uppercase and lowercase characters, numeric digits and at least one symbol [&,%,$,etc.]';
                header("Location: signup.php");
            }
            else if($_COOKIE['InsideUsers']=="True" && !preg_match("/\d{10}$/",$_SESSION['telNo'])){
                $_SESSION['messages'] = "Invalid telephone number. Please ensure that your telephone number only contains digits.";
               $_SESSION['showAddMenu'] = "true";
                header("Location: manageUsers.php");
            }
            else if($_COOKIE['InsideSignup']=="True" && !preg_match("/\d{10}$/",$_SESSION['telNo'])){
                $_SESSION['messages'] = "Invalid telephone number. Please ensure that your telephone number only contains digits.";
                header("Location: signup.php");
            }
            // else if($_SESSION['genderType'] == ""){
            //     $_SESSION['messages'] = "You did not select a Gender. Please do so.";
            //     header("Location: manageUsers.php");
            // }
            else if($_COOKIE['InsideUsers']=="True" && $_SESSION['userType']==""){
                $_SESSION['messages'] = "You did specify whether you are a player or an admin. Please do so.";
                $_SESSION['showAddMenu'] = "true";
                header("Location: manageUsers.php");
            }
            else if($_COOKIE['InsideSignup']=="True" && $_SESSION['userType']==""){
                $_SESSION['messages'] = "You did specify whether you are a player or an admin. Please do so.";
                $_SESSION['showAddMenu'] = "true";
                header("Location: signup.php");
            }
            else{
                $name = $_POST['name'];
                $surname = $_POST['surname'];
                $email = $_POST['email'];
                $password = $_POST['psw'];
                // $dateOfBirth = $_POST['dateOfBirth'];
                // $country = $_POST['country'];
                $telNo = $_POST['telNo'];
                $userType = $_POST['userType'];
                $initials = $_POST['initials'];
                //first check if the email address exists
                $select = $conn->prepare("SELECT * FROM users WHERE email = ?");
                $select->bind_param("s",$email);
                $select->execute();
                $result = $select->get_result();

                if($_COOKIE['InsideUsers']=="True" && mysqli_num_rows($result) > 0) {
                    $_SESSION['messages'] = 'Invalid Submission. That email address is already in use';
                    header("Location: manageUsers.php");
                }
                else if($_COOKIE['InsideSignup']=="True" && mysqli_num_rows($result) > 0) {
                    $_SESSION['messages'] = 'Invalid Submission. That email address is already in use';
                    header("Location: signup.php");
                }      
                else{          
                    //encrypt the password
                    $hashed_psw = password_hash($password, PASSWORD_DEFAULT, array('cost' => 10));
                    
                    //insert user into database
                    $query = $conn->prepare("INSERT INTO users (email, password, tel_no, user_type, first_name, init, last_name)
                    VALUES (?,?,?,?,?,?,?)");
                    $query->bind_param("sssssss", $email, $password, $telNo, $userType, $name, $initials, $surname);
                    $query->execute();
                    $result = $query->get_result();
                    
                    if ($query){
                        //Success
                        //we don't want to be redirected to another page, we just want a popup to display
                        $_COOKIE['showRegPopupAdd'] = "true";
                        if ($_COOKIE['InsideUsers']=="True"){
                            header("Location: manageUsers.php");
                        }
                        else if($_COOKIE['InsideSignup']=="True"){
                            header("Location: signup.php");
                        }
                    }
                    else{
                        $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                        error_reporting(E_ALL);
                        if ($_COOKIE['InsideUsers']=="True"){
                            header("Location: manageUsers.php");
                        }
                        else if($_COOKIE['InsideSignup']=="True"){
                            header("Location: signup.php");
                        }
                        // echo "Error connecting to database: " . $conn->error;
                    }

                    $conn->close();
                }
            }
        }
        else if(isset($_POST['pkEmail'])){
            //this is to validate deleteing a player
            $_SESSION['pkEmail'] = $_POST["pkEmail"];
            if(!preg_match("/^\w*@\w+([\.-]?\w+)*(\.[A-Za-z]{2,4})+$/",$_SESSION['pkEmail'])){
                $_SESSION['messages'] = 'Invalid Email. The email must be in the format: something@example.com';
               $_SESSION['showDeleteMenu'] = "true";
                header("Location: manageUsers.php");
            }
            else{
                $pkEmail = $_POST['pkEmail'];
                //first check to see if record exist
                $select = $conn->prepare("SELECT * FROM users WHERE email=?");
                $select->bind_param("s",$pkEmail);
                $select->execute();
                $result = $select->get_result();

                if(mysqli_num_rows($result) == 0) {
                    $_SESSION['messages'] = 'That email does not exist in the database.';
                    $_SESSION['showDeleteMenu'] = "true";
                    header("Location: manageUsers.php");
                }
                else{          
                    $query = $conn->prepare("DELETE FROM users WHERE email=?");
                    $query->bind_param("s", $pkEmail);
                    $query->execute();
                    $result = $query->get_result();
                    
                    if ($query){
                        //Success
                        //we don't want to be redirected to another page, we just want a popup to display
                        $_SESSION['showRegPopupDelete'] = "true";
                        header("Location: manageUsers.php");
                    }
                    else{
                        $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                        error_reporting(E_ALL);
                        header("Location: manageUsers.php");
                        // echo "Error connecting to database: " . $conn->error;
                    }
                    
                    $conn->close();
                }
            }
        }
        else if(isset($_POST['filterOption1']) || isset($_POST['filterOption2']) || isset($_POST['filterOption3']) || isset($_POST['filterOption4'])){
            //this is to filter the table
            if (isset($_POST['filterOption1'])) {
                $_SESSION['filterOption1'] = $_POST['filterOption1'];
            }
            else{
                $_SESSION['filterOption1'] = null;
            }
            if (isset($_POST['filterOption2'])) {
                $_SESSION['filterOption2'] = $_POST['filterOption2'];
            }
            else{
                $_SESSION['filterOption2'] = null;
            }
            if (isset($_POST['filterOption3'])) {
                $_SESSION['filterOption3'] = $_POST['filterOption3'];
            }
            else{
                $_SESSION['filterOption3'] = null;
            }
            if (isset($_POST['filterOption4'])) {
                $_SESSION['filterOption4'] = $_POST['filterOption4'];
            }
            else{
                $_SESSION['filterOption4'] = null;
            }
            $select = null;
            $result = null;
            if($_SESSION['filterOption1'] != null){
                //view males
                $select = $conn->prepare("SELECT * FROM users WHERE user_type=?");
                $select->bind_param("s",$_SESSION['filterOption1']);
                $select->execute();
                $result = $select->get_result();                 
            }
            else if($_SESSION['filterOption2'] != null){
                //view females
                $select = $conn->prepare("SELECT * FROM users WHERE user_type=?");
                $select->bind_param("s",$_SESSION['filterOption2']);
                $select->execute();
                $result = $select->get_result();  
                
            }
            else if($_SESSION['filterOption3'] != null){
                //view age >= 45
                $select = $conn->prepare("SELECT * FROM users WHERE email LIKE ? OR email LIKE ?");
                $google = "%google.com";
                $icloud = "%icloud.com";
                $select->bind_param("ss",$google,$icloud);
                $select->execute();
                $result = $select->get_result(); 

            }
            else{ //reset table
                $select = $conn->prepare("SELECT * FROM users ");
                $select->execute();
                $result = $select->get_result();    
            }
            if (mysqli_num_rows($result)==0){
                $tableHeaders = "<table class='Table'>
                            <th>id</th>
                            <th>email</th>
                            <th>password</th>
                            <th>tel_no</th>
                            <th>user_type</th>
                            <th>first_name</th>
                            <th>init</th>
                            <th>last_name</th>
                            </table>
                ";
                $_SESSION['table'] = $tableHeaders;
                header("Location: manageUsers.php");
            }
            else{   //now to rebuild
                $tableHeaders = "<table class='Table'>
                            <th>id</th>
                            <th>email</th>
                            <th>password</th>
                            <th>tel_no</th>
                            <th>user_type</th>
                            <th>first_name</th>
                            <th>init</th>
                            <th>last_name</th>
                ";
                //display first result and then continue from second row
                $row = mysqli_fetch_assoc($result);
                $tableRows = "<tr class='TableRow'>
                                <td>".$row['id']."</td>
                                <td>".$row['email']."</td>
                                <td>".$row['password']."</td>
                                <td>".$row['tel_no']."</td>
                                <td>".$row['user_type']."</td>
                                <td>".$row['first_name']."</td>
                                <td>".$row['init']."</td>
                                <td>".$row['last_name']."</td>
                            </tr>
                    ";
                //run through records
                while($row = mysqli_fetch_assoc($result)){
                    $tableRows .= "<tr class='TableRow'>
                                <td>".$row['id']."</td>
                                <td>".$row['email']."</td>
                                <td>".$row['password']."</td>
                                <td>".$row['tel_no']."</td>
                                <td>".$row['user_type']."</td>
                                <td>".$row['first_name']."</td>
                                <td>".$row['init']."</td>
                                <td>".$row['last_name']."</td>
                            </tr>
                    ";
                    // $tableGrid->innerHTML =$tableGrid->innerHTML . $tableHeaders . $tableRows;
                }
                // $tableGrid->innerHTML = $tableGrid->innerHTML . "</table>";
                $_SESSION['table'] = $tableHeaders . $tableRows . "</table>";
                if ($query){
                    //Success
                    $_SESSION['showRegPopupFilter'] = "true";
                    header("Location: manageUsers.php");
                }
                else{
                    $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                    error_reporting(E_ALL);
                    header("Location: manageUsers.php");
                    // echo "Error connecting to database: " . $conn->error;
                }
                $conn->close();
            }

        }
        else if(isset($_POST['updatePopupInput']) && (isset($_POST['option1']) || isset($_POST['option2']) || isset($_POST['option3']) || isset($_POST['option4']) || isset($_POST['option5']) || isset($_POST['option6']) || isset($_POST['option7']))){
            //update a player's data
            if (isset($_POST['option1'])) $_SESSION['option1'] = $_POST['option1'];
            if (isset($_POST['option2'])) $_SESSION['option2'] = $_POST['option2'];
            if (isset($_POST['option3'])) $_SESSION['option3'] = $_POST['option3'];
            if (isset($_POST['option4'])) $_SESSION['option4'] = $_POST['option4'];
            if (isset($_POST['option5'])) $_SESSION['option5'] = $_POST['option5'];
            if (isset($_POST['option6'])) $_SESSION['option6'] = $_POST['option6'];
            if (isset($_POST['option7'])) $_SESSION['option7'] = $_POST['option7'];
            $select=null;
            $result=null;
            if($_SESSION['option1'] != null){
                //view males
                $select = $conn->prepare("SELECT * FROM users WHERE email=?");
                $select->bind_param("s",$pkEmail);
                $select->execute();
                $result = $select->get_result();
                if(mysqli_num_rows($result) == 0) {
                    $_SESSION['messages'] = 'That email does not exist in the database.';
                    $_SESSION['showUpdateMenu'] = "true";
                    header("Location: manageUsers.php");
                }
                else{          //****UPDATE TABLE**//
                    $query = $conn->prepare("UPDATE users SET email=? WHERE email=?");
                    $query->bind_param("ss",$_SESSION['option1'], $pkEmail);
                    $query->execute();
                    $result = $query->get_result();
                    
                    if ($query){
                        //Success
                        $_SESSION["showRegPopupUpdate"] = "true";
                        header("Location: manageUsers.php");
                    }
                    else{
                        $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                        error_reporting(E_ALL);
                        $_SESSION['showUpdateMenu'] = "true";
                        header("Location: manageUsers.php");
                        // echo "Error connecting to database: " . $conn->error;
                    }  
                }                     
            }
            else if($_SESSION['option2'] != null){
                //change password
                $select = $conn->prepare("SELECT * FROM users WHERE email=?");
                $select->bind_param("i",$pkEmail);
                $select->execute();
                $result = $select->get_result();    
                if(mysqli_num_rows($result) == 0) {
                    $_SESSION['messages'] = 'That email does not exist in the database.';
                    $_SESSION['showUpdateMenu'] = "true";
                    header("Location: manageUsers.php");
                }
                else{          
                    $query = $conn->prepare("UPDATE users SET password=? WHERE email=?");
                    $query->bind_param("ss",$_SESSION['option2'],$pkEmail);
                    $query->execute();
                    $result = $query->get_result();
                    
                    if ($query){
                        //Success
                        $_SESSION["showRegPopupUpdate"] = "true";
                        header("Location: manageUsers.php");
                    }
                    else{
                        $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                        error_reporting(E_ALL);
                        $_SESSION['showUpdateMenu'] = "true";
                        header("Location: manageUsers.php");
                        // echo "Error connecting to database: " . $conn->error;
                    }   
                }                       
            }
            else if($_SESSION['option3'] != null){
                //update tel no.
                $select = $conn->prepare("SELECT * FROM users WHERE email=?");
                $select->bind_param("s",$pkEmail);
                $select->execute();
                $result = $select->get_result();  
                if(mysqli_num_rows($result) == 0) {
                    $_SESSION['messages'] = 'That email does not exist in the database.';
                    header("Location: manageUsers.php");
                }
                else{          
                    $query = $conn->prepare("UPDATE users SET tel_no=? WHERE email=?");
                    $query->bind_param("ss",$_SESSION['option3'],$pkEmail);
                    $query->execute();
                    $result = $query->get_result();
                    
                    if ($query){
                        //Success
                        $_SESSION["showRegPopupUpdate"] = "true";
                        header("Location: manageUsers.php");
                    }
                    else{
                        $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                        error_reporting(E_ALL);
                        $_SESSION["showUpdateMenu"] = "true";
                        header("Location: manageUsers.php");
                        // echo "Error connecting to database: " . $conn->error;
                    }   
                }                        
            }
            else if($_SESSION['option4'] != null){
                //update user type
                $select = $conn->prepare("SELECT * FROM users WHERE email=?");
                $select->bind_param("ss",$_SESSION['option4'],$pkEmail);
                $select->execute();
                $result = $select->get_result();  
                if(mysqli_num_rows($result) == 0) {
                    $_SESSION['messages'] = 'That email does not exist in the database.';
                    header("Location: manageUsers.php");
                }
                else{          
                    $query = $conn->prepare("UPDATE users SET user_type=? WHERE email=?");
                    $query->bind_param("ss",$_SESSION['option4'],$pkEmail);
                    $query->execute();
                    $result = $query->get_result();
                    
                    if ($query){
                        //Success
                        $_SESSION["showRegPopupUpdate"] = "true";
                        header("Location: manageUsers.php");
                    }
                    else{
                        $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                        error_reporting(E_ALL);
                        $_SESSION["showUpdateMenu"] = "true";
                        header("Location: manageUsers.php");
                        // echo "Error connecting to database: " . $conn->error;
                    }   
                }               
            }
            else if($_SESSION['option5'] != null){
                //view handicap >= 30
                $select = $conn->prepare("SELECT * FROM users WHERE email=?");
                $select->bind_param("s",$pkEmail);
                $select->execute();
                $result = $select->get_result(); 
                if(mysqli_num_rows($result) == 0) {
                    $_SESSION['messages'] = 'That email does not exist in the database.';
                    header("Location: manageUsers.php");
                }
                else{          
                    $query = $conn->prepare("UPDATE users SET first_name=? WHERE email=?");
                    $query->bind_param("ss",$_SESSION['option5'],$pkEmail);
                    $query->execute();
                    $result = $query->get_result();
                    
                    if ($query){
                        //Success
                        $_SESSION["showRegPopupUpdate"] = "true";
                        header("Location: manageUsers.php");
                    }
                    else{
                        $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                        error_reporting(E_ALL);
                        $_SESSION["showUpdateMenu"] = "true";
                        header("Location: manageUsers.php");
                        // echo "Error connecting to database: " . $conn->error;
                    }   
                }                
            }
            else if($_SESSION['option6']!=null){
                $select = $conn->prepare("SELECT * FROM users WHERE email=? ");
                $select->execute();
                $result = $select->get_result(); 
                if(mysqli_num_rows($result) == 0) {
                    $_SESSION['messages'] = 'That email does not exist in the database.';
                    header("Location: manageUsers.php");
                }
                else{          
                    $query = $conn->prepare("UPDATE users SET last_name=? WHERE email=?");
                    $query->bind_param("ss",$_SESSION['option6'],$pkEmail);
                    $query->execute();
                    $result = $query->get_result();
                    
                    if ($query){
                        //Success
                        $_SESSION["showRegPopupUpdate"] = "true";
                        header("Location: manageUsers.php");
                    }
                    else{
                        $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                        error_reporting(E_ALL);
                        $_SESSION["showUpdateMenu"] = "true";
                        header("Location: manageUsers.php");
                        // echo "Error connecting to database: " . $conn->error;
                    }   
                }    
            }
            else if($_SESSION['option7']!=null){
                $select = $conn->prepare("SELECT * FROM users WHERE email=? ");
                $select->execute();
                $result = $select->get_result(); 
                if(mysqli_num_rows($result) == 0) {
                    $_SESSION['messages'] = 'That email does not exist in the database.';
                    header("Location: manageUsers.php");
                }
                else{          
                    $query = $conn->prepare("UPDATE users SET init=? WHERE email=?");
                    $query->bind_param("ss",$_SESSION['option6'],$pkEmail);
                    $query->execute();
                    $result = $query->get_result();
                    
                    if ($query){
                        //Success
                        $_SESSION["showRegPopupUpdate"] = "true";
                        header("Location: manageUsers.php");
                    }
                    else{
                        $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                        error_reporting(E_ALL);
                        $_SESSION["showUpdateMenu"] = "true";
                        header("Location: manageUsers.php");
                        // echo "Error connecting to database: " . $conn->error;
                    }   
                }    
            }
            //now to rebuild
            $tableHeaders = "
                    <table class='Table'>
                        <th>id</th>
                        <th>email</th>
                        <th>password</th>
                        <th>tel_no</th>
                        <th>user_type</th>
                        <th>first_name</th>
                        <th>init</th>
                        <th>last_name</th>
            ";
            //build first then then continue from second row
            $tableRows = "
                    <tr class='TableRow'>
                        <td>".$row['id']."</td>
                        <td>".$row['email']."</td>
                        <td>".$row['password']."</td>
                        <td>".$row['tel_no']."</td>
                        <td>".$row['user_type']."</td>
                        <td>".$row['first_name']."</td>
                        <td>".$row['init']."</td>
                        <td>".$row['last_name']."</td>
                    </tr>
            ";
            //run through records
            while($row = mysqli_fetch_assoc($result)){
                $tableRows .= "
                        <tr class='TableRow'>
                            <td>".$row['id']."</td>
                            <td>".$row['email']."</td>
                            <td>".$row['password']."</td>
                            <td>".$row['tel_no']."</td>
                            <td>".$row['user_type']."</td>
                            <td>".$row['first_name']."</td>
                            <td>".$row['init']."</td>
                            <td>".$row['last_name']."</td>
                        </tr>
                ";
            }
            $_SESSION['table'] = $tableHeaders . $tableRows . "</table>";
            if ($query){
                //Success
                $_SESSION["showRegPopupUpdate"] = "true";
                header("Location: manageUsers.php");
            }
            else{
                $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                error_reporting(E_ALL);
                $_SESSION["showUpdateMenu"] = "true";
                header("Location: manageUsers.php");
                // echo "Error connecting to database: " . $conn->error;
            }
            $conn->close();
        }
    }

?>