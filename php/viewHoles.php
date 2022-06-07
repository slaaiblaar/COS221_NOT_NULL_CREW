<?php
   if(!isset($_SESSION)) session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="../css/holes.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/1af5f85004.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <title>Golf Holes</title>
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
                <span>Manage Holes</span>
                <p>Use the buttons on the left to manage the holes</p>
            </div>
        </div>
        <div class="contentContainer">
            <div class="buttonsGrid">
                <button id="createNewHole">Create New Hole</button>
                <button id="deleteHole">Delete a Hole from the table</button>
                <!-- <button id="filterTable">List filter options</button>
                <div id="filterOptions">
                    <div>
                        <input type="radio" name="filterOption1" class="filter-option1">
                        <label for="lblFilter">Par < 3</label>
                    </div>
                    <div>
                        <input type="radio" name="filterOption2" class="filter-option2">
                        <label for="lblFilter">Par >= 3</label>
                    </div>
                    <div>
                        <input type="radio" name="filterOption3" class="filter-option3">
                        <label for="lblFilter">Site Id</label>
                    </div>
                    <div>
                        <input type="radio" name="filterOption3" class="filter-option3">
                        <label for="lblFilter">Reset Table</label>
                    </div>
                </div> -->
                <button id="updateHole">Update a Hole's data</button>
                <div id="updateOptions">
                    <div>
                        <input type="radio" name="updateOption1" class="update-option1">
                        <label for="lblUpdate">Update Hole number</label>
                    </div>
                    <div>
                        <input type="radio" name="updateOption2" class="update-option2">
                        <label for="lblUpdate">Update site ID</label>
                    </div>
                    <div>
                        <input type="radio" name="updateOption3" class="update-option3">
                        <label for="lblUpdate">Update Par number</label>
                    </div>
                    <div>
                        <input type="radio" name="updateOption4" class="update-option4">
                        <label for="lblUpdate">Update length</label>
                    </div>
                </div>
            </div>

            <div class="tableGrid">
                <table>
                    <thead>
                        <tr>
                            <th><h3>ID</h3></th>
                            <th><h3>Hole number</h3></th>
                            <th><h3>Site Id</h3></th>
                            <th><h3>Par</h3></th>
                            <th><h3>Length</h3></th>
                        </tr>
                    </thead>
                    <tbody id="tableBody">

                    </tbody>
                </table>
            </div>
        </div>

        <div class="fullScreenPopupAdd">
            <div id="newHoleFormPopup">
                <form action="addHoleValidationForm.php" method="post" onsubmit="return validateAddInput()">
                    <div class="addHoleFormHeader">
                        <div class="formHeading">Create new Hole</div>
                        <div class="formSubHeading">Please enter all fields</div>
                    </div>
                    <hr>
                    <div id="formBodyContainer">
                        <div class="inputTextBox">
                            <label for="holeNo"><b>Hole Number</b></label><br>
                            <input type="number" name="holeNo" id="holeNo" min="1" max="99" placeholder="Enter hole number [1-99]">
                            <small><?php if(isset($_SESSION["holeNoError"]))
                                echo $_SESSION["holeNoError"];
                            else echo "";
                            ?></small>
                        </div><br>
                            
                        <div class="inputTextBox">
                            <label for="siteId"><b>Site ID</b></label><br>
                            <input type="number" name="siteId" id="siteId" min="1" placeholder="Enter site ID">
                            <small><?php if(isset($_SESSION["siteIdError"])) 
                                echo $_SESSION["siteIdError"];
                            else echo "";
                            ?></small>
                        </div><br>

                        <div class="inputTextBox">
                            <label for="par"><b>Par</b></label><br>
                            <input type="number" name="par" id="par" min="1" max="99" placeholder="Enter par number [1-99]">
                            <small><?php if(isset($_SESSION["par"])) 
                                echo $_SESSION["par"];
                            else echo "";
                            ?></small>
                        </div><br>

                        <div class="inputTextBox">
                            <label for="length"><b>Length</b></label><br>
                            <input type="text" name="len" id="len" maxlength="11" placeholder="Enter length">
                            <small><?php if(isset($_SESSION["lenError"]))
                                echo $_SESSION["lenError"];
                            else echo "";
                            ?></small>
                        </div><br>

                        <div class="submitButtons">
                            <button type="button" class="cancelbtn">Cancel</button>
                            <button type="submit" class="createbtn" name="Submit">Submit</button>
                        </div>
                    </div>
                </form>
                <hr class="endRuler">
            </div>
        </div>

        <div class="fullScreenPopupDelete">
            <div id="deleteHolePopup">
                <form action="delHoleValidationForm.php" method="post" id="deleteHoleForm" onsubmit="return validateDelInput()">
                    <div id="formBodyContainer">
                        <div class="deletePopupHeader">
                            <span>Enter the site id and hole number</span>
                        </div>

                        <div class="inputTextBox">
                            <input type="number" name="siteId" id="siteId" min="1" placeholder="Enter site ID">
                            <small><?php if(isset($_SESSION["siteIdError"])) 
                                echo $_SESSION["siteIdError"];
                            else echo "";
                            ?></small>
                        </div><br>

                        <div class="inputTextBox">
                            <input type="number" name="holeNo" id="holeNo" min="1" max="99" placeholder="Enter hole number [1-99]">
                            <small><?php if(isset($_SESSION["holeNoError"]))
                                echo $_SESSION["holeNoError"];
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

        <!-- <div class="fullScreenPopupFilter">
            <div id="filterHolePopup">
                <form action="InputvalidationHole.php" method="post" id="filterHoleForm" onsubmit="return validateDelInput()">
                    <div class="filterPopupHeader">
                        <span></span>
                    </div>

                    <div class="inputTextBox filterInput">
                        <input type="number" name="filterPopupInput" class="filterPopupInput">
                        <small></small>
                    </div>

                    <div class="submitButtons">
                        <button type="button" class="cancelbtnFilter">Cancel</button>
                        <button type="submit" class="submitbtnFilter" name="Submit">Filter</button>
                    </div>
                </form>
            </div>
        </div> -->

        <div class="fullScreenPopupUpdate">
            <div id="updateHolePopup">
                <form action="updateHoleValidationForm.php" method="post" id="updateHoleForm">
                    <div class="updatePopupHeader">
                    <span>Enter the site id</span>
                    </div>

                    <div class="inputTextBox">
                        <input type="number" name="siteId" id="siteId" min="1" placeholder="Enter site id">
                        <small><?php if(isset($_SESSION["siteIdError"])) 
                            echo $_SESSION["siteIdError"];
                        else echo "";
                        ?></small>
                    </div><br>

                    <div class="inputTextBox updateInput">
                        <input type="number" name="updatePopupInput" class="updatePopupInput">
                        <small></small>
                    </div>

                    <div class="submitButtons">
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

    <script src="../js/HolePopups.js"></script>
    <script src="../js/inputValidationHole.js"></script>
    <script language="Javascript" type="text/javascript" src="../js/loaderFlag.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</body>
</html>