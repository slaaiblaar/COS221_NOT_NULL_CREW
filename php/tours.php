<!--
    MEMBERS of NOT_NULL_CREW:
    u19043512
    u21446271
    u19234806
    u21457451
    u04929552
    u21457060
-->
<?php 
    session_start(); 
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/tours.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/1af5f85004.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    
    <title>Tours</title>
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
                <span>Manage Tours</span>
                <p> Use the buttons on the left to manage the tours</p>
            </div>
        </div>

        <div class="contentContainer">
            <div class="buttonsGrid">

                <button type="button" id="createNewTour">Create a New Tour</button>
                <button type="button" id="deleteTour" onmouseup="HasActive('delete')">Delete a Tour from  the table</button>
                <button type="button" id="updateTourData" onmouseup="HasActive('update')">Update a Tour's data</button>

                <button type="button" id="filterTable">List filter options</button>
                <form id="filterOptions" method = "post" onsubmit="clearTable()">

                    <?php
                        include_once("../php/ToursTable.php");

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
                        include_once("ToursTable.php");
                        
                        if(array_key_exists('ApplyFilter', $_POST)) {

                            $TourName = $_POST["TourNames"];
                            $AffiliationName = $_POST["AffiliationNames"];
                            FilterTable($TourName, $AffiliationName);

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

        <!-- New Tour -->
        <div class="fullScreenPopupAdd">
            <div id="newTourFormPopup">
                <form id="createTourForm"  onsubmit = "return InsertCheck()">
                    <div class="addTourFormHeader">
                        <div class="formHeading">Create new Tour</div>
                        <div class="formSubHeading">Please enter all fields</div>
                    </div>
                    <hr>
                    <div id="formBodyContainer">
                        <div class="inputTextBox">
                            <label for="NewTourN"><b>Enter the Tour Name:</b></label><br>
                            <input class="TourName" type="text" placeholder="Tour Name" name="NewTourN" id= "NewTourN" required>
                            <div class="error" id = "TourNameError"></div><br>
                        </div>
                        <div class="inputTextBox">
                            <label for="AffiliationNamesCreate"><b>Choose an Affiliation Name:</b></label><br>
                            <?php
                                include_once("../php/ToursTable.php");

                                PopulateAddAffilNDropDown("Insert");
                            ?>
                        </div>

                        <div id="submitButtons">
                            <button type="button" class="cancelbtn">Cancel</button>
                            <button type="submit" class="submitbtn" id="SubmitCreateTour" onclick="Insert()">Submit</button>
                        </div>
                        
                    </div>
                </form>

                <hr class="endRuler">

            </div>
        </div>

        <!-- Delete Tour -->
        <div class="fullScreenPopupDelete">
            <div id="deleteTourPopup">
                <forms id="DeleteTourForm">
                    <div class="addTourFormHeader">
                        <div class="formHeading">Delete Tour</div>
                    </div>
                    <hr>
                    <div id="formBodyContainer">
                        <div class="inputTextBox">
                            <label for="DeleteTourN"><b>Tour Name:</b></label><br>
                            <input class="DeleteTourInput" type="text" placeholder="Tour Name" name="DeleteTourN" id= "DeleteTourN" disabled>
                        </div>
                        <div class="inputTextBox">
                            <label for="DeleteAffilN"><b>Affiliation Name:</b></label><br>
                            <input class="DeleteTourInput" type="text" placeholder="Affiliation Name" name="DeleteAffilN" id= "DeleteAffilN" disabled>
                        </div>
                    </div>
                    <div id="submitButtons">
                        <button type="button" class="cancelbtnDel">Cancel</button>
                        <button type="submit" class="submitbtnDel" id="submitbtnDel" name="Submit" onclick="Delete()">Delete</button>
                    </div>
                </form>
            </div>
        </div>

         <!-- Update Tour -->
        <div class="fullScreenPopupUpdate">
            <div id="updateTourPopup">
                <forms id="updateTourForm" onsubmit = "return InsertCheck()">
                    <div class="addTourFormHeader">
                        <div class="formHeading">Update Tour</div>
                    </div>
                    <hr>
                    <div id="formBodyContainer">
                        <div class="inputTextBox">
                            <label for="UpdateTourN"><b>Enter the Tour Name:</b></label><br>
                            <input class="TourName" type="text" placeholder="Tour Name" name="UpdateTourN" id= "UpdateTourN" required>
                            <div class="error" id = "UpdateTourNameError"></div><br>
                        </div>
                        <div class="inputTextBox">
                            <label for="dateOfBirth"><b>Choose an Affiliation Name:</b></label><br>
                            <?php
                                include_once("../php/ToursTable.php");

                                PopulateAddAffilNDropDown("Update");
                            ?>
                        </div>
                    </div>
                    <div id="submitButtons">
                        <button type="button" class="cancelbtnUpdate" id="cancelbtnUpdate" >Cancel</button>
                        <button type="submit" class="submitbtnUpdate" id="submitbtnUpdate" name="Submit" onclick="Update()">Update</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <?php
        include_once("footer.php");
    ?>

    <script src="../js/ToursPopups.js"></script>
    <script src="../js/sideMenu.js"></script>
    <script src="../js/tours.js"></script>
    <script language="Javascript" type="text/javascript" src="../js/loaderFlag.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</body>
</html>