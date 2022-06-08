<?php if (session_id() == ''){
    session_start(); 
}else{
    session_unset();
    session_destroy();
}
if (isset($_COOKIE['resetLogin']))
{
    unset($_COOKIE['resetLogin']);
    unset($_COOKIE['userName']);
    unset($_COOKIE['loginStatus']);
}
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="../css/login.css">
        <title> Sunrise Golfing/Login </title>
        <script src="https://kit.fontawesome.com/1af5f85004.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <script src="https://kit.fontawesome.com/8fbf0cb444.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    </head>
    <body>
        <script> if (localStorage.length > 0) localStorage.clear(); </script>
        <div class="loaderFlag">
            <div>
                <img src="../img/flag-in-hole-joypixels.gif" alt="Flag Loader">
            </div>
        </div>
        <div class="content">
            <div class="top-content">
                <img id="Logo" src="../img/Golf-full-logo-transparent.png" width="150" height="150">
                <h1 id="webTitle">Sunrise Golfing</h1>  
            </div> 
            <?php
                include_once("header.php");
            ?>
            <div id="loginForm">
                <form action="validateLogin.php" method="post" class="loginForm">
                    <div class="container">
                        <h1>Login</h1>
                        <p>Please fill in details to login.</p>
                        <?php if(!empty($_SESSION['error'])) {
                            if (isset($_SESSION['errorName']) && $_SESSION['errorName'] == 'No user exists with name: '.$_SESSION['name']){
                                echo "<h3 style='color: red; font-weight: bold;'> Invalid submission. No user exists with name: ".$_SESSION['name']."! </h3>";
                                $_SESSION['name'] = "";
                            }
                            if (isset($_SESSION['errorSurname']) && $_SESSION['errorSurname'] == 'No user exists with surname: '.$_SESSION['surname']){
                                echo "<h3 style='color: red; font-weight: bold;'> Invalid submission. No user exists with surname: ".$_SESSION['surname']."! </h3>";
                                $_SESSION['surname'] = "";
                            }
                            if (isset($_SESSION['errorEmail']) && $_SESSION['errorEmail'] == 'No user exists with email: '.$_SESSION['email']){
                                echo "<h3 style='color: red; font-weight: bold;'> Invalid submission. No user exists with email: ".$_SESSION['email']."! </h3>";
                                $_SESSION['email'] = "";
                            }
                            if (isset($_SESSION['errorPsw']) && $_SESSION['errorPsw'] == 'Password incorrect or does not exist!'){
                                echo "<h3 style='color: red; font-weight: bold;'> Invalid submission. Password incorrect or does not exist! </h3>";
                                $_SESSION['psw'] = "";
                            }
                        } ?>
                        <hr>

                        <div class="inputTextBox">
                            <label for="name"><b>Name</b></label><br>
                            <input class= 'name' type="text" placeholder="Enter name" name="name" required max_length = '45'>
                            <div class="error"></div><br>
                        </div>
                        <div class="inputTextBox" >
                            <label for="surname"><b>Surname</b></label><br>
                            <input class="surname" type="text" placeholder="Enter Surname" name="surname" required max_length = '45'>
                            <div class="error"></div><br>
                        </div>
                        <div class="inputTextBox">
                            <label for="email"><b>Email</b></label><br>
                            <input class="email" type="text" placeholder="Enter Email" name="email" required>
                            <div class="error"></div><br>
                        </div>
                        <div class="inputTextBox">
                            <label for="psw"><b>Password</b></label><br>
                            <input class="password" type="password" placeholder="Enter Password" name="psw" required>
                            <i id="togglePsw"><span id="icon" class="material-icons">visibility</span></i>
                            <div class="error"></div><br>
                        </div>
                        <div class="clearfix">
                            <button type="button" class="cancelbtn"><a href="home.php">Cancel</a></button>
                            <button type="submit" class="loginbtn" name="Submit">Login</button>
                        </div>
                        <div class="linkContainer">
                            <div class="signupLink">
                                <a href="signup.php"> Not a user? Sign Up Today </a>
                            </div>
                        </div>
                        
                    </div>
                </form>
            </div>
            <div class="fullscreenPopup">
                <div id="SuccessfulRegPopup">
                    <h1> Successful Login </h1>
                    <img src="../img/flag-in-hole-joypixels.gif" alt="Flag Loader" width="100" height="100">
                    <div class="popupButtons">
                        <button type="button" class="dismissPopup"><a href="home.php">Dismiss</a></button>
                    </div>
                </div>
            </div>
            
            <?php
                if (isset($_COOKIE['loginStatus']))
                {
                    echo"<script src='../js/loginSuccess.js'></script>";
                }


                include_once("footer.php");
            ?>
        </div>
        
        <script language="Javascript" type="text/javascript" src="../js/inputValidationLogin.js"></script>
        <script language="Javascript" type="text/javascript" src="../js/passwordToggle.js"></script>
        <script language="Javascript" type="text/javascript" src="../js/loaderFlag.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    </body>
</html>
<?php session_unset(); session_destroy(); ?>