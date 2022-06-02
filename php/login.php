<?php if (session_id() == ''){
    session_start(); 
}else{
    session_unset();
    session_destroy();
}
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="css/login.css">
        <title> Golf Statistics/Login </title>
        <script src="https://kit.fontawesome.com/1af5f85004.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    </head>
    <body>
        <script> if (localStorage.length > 0) localStorage.clear(); </script>
        
        <div id="bodyContainer">
            <?php
                include_once("php/header.php");
            ?>
            <div id="loginForm">
                <form action="php/validate-login.php" method="post" class="loginForm">
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
        </div>
        <?php
            include_once("php/footer.php");
        ?>
        <script src="js/inputValidationLogin.js"></script>
        <script src="js/passwordToggle.js"></script>
    </body>
</html>
<?php session_unset(); session_destroy(); ?>