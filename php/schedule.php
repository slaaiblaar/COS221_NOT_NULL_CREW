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
    <link rel="stylesheet" href="../css/schedule.css">
    <title>Sunrise Golfing/View Tournaments Schedule</title>
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
                <span>Tournaments Schedule</span>
                <p> Use the buttons on the left to manage the schedule</p>
            </div>
        </div>
        <div class="contentContainer">
            <div class="buttonsGrid">
                <button type="button" id="filterTable">List filter options</button>
                
                <form action="validateSchedule.php" id="filterForm" method="post">
                    <div class="filterFormContainer">
                        <div id="filterOptions">
                            <div>    
                                <input class="filter-option1" type="radio" name="filterOption1">
                                <label class="lblFilter">View date</label>
                            </div>
                            <div>
                                <input class="filter-option2" type="radio" name="filterOption2">
                                <label class="lblFilter">View start time</label><br>
                            </div>
                            <div>
                                <input class="filter-option3" type="radio" name="filterOption3" value="15:00">
                                <label class="lblFilter">View start time < 15:00</label>
                            </div>
                            <div>
                                <input class="filter-option4" type="radio" name="filterOption4">
                                <label class="lblFilter">View end time</label>
                            </div>
                            <div>
                                <input class="filter-option5" type="radio" name="filterOption5" value="14:00">
                                <label class="lblFilter">View end time < 14:00</label>
                            </div>
                            <div>
                                <input class="filter-option6" type="radio" name="filterOption6">
                                <label class="lblFilter">Reset Table</label>
                            </div>
                        </div>
                        <button type="submit" class="submitFilter" name="submitFilter">Filter</button>
                    </div>
                </form>
            </div>
            <div class="tableGrid">
                <!--we will build the table using javascript-->
                <?php 
                    if (empty($_SESSION['table'])){
                        $select = mysqli_query($conn,"SELECT * FROM tournament_schedules ");
                        $tableRows = "";
                        if(mysqli_num_rows($select) > 0){
                            //load table
                            $tableHeaders = "
                                    <table class='Table'>
                                      <thead rowspan='1'>
                                        <th>id</th>
                                        <th>event_id</th>
                                        <th>date</th>
                                        <th>start_time</th>
                                        <th>end_time</th>
                                    </thead>
                            ";
                            echo $tableHeaders;
                            //run through records
                            while($row = mysqli_fetch_assoc($select)){
                                $tableRows .= "
                                        <tr class='TableRow' rowspan='1'>
                                            <td>".$row['id']."</td>
                                            <td>".$row['event_id']."</td>
                                            <td>".$row['date']."</td>
                                            <td>".$row['start_time']."</td>
                                            <td>".$row['end_time']."</td>
                                        </tr>
                                ";
                            }
                            
                            echo $tableRows . "</table>";
                        }
                        else{
                            $tableHeaders = "
                                    <table class='Table'>
                                        <thead rowspan='1'>
                                            <th>id</th>
                                            <th>event_id</th>
                                            <th>date</th>
                                            <th>start_time</th>
                                            <th>end_time</th>
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
        </div>
    </div>
    <?php
        include_once("footer.php");
    ?>
    <script language="Javascript" type="text/javascript" src="../js/inputValidationSchedule.js"></script>
    <script language="Javascript" type="text/javascript" src="../js/schedule.js"></script>
    <script language="Javascript" type="text/javascript" src="../js/loaderFlag.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</body>
</html>