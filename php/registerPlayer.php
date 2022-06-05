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
                <!-- <button id="createNewPlayer" href="managePlayers.php">Register new Player</button> -->
                <!-- <button id="deleteTournament">Delete a tournament from  the table</button> -->
                <button type="button" id="filterTable">List filter options</button>
                <div id="filterOptions">
                    <div>    
                        <input class="filter-option1" type="radio" name="filterOption1">
                        <label class="lblFilter">View Descending Netscores</label>
                    </div>
                    <div>
                        <input class="filter-option2" type="radio" name="filterOption1">
                        <label class="lblFilter">View Strokecount</label><br>
                    </div>
                    <div>
                        <input class="filter-option3" type="radio" name="filterOption1">
                        <label class="lblFilter">View Birdie and Eagle >= 3</label>
                    </div>
                    <div>
                        <input class="filter-option4" type="radio" name="filterOption1">
                        <label class="lblFilter">View Most double bogeys</label>
                    </div>
                </div>
            </div>
            <div class="tableGrid">
                <!--we will build the table using javascript-->
            </div>
        </div>
        <?php
            include_once("footer.php");
        ?>
    </div>
    
    <!-- <script language="Javascript" type="text/javascript" src="../js/validationTournaments.js"></script> -->
    <script language="Javascript" type="text/javascript" src="../js/registerPlayer.js"></script>
    <!-- <script language="Javascript" type="text/javascript" src="../js/passwordToggle.js"></script> -->
    <script language="Javascript" type="text/javascript" src="../js/loaderFlag.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</body>
</html>