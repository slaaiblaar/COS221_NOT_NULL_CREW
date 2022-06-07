<?php
    require_once("setDBEnvVar.php");
    include_once("configDB.php");
    session_start();

    if ($_SERVER['REQUEST_METHOD'] == 'POST'){
        if(isset($_POST['filterOption1']) || isset($_POST['filterOption2']) || isset($_POST['filterOption3']) || isset($_POST['filterOption4']) || isset($_POST['filterOption5']) || isset($_POST['filterOption6'])){
            //this is to filter the table
            if (isset($_POST['filterOption1'])) {
                $_SESSION['filterOption1'] = $_POST['filterOption1'];
            }
            else{
                $_SESSION['filterOption1'] = null;
            }
            if (isset($_POST['filterOption2'])) {
                $_SESSION['filterOption2'] = $_POST['filterOption2'];
            }
            else{
                $_SESSION['filterOption2'] = null;
            }
            if (isset($_POST['filterOption3'])) {
                $_SESSION['filterOption3'] = $_POST['filterOption3'];
            }
            else{
                $_SESSION['filterOption3'] = null;
            }
            if (isset($_POST['filterOption4'])) {
                $_SESSION['filterOption4'] = $_POST['filterOption4'];
            }
            else{
                $_SESSION['filterOption4'] = null;
            }
            if (isset($_POST['filterOption5'])) {
                $_SESSION['filterOption5'] = $_POST['filterOption5'];
            }
            else{
                $_SESSION['filterOption5'] = null;
            }
            if (isset($_POST['filterOption6'])) {
                $_SESSION['filterOption6'] = $_POST['filterOption6'];
            }
            else{
                $_SESSION['filterOption6'] = null;
            }
            $select=null;
            $result = null;
            if($_SESSION['filterOption1'] != null){
                $select = "SELECT id,event_id, date FROM tournament_schedules";
                $GLOBALS['result'] = $conn->query($select);
            }
            else if($_SESSION['filterOption2'] != null){
                $select = "SELECT id,event_id, start_time FROM tournament_schedules";
                $GLOBALS['result'] = $conn->query($select); 
                
            }
            else if($_SESSION['filterOption3'] != null){
                $select = $conn->prepare("SELECT * FROM tournament_schedules WHERE start_time < ?");
                $select->bind_param("s",$_SESSION['filterOption3']);
                $select->execute();
                $result = $select->get_result(); 

            }
            else if($_SESSION['filterOption4'] != null){
                $select = "SELECT id,event_id, end_time FROM tournament_schedules";
                $GLOBALS['result'] = $conn->query($select);               
            }
            else if($_SESSION['filterOption5'] != null){
                $select = $conn->prepare("SELECT * FROM tournament_schedules WHERE end_time < ?");
                $select->bind_param("s",$_SESSION['filterOption4']);
                $select->execute();
                $result = $select->get_result();            
            }
            else{ //reset table
                $select = "SELECT * FROM tournament_schedules";
                $GLOBALS['result'] = $conn->query($select);    
            }
            if (mysqli_num_rows($result)==0){
                $tableHeaders = "
                        <table class='Table'>
                            <thead rowspan='1'>
                                <th>id</th>
                                <th>event_id</th>
                                <th>date</th>
                                <th>start_time</th>
                                <th>end_time</th>
                            </thead>
                        </table>
                ";
                $_SESSION['table'] = $tableHeaders;
                header("Location: schedule.php");
            }
            else{    //now to rebuild
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
                //first get first row then build from second row
                $row = mysqli_fetch_assoc($result);
                $tableRows = "
                        <tr class='TableRow' rowspan='1'>
                            <td>".$row['id']."</td>
                            <td>".$row['event_id']."</td>
                            <td>".$row['date']."</td>
                            <td>".$row['start_time']."</td>
                            <td>".$row['end_time']."</td>
                        </tr>
                    ";
                //run through records
                while($row = mysqli_fetch_assoc($result)){
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
                $_SESSION['table'] = $tableHeaders . $tableRows . "</table>";
                if ($query){
                    //Success
                    $_SESSION['showRegPopupFilter'] = "true";
                    header("Location: schedule.php");
                }
                else{
                    $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                    error_reporting(E_ALL);
                    header("Location: schedule.php");
                    // echo "Error connecting to database: " . $conn->error;
                }
                $conn->close();
            }

        }
    }

?>