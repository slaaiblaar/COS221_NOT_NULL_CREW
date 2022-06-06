<!--
    MEMBERS of NOT_NULL_CREW:
    u19043512
    u21446271
    u19234806
    u21457451
    u04929552
    u21457060
-->
<?php session_start(); setcookie("InsideUsers", "True", 0, "/");setcookie("InsideSignup", "False", 0, "/");
    require_once("configDB.php");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/manageUsers.css">
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
                <span>Manage Media</span>
                <p> Use the buttons on the left to manage the media</p>
            </div>
        </div>
        <div class="contentContainer">
            <div class="buttonsGrid">
                <button id="createNewMedia">Add New Media</button>
                <button id="deleteMedia">Delete media from  the table</button>
                <button id="filterTable">List filter options</button>
                <form action="validateMedia.php" id="filterForm" method="post">
                    <div class="filterFormContainer">
                        <div id="filterOptions">
                            <div>    
                                <input class="filter-option1" type="radio" name="filterOption1" value="photo">
                                <label class="lblFilter">View Photos</label>
                            </div>
                            <div>
                                <input class="filter-option2" type="radio" name="filterOption2" value="video">
                                <label class="lblFilter">View Videos</label><br>
                            </div>
                            <div>
                                <input class="filter-option3" type="radio" name="filterOption3" value="reset">
                                <label class="lblFilter">Reset Table</label><br>
                            </div>
                        </div>
                        <button type="submit" class="submitFilter" name="submitFilter">Filter</button>
                    </div>
                </form>
                <button type="button" id="updateUserData">Update a User's data</button>
                <div id="updateOptions">
                    <div>    
                        <input class="update-option1" type="radio" name="updateOption1">
                        <label class="lblUpdate">Change media type</label>
                    </div>
                    <!-- <div>
                        <input class="update-option2" type="radio" name="updateOption2">
                        <label class="lblUpdate">Change  user password</label><br>
                    </div>
                    <div>
                        <input class="update-option3" type="radio" name="updateOption3">
                        <label class="lblUpdate">Change telephone no.</label>
                    </div>
                    <div>
                        <input class="update-option4" type="radio" name="updateOption4">
                        <label class="lblUpdate">Change user type</label><br>
                    </div>
                    <div>
                        <input class="update-option5" type="radio" name="updateOption5">
                        <label class="lblUpdate">Change first name</label>
                    </div>
                    <div>
                        <input class="update-option6" type="radio" name="updateOption6">
                        <label class="lblUpdate">Change last name</label>
                    </div>
                    <div>
                        <input class="update-option7" type="radio" name="updateOption7">
                        <label class="lblUpdate">Change initials</label>
                    </div> -->
                </div>
            </div>
            <div class="tableGrid">
                <!--we will build the table using javascript-->
                <?php 
                    if (empty($_SESSION['table'])){
                        $select = mysqli_query($conn,"SELECT * FROM media ");
                        $tableRows = "";
                        if(mysqli_num_rows($select) > 0){
                            //load table
                            $tableHeaders = "
                                    <table class='Table'>
                                        <th>id</th>
                                        <th>object_id</th>
                                        <th>revision_id</th>
                                        <th>media_type</th>
                                        <th>publisher_id</th>
                                        <th>date_time</th>
                                        <th>credit_id</th>
                                        <th>db_location_id</th>
                                        <th>creation_location_id</th>
                            ";
                            echo $tableHeaders;
                            //run through records
                            while($row = mysqli_fetch_assoc($select)){
                                $tableRows .= "
                                        <tr class='TableRow'>
                                            <td>".$row['id']."</td>
                                            <td>".$row['object_id']."</td>
                                            <td>".$row['revision_id']."</td>
                                            <td>".$row['media_type']."</td>
                                            <td>".$row['publisher_id']."</td>
                                            <td>".$row['first_name']."</td>
                                            <td>".$row['credit_id']."</td>
                                            <td>".$row['db_location_id']."</td>
                                            <td>".$row['creation_location_id']."</td>
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
            <div id="newMediaPopupForm">
                    <form action="validateMedia.php" method="post" class="signupForm"> <!-- onsubmit="return ValidateInput()"> -->
                        <div class="formContainer">
                            <h1>Sign Up</h1>
                            <p>Please fill in this form to create an account.</p>
                            
                            <?php if(!empty($_SESSION['messages'])) {
                                if ($_SESSION['messages'] == 'Invalid object_id. The object_id must be a digit.'){
                                    $_SESSION['object_id'] = "";
                                    echo "<h3 style='color: red; font-weight: bold;'> Invalid object_id. The object_id must be a digit. </h3>";
                                    echo "<script> document.querySelector('.object_id').style.borderColor = 'red'; </script>";
                                }
                                else if ($_SESSION['messages'] == 'Invalid source_id. The source_id must be a digit.'){
                                    $_SESSION['source_id'] = "";
                                    echo "<h3 style='color: red; font-weight: bold;'> Invalid source_id. The source_id must be a digit. </h3>";
                                    echo "<script> document.querySelector('.source_id').style.borderColor = 'red'; </script>";
                                }
                                else if ($_SESSION['messages'] == 'Invalid revision_id. The revision_id must be a digit.'){
                                    $_SESSION['revision_id'] = "";
                                    echo "<h3 style='color: red; font-weight: bold;'> Invalid revision_id. The revision_id must be a digit. </h3>";
                                    echo "<script> document.querySelector('.revision_id').style.borderColor = 'red'; </script>";
                                }
                                else if ($_SESSION['messages'] == 'Invalid publisher_id. The publisher_id must be a digit.'){
                                    $_SESSION['publisher_id'] = "";
                                    echo "<h3 style='color: red; font-weight: bold;'> Invalid publisher_id. The publisher_id must be a digit. </h3>";
                                    echo "<script> document.querySelector('.publisher_id').style.borderColor = 'red'; </script>";
                                }
                                else if ($_SESSION['messages'] == 'Invalid credit_id. The credit_id must be a digit.'){
                                    $_SESSION['credit_id'] = "";
                                    echo "<h3 style='color: red; font-weight: bold;'> Invalid credit_id. The credit_id must be a digit. </h3>";
                                    echo "<script> document.querySelector('.credit_id').style.borderColor = 'red'; </script>";
                                }
                                else if ($_SESSION['messages'] == 'Invalid creation_location_id. The creation_location_id must be a digit.'){
                                    $_SESSION['creation_location_id'] = "";
                                    echo "<h3 style='color: red; font-weight: bold;'> Invalid creation_location_id. The creation_location_id must be a digit. </h3>";
                                    echo "<script> document.querySelector('.creation_location_id').style.borderColor = 'red'; </script>";
                                }
                                else {$_SESSION['object_id'] = "";
                                    $_SESSION['source_id'] = "";
                                    $_SESSION['revision_id'] = "";
                                    $_SESSION['publisher_id'] = "";
                                    $_SESSION['credit_id']="";
                                    $_SESSION['creation_location_id']="";
                                    // $_SESSION['telNo']="";
                                    // $_SESSION['initials']="";
    
                                    echo "<div id='errorSignup'>
                                            <h3 style='color: red; font-weight: bold;'> Invalid submission. Please take note of the following when filling in the form: </h3>
                                            <ul style='color: red; font-weight: bold;'>
                                                <li class='error'> All input fields for id's must be digits.</li>
                                            </ul>
                                          </div>";
                                }
                            }?>
    
                            <hr>
    
                            <div class="inputTextBox">
                                <label for="object_id"><b>Object ID</b></label><br>
                                <input class= 'object_id' type="number" placeholder="Enter object id" name="object_id" required>
                                <div class="error"></div><br>
                            </div>
                            <div class="inputTextBox" >
                                <label for="source_id"><b>Source ID</b></label><br>
                                <input class="source_id" type="number" placeholder="Enter source id" name="source_id" required>
                                <div class="error"></div><br>
                            </div>
                            <div class="inputTextBox" >
                                <label for="revision_id"><b>Revision_id </b></label><br>
                                <input class="revision_id" type="number" placeholder="Enter revision_id" name="revision_id" required>
                                <div class="error"></div><br>
                            </div>
                            <div class="mediaType_DateTime">
                                <div class="inputTextBox">
                                    <label for="mediaType"><b>Type of media</b></label><br>
                                    <input class="photoType" type="radio" name="mediaType" value="photo">
                                    <label for="photoType"><b>Photo</b></label><br>
                                    <input class="videoType" type="radio" name="mediaType" value="video">
                                    <label for="videoType"><b>Video</b></label><br>
                                    <div class="error"></div><br>
                                </div>
                                <div class="inputTextBox">
                                    <label for="dateTime"><b>Date and Time</b></label><br>
                                    <input class="dateTime" type="date" name="dateTime" required>
                                    <div class="error"></div><br>
                                </div>
                            </div>
                            <div class="inputTextBox">
                                <label for="publisher_id"><b>Publisher ID</b></label><br>
                                <input class="publisher_id" type="number" placeholder="Enter publisher id" name="publisher_id" required>
                                <div class="error"></div><br>
                            </div>
                            <div class="inputTextBox">
                                <label for="credit_id"><b>Credit ID</b></label><br>
                                <input class="credit_id" type="number" placeholder="Enter credit id" name="credit_id" required>
                                <div class="error"></div><br>
                            </div>
                            <div class="inputTextBox">
                                <label for="creation_location_id"><b>Creation Location ID </b></label><br>
                                <input class="creation_location_id" type="number" placeholder="Enter Creation Location ID " name="creation_location_id" required>
                                <div class="error"></div><br>
                            </div>
                            
                            <div class="submitButtons">
                                <button type="button" class="cancelbtn">Cancel</button>
                                <button type="submit" class="signupbtn" name="Submit">Sign Up</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="fullScreenPopupDelete">
                <div id="deleteMediaPopup">
                    <form action="validateMedia.php" method="post" id="deletePlayerForm">
                        <div class="deletePopupHeader">
                            <span>Enter the id for the Media:</span>
                            <p> (note: not the Credit_id)<p>
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
                <div id="updateMediaPopup">
                    <form action="validateMedia.php" method="post" id="updateUserForm">
                        <div class="updatePopupHeader">
                            <span></span>
                        </div>
                        <div class="inputTextBox updateInputID">
                            <label>User id</label><br>
                            <input class="id" type="text" name="id" placeholder="Enter the primary id">
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
    <script src="../js/UserPopups.js"></script>
    <script language="Javascript" type="text/javascript" src="../js/inputValidationMedia.js"></script>
    <script language="Javascript" type="text/javascript" src="../js/loaderFlag.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</body>
</html>
<?php session_unset(); session_destroy(); ?>