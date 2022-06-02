<!--
    MEMBERS of NOT_NULL_CREW:
    u19043512
    u21446271
    u19234806
    u21457451
    u04929552
    u21457060
-->
<?php session_start(); ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/manageUsers.css">
    <title>Daily Golf Statistics</title>
    <script src="https://kit.fontawesome.com/1af5f85004.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    
</head>
<body>
    <div id="bodyContainer">
        <?php 
            include_once("php/header.php");
        ?>
        <div  id="main_header">
            <div id="headingLogo">
                <image></image>
            </div>
            <div class="heading">
                Golf Statistics
            </div>            
        </div>                

        <nav id="navBar">
            <div class="container">
                <ul>
                    <li><a href="home.php">Home</a></li>
                    <li class="loginSignUp"><a class="active" href="#">Login</a></li>
                    <li class="loginSignUp"><a href="signup.php">Sign Up</a></li>
                </ul>
            </div>
        </nav>
        <div id="pageHeader">
            <div class="pageHeadings">
                <span>Manage Users</span>
                <p> Use the buttons on the left to manage the users</p>
            </div>
        </div>
        <div class="contentContainer">
            <div class="buttonsGrid">
                <button id="createNewUser">Create New User</button>
                <button id="deleteUser">Delete a user from  the table</button>
                <button id="filterTable">List filter options</button>
                <button id="updateUserData">Update a User's data</button>
            </div>
            <div class="tableGrid">
                <!--we will build the table using javascript-->
            </div>
        </div>
        <div class="fullscreenPopup">
            <div id="newUserPopupForm">
                <div id="signupForm">
                    <form action="php/validate-signup.php" method="post" class="signupForm"> <!-- onsubmit="return ValidateInput()"> -->
                        <div class="formContainer">
                            <h1>Sign Up</h1>
                            <p>Please fill in this form to create an account.</p>
                            
                            <?php if(!empty($_SESSION['messages'])) {
                                if ($_SESSION['messages'] == 'Email address already exists.'){
                                    $_SESSION['email'] = "";
                                    echo "<h3 style='color: red; font-weight: bold;'> Invalid submission. Email address already in use. </h3>";
                                    echo "<script> document.querySelector('.email').style.borderColor = 'red'; </script>";
                                }
                                else {$_SESSION['name'] = "";
                                    $_SESSION['surname'] = "";
                                    $_SESSION['email'] = "";
                                    $_SESSION['psw'] = "";
                                    $_SESSION['country']="";
                                    $_SESSION['handicap']="";
                                    $_SESSION['telNo']="";
                                    $_SESSION['initials']="";
    
                                    echo "<h3 style='color: red; font-weight: bold;'> Invalid submission. Please take note of the following when filling in the form: </h3>
                                            <ul style='color: red; font-weight: bold;'>
                                                <li class='error'> Name should start with a capital letter and only have characters [A-Z] or [a-z].</li>
                                                <li class='error'> Surname should start with a capital letter and only have characters [A-Z] or [a-z].</li>
                                                <li class='error'> Initials should start with a capital letter and only have characters [A-Z].</li>
                                                <li class='error'> Telephone Number must be in valid format e.g. 012 345 6789</li>
                                                <li class='error'> Email should have the format - something@example.com.</li>
                                                <li class='error'> Password must consist of at least 8 characters, uppercase and lowercase letters, at least one digit and one symbol(&,%,$,etc.).</li>
                                            </ul>";
                                }
                            } ?>
    
                            <hr>
    
                            <div class="inputTextBox">
                                <label for="name"><b>Name</b></label><br>
                                <input class= 'name' type="text" placeholder="Enter Name" name="name" required max_length = '45'
                                value = "<?php echo isset($_SESSION['name']) ? $_SESSION['name'] : '';?>">
                                <div class="error"></div><br>
                            </div>
                            <div class="inputTextBox" >
                                <label for="surname"><b>Surname</b></label><br>
                                <input class="surname" type="text" placeholder="Enter Surname" name="surname" required max_length = '45'
                                value = "<?php echo isset($_SESSION['surname']) ? $_SESSION['surname'] : '';  ?>">
                                <div class="error"></div><br>
                            </div>
                            <div class="inputTextBox" >
                                <label for="initials"><b>Initials (optional) </b></label><br>
                                <input class="initials" type="text" placeholder="Enter Initials" name="initials" required max_length = '45'
                                value = "<?php echo isset($_SESSION['initials']) ? $_SESSION['initials'] : '';  ?>">
                                <div class="error"></div><br>
                            </div>
                            <div class="userType_TelNo">
                                <div class="inputTextBox">
                                    <label for="userType"><b>Type of User</b></label><br>
                                    <input class="adminType" type="radio" name="adminType" value="Admin">
                                    <label for="adminType"><b>Admin</b></label><br>
                                    <input class="playerType" type="radio" name="playerType" value="Player">
                                    <label for="playerType"><b>Player</b></label><br>
                                    <div class="error"></div><br>
                                </div>
                                <div class="inputTextBox">
                                    <label for="telNo"><b>Tel No.</b></label><br>
                                    <input class="telNo" type="text" placeholder="Enter your Telefone Number" name="telNo" required
                                    value = "<?php echo isset($_SESSION['telNo']) ? $_SESSION['telNo'] : '';  ?>">
                                    <div class="error"></div><br>
                                </div>
                            </div>
                            <div class="inputTextBox">
                                <label for="email"><b>Email</b></label><br>
                                <input class="email" type="text" placeholder="Enter Email" name="email" required
                                value = "<?php echo isset($_SESSION['email']) ? $_SESSION['email'] : '';  ?>">
                                <div class="error"></div><br>
                            </div>
                            <div class="inputTextBox">
                                <label for="psw"><b>Password</b></label><br>
                                <input class="password" type="password" placeholder="Enter Password" name="psw" required>
                                <i id="togglePsw"><span id="icon" class="material-icons">visibility</span></i>
                                <div class="error"></div><br>
                            </div>
                            
                            <div class="submitButtons">
                                <button type="button" class="cancelbtn">Cancel</button>
                                <button type="submit" class="signupbtn" name="Submit">Sign Up</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <?php
        include_once("php/footer.php");
    ?>
    <script src="js/inputValidationSignUp.js"></script>
    <script src="js/passwordToggle.js"></script>
</body>
</html>