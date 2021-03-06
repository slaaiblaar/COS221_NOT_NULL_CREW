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

    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <title>Rounds</title>
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
            require_once("../php/header.php");
        ?>
        <!-- inclusion of navbar end-->
        <br/><br/>
        <div id="pageHeader">
            <div class="pageHeadings">
                <span>Manage Rounds</span>
                <p> Use the buttons on the left to manage the Rounds</p>
            </div>
        </div>

        <div class="contentContainer">
            <div class="buttonsGrid">

                <button type="button" id="createNewRound">Create a New Round</button>
                <button type="button" id="deleteRound" onmouseup="HasActive('delete')">Delete a Round from the table</button>
                <button type="button" id="updateRoundData" onmouseup="HasActive('update')">Update a Round's data</button>

                <button type="button" id="filterTable">List filter options</button>
                <form id="filterOptions" method = "post" onsubmit="clearTable()">

                    <?php
                        include_once("../php/roundTableDisplay.php");

                        PopulateDropDown();
                    ?>
                    
                    <input type="submit" name = "ApplyFilter" id="ApplyFilter" value="Apply Filter"/>
                </form>

                <script>
                    function clearTable()
                    {
                        document.getElementById("TableSize").innerhtml = "";
                    }
                </script>

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

        <!-- New Round -->
        <div class="fullScreenPopupAdd">
            <div id="newRoundFormPopup">
                <form id="createRoundForm"  onsubmit = "return InsertCheck()">
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

                            <label for="RoundNumberCreate"><b>Enter the Round Number:</b></label><br>
                            <input class="RoundsCreateInput" type="number" placeholder="Number" name="RoundNumberCreate" id= "RoundNumberCreate" min="1" required>
                            <div class="error" id = "RoundLengthErrorCreate"></div><br>
                        </div>
                        <div class="inputTextBox">
                            <label for="EventNamesCreate"><b>Choose a Tournament:</b></label><br>
                            <?php
                                include_once("../php/roundTableDisplay.php");

                                PopulateAddEventNDropDown("Insert");
                            ?>
                        </div>
                        <div class="inputTextBox">
                            <label for="LeaderNamesCreate"><b>Choose a Leader's Name:</b></label><br>
                            <?php
                                include_once("../php/roundTableDisplay.php");

                                PopulateAddLeaderNDropDown("Insert");
                            ?>
                        </div>
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
                            <button type="submit" class="submitbtn" id="SubmitCreateRound" onclick="Insert()">Submit</button>
                        </div>
                        
                    </div>
                </form>

                <hr class="endRuler">

            </div>
        </div>

        <!-- Delete Round -->
        <div class="fullScreenPopupDelete">
            <div id="deleteRoundPopup">
                <forms id="DeleteRoundForm">
                    <div class="addRoundFormHeader">
                        <div class="formHeading">Delete Round</div>
                    </div>
                    <hr>
                    <div id="formBodyContainer">
                        <div class="inputTextBox">
                            <label for="DeleteRoundNum"><b>Round Number:</b></label><br>
                            <input class="DeleteRoundInput" type="text" placeholder="Round Number" name="DeleteRoundNum" id= "DeleteRoundNum" disabled>
                        </div>
                        <div class="inputTextBox">
                            <label for="DeleteEventName"><b>Tournament:</b></label><br>
                            <input class="DeleteRoundInput" type="text" placeholder="Tournament" name="DeleteEventName" id= "DeleteEventName" disabled>
                        </div>
                        <div class="inputTextBox">
                            <label for="DeleteLeaderName"><b>Leader:</b></label><br>
                            <input class="DeleteRoundInput" type="text" placeholder="No Leader" name="DeleteLeaderName" id= "DeleteLeaderName" disabled>
                        </div>
                        <div class="inputTextBox">
                            <label for="DeleteState"><b>State:</b></label><br>
                            <input class="DeleteRoundInput" type="text" placeholder="State" name="DeleteState" id= "DeleteState" disabled>
                        </div>
                    </div>
                    <div id="submitButtons">
                        <button type="button" class="cancelbtnDel">Cancel</button>
                        <button type="submit" class="submitbtnDel" id="submitbtnDel" name="Submit" onclick="Delete()">Delete</button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Update Round -->
        <div class="fullScreenPopupUpdate">
            <div id="updateRoundPopup">
                <forms id="updateRoundForm" onsubmit = "return UpdateCheck()">
                    <div class="addRoundFormHeader">
                        <div class="formHeading">Update Tour</div>
                    </div>
                    <hr>
                    <div id="formBodyContainer">
                        <div class="inputTextBox">
                            <label for="RoundNumberUpdate"><b>Enter the Round Number:</b></label><br>
                            <input class="RoundsUpdateInput" type="number" placeholder="Number" name="RoundNumberUpdate" id= "RoundNumberUpdate" min="1" required>

                            <div class="error" id = "RoundNumberErrorUpdate"></div><br>
                            <div class="error" id = "RoundNumberErrorUpdate"></div><br>

                        </div>
                        <div class="inputTextBox">
                            <label for="EventNamesUpdate"><b>Choose a Tournament:</b></label><br>
                            <?php
                                include_once("../php/roundTableDisplay.php");

                                PopulateAddEventNDropDown("Update");
                            ?>
                        </div>
                        <div class="inputTextBox">
                            <label for="LeaderNamesUpdate"><b>Choose a Leader's Name:</b></label><br>
                            <?php
                                include_once("../php/roundTableDisplay.php");

                                PopulateAddLeaderNDropDown("Update");
                            ?>
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
            include_once("../php/footer.php");
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