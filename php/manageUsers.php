<!--
    MEMBERS of NOT_NULL_CREW:
    u19043512
    u21446271
    u19234806
    u21457451
    u04929552
    u21457060
-->
<?php session_start(); setcookie("InsideUsers", "True", 0, "/");setcookie("InsideSignup", "False", 0, "/");
    require_once("configDB.php");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/manageUsers.css">
    <title>Sunrise Golfing</title>
    <script src="https://kit.fontawesome.com/1af5f85004.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    
</head>
<body>
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

        <!-- inclusion of navbar start -->
        <?php
            require_once("header.php");
        ?>
        <!-- inclusion of navbar end-->

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
                <form action="validateSignup.php" id="filterForm" method="post">
                    <div class="filterFormContainer">
                        <div id="filterOptions">
                            <div>    
                                <input class="filter-option1" type="radio" name="filterOption1" value="Admin">
                                <label class="lblFilter">View Admins</label>
                            </div>
                            <div>
                                <input class="filter-option2" type="radio" name="filterOption2" value="Normal">
                                <label class="lblFilter">View Normal users</label><br>
                            </div>
                            <div>
                                <input class="filter-option3" type="radio" name="filterOption3" value="@google/@icloud">
                                <label class="lblFilter">View @google.com/@icloud.com emails</label>
                            </div>
                            <div>
                                <input class="filter-option4" type="radio" name="filterOption4" value="All">
                                <label class="lblFilter">Reset table</label>
                            </div>
                        </div>
                        <button type="submit" class="submitFilter" name="submitFilter">Filter</button>
                    </div>
                </form>
                <button type="button" id="updateUserData">Update a User's data</button>
                <div id="updateOptions">
                    <div>    
                        <input class="update-option1" type="radio" name="updateOption1">
                        <label class="lblUpdate">Change user email</label>
                    </div>
                    <div>
                        <input class="update-option2" type="radio" name="updateOption2">
                        <label class="lblUpdate">Change  user password</label><br>
                    </div>
                    <div>
                        <input class="update-option3" type="radio" name="updateOption3">
                        <label class="lblUpdate">Change telephone no.</label>
                    </div>
                    <div>
                        <input class="update-option4" type="radio" name="updateOption4">
                        <label class="lblUpdate">Change user type</label><br>
                    </div>
                    <div>
                        <input class="update-option5" type="radio" name="updateOption5">
                        <label class="lblUpdate">Change first name</label>
                    </div>
                    <div>
                        <input class="update-option6" type="radio" name="updateOption6">
                        <label class="lblUpdate">Change last name</label>
                    </div>
                    <div>
                        <input class="update-option7" type="radio" name="updateOption7">
                        <label class="lblUpdate">Change initials</label>
                    </div>
                </div>
            </div>
            <div class="tableGrid">
                <!--we will build the table using javascript-->
                <?php 
                    if (empty($_SESSION['table'])){
                        $select = mysqli_query($conn,"SELECT * FROM users ");
                        $tableRows = "";
                        if(mysqli_num_rows($select) > 0){
                            //load table
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
                            echo $tableHeaders;
                            //run through records
                            while($row = mysqli_fetch_assoc($select)){
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
                            
                            echo $tableRows . "</table>";
                        }
                        else{
                            echo "<h3> No data found</h3>";

                        }
                    }
                    else{
                        echo $_SESSION['table'];
                    }
                ?>
            </div>
        </div>
        <div class="fullScreenPopupAdd">
            <div id="newUserPopupForm">
                    <form action="validateSignup.php" method="post" class="signupForm"> <!-- onsubmit="return ValidateInput()"> -->
                        <div class="formContainer">
                            <h1>Sign Up</h1>
                            <p>Please fill in this form to create an account.</p>
                            
                            <?php if(!empty($_SESSION['messages'])) {
                                if ($_SESSION['messages'] == 'Invalid Email. The email must be in the format: something@example.com'){
                                    $_SESSION['email'] = "";
                                    echo "<h3 style='color: red; font-weight: bold;'> Invalid Email. The email must be in the format: something@example.com </h3>";
                                    echo "<script> document.querySelector('.email').style.borderColor = 'red'; </script>";
                                }
                                else if ($_SESSION['messages'] == 'Invalid Name. The name must start with a capital and can only contain characters [a-z].'){
                                    $_SESSION['name'] = "";
                                    echo "<h3 style='color: red; font-weight: bold;'> Invalid Name. The name must start with a capital and can only contain characters [a-z]. </h3>";
                                    echo "<script> document.querySelector('.name').style.borderColor = 'red'; </script>";
                                }
                                else if ($_SESSION['messages'] == 'Invalid Surname. The surname must start with a capital and can only contain characters [a-z].'){
                                    $_SESSION['surname'] = "";
                                    echo "<h3 style='color: red; font-weight: bold;'> Invalid Surname. The surname must start with a capital and can only contain characters [a-z]. </h3>";
                                    echo "<script> document.querySelector('.surname').style.borderColor = 'red'; </script>";
                                }
                                else if ($_SESSION['messages'] == 'Invalid initials. The initials must start with a capital and can only contain characters [a-z].'){
                                    $_SESSION['initials'] = "";
                                    echo "<h3 style='color: red; font-weight: bold;'> Invalid initials. The initials must start with a capital and can only contain characters [a-z]. </h3>";
                                    echo "<script> document.querySelector('.initials').style.borderColor = 'red'; </script>";
                                }
                                else if ($_SESSION['messages'] == 'Invalid Password. It needs to contain: at least 8 characters, uppercase and lowercase characters, numeric digits and at least one symbol [&,%,$,etc.]'){
                                    $_SESSION['psw'] = "";
                                    echo "<h3 style='color: red; font-weight: bold;'> Invalid Password. It needs to contain: at least 8 characters, uppercase and lowercase characters, numeric digits and at least one symbol [&,%,$,etc.] </h3>";
                                    echo "<script> document.querySelector('.password').style.borderColor = 'red'; </script>";
                                }
                                else if ($_SESSION['messages'] == 'Invalid telephone number. Please ensure that your telephone number only contains digits.'){
                                    $_SESSION['telNo'] = "";
                                    echo "<h3 style='color: red; font-weight: bold;'> Invalid telephone number. Please ensure that your telephone number only contains digits.</h3>";
                                    echo "<script> document.querySelector('.telNo').style.borderColor = 'red'; </script>";
                                }
                                else if ($_SESSION['messages'] == 'You did specify whether you are a player or an admin. Please do so.'){
                                    $_SESSION['userType'] = "";
                                    echo "<h3 style='color: red; font-weight: bold;'> You did specify whether you are a player or an admin. Please do so.</h3>";
                                    echo "<script> document.querySelector('.userType').style.borderColor = 'red'; </script>";
                                }
                                else {$_SESSION['name'] = "";
                                    $_SESSION['surname'] = "";
                                    $_SESSION['email'] = "";
                                    $_SESSION['psw'] = "";
                                    $_SESSION['country']="";
                                    $_SESSION['handicap']="";
                                    $_SESSION['telNo']="";
                                    $_SESSION['initials']="";
    
                                    echo "<div id='errorSignup'>
                                            <h3 style='color: red; font-weight: bold;'> Invalid submission. Please take note of the following when filling in the form: </h3>
                                            <ul style='color: red; font-weight: bold;'>
                                                <li class='error'> Name should start with a capital letter and only have characters [A-Z] or [a-z].</li>
                                                <li class='error'> Surname should start with a capital letter and only have characters [A-Z] or [a-z].</li>
                                                <li class='error'> Initials should start with a capital letter and only have characters [A-Z].</li>
                                                <li class='error'> Telephone Number must be in valid format e.g. 012 345 6789</li>
                                                <li class='error'> Email should have the format - something@example.com.</li>
                                                <li class='error'> Password must consist of at least 8 characters, uppercase and lowercase letters, at least one digit and one symbol(&,%,$,etc.).</li>
                                            </ul>
                                          </div>";
                                }
                            }?>
    
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
                                <input class="initials" type="text" placeholder="Enter Initials" name="initials" max_length = '45'
                                value = "<?php echo isset($_SESSION['initials']) ? $_SESSION['initials'] : '';  ?>">
                                <div class="error"></div><br>
                            </div>
                            <div class="userType_TelNo">
                                <div class="inputTextBox">
                                    <label for="userType"><b>Type of User</b></label><br>
                                    <input class="adminType" type="radio" name="userType" value="Admin">
                                    <label for="adminType"><b>Admin</b></label><br>
                                    <input class="playerType" type="radio" name="userType" value="Player">
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
            <div class="fullScreenPopupDelete">
                <div id="deleteUserPopup">
                    <form action="validateSignup.php" method="post" id="deleteUserForm">
                        <div class="deletePopupHeader">
                            <span>Enter the email of the User:</span>
                            <p> (Please ensure it is of the format some@example.com)<p>
                        </div>
                        <?php if (isset($_SESSION['messages']) && $_SESSION['messages'] == 'Invalid Email. The email must be in the format: something@example.com'){
                                    $_SESSION['pkEmail'] = "";
                                    echo "<div id='errorDelete'><h3 style='color: red; font-weight: bold;'> Invalid Email. The email must be in the format: something@example.com </h3>
                                        <script> document.querySelector('.pkEmail').style.borderColor = 'red'; </script></div>";
                                }
                        ?>
                        <div class="inputTextBox">
                            <input class="pkEmail" type="text" name="pkEmail" placeholder="Enter the email (e.g. some@example.com)">
                            <div class="error"></div><br>
                        </div>
                        <div id="submitButtons">
                            <button type="button" class="cancelbtnDel">Cancel</button>
                            <button type="submit" class="submitbtnDel" name="Submit">Delete</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="fullScreenPopupReg">
                <div id="SuccessfulRegPopup">
                    <h1></h1>
                    <image class="Logo"></image>
                    <div class="popupButtons">
                        <button type="button" class="dismissPopup">Dismiss</button>
                    </div>
                </div>
            </div>
            <div class="fullScreenPopupUpdate">
                <div id="updateUserPopup">
                    <form action="validateSignup.php" method="post" id="updateUserForm">
                        <div class="updatePopupHeader">
                            <span></span>
                        </div>
                        <div class="inputTextBox updateInputID">
                            <label>User Email</label><br>
                            <input class="pkEmail" type="text" name="pkEmail" placeholder="Enter your email">
                            <div class="error"></div><br>
                        </div>
                        <div class="inputTextBox updateInput">
                            <label></label><br>
                            <input class="updatePopupInput" type="text" name="updatePopupInput">
                            
                            <div class="error"></div><br>
                        </div>
                        <div id="submitButtons">
                            <button type="button" class="cancelbtnUpdate">Cancel</button>
                            <button type="submit" class="submitbtnUpdate" name="Submit">Update</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <?php
        if(!empty($_SESSION['showAddMenu'])){
            echo"<script> document.querySelector('.fullScreenPopupAdd').style.visibility = 'visible';</script>";
        }
        if(!empty($_SESSION['showRegPopupDelete'])){
            echo "
                <script> 
                    var regPopup = document.querySelector('fullScreenPopupReg');                    
                    var deletePopup = document.querySelector('fullScreenPopupAdDelete');
                    var succesPopup = document.querySelector('#SuccessfulRegPopup');
                    successPopup.children[0].innerHTML = 'Successfully Deleted User';

                    regPopup.style.visibility = 'visible'; 
                    regPopup.fadeIn('slow');
                    deletePopup.style.visisbility = 'hidden';
                    deletePopup.fadeOut('slow');
                </script>
            ";
        }
        if(!empty($_SESSION['showRegPopupAdd'])){
            echo "
                <script> 
                    var regPopup = document.querySelector('fullScreenPopupReg');                    
                    var addPopup = document.querySelector('fullScreenPopupAdd');
                    var succesPopup = document.querySelector('#SuccessfulRegPopup');
                    successPopup.children[0].innerHTML = 'Successfully Added New User';

                    regPopup.style.visibility = 'visible'; 
                    regPopup.fadeIn('slow');
                    addPopup.style.visisbility = 'hidden';
                    addPopup.fadeOut('slow');
                </script>
            ";
        }
        if(!empty($_SESSION['showRegPopupUpdate'])){
            echo "
                <script> 
                    var regPopup = document.querySelector('fullScreenPopupReg');                    
                    var updatePopup = document.querySelector('fullScreenPopupUpdate');
                    var succesPopup = document.querySelector('#SuccessfulRegPopup');
                    successPopup.children[0].innerHTML = 'Successfully Updated User's record';

                    regPopup.style.visibility = 'visible'; 
                    regPopup.fadeIn('slow');
                    updatePopup.style.visisbility = 'hidden';
                    updatePopup.fadeOut('slow');
                </script>
            ";
        }
        if(!empty($_SESSION['showRegPopupFilter'])){
            echo "
                <script> 
                    var regPopup = document.querySelector('fullScreenPopupReg');       
                    var succesPopup = document.querySelector('#SuccessfulRegPopup');
                    successPopup.children[0].innerHTML = 'Successfully Filtered Table';

                    regPopup.style.visibility = 'visible'; 
                    regPopup.fadeIn('slow');
                </script>
            ";
        }
        if(!empty($_SESSION['showDeleteMenu'])){
            echo"<script> document.querySelector('.fullScreenPopupDelete').style.visibility = 'visible';</script>";
        }
        if(!empty($_SESSION['showUpdateMenu'])){
            echo"<script> document.querySelector('.fullScreenPopupUpdate').style.visibility = 'visible';</script>";
        }
    ?>
    <?php
        include_once("footer.php");
    ?>
    <script src="../js/UserPopups.js"></script>
    <script language="Javascript" type="text/javascript" src="../js/inputValidationSignUp.js"></script>
    <script language="Javascript" type="text/javascript" src="../js/passwordToggle.js"></script>
    <script language="Javascript" type="text/javascript" src="../js/loaderFlag.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</body>
</html>
<?php session_unset(); session_destroy(); ?>