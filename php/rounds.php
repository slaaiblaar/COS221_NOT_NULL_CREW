<?php
   if(!isset($_SESSION)) session_start();
    session_start(); 
    
    require_once("setDBEnvVar.php");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="../css/rounds.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/1af5f85004.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <title>Golf Rounds</title>
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

        <?php 
            include_once("header.php");
        ?>

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
                <span>Manage Rounds</span>
                <p>Use the buttons on the left to manage the rounds</p>
            </div>
        </div>
        <div class="contentContainer">
            <div class="buttonsGrid">
                <button id="createNewRound">Create New Round</button>
                <button id="deleteRound">Delete a Round from the table</button>
                <!-- <button id="filterTable">List filter options</button>
                <div id="filterOptions">
                    <div>
                        <input type="radio" name="filterOption1" class="filter-option1">
                        <label for="lblFilter">View Round</label>
                    </div>
                    <div>
                        <input type="radio" name="filterOption2" class="filter-option2">
                        <label for="lblFilter">View Sites</label>
                    </div>
                </div> -->
                <button id="updateRound">Update a Round's data</button>
                <div id="updateOptions">
                    <div>
                        <input type="radio" name="updateOption1" class="update-option1">
                        <label for="lblUpdate">Update Round number</label>
                    </div>
                    <div>
                        <input type="radio" name="updateOption2" class="update-option2">
                        <label for="lblUpdate">Update Event ID</label>
                    </div>
                    <div>
                        <input type="radio" name="updateOption3" class="update-option3">
                        <label for="lblUpdate">Update Leader ID</label>
                    </div>
                    <div>
                        <input type="radio" name="updateOption4" class="update-option4">
                        <label for="lblUpdate">Update State</label>
                    </div>
                </div>
            </div>

            <div class="tableGrid">
                <div id = "TableSize">
                    <!-- include Tours table -->
                    <?php
                        include_once("../php/roundTableDisplay.php");
                        
                        if(array_key_exists('ApplyFilter', $_POST)) 
                        {
                            $RoundNum = $_POST["RoundNumDrpDwn"];
                            $EventName = $_POST["EventNameDrpDwn"];
                            $LeaderName = $_POST["LeaderNameDrpDwn"];
                            $State = $_POST["RoundStateFilter"];
                           
                            FilterTable($RoundNum, $EventName, $LeaderName, $State);
                           
                            unset($_POST);
                            $_POST = array();
                        }
                        else
                        {
                            NormalTable();
                        }

                    ?>
                </div>
                
            </div>
        </div>

        <div class="fullScreenPopupAdd">
            <div id="newRoundFormPopup">
                <form action="addRoundValidationForm.php" method="post" onsubmit="return validateAddInput()">
                    <div class="addRoundFormHeader">
                        <div class="formHeading">Create new Round</div>
                        <div class="formSubHeading">Please enter all fields</div>
                    </div>
                    <hr>
                    <div id="formBodyContainer">
                        <div class="inputTextBox">
                            <label for="RoundNo"><b>Round Number</b></label><br>
                            <input type="number" name="RoundNo" id="RoundNo" min="1" max="99" placeholder="Enter Round number [1-99]">
                            <small><?php if(isset($_SESSION["RoundNoError"])) 
                                echo $_SESSION["RoundNoError"];
                            else echo "";
                            ?></small>
                        </div><br>
                            
                        <div class="inputTextBox">
                            <label for="eventId"><b>Event ID</b></label><br>
                            <input type="number" name="eventId" id="eventId" min="1" placeholder="Enter event ID">
                            <small><?php if(isset($_SESSION["eventIdError"])) 
                                echo $_SESSION["eventIdError"];
                            else echo "";
                            ?></small>
                        </div><br>

                        <div class="inputTextBox">
                            <label for="leaderId"><b>Leader ID</b></label><br>
                            <input type="number" name="leaderId" id="leaderId" min="1" placeholder="Enter Leader ID">
                            <small><?php if(isset($_SESSION["leaderIdError"])) 
                                echo $_SESSION["leaderIdError"];
                            else echo "";
                            ?></small>
                        </div><br>

                        <div class="inputTextBox">
                            <label for="RoundStateCreate"><b>Choose the Round number:</b></label><br>
                            <select name='RoundStateCreate' id='RoundStateCreate' class="RoundsCreateInput">
                                <option value= 'Scheduled'>Scheduled</option>
                                <option value= 'In+progress'>In progress</option>
                                <option value= 'Finished'>Finished</option>
                                <option value= 'Cancelled'>Cancelled</option>
                                <option value= 'Postponed'>Postponed</option>
                            </select>
                        </div>
                        
                        <div id="submitButtons">
                            <button type="button" class="cancelbtn">Cancel</button>
                            <button type="submit" class="createbtn" name="Submit">Submit</button>
                        </div>
                    </div>
                </form>
                <hr class="endRuler">
            </div>
        </div>

        <div class="fullScreenPopupDelete">
            <div id="deleteRoundPopup">
                <form action="delRoundValidationForm.php" method="post" id="deleteRoundForm" onsubmit="return validateAddInput()">
                    <div id="formBodyContainer">
                        <div class="inputTextBox">
                            <label for="RoundNo"><b>Round number</b></label><br>
                            <input type="number" name="RoundNo" id="RoundNo" min="1" max="99" placeholder="Enter Round number [1-99]">
                            <small><?php if(isset($_SESSION["RoundNoError"])) 
                                echo $_SESSION["RoundNoError"];
                            else echo "";
                            ?></small>
                        </div><br>

                        <div class="inputTextBox">
                            <label for="eventId"><b>Event ID</b></label><br>
                            <input type="number" name="eventId" id="eventId" min="1" placeholder="Enter event ID">
                            <small><?php if(isset($_SESSION["eventIdError"])) 
                                echo $_SESSION["eventIdError"];
                            else echo "";
                            ?></small>
                        </div><br>

                        <div class="inputTextBox">
                            <label for="leaderId"><b>Leader ID</b></label><br>
                            <input type="number" name="leaderId" id="leaderId" min="1" placeholder="Enter Leader ID">
                            <small><?php if(isset($_SESSION["leaderIdError"])) 
                                echo $_SESSION["leaderIdError"];
                            else echo "";
                            ?></small>
                        </div><br>

                        <div class="inputTextBox">
                            <label for="state"><b>State</b></label><br>
                            <input type="number" name="state" id="state" min="1" placeholder="Enter state (Scheduled','In progress','Finished','Cancelled','Postponed)">
                            <small><?php if(isset($_SESSION["stateError"])) 
                                echo $_SESSION["stateError"];
                            else echo "";
                            ?></small>
                        </div><br>

                        <div class="submitButtons">
                            <button type="button" class="cancelbtnDel">Cancel</button>
                            <button type="submit" class="submitbtnDel" name="Submit">Delete</button>
                        </div>
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
            <div id="updateRoundPopup">
                <form action="updateRoundValidationForm.php" method="post" id="updateRoundForm">
                    <div class="updatePopupHeader">
                        <span></span>
                    </div>
                    <hr>
                    <div id="formBodyContainer">
                        <div class="inputTextBox">
                            <label for="RoundNumberUpdate"><b>Enter the Round Number:</b></label><br>
                            <input class="RoundsUpdateInput" type="number" placeholder="Number" name="RoundNumberUpdate" id= "RoundNumberUpdate" min="1" required>
                            <div class="error" id = "RoundNumberErrorUpdate"></div><br>
                        </div>
                        <div class="inputTextBox">
                            <label for="EventNamesUpdate"><b>Choose a Tournament:</b></label><br>
                            <?php
                                include_once("../php/roundTableDisplay.php");
                                PopulateAddLeaderNDropDown("Update");
                            ?>

                    <div class="inputTextBox updateInput">
                        <input type="text" name="updatePopupInput" class="updatePopupInput">
                        <small></small>
                    </div>
                        </div>
                        <div class="inputTextBox">
                            <label for="RoundStateUpdate"><b>Choose the Round number:</b></label><br>
                            <select name='RoundStateUpdate' id='RoundStateUpdate' class="RoundsUpdateInput">
                                <option value= 'Scheduled'>Scheduled</option>
                                <option value= 'In+progress'>In progress</option>
                                <option value= 'Finished'>Finished</option>
                                <option value= 'Cancelled'>Cancelled</option>
                                <option value= 'Postponed'>Postponed</option>
                            </select>
                        </div>
                        <div id="submitButtons">
                            <button type="button" class="cancelbtnUpdate" id="cancelbtnUpdate" >Cancel</button>
                            <button type="submit" class="submitbtnUpdate" id="submitbtnUpdate" name="Submit" onclick="Update()">Update</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <?php
            include_once("footer.php");
        ?>
    </div>

    <script src="../js/RoundPopups.js"></script>
    <script src="../js/rounds.js"></script>
    <script src="../js/loaderFlag.js"></script>
    <script src="../js/sideMenu.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</body>
</html>