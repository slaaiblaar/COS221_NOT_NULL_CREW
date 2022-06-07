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
    <link rel="stylesheet" href="../css/scores.css">
    <title>Sunrise Golfing/View Strokes</title>
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
                <span>Strokes</span>
                <p> Use the buttons on the left to manage the strokes</p>
            </div>
        </div>
        <div class="contentContainer">
            <div class="buttonsGrid">
                <button id="createNewStroke">Create New Stroke</button>
                <button id="deleteStroke">Delete a stroke from  the table</button>
                <button type="button" id="filterTable">List filter options</button>
                <div id="filterOptions">
                    <div>    
                        <input class="filter-option1" type="radio" name="filterOption1" value="100">
                        <label class="lblFilter">View Distances >= 100</label>
                    </div>
                    <div>
                        <input class="filter-option2" type="radio" name="filterOption1">
                        <label class="lblFilter">View Clubs against Distance</label><br>
                    </div>
                    <div>
                        <input class="filter-option3" type="radio" name="filterOption1">
                        <label class="lblFilter">View Distance <= 200</label>
                    </div>
                    <div>
                        <input class="filter-option4" type="radio" name="filterOption1">
                        <label class="lblFilter">View Distance vs Landing</label>
                    </div>
                    <div>
                        <input class="filter-option5" type="radio" name="filterOption1">
                        <label class="lblFilter">Reset Table</label>
                    </div>
                    <button type="submit" class="submitFilter" name="submitFilter">Filter</button>
                </div>
                <button id="updateStrokeData">Update a Stroke's data</button>
                <div id="updateOptions">
                    <div>    
                        <input class="update-option1" type="radio" name="updateOption1">
                        <label class="lblUpdate">Update Club Used</label>
                    </div>
                    <div>
                        <input class="update-option2" type="radio" name="updateOption1">
                        <label class="lblUpdate">Update Landing</label>
                    </div>
                    <div>
                        <input class="update-option3" type="radio" name="updateOption1">
                        <label class="lblUpdate">Update Distance</label>
                    </div>
                </div>
            </div>
            <div class="tableGrid">
                 <!--we will build the table using javascript-->
                 <?php 
                    if (empty($_SESSION['table'])){
                        $select = mysqli_query($conn,"SELECT * FROM strokes ");
                        $tableRows = "";
                        if(mysqli_num_rows($select) > 0){
                            //load table
                            $tableHeaders = "
                                    <table class='Table'>
                                        <th>stroke_no</th>
                                        <th>round_id</th>
                                        <th>hole_id</th>
                                        <th>person_id</th>
                                        <th>club_used</th>
                                        <th>distance</th>
                                        <th>landing</th>
                            ";
                            echo $tableHeaders;
                            //run through records
                            while($row = mysqli_fetch_assoc($select)){
                                $tableRows .= "
                                        <tr class='TableRow'>
                                            <td>".$row['stroke_no']."</td>
                                            <td>".$row['round_id']."</td>
                                            <td>".$row['revision_id']."</td>
                                            <td>".$row['hole_id']."</td>
                                            <td>".$row['person_id']."</td>
                                            <td>".$row['club_used']."</td>
                                            <td>".$row['credit_id']."</td>
                                            <td>".$row['distance']."</td>
                                            <td>".$row['landing']."</td>
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
            <div id="newStrokesFormPopup" style="height: 100%">
                <form action="validateStrokesCreate.php" method="post">
                    <div class="addStrokesFormHeader">
                        <div class="formHeading">Create new Strokes</div>
                        <div class="formSubHeading">Please enter all fields</div>
                    </div>
                    <hr>
                    <div id="formBodyContainer">
                        <div class="inputTextBox">
                            <label style="padding-bottom: 20px" for="clubUsed"><b>Club used:</b></label><br>
                            <input class="clubUsed" type="text" placeholder="Enter the name of the club used" name="clubUsed" required max_length = '20'>
                            <div class="error"></div><br>
                        </div>
                        <div class="inputTextBox">
                            <label style="padding-bottom: 20px" for="distance"><b>Distance:</b></label><br>
                            <input class="distance" type="number" min="0" max="500" style="padding:5px" required>
                            <div class="error"></div><br>
                        </div>
                        <div class="inputTextBox">
                            <label style="margin-bottom: 10px" class="lblLanding" for="landing"><b>Where did the ball land?</b></label><br>
                            <input class="green" type="radio" name="landing">
                            <label class="lblLanding" for="landingGreen"><b>Green</b></label>
                            <input class="fairway" type="radio" name="landing">
                            <label class="lblLanding" for="landingFairway"><b>Fairway</b></label>
                            <input class="rough" type="radio" name="landing">
                            <label class="lblRough" for="landingRough"><b>Rough</b></label>
                            <input class="hazard" type="radio" name="landing">
                            <label class="lblLanding" for="landingHazard"><b>Water Hazard</b></label>
                            <input class="bunker" type="radio" name="landing">
                            <label class="lblLanding" for="landingBunker"><b>Bunker</b></label>
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
            <div id="deleteStrokePopup">
                <form action="validationStrokes.php" method="post" id="deleteStrokeForm">
                    <div class="deletePopupHeader">
                        <span>Enter the number of the stroke:</span>
                    </div>
                    <div class="inputTextBox">
                        <input class="id" type="text" name="id" placeholder="Enter the stroke number">
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
            <div id="updateStrokePopup">
                <form action="validationStrokes.php" method="post" id="updateStrokeForm">
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
        <?php
            include_once("footer.php");
        ?>
    </div>
    
    <script language="Javascript" type="text/javascript" src="../js/validationScores.js"></script>
    <script language="Javascript" type="text/javascript" src="../js/scoresPopups.js"></script>
    <script language="Javascript" type="text/javascript" src="../js/loaderFlag.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</body>
</html>