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
    <link rel="stylesheet" href="../css/holes.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/1af5f85004.js" crossorigin="anonymous"></script>
    <title>Holes</title>
</head>
<body>
    <div id="bodyContainer">

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
                <span>Manage Holes</span>
                <p> Use the buttons on the left to manage the Holes</p>
            </div>
        </div>

        <div class="contentContainer">
            <div class="buttonsGrid">

                <button type="button" id="createNewHole">Create a New Hole</button>
                <button type="button" id="deleteHole" onmouseup="HasActive('delete')">Delete a Hole from the table</button>
                <button type="button" id="updateHoleData" onmouseup="HasActive('update')">Update a Hole's data</button>

                <button type="button" id="filterTable">List filter options</button>
                <form id="filterOptions" method = "post" onsubmit="clearTable()">

                    <?php
                        include_once("../php/holeTableDisplay.php");

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
                        include_once("../php/holeTableDisplay.php");
                        
                        if(array_key_exists('ApplyFilter', $_POST)) {

                            $HoleNum = $_POST["HoleNumDrpDwn"];
                            $SiteName = $_POST["SiteNameDrpDwn"];
                            $ParNum = $_POST["ParNumDrpDwn"];
                            FilterTable($HoleNum, $SiteName, $ParNum);

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

        <!-- New Hole -->
        <div class="fullScreenPopupAdd">
            <div id="newHoleFormPopup">
                <form id="createHoleForm"  onsubmit = "return InsertCheck()">
                    <div class="addHoleFormHeader">
                        <div class="formHeading">Create new Hole</div>
                        <div class="formSubHeading">Please enter all fields</div>
                    </div>
                    <hr>
                    <div id="formBodyContainer">
                        <div class="inputTextBox">
                            <label for="HoleNumberCreate"><b>Choose the hole number:</b></label><br>
                            <select name='HoleNumberCreate' id='HoleNumberCreate' class="HolesCreateInput">
                                <option value= '1'>1</option>
                                <option value= '2'>2</option>
                                <option value= '3'>3</option>
                                <option value= '4'>4</option>
                                <option value= '5'>5</option>
                                <option value= '6'>6</option>
                                <option value= '7'>7</option>
                                <option value= '8'>8</option>
                                <option value= '9'>9</option>
                                <option value= '10'>10</option>
                                <option value= '11'>11</option>
                                <option value= '12'>12</option>
                                <option value= '13'>13</option>
                                <option value= '14'>14</option>
                                <option value= '15'>15</option>
                                <option value= '16'>16</option>
                                <option value= '17'>17</option>
                                <option value= '18'>18</option>
                            </select>
                        </div>
                        <div class="inputTextBox">
                            <label for="SiteNamesCreate"><b>Choose an Site Name:</b></label><br>
                            <?php
                                include_once("../php/holeTableDisplay.php");

                                PopulateAddSiteNDropDown("Insert");
                            ?>
                        </div>
                        <div class="inputTextBox">
                            <label for="HoleParCreate"><b>Choose the Par number:</b></label><br>
                            <select name='HoleParCreate' id='HoleParCreate' class="HolesCreateInput">
                                <option value= '1'>1</option>
                                <option value= '2'>2</option>
                                <option value= '3'>3</option>
                                <option value= '4'>4</option>
                                <option value= '5'>5</option>
                            </select>
                        </div>
                        <div class="inputTextBox">
                            <label for="HoleLengthCreate"><b>Enter the Hole Length (in meters):</b></label><br>
                            <input class="HolesCreateInput" type="number" placeholder="Length in meters" name="HoleLengthCreate" id= "HoleLengthCreate" min="1" required>
                            <div class="error" id = "HoleLengthErrorCreate"></div><br>
                        </div>

                        <div id="submitButtons">
                            <button type="button" class="cancelbtn">Cancel</button>
                            <button type="submit" class="submitbtn" id="SubmitCreateHole" onclick="Insert()">Submit</button>
                        </div>
                        
                    </div>
                </form>

                <hr class="endRuler">

            </div>
        </div>

        <!-- Delete Hole -->
        <div class="fullScreenPopupDelete">
            <div id="deleteHolePopup">
                <forms id="DeleteHoleForm">
                    <div class="addHoleFormHeader">
                        <div class="formHeading">Delete Hole</div>
                    </div>
                    <hr>
                    <div id="formBodyContainer">
                        <div class="inputTextBox">
                            <label for="DeleteHoleNum"><b>Hole Number:</b></label><br>
                            <input class="DeleteHoleInput" type="text" placeholder="Hole Number" name="DeleteHoleNum" id= "DeleteHoleNum" disabled>
                        </div>
                        <div class="inputTextBox">
                            <label for="DeleteSiteName"><b>Site Name:</b></label><br>
                            <input class="DeleteHoleInput" type="text" placeholder="Site Name" name="DeleteSiteName" id= "DeleteSiteName" disabled>
                        </div>
                        <div class="inputTextBox">
                            <label for="DeletePar"><b>Par number:</b></label><br>
                            <input class="DeleteHoleInput" type="text" placeholder="Par number" name="DeletePar" id= "DeletePar" disabled>
                        </div>
                        <div class="inputTextBox">
                            <label for="DeleteLength"><b>Length(in meters):</b></label><br>
                            <input class="DeleteHoleInput" type="text" placeholder="Length(in meters)" name="DeleteLength" id= "DeleteLength" disabled>
                        </div>
                    </div>
                    <div id="submitButtons">
                        <button type="button" class="cancelbtnDel">Cancel</button>
                        <button type="submit" class="submitbtnDel" id="submitbtnDel" name="Submit" onclick="Delete()">Delete</button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Update Hole -->
        <div class="fullScreenPopupUpdate">
            <div id="updateHolePopup">
                <forms id="updateHoleForm" onsubmit = "return UpdateCheck()">
                    <div class="addHoleFormHeader">
                        <div class="formHeading">Update Tour</div>
                    </div>
                    <hr>
                    <div id="formBodyContainer">
                        <div class="inputTextBox">
                            <label for="HoleNumberUpdate"><b>Choose the hole number:</b></label><br>
                            <select name='HoleNumberUpdate' id='HoleNumberUpdate' class="HolesUpdateInput">
                                <option value= '1'>1</option>
                                <option value= '2'>2</option>
                                <option value= '3'>3</option>
                                <option value= '4'>4</option>
                                <option value= '5'>5</option>
                                <option value= '6'>6</option>
                                <option value= '7'>7</option>
                                <option value= '8'>8</option>
                                <option value= '9'>9</option>
                                <option value= '10'>10</option>
                                <option value= '11'>11</option>
                                <option value= '12'>12</option>
                                <option value= '13'>13</option>
                                <option value= '14'>14</option>
                                <option value= '15'>15</option>
                                <option value= '16'>16</option>
                                <option value= '17'>17</option>
                                <option value= '18'>18</option>
                            </select>
                        </div>
                        <div class="inputTextBox">
                            <label for="SiteNamesUpdate"><b>Choose an Site Name:</b></label><br>
                            <?php
                                include_once("../php/holeTableDisplay.php");

                                PopulateAddSiteNDropDown("Update");
                            ?>
                        </div>
                        <div class="inputTextBox">
                            <label for="HoleParUpdate"><b>Choose the Par number:</b></label><br>
                            <select name='HoleParUpdate' id='HoleParUpdate' class="HolesUpdateInput">
                                <option value= '1'>1</option>
                                <option value= '2'>2</option>
                                <option value= '3'>3</option>
                                <option value= '4'>4</option>
                                <option value= '5'>5</option>
                            </select>
                        </div>
                        <div class="inputTextBox">
                            <label for="HoleLengthUpdate"><b>Enter the Hole Length (in meters):</b></label><br>
                            <input class="HolesUpdateInput" type="number" placeholder="Length in meters" name="HoleLengthUpdate" id= "HoleLengthUpdate" min="1" required>
                            <div class="error" id = "HoleLengthErrorUpdate"></div><br>
                        </div>
                    </div>
                    <div id="submitButtons">
                        <button type="button" class="cancelbtnUpdate" id="cancelbtnUpdate" >Cancel</button>
                        <button type="submit" class="submitbtnUpdate" id="submitbtnUpdate" name="Submit" onclick="Update()">Update</button>
                    </div>
                </form>
            </div>
        </div>

        <?php
            include_once("../php/footer.php");
        ?>
    </div>

    <script src="../js/HolePopups.js"></script>
    <script src="../js/holes.js"></script>
    <script src="../js/sideMenu.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</body>
</html>