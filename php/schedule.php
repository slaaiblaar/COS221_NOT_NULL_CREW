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
    <link rel="stylesheet" href="../css/schedule.css">
    <title>Sunrise Golfing/View Tournaments Schedule</title>
    <script src="https://kit.fontawesome.com/1af5f85004.js" crossorigin="anonymous"></script>
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
                <span>Tournaments Schedule</span>
                <p> Use the buttons on the left to manage the schedule</p>
            </div>
        </div>
        <div class="contentContainer">
            <div class="buttonsGrid">
                <button type="button" id="filterTable">List filter options</button>
                <div id="filterOptions">
                    <div>    
                        <input class="filter-option1" type="radio" name="filterOption1">
                        <label class="lblFilter">View date</label>
                    </div>
                    <div>
                        <input class="filter-option2" type="radio" name="filterOption1">
                        <label class="lblFilter">View start time</label><br>
                    </div>
                    <div>
                        <input class="filter-option3" type="radio" name="filterOption1">
                        <label class="lblFilter">View start time < 15:00</label>
                    </div>
                    <div>
                        <input class="filter-option4" type="radio" name="filterOption1">
                        <label class="lblFilter">View end time</label>
                    </div>
                    <div>
                        <input class="filter-option5" type="radio" name="filterOption1">
                        <label class="lblFilter">View end time < 14:00</label>
                    </div>
                </div>
                <!-- <button id="updateTournamentData">Update a Tournament's data</button>
                <div id="updateOptions">
                    <div>    
                        <input class="update-option1" type="radio" name="updateOption1">
                        <label class="lblUpdate">Update Event key</label>
                    </div>
                    <div>
                        <input class="update-option2" type="radio" name="updateOption2">
                        <label class="lblUpdate">Update gender class</label>
                    </div>
                    <div>
                </div> -->
            </div>
            <div class="tableGrid">
                <!--we will build the table using javascript-->
            </div>
        </div>
        <div class="fullScreenPopupAdd">
            <!-- <div id="newTournamentFormPopup">
                <form action="validateTournamentSignUp.php" method="post">
                    <div class="addTournamentFormHeader">
                        <div class="formHeading">Create new Tournament</div>
                        <div class="formSubHeading">Please enter all fields</div>
                    </div>
                    <hr>
                    <div id="formBodyContainer">
                        <div class="inputTextBox">
                            <label style="padding-bottom: 20px" for="eventKey"><b>Tournament Name:</b></label><br>
                            <input class="eventKey" type="text" placeholder="Enter the name of the new tournament" name="eventKey" required max_length = '20'>
                            <div class="error"></div><br>
                        </div>
                        <div class="inputTextBox">
                            <label style="padding-bottom: 20px" for="startDate"><b>Start Date</b></label><br>
                            <input class="startDate" type="datetime-local" style="padding:5px" required>
                            <div class="error"></div><br>
                        </div>
                        <div class="inputTextBox">
                            <label style="padding-bottom: 20px" for="endDate"><b>End Date</b></label><br>
                            <input class="endDate" type="datetime-local" style="padding:10px" required>
                            <div class="error"></div><br>
                        </div>
                        <div class="inputTextBox">
                            <label style="padding-bottom: 20px" for="duration"><b>Tournament Duration (days)</b></label><br>
                            <input class="duration" type="number" style="width: 10%; text-align:centre" max="5" min="0" value="duration()" required>
                            <div class="error"></div><br>
                        </div>
                        <div class="inputTextBox">
                            <label style="margin-bottom: 10px" class="lblGender" for="gender"><b>Gender</b></label><br>
                            <input class="genderMen" type="radio" name="gender">
                            <label class="lblGenderType" for="genderMale"><b>Men</b></label>
                            <input class="genderWomen" type="radio" name="gender">
                            <label class="lblGenderType" for="genderFemale"><b>Women</b></label>
                        </div> 
                        <div class="inputTextBox" style="margin-top: 20px;margin-bottom:20px">
                            <label style="padding-bottom: 20px" class="lblStatus" for="status"><b>Status</b></label><br>
                            <input class="scheduled" type="radio" name="status">
                            <label class="lblStatusType" for="scheduled"><b>Scheduled</b></label>
                            <input class="canceled" type="radio" name="status">
                            <label class="lblStatusType" for="canceled"><b>Canceled</b></label>
                        </div>                        
                        
                        <div id="submitButtons">
                            <button type="button" class="cancelbtn">Cancel</button>
                            <button type="submit" class="submitbtn" name="Submit">Submit</button>
                        </div>
                    </div>
                </form>
                <hr class="endRuler">
            </div> -->
        </div>
        <div class="fullScreenPopupDelete">
            <!-- <div id="deleteTournamentPopup">
                <form action="validationTournaments.php" method="post" id="deleteTournamentForm">
                    <div class="deletePopupHeader">
                        <span>Enter the id of the tournament:</span>
                        <p> (note: not the event_key)<p>
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
            </div> -->
        </div>
        <!-- <div class="fullScreenPopupReg">
            <div id="SuccessfulRegPopup">
                <h1> Successful Registration </h1>
                <image class="Logo"></image>
                <div class="popupButtons">
                    <button type="button" class="undoReg">Undo Registration</button>
                    <button type="button" class="dismissPopup">Dismiss</button>
                </div>
            </div>
        </div> -->
        <div class="fullScreenPopupUpdate">
            <!-- <div id="updateTournamentPopup">
                <form action="validationTournaments.php" method="post" id="updateTournamentForm">
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
            </div> -->
        </div>
    </div>
    <?php
        include_once("footer.php");
    ?>
    <!-- <script language="Javascript" type="text/javascript" src="../js/validationTournaments.js"></script> -->
    <script language="Javascript" type="text/javascript" src="../js/schedule.js"></script>
    <!-- <script language="Javascript" type="text/javascript" src="../js/passwordToggle.js"></script> -->
    <script language="Javascript" type="text/javascript" src="../js/loaderFlag.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</body>
</html>