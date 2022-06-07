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
    require_once("configDB.php");?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/registerPlayer.css">
    <title>Sunrise Golfing/Register Players Tournaments</title>
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
                <span>View Players Scores</span>
                <p> Use the buttons on the left to manage the registration</p>
            </div>
        </div>
        <div class="contentContainer">
            <div class="buttonsGrid">
            <button id="createNewPlayerScore">Add a Player's Score</button>
                <button id="deletePlayerScore">Delete a Player's Score</button>
                <button id="filterTable">List filter options</button>
                <form action="validateRegisterPlayer.php" id="filterForm" method="post">
                    <div class="filterFormContainer">
                        <div id="filterOptions">
                            <div>    
                                <input class="filter-option1" type="radio" name="filterOption1" value="-2">
                                <label class="lblFilter">View net score <= -2</label>
                            </div>
                            <div>
                                <input class="filter-option2" type="radio" name="filterOption2" value="1">
                                <label class="lblFilter">View Player's with Birdies</label><br>
                            </div>
                            <div>
                                <input class="filter-option3" type="radio" name="filterOption3" value="1">
                                <label class="lblFilter">View Players with Eagles</label>
                            </div>
                            <div>
                                <input class="filter-option4" type="radio" name="filterOption4" value="1">
                                <label class="lblFilter">View Players with Bogeys</label>
                            </div>
                            <div>
                                <input class="filter-option5" type="radio" name="filterOption5" value="1">
                                <label class="lblFilter">View Players with Double Bogeys</label>
                            </div>
                            <div>
                                <input class="filter-option6" type="radio" name="filterOption6" value="ALL">
                                <label class="lblFilter">Reset table</label>
                            </div>
                        </div>
                        <button type="submit" class="submitFilter" name="submitFilter">Filter</button>
                    </div>
                </form>
                <button type="button" id="updatePlayerScoreData">Update a User's data</button>
                <div id="updateOptions">
                    <div>    
                        <input class="update-option1" type="radio" name="updateOption1">
                        <label class="lblUpdate">Change stroke count</label>
                    </div>
                    <div>
                        <input class="update-option2" type="radio" name="updateOption2">
                        <label class="lblUpdate">Change net_score</label><br>
                    </div>
                </div>
            </div>
            <div class="tableGrid">
                <?php 
                    if (empty($_SESSION['table'])){
                        $select = mysqli_query($conn,"SELECT * FROM scores ");
                        $tableRows = "";
                        if(mysqli_num_rows($select) > 0){
                            //load table
                            $tableHeaders = "
                                    <table class='Table'>
                                      <thead rowspan='1'>
                                        <th>person_id</th>
                                        <th>round_id</th>
                                        <th>hole_id</th>
                                        <th>stroke_count</th>
                                        <th>net_score</th>
                                        <th>birdie</th>
                                        <th>eagle</th>
                                        <th>bogey</th>
                                        <th>double_bogey</th>
                                        </thead>
                            ";
                            echo $tableHeaders;
                            //run through records
                            while($row = mysqli_fetch_assoc($select)){
                                $tableRows .= "
                                        <tr class='TableRow' rowspan='1'>
                                            <td>".$row['person_id']."</td>
                                            <td>".$row['round_id']."</td>
                                            <td>".$row['hole_id']."</td>
                                            <td>".$row['stroke_count']."</td>
                                            <td>".$row['net_score']."</td>
                                            <td>".$row['birdie']."</td>
                                            <td>".$row['eagle']."</td>
                                            <td>".$row['bogey']."</td>
                                            <td>".$row['double_bogey']."</td>
                                        </tr>
                                ";
                            }
                            
                            echo $tableRows . "</table>";
                        }
                        else{
                            $tableHeaders = "
                                    <table class='Table'>
                                        <thead rowspan='1'>
                                            <th>person_id</th>
                                            <th>round_id</th>
                                            <th>hole_id</th>
                                            <th>stroke_count</th>
                                            <th>net_score</th>
                                            <th>birdie</th>
                                            <th>eagle</th>
                                            <th>bogey</th>
                                            <th>double_bogey</th>
                                        </thead>
                            ";
                            echo $tableHeaders;
                            echo "<tr>
                                    <td colspan='3'> No data found </td>
                                </tr>
                                </table>";

                        }
                    }
                    else{
                        echo $_SESSION['table'];
                    }
                ?>
            </div>
            <div class="fullScreenPopupAdd">
            <div id="newRegisterPlayerPopupForm">
                    <form action="validateRegisterPlayer.php" method="post" class="signupForm"> <!-- onsubmit="return ValidateInput()"> -->
                        <div class="formContainer">
                            <h1>Add Player Score</h1>
                            <p>Please fill in this form to create an account.</p>
    
                            <hr>
    
                            <div class="inputTextBox">
                                <label for="person_id"><b>Person ID</b></label><br>
                                <input class= 'person_id' type="number" min='1' placeholder="Enter person id" name="person_id" required max_length = '45'>
                                <div class="error"></div><br>
                            </div>
                            <div class="inputTextBox" >
                                <label for="round_id"><b>Round ID</b></label><br>
                                <input class="round_id" type="number" placeholder="Enter round id" name="round_id" required max_length = '45' min='1'>
                                <div class="error"></div><br>
                            </div>
                            <div class="inputTextBox" >
                                <label for="hole_id"><b>Hole ID</b></label><br>
                                <input class="hole_id" type="number" placeholder="Enter hole id" required name="hole_id" max_length = '45' min='1'>
                                <div class="error"></div><br>
                            </div>
                            <div class="inputTextBox" >
                                <label for="stroke_count"><b>Stroke Count</b></label><br>
                                <input class="stroke_count" type="number" placeholder="Enter hole id" required name="stroke_count" max_length = '45'>
                                <div class="error"></div><br>
                            </div>
                            <div class="inputTextBox" >
                                <label for="net_score"><b>Net Score</b></label><br>
                                <input class="net_score" type="number" placeholder="Enter Net Score" required name="net_score" max_length = '45'>
                                <div class="error"></div><br>
                            </div>
                            <div class="inputTextBox">
                                <label for="strokeType"><b>Type of Stroke</b></label><br>
                                <input class="birdie" type="radio" required name="strokeType" value="1">
                                <label for="birdie"><b>Birdie</b></label>
                                <input class="eagle" type="radio" required name="strokeType" value="1">
                                <label for="eagle"><b>Eagle</b></label><br>
                                <input class="bogey" type="radio" required name="strokeType" value="1">
                                <label for="bogey"><b>Bogey</b></label>
                                <input class="double_bogey" type="radio" required name="strokeType" value="1">
                                <label for="double_bogey"><b>Double Bogey</b></label><br>
                                <div class="error"></div><br>
                            </div>
                            
                            <div class="submitButtons">
                                <button type="button" class="cancelbtn">Cancel</button>
                                <button type="submit" class="submitbtn" name="Submit">Add Score</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="fullScreenPopupDelete">
                <div id="deleteRegisterPlayerPopup">
                    <form action="validateRegisterPlayer.php" method="post" id="deleteRegisterPlayerForm">
                        <div class="deletePopupHeader">
                            <span>Enter the Person Id, Round ID and Hole ID of the Record:</span>
                            <p> (Please ensure it is all digits)<p>
                        </div>
                        <div class="inputTextBox">
                            <label>Person ID</label><br>
                            <input class="person_idDelete" type="number" min='1' required name="person_idDelete" placeholder="Enter the person id">
                            <div class="error"></div><br>
                        </div>
                        <div class="inputTextBox">
                            <label>Round ID</label><br>
                            <input class="round_idDelete" type="number" min='1' required name="round_idDelete" placeholder="Enter the round id">
                            <div class="error"></div><br>
                        </div>
                        <div class="inputTextBox">
                            <label>Hole ID</label><br>
                            <input class="hole_idDelete" type="number" min='1' required name="hole_idDelete" placeholder="Enter the hole id">
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
                <div id="updateRegisterPlayerPopup">
                    <form action="validateRegisterPlayer.php" method="post" id="updateRegisterPlayerForm">
                        <div class="updatePopupHeader">
                            <span></span>
                        </div>
                        <div class="inputTextBox updateInputID">
                            <label>Person ID</label><br>
                            <input class="person_idUpdate" type="number" min='1' required name="person_idUpdate" placeholder="Enter the person id">
                            <div class="error"></div><br>
                        </div>
                        <div class="inputTextBox updateInputID">
                            <label>Round ID</label><br>
                            <input class="round_idUpdate" type="number" min='1' required name="round_idUpdate" placeholder="Enter the round id">
                            <div class="error"></div><br>
                        </div>
                        <div class="inputTextBox updateInputID">
                            <label>Hole ID</label><br>
                            <input class="hole_idUpdate" type="number" min='1' name="hole_idUpdate" placeholder="Enter the hole id">
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
        <?php
            include_once("footer.php");
        ?>
        </div>
        
    </div>

    <script language="Javascript" type="text/javascript" src="../js/inputValidationRegisterPlayer.js"></script>
    <script language="Javascript" type="text/javascript" src="../js/registerPlayer.js"></script>
    <script language="Javascript" type="text/javascript" src="../js/loaderFlag.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</body>
</html>