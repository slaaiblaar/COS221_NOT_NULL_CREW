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
    <link rel="stylesheet" href="css/managePlayers.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/1af5f85004.js" crossorigin="anonymous"></script>
    <title>Daily Golf Statistics</title>
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
                <span>Manage Players</span>
                <p> Use the buttons on the left to manage the players</p>
            </div>
        </div>
        <div class="contentContainer">
            <div class="buttonsGrid">
                <button type="button" id="createNewPlayer">Create New Player</button>
                <button type="button" id="deletePlayer">Delete a Player from  the table</button>
                <button type="button" id="filterTable">List filter options</button>
                <div id="filterOptions">
                    <div>    
                        <input class="filter-option1" type="radio" name="filterOption1">
                        <label class="lblFilter">View Males</label>
                    </div>
                    <div>
                        <input class="filter-option2" type="radio" name="filterOption2">
                        <label class="lblFilter">View Females</label><br>
                    </div>
                    <div>
                        <input class="filter-option3" type="radio" name="filterOption3">
                        <label class="lblFilter">Age >= 45</label>
                    </div>
                    <div>
                        <input class="filter-option4" type="radio" name="filterOption4">
                        <label class="lblFilter">Age < 45</label><br>
                    </div>
                    <div>
                        <input class="filter-option5" type="radio" name="filterOption5">
                        <label class="lblFilter">Handicap >= 30</label>
                    </div>
                    <div>
                        <input class="filter-option6" type="radio" name="filterOption6">
                        <label class="lblFilter">Reset table</label>
                    </div>
                </div>
                <button type="button" id="updatePlayerData">Update a Player's data</button>
                <div id="updateOptions">
                    <div>    
                        <input class="update-option1" type="radio" name="updateOption1">
                        <label class="lblUpdate">Update Person key</label>
                    </div>
                    <div>
                        <input class="update-option2" type="radio" name="updateOption2">
                        <label class="lblUpdate">Update Date of Birth</label><br>
                    </div>
                    <div>
                        <input class="update-option3" type="radio" name="updateOption3">
                        <label class="lblUpdate">Update Age</label>
                    </div>
                    <div>
                        <input class="update-option4" type="radio" name="updateOption4">
                        <label class="lblUpdate">Update Handicap</label><br>
                    </div>
                    <div>
                        <input class="update-option5" type="radio" name="updateOption5">
                        <label class="lblUpdate">Update Death Date</label>
                    </div>
                    <div>
                        <input class="update-option6" type="radio" name="updateOption6">
                        <label class="lblUpdate">Update Gender</label>
                    </div>
                </div>
            </div>
            <div class="tableGrid">
                <!--we will build the table using javascript-->
            </div>
        </div>
        <div class="fullScreenPopupAdd">
            <div id="newPlayerFormPopup">
                <form action="php/validatePlayerSignUp.php" method="post">
                    <div class="addPlayerFormHeader">
                        <div class="formHeading">Create new Player</div>
                        <div class="formSubHeading">Please enter all fields</div>
                    </div>
                    <hr>
                    <div id="formBodyContainer">
                        <div class="inputTextBox">
                            <label for="idNumber"><b>ID Number/Passport Number</b></label><br>
                            <input class="idNumber" type="text" placeholder="Enter your ID Number or Passport Number" name="idNumber" required max_length = '13'>
                            <div class="error"></div><br>
                        </div>
                        <div class="inputTextBox">
                            <label for="dateOfBirth"><b>Date of Birth</b></label><br>
                            <input class="dateOfBirth" type="date" required>
                            <div class="error"></div><br>
                        </div>
                        <div class="inputTextBox">
                            <label class="lblGender" for="gender"><b>Gender</b></label><br>
                            <input class="genderMale" type="radio" name="gender">
                            <label class="lblGenderType" for="genderMale"><b>Male</b></label>
                            <input class="genderFemale" type="radio" name="gender">
                            <label class="lblGenderType" for="genderFemale"><b>Female</b></label>
                            <input class="genderOther" type="radio" name="gender">
                            <label class="lblGenderType" for="genderOther"><b>Other</b></label><br>
                        </div>
                        <div id="Age_Handicap">
                            <div class="inputTextBox">
                                <label for="age"><b>Age</b></label><br>
                                <input class="age" type="number" name="age" placeholder="Enter integer [18-65]" required min="18" max="65"> 
                                <div class="error"></div><br>
                            </div>
                            <div class="inputTextBox">
                                <label for="handicap"><b>Handicap</b></label><br>
                                <input class="handicap" type="number" name="handicap" placeholder="Enter integer [0-54]" required min="0" max="54"> 
                                <div class="error"></div><br>
                            </div>
                        </div>
                        <div id="submitButtons">
                            <button type="button" class="cancelbtn">Cancel</button>
                            <button type="submit" class="submitbtn" name="Submit">Submit</button>
                        </div>
                    </div>
                </form>
                <hr class="endRuler">
            </div>
        </div>
        <div class="fullScreenPopupDelete">
            <div id="deletePlayerPopup">
                <form action="InputValidationPlayers.php" method="post" id="deletePlayerForm">
                    <div class="deletePopupHeader">
                        <span>Enter the id of the player:</span>
                        <p> (note: not the person_key)<p>
                    </div>
                    <div class="inputTextBox">
                        <input class="id" type="text" name="id" placeholder="Enter the id">
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
                <h1> Successful Registration </h1>
                <image class="Logo"></image>
                <div class="popupButtons">
                    <button type="button" class="undoReg">Undo Registration</button>
                    <button type="button" class="dismissPopup">Dismiss</button>
                </div>
            </div>
        </div>
        <div class="fullScreenPopupUpdate">
            <div id="updatePlayerPopup">
                <form action="InputValidationPlayers.php" method="post" id="updatePlayerForm">
                    <div class="updatePopupHeader">
                        <span></span>
                    </div>
                    <div class="inputTextBox updateInput">
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
    <?php
        include_once("php/footer.php");
    ?>
    <script src="js/PlayerPopups.js"></script>
    <script src="js/inputValidationPlayers.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</body>
</html>