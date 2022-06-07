<!--
    MEMBERS of NOT_NULL_CREW:
    u19043512
    u21446271
    u19234806
    u21457451
    u04929552
    u21457060
-->
<?php session_start(); 
    require_once("setDBEnvVar.php"); 
    require_once("configDB.php");
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/managePlayers.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/1af5f85004.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <title>Sunrise Golfing</title>
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
                <span>Manage Players</span>
                <p> Use the buttons on the left to manage the players</p>
            </div>
        </div>
        <div class="contentContainer">
            <div class="buttonsGrid">
                <button type="button" id="createNewPlayer">Create New Player</button>
                <button type="button" id="deletePlayer">Delete a Player from  the table</button>
                <button type="button" id="filterTable">List filter options</button>
                <form action="validatePlayers.php" id="filterForm" method="post">
                    <div class="filterFormContainer">
                        <div id="filterOptions">
                            <div>    
                                <input class="filter-option1" type="radio" name="filterOption1" value="Male">
                                <label class="lblFilter">View Males</label>
                            </div>
                            <div>
                                <input class="filter-option2" type="radio" name="filterOption2" value="Female">
                                <label class="lblFilter">View Females</label><br>
                            </div>
                            <div>
                                <input class="filter-option3" type="radio" name="filterOption3" value="45">
                                <label class="lblFilter">Age >= 45</label>
                            </div>
                            <div>
                                <input class="filter-option4" type="radio" name="filterOption4" value="45">
                                <label class="lblFilter">Age < 45</label><br>
                            </div>
                            <div>
                                <input class="filter-option5" type="radio" name="filterOption5" value="30">
                                <label class="lblFilter">Handicap >= 30</label>
                            </div>
                            <div>
                                <input class="filter-option6" type="radio" name="filterOption6" value="reset">
                                <label class="lblFilter">Reset table</label>
                            </div>
                        </div>
                        <button type="submit" class="submitFilter" name="submitFilter">Filter</button>
                    </div>
                </form>
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
                <!--we will build the table using php-->
                <?php 
                    if (empty($_SESSION['table'])){
                        $select = mysqli_query($conn,"SELECT * FROM persons ");
                        $tableRows = "";
                        if(mysqli_num_rows($select) > 0){
                            //load table
                            $tableHeaders = "
                                    <table class='Table'>
                                        <th>id</th>
                                        <th>person_key</th>
                                        <th>publisher_id</th>
                                        <th>gender</th>
                                        <th>birth_date</th>
                                        <th>death_date</th>
                                        <th>final_resting_location</th>
                                        <th>birth_location_id</th>
                                        <th>hometown_location_id</th>
                                        <th>residence_location</th>
                                        <th>death_location_id</th>
                                        <th>age</th>
                                        <th>handicap</th>
                                        <th>affiliation_id</th>
                            ";
                            echo $tableHeaders;
                            //run through records
                            while($row = mysqli_fetch_assoc($select)){
                                $tableRows .= "
                                        <tr class='TableRow'>
                                            <td>".$row['id']."</td>
                                            <td>".$row['person_key']."</td>
                                            <td>".$row['publisher_id']."</td>
                                            <td>".$row['gender']."</td>
                                            <td>".$row['birth_date']."</td>
                                            <td>".$row['death_date']."</td>
                                            <td>".$row['final_resting_location_id']."</td>
                                            <td>".$row['birth_location_id']."</td>
                                            <td>".$row['hometown_location_id']."</td>
                                            <td>".$row['residence_location_id']."</td>
                                            <td>".$row['death_location_id']."</td>
                                            <td>".$row['age']."</td>
                                            <td>".$row['handicap']."</td>
                                            <td>".$row['affiliation_id']."</td>
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
            <div id="newPlayerFormPopup">
                <form action="validatePlayers.php" method="post">
                    <div class="addPlayerFormHeader">
                        <div class="formHeading">Create new Player</div>
                        <div class="formSubHeading">Please enter all fields</div>
                    </div>
                    <?php if(!empty($_SESSION['messages'])) {
                                if ($_SESSION['messages'] == 'Invalid Date format. Format needs to be in MM/DD/YYY.'){
                                    $_SESSION['dateOfBirth'] = "";
                                    echo "<h3 style='color: red; font-weight: bold;'> Invalid Date format. Format needs to be in MM/DD/YYY. </h3>";
                                    echo "<script> document.querySelector('.dateOfBirth').style.borderColor = 'red'; </script>";
                                }
                                else if ($_SESSION['messages'] == 'Invalid handicap value. The value must be a whole number between [0-54].'){
                                    $_SESSION['handicap'] = "";
                                    echo "<h3 style='color: red; font-weight: bold;'> Invalid handicap value. The value must be a whole number between [0-54]. </h3>";
                                    echo "<script> document.querySelector('.handicap').style.borderColor = 'red'; </script>";
                                }
                                else if ($_SESSION['messages'] == 'You did not select a Gender. Please do so.'){
                                    $_SESSION['gender'] = "";
                                    echo "<h3 style='color: red; font-weight: bold;'> You did not select a Gender. Please do so. </h3>";
                                    echo "<script> document.querySelector('.gender').style.borderColor = 'red'; </script>";
                                }
                                else if ($_SESSION['messages'] == 'Invalid ID or Date of Birth. Ensure the the IDs first 6 digits reflect the Date of Birth.'){
                                    $_SESSION['idNumber'] = "";
                                    echo "<h3 style='color: red; font-weight: bold;'> Invalid ID or Date of Birth. Ensure the the ID's first 6 digits reflect the Date of Birth. </h3>";
                                    echo "<script> document.querySelector('.idNumber').style.borderColor = 'red'; </script>";
                                }
                                else{
                                    $_SESSION['handicap'] ="";
                                    $_SESSION['age'] = "";
                                    $_SESSION['gender'] = "";
                                    $_SESSION['idNumber'] = "";
        
                                        echo "<div id='errorSignup'>
                                                <h3 style='color: red; font-weight: bold;'> Invalid submission. Please take note of the following when filling in the form: </h3>
                                                <ul style='color: red; font-weight: bold;'>
                                                    <li class='error'> Date of Birth should not be any future date </li>
                                                    <li class='error'> Handicap can only be between 0 - 54</li>
                                                    <li class='error'> Age can only be between 18 - 65</li>
                                                    <li class='error'> Gender may only be Male, Female or Other</li>
                                                    <li class='error'> ID Number/Passport Number but have 13 digits and the first six must match the date of birth.</li>
                                                </ul>
                                            </div>";
                                }
                            }?>
                    <hr>
                    <div id="formBodyContainer">
                        <div class="inputTextBox">
                            <label for="idNumber"><b>ID Number/Passport Number</b></label><br>
                            <input class="idNumber" type="text" placeholder="Enter your ID Number or Passport Number" name="idNumber" required max_length = '13'>
                            <div class="error"></div><br>
                        </div>
                        <div class="inputTextBox">
                            <label for="dateOfBirth"><b>Date of Birth</b></label><br>
                            <input class="dateOfBirth" type="date" name="dateOfBirth" required>
                            <div class="error"></div><br>
                        </div>
                        <div class="inputTextBox">
                            <label class="lblGender" for="gender"><b>Gender</b></label><br>
                            <input class="genderMale" type="radio" name="gender" value="Male">
                            <label class="lblGenderType" for="genderMale"><b>Male</b></label>
                            <input class="genderFemale" type="radio" name="gender" value="Female">
                            <label class="lblGenderType" for="genderFemale"><b>Female</b></label>
                            <input class="genderOther" type="radio" name="gender" value="Other">
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
                <form action="validatePlayers.php" method="post" id="deletePlayerForm">
                    <div class="deletePopupHeader">
                        <span>Enter the id of the player:</span>
                        <p> (note: not the person_key)<p>
                    </div>
                    <?php if (isset($_SESSION['messages']) && $_SESSION['messages'] == 'Invalid Email. The email must be in the format: something@example.com'){
                                    $_SESSION['pkEmail'] = "";
                                    echo "<div id='errorDelete'><h3 style='color: red; font-weight: bold;'> Invalid Email. The email must be in the format: something@example.com </h3>
                                        <script> document.querySelector('.pkEmail').style.borderColor = 'red'; </script></div>";
                                }
                        ?>
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
                <form action="validatePlayers.php" method="post" id="updatePlayerForm">
                    <div class="updatePopupHeader">
                        <span></span>
                    </div>
                    <div class="inputTextBox updateInputID">
                        <label>Player id</label><br>
                        <input class="idUpdate" type="text" name="idUpdate" placeholder="Enter the id">
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
        <?php
            include_once("footer.php");
        ?>
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
                    successPopup.children[0].innerHTML = 'Successfully Updated Users record';

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
    <script src="../js/PlayerPopups.js"></script>
    <script src="../js/inputValidationPlayers.js"></script>
    <script language="Javascript" type="text/javascript" src="../js/loaderFlag.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</body>
</html>
<?php session_unset(); session_destroy(); ?>