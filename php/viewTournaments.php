<!--
    MEMBERS of NOT_NULL_CREW:
    u19043512
    u21446271
    u19234806
    u21457451
    u04929552
    u21457060
-->
<?php session_start(); require_once("setDBEnvVar.php"); require_once("configDB.php");?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/viewTournaments.css">
    <title>Sunrise Golfing/View Tournaments</title>
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
                <span>Tournaments</span>
                <p> Use the buttons on the left to manage the tournaments</p>
            </div>
        </div>
        <div class="contentContainer">
            <div class="buttonsGrid">
                <button id="createNewTournament">Create New Tournament</button>
                <button id="deleteTournament">Delete a tournament from  the table</button>
                <button type="button" id="filterTable">List filter options</button>
                <form action="validateTournamentCreate.php" id="filterForm" method="post">
                    <div class="filterFormContainer">
                        <div id="filterOptions">
                            <div>    
                                <input class="filter-option1" type="radio" name="filterOption1" value="Men">
                                <label class="lblFilter">View Men's Tournaments</label>
                            </div>
                            <div>
                                <input class="filter-option2" type="radio" name="filterOption2" value="Women">
                                <label class="lblFilter">View Women's Tournaments</label><br>
                            </div>
                            <div>
                                <input class="filter-option3" type="radio" name="filterOption3" value="3">
                                <label class="lblFilter">View Duration >= 3</label>
                            </div>
                            <div>
                                <input class="filter-option4" type="radio" name="filterOption4" value="Scheduled">
                                <label class="lblFilter">View Scheduled Tournaments</label>
                            </div>
                            <div>
                                <input class="filter-option5" type="radio" name="filterOption5" value="Canceled">
                                <label class="lblFilter">View Canceled Tournaments</label>
                            </div>
                            <div>
                                <input class="filter-option6" type="radio" name="filterOption6">
                                <label class="lblFilter">Reset Table</label>
                            </div>
                        </div>
                        <button type="submit" class="submitFilter" name="submitFilter">Filter</button>
                    </div>
                </form>
                <button id="updateTournamentData">Update a Tournament's data</button>
                <div id="updateOptions">
                    <div>    
                        <input class="update-option1" type="radio" name="updateOption1">
                        <label class="lblUpdate">Update Event key</label>
                    </div>
                    <div>
                        <input class="update-option2" type="radio" name="updateOption1">
                        <label class="lblUpdate">Update gender class</label>
                    </div>
                    <div>
                        <input class="update-option3" type="radio" name="updateOption1">
                        <label class="lblUpdate">Update status</label>
                    </div>
                </div>
            </div>
            <div class="tableGrid">
                <!--we will build the table using javascript-->
                <?php 
                    if (empty($_SESSION['table'])){
                        $select = mysqli_query($conn,"SELECT * FROM events ");
                        $tableRows = "";
                        if(mysqli_num_rows($select) > 0){
                            //load table
                            $tableHeaders = "
                                        <table class='Table'>
                                            <th>id</th>
                                            <th>event_key</th>
                                            <th>publisher_id</th>
                                            <th>start_date_time</th>
                                            <th>end_date_time</th>
                                            <th>site_id</th>
                                            <th>duration</th>
                                            <th>event_status</th>
                                            <th>gender</th>
                                            <th>tour_id</th>
                                            <th>year</th>
                            ";
                            echo $tableHeaders;
                            //run through records
                            while($row = mysqli_fetch_assoc($select)){
                                $tableRows .= "
                                            <tr class='TableRow'>
                                                <td>".$row['id']."</td>
                                                <td>".$row['event_key']."</td>
                                                <td>".$row['publisher_id']."</td>
                                                <td>".$row['start_date_time']."</td>
                                                <td>".$row['end_date_time']."</td>
                                                <td>".$row['site_id']."</td>
                                                <td>".$row['duration']."</td>
                                                <td>".$row['event_status']."</td>
                                                <td>".$row['gender']."</td>
                                                <td>".$row['tour_id']."</td>
                                                <td>".$row['year']."</td>
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
                        error_log($_SESSION['table']);
                        echo $_SESSION['table'];
                    }
                ?>
            </div>
        </div>
        <div class="fullScreenPopupAdd">
            <div id="newTournamentFormPopup" style="height: 100%">
                <form action="validateTournamentCreate.php" method="post">
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
                            <label style="padding-bottom: 20px" for="startDate"><b>Start Date:</b></label><br>
                            <input class="startDate" type="datetime-local" style="padding:5px" name="startDate" required>
                            <div class="error"></div><br>
                        </div>
                        <div class="inputTextBox">
                            <label style="padding-bottom: 20px" for="endDate"><b>End Date:</b></label><br>
                            <input class="endDate" type="datetime-local" style="padding:10px" name="endDate" required>
                            <div class="error"></div><br>
                        </div>
                        <div class="inputTextBox">
                            <label style="padding-bottom: 20px" for="duration"><b>Tournament Duration (days):</b></label><br>
                            <input class="duration" type="number" style="width: 10%; text-align:centre" max="5" min="0" name="duration" required>
                            <div class="error"></div><br>
                        </div>
                        <div class="inputTextBox">
                            <label style="margin-bottom: 10px" class="lblGender" for="gender"><b>Gender:</b></label><br>
                            <input class="genderMen" type="radio" name="gender">
                            <label class="lblGenderType" for="genderMale"><b>Men</b></label>
                            <input class="genderWomen" type="radio" name="gender">
                            <label class="lblGenderType" for="genderFemale"><b>Women</b></label>
                        </div> 
                        <div class="inputTextBox" style="margin-top: 20px;margin-bottom:20px">
                            <label style="padding-bottom: 20px" class="lblStatus" for="status"><b>Status:</b></label><br>
                            <input class="scheduled" type="radio" checked=true name="status">
                            <label class="lblStatusType" for="scheduled"><b>Scheduled</b></label>
                            <!-- <input class="canceled" type="radio" name="status"> -->
                            <!-- <label class="lblStatusType" for="canceled"><b>Canceled</b></label> -->
                        </div>   
                        <div class="inputTextBox">
                            <label style="padding-bottom: 20px" for="year"><b>Year:</b></label><br>
                            <input class="year" type="text" name="year" readonly style="width: 10%; text-align:centre" value="2022" required>
                            <div class="error"></div><br>
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
            <div id="deleteTournamentPopup">
                <form action="validateTournamentCreate.php" method="post" id="deleteTournamentForm">
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
            <div id="updateTournamentPopup">
                <form action="validateTournamentCreate.php" method="post" id="updateTournamentForm">
                    <div class="updatePopupHeader">
                        <span></span>
                    </div>
                    <div class="inputTextBox updateInputID">
                        <label>Event id</label><br>
                        <input class="idUpdate" type="text" name="id" placeholder="Enter the primary id">
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
    
    <script language="Javascript" type="text/javascript" src="../js/validationTournaments.js"></script>
    <script language="Javascript" type="text/javascript" src="../js/tournamentPopups.js"></script>
    <script language="Javascript" type="text/javascript" src="../js/loaderFlag.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</body>
</html>