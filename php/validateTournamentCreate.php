<?php
    require_once("setDBEnvVar.php");
    include_once("configDB.php");
    session_start();

    if ($_SERVER['REQUEST_METHOD'] == 'POST'){
        if ((isset($_POST['eventKey']) && isset($_POST['startDate']) && isset($_POST['endDate']) && isset($_POST['duration']) && isset($_POST['status']) && isset($_POST['gender']) && isset($_POST['year']))){
            $_SESSION['eventKey'] = $_POST['eventKey'];
            $_SESSION['startDate'] = $_POST['startDate'];
            $_SESSION['endDate'] = $_POST['endDate'];
            $_SESSION['duration'] = $_POST['duration'];            
            $_SESSION['gender'] = $_POST['gender'];          
            $_SESSION['status'] = $_POST['status'];          
            $_SESSION['year'] = $_POST['year'];
            
            if(!preg_match("/^[A-Z][a-z]+\s([a-z]+|[A-Z][a-z]+)$/",$_SESSION['eventKey'])){
                $_SESSION['messages'] = "Invalid event name format. Format needs to start with a capital letter and only contain characters.";
                header("Location: viewTournaments.php");
            }
            else if ($_SESSION['endDate'] < $_SESSION['startDate'])
            {
                $_SESSION['messages'] = "Invalid dates. Please make sure the end date is after the chosen start date.";
                header("Location: viewTournaments.php");
            }
            else{
                $eventName = $_POST['eventKey'];
                $startDate = $_POST['startDate'];
                $endDate = $_POST['endDate'];
                $duration = $_POST['duration'];                
                $gender = $_POST['gender'];
                $status = $_POST['status'];
                $year = $_POST['year'];
                
                //insert user into database
                $query = "INSERT INTO events (event_key, start_date_time, end_date_time, duration, event_status, gender, `year`) 
                VALUES (?,?,?,?,?,?)";
                $query->bind_param("sssissi", $eventName, $startDate, $endDate, $duration, $status, $gender, $year);
                $query->execute();
                $result = $query->get_result();
                error_log($result);
                if ($query){
                    //Success
                    //we don't want to be redirected to another page, we just want a popup to display
                    // echo "
                    //     <script> 
                    //         document.getElementById("fullScreenPopupReg").style.visibility = "visible"; 
                    //         $("'#'fullScreenPopupReg").fadeIn("slow");
                    //         document.getElementById("fullScreenPopupAdd").style.visisbility = "hidden";
                    //         $("'#'fullScreenPopupAdd").fadeOut("slow");
                    //     </script>
                    // ";
                    header("Location: viewTournaments.php");
                }
                else{
                    $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                    error_reporting(E_ALL);
                    header("Location: viewTournaments.php");
                    // echo "Error connecting to database: " . $conn->error;
                }

                $conn->close();
            }
        }
        else if(isset($_POST['id'])){
            //this is to validate deleteing a tournament
            $_SESSION['id'] = $_POST["id"];
            if(!preg_match("/^\d+$/",$_SESSION['id'])){
                $_SESSION['messages'] = "Invalid ID , please ensure the ID contains digits.";
                header("Location: viewTournaments.php");
            }
            else{
                $id = $_POST['id'];
                //first check to see if record exist
                $select = $conn->prepare("SELECT * FROM events WHERE id=?");
                $select->bind_param("i",$id);
                $select->execute();
                $result = $select->get_result();

                if(mysqli_num_rows($result) == 0) {
                    $_SESSION['messages'] = 'That id does not exist in the database.';
                    header("Location: viewTournaments.php");
                }
                else{          
                    $query = $conn->prepare("DELETE FROM events WHERE id=?");
                    $query->bind_param("i", $id);
                    $query->execute();
                    $result = $query->get_result();
                    
                    if ($query){
                        //Success                        
                        header("Location: viewTournaments.php");
                    }
                    else{
                        $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                        error_reporting(E_ALL);
                        header("Location: viewTournaments.php");
                        // echo "Error connecting to database: " . $conn->error;
                    }
                    
                    $conn->close();
                }
            }
        }
        else if(isset($_POST['filterOption1']) || isset($_POST['filterOption2']) || isset($_POST['filterOption3']) || isset($_POST['filterOption4']) || isset($_POST['filterOption5']) || isset($_POST['filterOption6'])){
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
                //view men
                $select = $conn->prepare("SELECT * FROM events WHERE gender=?");
                $select->bind_param("s",$_SESSION['filterOption1']);
                $select->execute();
                $result = $select->get_result();                 
            }
            else if($_SESSION['filterOption2'] != null){
                //view women
                $select = $conn->prepare("SELECT * FROM events WHERE gender=?");
                $select->bind_param("s",$_SESSION['filterOption2']);
                $select->execute();
                $result = $select->get_result();  
                
            }
            else if($_SESSION['filterOption3'] != null){
                //view duration >= 3
                $select = $conn->prepare("SELECT * FROM events WHERE duration>=?");
                $select->bind_param("s",$_SESSION['filterOption3']);
                $select->execute();
                $result = $select->get_result();  
                
            }
            else if($_SESSION['filterOption4'] != null){
                //view scheduled
                $select = $conn->prepare("SELECT * FROM events WHERE event_status=?");
                $select->bind_param("s",$_SESSION['filterOption4']);
                $select->execute();
                $result = $select->get_result();  
                
            }
            else if($_SESSION['filterOption5'] != null){
                //view canceled
                $select = $conn->prepare("SELECT * FROM events WHERE event_status=?");
                $select->bind_param("s",$_SESSION['filterOption5']);
                $select->execute();
                $result = $select->get_result();  
                
            }
            else{ //reset table
                $select = $conn->prepare("SELECT * FROM events ");
                $select->execute();
                $result = $select->get_result();    
            }
            if (mysqli_num_rows($result)==0){
                $tableHeaders = "
                        <table class='Table'>
                            <th>id</th>
                            <th>event_key</th>
                            <th>publisher_id</th>
                            <th>start_date_time</th>
                            <th>end_date_time</th>
                            <th>site_id</th>
                            <th>duration</th>
                            <th>event_status</th>
                            <th>gender</th>
                            <th>tour_id</th>
                            <th>year</th>
                        </table>
                ";
                $_SESSION['table'] = $tableHeaders;
                header("Location: viewTournaments.php");
            }
            else{    //now to rebuild
                $tableHeaders = "
                            <table class='Table'>
                                <th>id</th>
                                <th>event_key</th>
                                <th>publisher_id</th>
                                <th>start_date_time</th>
                                <th>end_date_time</th>
                                <th>site_id</th>
                                <th>duration</th>
                                <th>event_status</th>
                                <th>gender</th>
                                <th>tour_id</th>
                                <th>year</th>
                ";
                //first get first row then build from second row
                $row = mysqli_fetch_assoc($result);
                $tableRows .= "
                            <tr class='TableRow' rowspan='1'>
                                <td>".$row['id']."</td>
                                <td>".$row['event_key']."</td>
                                <td>".$row['publisher_id']."</td>
                                <td>".$row['start_date_time']."</td>
                                <td>".$row['end_date_time']."</td>
                                <td>".$row['site_id']."</td>
                                <td>".$row['duration']."</td>
                                <td>".$row['event_status']."</td>
                                <td>".$row['gender']."</td>
                                <td>".$row['tour_id']."</td>
                                <td>".$row['year']."</td>
                            </tr>
                ";
                //run through records
                while($row = mysqli_fetch_assoc($result)){
                    $tableRows .= "
                            <tr class='TableRow' rowspan='1'>
                                <td>".$row['id']."</td>
                                <td>".$row['event_key']."</td>
                                <td>".$row['publisher_id']."</td>
                                <td>".$row['start_date_time']."</td>
                                <td>".$row['end_date_time']."</td>
                                <td>".$row['site_id']."</td>
                                <td>".$row['duration']."</td>
                                <td>".$row['event_status']."</td>
                                <td>".$row['gender']."</td>
                                <td>".$row['tour_id']."</td>
                                <td>".$row['year']."</td>
                            </tr>
                    ";
                }
                $_SESSION['table'] = $tableHeaders . $tableRows . "</table>";
                if ($query){
                    //Success
                    header("Location: viewTournaments.php");
                }
                else{
                    $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                    error_reporting(E_ALL);
                    header("Location: viewTournaments.php");
                    // echo "Error connecting to database: " . $conn->error;
                }
                $conn->close();
            }

        }
        else if(isset($_POST['idUpdate'])){
            if (isset($_POST['option1'])){
                //update a player's data
                $_SESSION['option1'] = $_POST['option1'];
                $select=null;
                $result=null;
                if($_SESSION['option1'] != null){
                    //view males
                    $select = $conn->prepare("SELECT * FROM events WHERE id=?");
                    $select->bind_param("i",$id);
                    $select->execute();
                    $result = $select->get_result();
                    if(mysqli_num_rows($result) == 0) {
                        $_SESSION['messages'] = 'That id does not exist in the database.';
                        header("Location: viewTournaments.php");
                    }
                    else{          //****UPDATE TABLE**//
                        $query = $conn->prepare("UPDATE events SET event_key=? WHERE id=?");
                        $query->bind_param("si",$_SESSION['option1'], $id);
                        $query->execute();
                        $result = $query->get_result();
                        
                        if ($query){
                            //Success
                            header("Location: viewTournaments.php");
                        }
                        else{
                            $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                            error_reporting(E_ALL);
                            header("Location: viewTournaments.php");
                            // echo "Error connecting to database: " . $conn->error;
                        }  
                    }                     
                }
            }
            else if (isset($_POST['option2'])){
                //update a player's data
                $_SESSION['option2'] = $_POST['option2'];
                $select=null;
                $result=null;
                if($_SESSION['option2'] != null){
                    //view males
                    $select = $conn->prepare("SELECT * FROM events WHERE id=?");
                    $select->bind_param("i",$id);
                    $select->execute();
                    $result = $select->get_result();
                    if(mysqli_num_rows($result) == 0) {
                        $_SESSION['messages'] = 'That id does not exist in the database.';
                        header("Location: viewTournaments.php");
                    }
                    else{          //****UPDATE TABLE**//
                        $query = $conn->prepare("UPDATE events SET gender=? WHERE id=?");
                        $query->bind_param("si",$_SESSION['option2'], $id);
                        $query->execute();
                        $result = $query->get_result();
                        
                        if ($query){
                            //Success
                            header("Location: viewTournaments.php");
                        }
                        else{
                            $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                            error_reporting(E_ALL);
                            header("Location: viewTournaments.php");
                            // echo "Error connecting to database: " . $conn->error;
                        }  
                    }                     
                }
            }
            else if (isset($_POST['option3'])){
                //update a player's data
                $_SESSION['option3'] = $_POST['option3'];
                $select=null;
                $result=null;
                if($_SESSION['option3'] != null){
                    //view males
                    $select = $conn->prepare("SELECT * FROM events WHERE id=?");
                    $select->bind_param("i",$id);
                    $select->execute();
                    $result = $select->get_result();
                    if(mysqli_num_rows($result) == 0) {
                        $_SESSION['messages'] = 'That id does not exist in the database.';
                        header("Location: viewTournaments.php");
                    }
                    else{          //****UPDATE TABLE**//
                        $query = $conn->prepare("UPDATE events SET event_status=? WHERE id=?");
                        $query->bind_param("si",$_SESSION['option3'], $id);
                        $query->execute();
                        $result = $query->get_result();
                        
                        if ($query){
                            //Success
                            header("Location: viewTournaments.php");
                        }
                        else{
                            $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                            error_reporting(E_ALL);
                            header("Location: viewTournaments.php");
                            // echo "Error connecting to database: " . $conn->error;
                        }  
                    }                     
                }
            }
            
            //build first row then continue from second row
            //now to rebuild
            $tableHeaders = "
                        <table class='Table'>
                            <th>id</th>
                            <th>event_key</th>
                            <th>publisher_id</th>
                            <th>start_date_time</th>
                            <th>end_date_time</th>
                            <th>site_id</th>
                            <th>duration</th>
                            <th>event_status</th>
                            <th>gender</th>
                            <th>tour_id</th>
                            <th>year</th>
            ";
            //first get first row then build from second row
            $row = mysqli_fetch_assoc($result);
            $tableRows .= "
                        <tr class='TableRow' rowspan='1'>
                            <td>".$row['id']."</td>
                            <td>".$row['event_key']."</td>
                            <td>".$row['publisher_id']."</td>
                            <td>".$row['start_date_time']."</td>
                            <td>".$row['end_date_time']."</td>
                            <td>".$row['site_id']."</td>
                            <td>".$row['duration']."</td>
                            <td>".$row['event_status']."</td>
                            <td>".$row['gender']."</td>
                            <td>".$row['tour_id']."</td>
                            <td>".$row['year']."</td>
                        </tr>
            ";
            //run through records
            while($row = mysqli_fetch_assoc($result)){
                $tableRows .= "
                            <tr class='TableRow' rowspan='1'>
                                <td>".$row['id']."</td>
                                <td>".$row['event_key']."</td>
                                <td>".$row['publisher_id']."</td>
                                <td>".$row['start_date_time']."</td>
                                <td>".$row['end_date_time']."</td>
                                <td>".$row['site_id']."</td>
                                <td>".$row['duration']."</td>
                                <td>".$row['event_status']."</td>
                                <td>".$row['gender']."</td>
                                <td>".$row['tour_id']."</td>
                                <td>".$row['year']."</td>
                            </tr>
                ";
            }
            $_SESSION['table'] = $tableHeaders . $tableRows . "</table>";
            if ($query){
                //Success
                header("Location: viewTournaments.php");
            }
            else{
                $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                error_reporting(E_ALL);
                header("Location: viewTournaments.php");
                // echo "Error connecting to database: " . $conn->error;
            }
            $conn->close();
        }
    }
?>