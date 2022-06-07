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
    require_once("configDB.php");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/manageStatistics.css">
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
                <span>Manage Golf Statistics</span>
                <p> Use the buttons on the left to manage the statistics</p>
            </div>
        </div>
        <div class="contentContainer">
            <div class="buttonsGrid">
                <button id="createNewStatistics">Add New stats</button>
                <button id="deleteStatistics">Delete a record from  the table</button>
                <button id="filterTable">List filter options</button>
                <form action="validateStatistics.php" id="filterForm" method="post">
                    <div class="filterFormContainer">
                        <div id="filterOptions">
                            <div>    
                                <input class="filter-option1" type="radio" name="filterOption1" value="tours">
                                <label class="lblFilter">View Tours</label>
                            </div>
                            <div>
                                <input class="filter-option2" type="radio" name="filterOption2" value="event">
                                <label class="lblFilter">View Events</label><br>
                            </div>
                            <div>    
                                <input class="filter-option3" type="radio" name="filterOption3" value="rounds">
                                <label class="lblFilter">View Rounds</label>
                            </div>
                            <div>
                                <input class="filter-option4" type="radio" name="filterOption4" value="15">
                                <label class="lblFilter">View Eagles >= 15</label><br>
                            </div>
                            <div>
                                <input class="filter-option5" type="radio" name="filterOption5" value="5">
                                <label class="lblFilter">View Birdies >= 5</label><br>
                            </div>
                            <div>
                                <input class="filter-option6" type="radio" name="filterOption6" value="3">
                                <label class="lblFilter">View Bogeys >= 3</label><br>
                            </div>
                            <div>
                                <input class="filter-option7" type="radio" name="filterOption7" value="5">
                                <label class="lblFilter">View Double Bogeys >= 5</label><br>
                            </div>
                            <div>
                                <input class="filter-option8" type="radio" name="filterOption8" value="300">
                                <label class="lblFilter">View Max Drive >= 300</label><br>
                            </div>
                            <div>
                                <input class="filter-option9" type="radio" name="filterOption9" value="-2">
                                <label class="lblFilter">View Avg Net score <= -2</label><br>
                            </div>
                            <div>
                                <input class="filter-option10" type="radio" name="filterOption10" value="reset">
                                <label class="lblFilter">Reset Table</label><br>
                            </div>
                        </div>
                        <button type="submit" class="submitFilter" name="submitFilter">Filter</button>
                    </div>
                </form>
                <button type="button" id="updateStatisticsData">Update Stats</button>
                <div id="updateOptions">
                    <div>    
                        <input class="update-option1" type="radio" name="updateOption1">
                        <label class="lblUpdate">Change Entity type</label>
                    </div>
                    <div>
                        <input class="update-option2" type="radio" name="updateOption2">
                        <label class="lblUpdate">Change Winner ID</label><br>
                    </div>
                    <div>
                        <input class="update-option3" type="radio" name="updateOption3">
                        <label class="lblUpdate">Change No. of eagles</label>
                    </div>
                    <div>
                        <input class="update-option4" type="radio" name="updateOption4">
                        <label class="lblUpdate">Change No. of birdies</label>
                    </div>
                    <div>
                        <input class="update-option5" type="radio" name="updateOption5">
                        <label class="lblUpdate">Change No. of bogeys</label>
                    </div>
                    <div>
                        <input class="update-option6" type="radio" name="updateOption6">
                        <label class="lblUpdate">Change No. of double bogeys</label>
                    </div>
                    <div>
                        <input class="update-option7" type="radio" name="updateOption7">
                        <label class="lblUpdate">Change Max drive</label><br>
                    </div>
                    <div>
                        <input class="update-option8" type="radio" name="updateOption8">
                        <label class="lblUpdate">Change average net score</label>
                    </div>
                    <div>
                        <input class="update-option9" type="radio" name="updateOption9">
                        <label class="lblUpdate">Change win count</label>
                    </div>
                    <div>
                        <input class="update-option10" type="radio" name="updateOption10">
                        <label class="lblUpdate">Change position</label>
                    </div>
                </div>
            </div>
            <div class="tableGrid">
                <!--we will build the table using javascript-->
                <?php 
                    if (empty($_SESSION['table'])){
                        $select = mysqli_query($conn,"SELECT * FROM golf_statistics ");
                        $tableRows = "";
                        if(mysqli_num_rows($select) > 0){
                            //load table
                            $tableHeaders = "
                                    <table class='Table'>
                                        <th>id</th>
                                        <th>entity_type</th>
                                        <th>entity_id</th>
                                        <th>person_id</th>
                                        <th>tour_ind</th>
                                        <th>event_ind</th>
                                        <th>round_ind</th>
                                        <th>player_ind</th>
                                        <th>winner_id</th>
                                        <th>leader_id</th>
                                        <th>NoOfEagles</th>
                                        <th>NoOfBirdies</th>
                                        <th>NoOfBogeys</th>
                                        <th>NoOfDBogeys</th>
                                        <th>MaxDrive</th>
                                        <th>Top10Count</th>
                                        <th>AvgNetScore</th>
                                        <th>WinCount</th>
                                        <th>Position</th>
                            ";
                            echo $tableHeaders;
                            //run through records
                            while($row = mysqli_fetch_assoc($select)){
                                $tableRows .= "
                                        <tr class='TableRow'>
                                            <td>".$row['id']."</td>
                                            <td>".$row['entity_type']."</td>
                                            <td>".$row['entity_id']."</td>
                                            <td>".$row['person_id']."</td>
                                            <td>".$row['tour_ind']."</td>
                                            <td>".$row['event_ind']."</td>
                                            <td>".$row['round_ind']."</td>
                                            <td>".$row['player_ind']."</td>
                                            <td>".$row['winner_id']."</td>
                                            <td>".$row['leader_id']."</td>
                                            <td>".$row['no_of_eagles']."</td>
                                            <td>".$row['no_of_birdies']."</td>
                                            <td>".$row['no_of_bogeys']."</td>
                                            <td>".$row['no_of_double_bogeys']."</td>
                                            <td>".$row['max_drive']."</td>
                                            <td>".$row['top10_cnt']."</td>
                                            <td>".$row['avg_net_score']."</td>
                                            <td>".$row['win_cnt']."</td>
                                            <td>".$row['position']."</td>
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
            <div id="newStatisticsPopupForm">
                    <form action="validateStatistics.php" method="post" class="signupForm"> <!-- onsubmit="return ValidateInput()"> -->
                        <div class="formContainer">
                            <h1>Add New Statistics</h1>
                            <p>Please fill in this form to add new statistics.</p>
                            
                            <?php if(!empty($_SESSION['messages'])) {
                                if ($_SESSION['messages'] == 'Invalid entity type. The entity type must be tours, events or rounds.'){
                                    $_SESSION['entity_type'] = "";
                                    echo "<h3 style='color: red; font-weight: bold;'> Invalid entity_type. The entity_type must be tours, events or rounds. </h3>";
                                    echo "<script> document.querySelector('.entity_type').style.borderColor = 'red'; </script>";
                                }
                                else if ($_SESSION['messages'] == 'Invalid entity_id. The entity_id must be a digit.'){
                                    $_SESSION['entity_id'] = "";
                                    echo "<h3 style='color: red; font-weight: bold;'> Invalid entity_id. The entity_id must be a digit. </h3>";
                                    echo "<script> document.querySelector('.entity_id').style.borderColor = 'red'; </script>";
                                }
                                else if ($_SESSION['messages'] == 'Invalid person_id. The person_id must be a digit.'){
                                    $_SESSION['person_id'] = "";
                                    echo "<h3 style='color: red; font-weight: bold;'> Invalid person_id. The person_id must be a digit. </h3>";
                                    echo "<script> document.querySelector('.person_id').style.borderColor = 'red'; </script>";
                                }
                                else if ($_SESSION['messages'] == 'Invalid tour_ind. The tour_ind must be a digit.'){
                                    $_SESSION['tour_ind'] = "";
                                    echo "<h3 style='color: red; font-weight: bold;'> Invalid tour_ind. The tour_ind must be a digit. </h3>";
                                    echo "<script> document.querySelector('.tour_ind').style.borderColor = 'red'; </script>";
                                }
                                else if ($_SESSION['messages'] == 'Invalid event_ind. The event_ind must be a digit.'){
                                    $_SESSION['event_ind'] = "";
                                    echo "<h3 style='color: red; font-weight: bold;'> Invalid event_ind. The event_ind must be a digit. </h3>";
                                    echo "<script> document.querySelector('.event_ind').style.borderColor = 'red'; </script>";
                                }
                                else if ($_SESSION['messages'] == 'Invalid round_ind. The round_ind must be a digit.'){
                                    $_SESSION['round_ind'] = "";
                                    echo "<h3 style='color: red; font-weight: bold;'> Invalid round_ind. The round_ind must be a digit. </h3>";
                                    echo "<script> document.querySelector('.round_ind').style.borderColor = 'red'; </script>";
                                }
                                else if ($_SESSION['messages'] == 'Invalid player_ind. The player_ind must be a digit.'){
                                    $_SESSION['player_ind'] = "";
                                    echo "<h3 style='color: red; font-weight: bold;'> Invalid player_ind. The player_ind must be a digit. </h3>";
                                    echo "<script> document.querySelector('.player_ind').style.borderColor = 'red'; </script>";
                                }
                                else if ($_SESSION['messages'] == 'Invalid winner_id. The winner_id must be a digit.'){
                                    $_SESSION['winner_id'] = "";
                                    echo "<h3 style='color: red; font-weight: bold;'> Invalid winner_id. The winner_id must be a digit. </h3>";
                                    echo "<script> document.querySelector('.winner_id').style.borderColor = 'red'; </script>";
                                }
                                else if ($_SESSION['messages'] == 'Invalid leader_id. The leader_id must be a digit.'){
                                    $_SESSION['leader_id'] = "";
                                    echo "<h3 style='color: red; font-weight: bold;'> Invalid leader_id. The leader_id must be a digit. </h3>";
                                    echo "<script> document.querySelector('.leader_id').style.borderColor = 'red'; </script>";
                                }
                                else if ($_SESSION['messages'] == 'Invalid no_of_eagles. The no_of_eagles must be a digit.'){
                                    $_SESSION['no_of_eagles'] = "";
                                    echo "<h3 style='color: red; font-weight: bold;'> Invalid no_of_eagles. The no_of_eagles must be a digit. </h3>";
                                    echo "<script> document.querySelector('.no_of_eagles').style.borderColor = 'red'; </script>";
                                }
                                else if ($_SESSION['messages'] == 'Invalid no_of_birdies. The no_of_birdies must be a digit.'){
                                    $_SESSION['no_of_birdies'] = "";
                                    echo "<h3 style='color: red; font-weight: bold;'> Invalid no_of_birdies. The no_of_birdies must be a digit. </h3>";
                                    echo "<script> document.querySelector('.no_of_birdies').style.borderColor = 'red'; </script>";
                                }
                                else if ($_SESSION['messages'] == 'Invalid no_of_bogeys. The no_of_bogeys must be a digit.'){
                                    $_SESSION['no_of_bogeys'] = "";
                                    echo "<h3 style='color: red; font-weight: bold;'> Invalid no_of_bogeys. The no_of_bogeys must be a digit. </h3>";
                                    echo "<script> document.querySelector('.no_of_bogeys').style.borderColor = 'red'; </script>";
                                }
                                else if ($_SESSION['messages'] == 'Invalid no_of_double_bogeys. The no_of_double_bogeys must be a digit.'){
                                    $_SESSION['no_of_double_bogeys'] = "";
                                    echo "<h3 style='color: red; font-weight: bold;'> Invalid no_of_double_bogeys. The no_of_double_bogeys must be a digit. </h3>";
                                    echo "<script> document.querySelector('.no_of_double_bogeys').style.borderColor = 'red'; </script>";
                                }
                                else if ($_SESSION['messages'] == 'Invalid max_drive. The max_drive must be a digit.'){
                                    $_SESSION['max_drive'] = "";
                                    echo "<h3 style='color: red; font-weight: bold;'> Invalid max_drive. The max_drive must be a digit. </h3>";
                                    echo "<script> document.querySelector('.max_drive').style.borderColor = 'red'; </script>";
                                }
                                else if ($_SESSION['messages'] == 'Invalid top10_cnt. The top10_cnt must be a digit.'){
                                    $_SESSION['top10_cnt'] = "";
                                    echo "<h3 style='color: red; font-weight: bold;'> Invalid top10_cnt. The top10_cnt must be a digit. </h3>";
                                    echo "<script> document.querySelector('.top10_cnt').style.borderColor = 'red'; </script>";
                                }
                                else if ($_SESSION['messages'] == 'Invalid avg_net_score. The avg_net_score must be a digit.'){
                                    $_SESSION['avg_net_score'] = "";
                                    echo "<h3 style='color: red; font-weight: bold;'> Invalid avg_net_score. The avg_net_score must be a digit. </h3>";
                                    echo "<script> document.querySelector('.avg_net_score').style.borderColor = 'red'; </script>";
                                }
                                else if ($_SESSION['messages'] == 'Invalid win_cnt. The win_cnt must be a digit.'){
                                    $_SESSION['win_cnt'] = "";
                                    echo "<h3 style='color: red; font-weight: bold;'> Invalid win_cnt. The win_cnt must be a digit. </h3>";
                                    echo "<script> document.querySelector('.win_cnt').style.borderColor = 'red'; </script>";
                                }
                                else if ($_SESSION['messages'] == 'Invalid position. The position must be a digit.'){
                                    $_SESSION['position'] = "";
                                    echo "<h3 style='color: red; font-weight: bold;'> Invalid position. The position must be a digit. </h3>";
                                    echo "<script> document.querySelector('.position').style.borderColor = 'red'; </script>";
                                }
                                else {$_SESSION['entity_type'] = "";
                                    $_SESSION['entity_id'] = "";
                                    $_SESSION['person_id'] = "";
                                    $_SESSION['tour_ind'] = "";
                                    $_SESSION['event_ind']="";
                                    $_SESSION['round_ind']="";
                                    $_SESSION['player_ind']="";
                                    $_SESSION['winner_id']="";
                                    $_SESSION['leader_id'] = "";
                                    $_SESSION['no_of_eagles'] = "";
                                    $_SESSION['no_of_birdies'] = "";
                                    $_SESSION['no_of_bogeys'] = "";
                                    $_SESSION['no_of_double_bogeys']="";
                                    $_SESSION['max_drive']="";
                                    $_SESSION['top10_cnt']="";
                                    $_SESSION['avg_net_score']="";
                                    $_SESSION['win_cnt']="";
                                    $_SESSION['position']="";
    
                                    echo "<div id='errorSignup'>
                                            <h3 style='color: red; font-weight: bold;'> Invalid submission. Please take note of the following when filling in the form: </h3>
                                            <ul style='color: red; font-weight: bold;'>
                                                <li class='error'> All input fields for id's must be digits.</li>
                                                <li class='error'> You need to choose an entity type.</li>
                                            </ul>
                                          </div>";
                                }
                            }?>
    
                            <hr>
    
                            <div class="inputTextBox">
                                <label for="entity_type"><b>Type of media</b></label><br>
                                <input class="toursType" type="radio" name="entity_type" value="tours">
                                <label for="toursType"><b>tours</b></label>
                                <input class="eventsType" type="radio" name="entity_type" value="events">
                                <label for="eventsType"><b>events</b></label>
                                <input class="roundsType" type="radio" name="entity_type" value="rounds">
                                <label for="roundsType"><b>rounds</b></label><br>
                                <div class="error"></div><br>
                                </div>
                            <div class="inputTextBox" >
                                <label for="entity_id"><b>Entity ID</b></label><br>
                                <input class="entity_id" type="number" placeholder="Enter entity id" name="entity_id" required min="0">
                                <div class="error"></div><br>
                            </div>
                            <div class="inputTextBox" >
                                <label for="person_id"><b>Person ID </b></label><br>
                                <input class="person_id" type="number" placeholder="Enter person_id" name="person_id" required min="0">
                                <div class="error"></div><br>
                            </div>
                            <div class="inputTextBox">
                                <label for="tour_ind"><b>Tour ind</b></label><br>
                                <input class="tour_ind" type="number" placeholder="Enter tour ind" name="tour_ind" required min="0">
                                <div class="error"></div><br>
                            </div>
                            <div class="inputTextBox">
                                <label for="event_ind"><b>Event ind</b></label><br>
                                <input class="event_ind" type="number" placeholder="Enter event ind" name="event_ind" min="0" required>
                                <div class="error"></div><br>
                            </div>
                            <div class="inputTextBox">
                                <label for="round_ind"><b>Round ind </b></label><br>
                                <input class="round_ind" type="number" placeholder="Enter Round ind " min="0" name="round_ind" required>
                                <div class="error"></div><br>
                            </div>                            
                            <div class="inputTextBox">
                                <label for="player_ind"><b>Player ind </b></label><br>
                                <input class="player_ind" type="number" placeholder="Enter Player ind " min="0" name="player_ind" required>
                                <div class="error"></div><br>
                            </div>
                            <div class="inputTextBox">
                                <label for="winner_id"><b>Winner ID </b></label><br>
                                <input class="winnder_id" type="number" placeholder="Enter winner id " min="0" name="winner_id" required>
                                <div class="error"></div><br>
                            </div>
                            <div class="inputTextBox">
                                <label for="leader_id"><b>Leader ID </b></label><br>
                                <input class="leader_id" type="number" placeholder="Enter leader id " min="0" name="leader_id" required>
                                <div class="error"></div><br>
                            </div>
                            <div class="inputTextBox">
                                <label for="no_of_eagles"><b>No of Eagles </b></label><br>
                                <input class="no_of_eagles" type="number" placeholder="Enter No of eagles " min="0" name="no_of_eagles" required>
                                <div class="error"></div><br>
                            </div>
                            <div class="inputTextBox">
                                <label for="no_of_birdies"><b>No of Birdies </b></label><br>
                                <input class="no_of_birdies" type="number" placeholder="Enter No of Birdies " min="0" name="no_of_birdies" required>
                                <div class="error"></div><br>
                            </div>
                            <div class="inputTextBox">
                                <label for="no_of_bogeys"><b>No of bogeys </b></label><br>
                                <input class="no_of_bogeys" type="number" placeholder="Enter No of bogeys " min="0" name="no_of_bogeys" required>
                                <div class="error"></div><br>
                            </div>
                            <div class="inputTextBox">
                                <label for="no_of_double_bogeys"><b>No of double bogeys </b></label><br>
                                <input class="no_of_double_bogeys" type="number" placeholder="Enter No of double bogeys " min="0" name="no_of_double_bogeys" required>
                                <div class="error"></div><br>
                            </div>
                            <div class="inputTextBox">
                                <label for="max_drive"><b>Max Drive </b></label><br>
                                <input class="max_drive" type="number" placeholder="Enter Max Drive " min="0" max="500"name="max_drive" required>
                                <div class="error"></div><br>
                            </div>
                            <div class="inputTextBox">
                                <label for="top10_cnt"><b>Top 10 count </b></label><br>
                                <input class="top10_cnt" type="number" placeholder="Enter Top 10 count " min="0" name="top10_cnt" required>
                                <div class="error"></div><br>
                            </div>
                            <div class="inputTextBox">
                                <label for="avg_net_score"><b>Avg Net Score</b></label><br>
                                <input class="avg_net_score" type="number" placeholder="Enter Avg Net Score" min="0" name="avg_net_score" required>
                                <div class="error"></div><br>
                            </div>
                            <div class="inputTextBox">
                                <label for="win_cnt"><b>Win Count</b></label><br>
                                <input class="win_cnt" type="number" placeholder="Enter Win Count" min="0" name="win_cnt" required>
                                <div class="error"></div><br>
                            </div>
                            <div class="inputTextBox">
                                <label for="position"><b>Position </b></label><br>
                                <input class="position" type="number" placeholder="Enter Position " min="0" name="position" required>
                                <div class="error"></div><br>
                            </div>
                            
                            <div class="submitButtons">
                                <button type="button" class="cancelbtn">Cancel</button>
                                <button type="submit" class="submitbtn" name="Submit">Sign Up</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="fullScreenPopupDelete">
                <div id="deleteStatisticsPopup">
                    <form action="validatStatistics.php" method="post" id="deleteStatisticsForm">
                        <div class="deletePopupHeader">
                            <span>Enter the id for the Statistics:</span>
                            <p> (note: not the entity or player id)<p>
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
                    <h1></h1>
                    <image class="Logo"></image>
                    <div class="popupButtons">
                        <button type="button" class="dismissPopup">Dismiss</button>
                    </div>
                </div>
            </div>
            <div class="fullScreenPopupUpdate">
                <div id="updateStatisticsPopup">
                    <form action="validateStatistics.php" method="post" id="updateStatisticsForm">
                        <div class="updatePopupHeader">
                            <span></span>
                        </div>
                        <div class="inputTextBox updateInputID">
                            <label>Statistics id</label><br>
                            <input class="idUpdate" type="text" name="idUpdate" placeholder="Enter the primary id">
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
    ?>
    <?php
        include_once("footer.php");
    ?>
    <script src="../js/StatisticsPopups.js"></script>
    <script language="Javascript" type="text/javascript" src="../js/inputValidationStatistics.js"></script>
    <script language="Javascript" type="text/javascript" src="../js/loaderFlag.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</body>
</html>
<?php session_unset(); session_destroy(); ?>