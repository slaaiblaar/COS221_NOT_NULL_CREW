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
    require_once("setDBEnvVar.php");
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/organization.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/1af5f85004.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <title>Organizations</title>
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
                <span>Manage Organizations</span>
                <p> Use the buttons on the left to manage the organizations</p>
            </div>
        </div>

        <div class="contentContainer">
            <div class="buttonsGrid">

                <button type="button" id="createNewOrg">Create a New Organization</button>
                <button type="button" id="deleteOrg" onmouseup="HasActive('delete')">Delete an Organization</button>
                <button type="button" id="updateOrgData" onmouseup="HasActive('update')">Update an Organization's data</button>

                <button type="button" id="filterTable">List filter options</button>
                <form id="filterOptions" method = "post" onsubmit="clearTable()">

                    <?php
                        include_once("../php/OrganizationTable.php");

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
                        include_once("../php/OrganizationTable.php");
                        
                        if(array_key_exists('ApplyFilter', $_POST)) {

                            $OrgName = $_POST["OrgNameDrpDwn"];
                            $OrgType = $_POST["OrgTypeDrpDwn"];
                            $PublisherName = $_POST["PublisherNameDrpDwn"];
                            $Manager = $_POST["ManagerDrpDwn"];
                            
                            FilterTable($OrgName, $OrgType, $PublisherName, $Manager);

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
            <div id="newOrgFormPopup">
                <form id="createOrgForm" onsubmit = "return InsertCheck()">
                    <div class="addOrgFormHeader">
                        <div class="formHeading">Create new Organization</div>
                        <div class="formSubHeading">Please enter all fields</div>
                    </div>
                    <hr>
                    <div id="formBodyContainer">
                        <div class="inputTextBox">
                            <label for="NewOrgN"><b>Enter the Organization Name:</b></label><br>
                            <input class="OrgName" type="text" placeholder="Organization Name" name="NewOrgN" id= "NewOrgN" required>
                            <div class="error" id = "OrgNameError"></div><br>
                        </div>
                        <div class="inputTextBox">
                            <label for="NewOrgType"><b>Enter the Organization Type:</b></label><br>
                            <input class="OrgType" type="text" placeholder="Organization Type (optional)" name="NewOrgType" id= "NewOrgType" required>
                            <div class="error" id = "OrgTypeError"></div><br>
                        </div>
                        <div class="inputTextBox">
                            <label for="PublisherNamesCreate"><b>Choose a Publisher Name:</b></label><br>
                            <?php
                                include_once("../php/OrganizationTable.php");

                                PopulateAddPublisherDropDown("Insert");
                            ?>
                        </div>
                        <div class="inputTextBox">
                            <label for="ManagerNamesCreate"><b>Choose a Manager Name:</b></label><br>
                            <?php
                                include_once("../php/OrganizationTable.php");

                                PopulateAddManagerDropDown("Insert");
                            ?>
                        </div>

                        <div id="submitButtons">
                            <button type="button" class="cancelbtn">Cancel</button>
                            <input type="submit" class="submitbtn" id="SubmitCreateTour" onclick="Insert()" value="Submit"/>
                        </div>
                        
                    </div>
                </form>

                <hr class="endRuler">

            </div>
        </div>

        <!-- Delete Tour -->
        <div class="fullScreenPopupDelete">
            <div id="deleteOrgPopup">
                <forms id="DeleteOrgForm">
                    <div class="addOrgFormHeader">
                        <div class="formHeading">Delete Organization</div>
                    </div>
                    <hr>
                    <div id="formBodyContainer">
                        <div class="inputTextBox">
                            <label for="DeleteOrgN"><b>Organization Name:</b></label><br>
                            <input class="DeleteOrgInput" type="text" placeholder="Organization Name" name="DeleteOrgN" id= "DeleteOrgN" disabled>
                        </div>
                        <div class="inputTextBox">
                            <label for="DeleteOrgType"><b>Organization Type:</b></label><br>
                            <input class="DeleteOrgInput" type="text" placeholder="Affiliation Name" name="DeleteOrgType" id= "DeleteOrgType" disabled>
                        </div>
                        <div class="inputTextBox">
                            <label for="DeleteOrgP"><b>Publisher Name:</b></label><br>
                            <input class="DeleteOrgInput" type="text" placeholder="Organization Name" name="DeleteOrgP" id= "DeleteOrgP" disabled>
                        </div>
                        <div class="inputTextBox">
                            <label for="DeleteOrgM"><b>Managing Organization:</b></label><br>
                            <input class="DeleteOrgInput" type="text" placeholder="Organization Name" name="DeleteOrgM" id= "DeleteOrgM" disabled>
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
            <div id="updateOrgPopup">
                <forms id="updateOrgForm"  onsubmit = "return UpdateCheck()">
                    <div class="addOrgFormHeader">
                        <div class="formHeading">Update Organization</div>
                    </div>
                    <hr>
                    <div id="formBodyContainer">
                        <div class="inputTextBox">
                            <label for="UpdateOrgN"><b>Enter the Organization Name:</b></label><br>
                            <input class="OrgName" type="text" placeholder="Organization Name" name="UpdateOrgN" id= "UpdateOrgN" required>
                            <div class="error" id = "OrgNameErrorUpdate"></div><br>
                        </div>
                        <div class="inputTextBox">
                            <label for="UpdateOrgType"><b>Enter the Organization Type:</b></label><br>
                            <input class="OrgType" type="text" placeholder="Organization Type" name="UpdateOrgType" id= "UpdateOrgType" required>
                            <div class="error" id = "OrgTypeErrorUpdate"></div><br>
                        </div>
                        <div class="inputTextBox">
                            <label for="PublisherNamesUpdate"><b>Choose a Publisher Name:</b></label><br>
                            <?php
                                include_once("../php/OrganizationTable.php");

                                PopulateAddPublisherDropDown("update");
                            ?>
                        </div>
                        <div class="inputTextBox">
                            <label for="ManagerNamesUpdate"><b>Choose a Manager Name:</b></label><br>
                            <?php
                                include_once("../php/OrganizationTable.php");

                                PopulateAddManagerDropDown("update");
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
        <?php
            include_once("footer.php");
        ?>
    </div>

    <script src="../js/OrganizationPopups.js"></script>
    <!-- <script src="../js/sideMenu.js"></script> -->
    <script src="../js/organization.js"></script>
    <script language="Javascript" type="text/javascript" src="../js/loaderFlag.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</body>
</html>