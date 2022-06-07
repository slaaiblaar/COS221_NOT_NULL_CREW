<?php
    include_once("configDB.php");
    session_start();

    if ($_SERVER['REQUEST_METHOD'] == 'POST'){
        if (isset($_POST['entity_type']) && isset($_POST['entity_id']) && isset($_POST['person_id']) && isset($_POST['tour_ind']) && isset($_POST['event_ind']) && isset($_POST['round_ind']) && isset($_POST['player_ind']) && isset($_POST['winner_id']) && isset($_POST['leader_id']) && isset($_POST['no_of_eagles'])&& isset($_POST['no_of_birdies'])&& isset($_POST['no_of_bogeys'])&& isset($_POST['no_of_double_bogeys'])&& isset($_POST['max_drive']) && isset($_POST['top10_cnt'])&& isset($_POST['avg_net_score'])&& isset($_POST['win_cnt'])&& isset($_POST['position'])){
            //this is to validate adding a new statistic
            $_SESSION['entity_type'] = $_POST['entity_type'];
            $_SESSION['entity_id'] = $_POST['entity_id'];
            $_SESSION['person_id'] = $_POST['person_id'];
            $_SESSION['tour_ind'] = $_POST['tour_ind'];
            $_SESSION['event_ind'] = $_POST['event_ind'];
            $_SESSION['round_ind'] = $_POST['round_ind'];
            $_SESSION['player_ind'] = $_POST['player_ind'];
            $_SESSION['winner_id'] = $_POST['winner_id'];
            $_SESSION['leader_id'] = $_POST['leader_id'];
            $_SESSION['no_of_eagles'] = $_POST['no_of_eagles'];
            $_SESSION['no_of_birdies'] = $_POST['no_of_birdies'];
            $_SESSION['no_of_bogeys'] = $_POST['no_of_bogeys'];
            $_SESSION['no_of_double_bogeys'] = $_POST['no_of_double_bogeys'];
            $_SESSION['max_drive'] = $_POST['max_drive'];
            $_SESSION['avg_net_score'] = $_POST['avg_net_score'];
            $_SESSION['top10_cnt'] = $_POST['top10_cnt'];
            $_SESSION['win_cnt'] = $_POST['win_cnt'];
            $_SESSION['position'] = $_POST['position'];
            if($_SESSION['entity_type'] == ""){
                $_SESSION['messages'] = "Invalid entity type. The entity type must be tours, events or rounds.";
                header("Location: manageStatistics.php");
            }
            else if(!preg_match("/^\d+$/",$_SESSION['entity_id'])){
                $_SESSION['messages'] = "Invalid entity_id. Th entity_id must be a digit.";
                header("Location: manageMedia.php");
            }
            else if(!preg_match("/^\d+$/",$_SESSION['person_id'])){
                $_SESSION['messages'] = "Invalid person_id.  The person_id must be a digit.";
                header("Location: manageMedia.php");
            }
            else if(!preg_match("/^\d+$/",$_SESSION['tour_ind'])){
                $_SESSION['messages'] = "Invalid tour_ind. The tour_ind must be a digit.";
                header("Location: manageMedia.php");
            }
            else if(!preg_match("/^\d+$/",$_SESSION['event_ind'])){
                $_SESSION['messages'] = "Invalid event_ind. The event_ind must be a digit.";
                header("Location: manageMedia.php");
            }
            else if(!preg_match("/^\d+$/",$_SESSION['round_ind'])){
                $_SESSION['messages'] = "Invalid round_ind. The round_ind must be a digit.";
                header("Location: manageMedia.php");
            }
            else if(!preg_match("/^\d+$/",$_SESSION['player_ind'])){
                $_SESSION['messages'] = "Invalid player_ind. The player_ind must be a digit.";
                header("Location: manageMedia.php");
            }
            else if(!preg_match("/^\d+$/",$_SESSION['winner_id'])){
                $_SESSION['messages'] = "Invalid winner_id. The winner_id must be a digit.";
                header("Location: manageMedia.php");
            }
            else if(!preg_match("/^\d+$/",$_SESSION['leader_id'])){
                $_SESSION['messages'] = "Invalid leader_id. The leader_id must be a digit.";
                header("Location: manageMedia.php");
            }
            else if(!preg_match("/^\d+$/",$_SESSION['no_of_eagles'])){
                $_SESSION['messages'] = "Invalid no_of_eagles. The no_of_eagles must be a digit.";
                header("Location: manageMedia.php");
            }
            else if(!preg_match("/^\d+$/",$_SESSION['no_of_birdies'])){
                $_SESSION['messages'] = "Invalid no_of_birdies. The no_of_birdies must be a digit.";
                header("Location: manageMedia.php");
            }
            else if(!preg_match("/^\d+$/",$_SESSION['no_of_bogeys'])){
                $_SESSION['messages'] = "Invalid no_of_bogeys. The no_of_bogeys must be a digit.";
                header("Location: manageMedia.php");
            }
            else if(!preg_match("/^\d+$/",$_SESSION['no_of_double_bogeys'])){
                $_SESSION['messages'] = "Invalid no_of_double_bogeys. The no_of_double_bogeys must be a digit.";
                header("Location: manageMedia.php");
            }
            else if(!preg_match("/^\d+$/",$_SESSION['max_drive'])){
                $_SESSION['messages'] = "Invalid max_drive. The max_drive must be a digit.";
                header("Location: manageMedia.php");
            }
            else if(!preg_match("/^\d+$/",$_SESSION['avg_net_score'])){
                $_SESSION['messages'] = "Invalid avg_net_score. The avg_net_score must be a digit.";
                header("Location: manageMedia.php");
            }
            else if(!preg_match("/^\d+$/",$_SESSION['top10_cnt'])){
                $_SESSION['messages'] = "Invalid top10_cnt. The top10_cnt must be a digit.";
                header("Location: manageMedia.php");
            }
            else if(!preg_match("/^\d+$/",$_SESSION['win_cnt'])){
                $_SESSION['messages'] = "Invalid win_cnt. The win_cnt must be a digit.";
                header("Location: manageMedia.php");
            }
            else if(!preg_match("/^\d+$/",$_SESSION['position'])){
                $_SESSION['messages'] = "Invalid position. The position must be a digit.";
                header("Location: manageMedia.php");
            }
            else{
                $entity_type = $_POST['entity_type'];
                $entity_id = $_POST['entity_id'];
                $person_id = $_POST['person_id'];
                $tour_ind = $_POST['tour_ind'];
                $event_ind = $_POST['event_ind'];
                $round_ind = $_POST['round_ind'];
                $player_ind = $_POST['player_ind'];
                $winner_id = $_POST['winner_id'];
                $leader_id = $_POST['leader_id'];
                $no_of_eagles = $_POST['no_of_eagles'];
                $no_of_birdies = $_POST['no_of_birdies'];
                $no_of_bogeys = $_POST['no_of_bogeys'];
                $no_of_double_bogeys = $_POST['no_of_double_bogeys'];
                $max_drive = $_POST['max_drive'];
                $avg_net_score = $_POST['avg_net_score'];
                $top10_cnt = $_POST['top10_cnt'];
                $win_cnt = $_POST['win_cnt'];
                $position = $_POST['position'];
                
                //insert user into database
                $query = $conn->prepare("INSERT INTO golf_statistics (entity_type, entity_id, person_id, tour_ind, event_ind, round_ind,
                player_ind,winner_id, leader_id, no_of_eagles, no_of_birdies, no_of_bogeys, no_of_double_bogeys, max_drive, agv_net_score, top10_cnt, win_cnt, position) 
                VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
                $nullVal = null;
                $query->bind_param("siiiiiiiiiiiiiiiii", $entity_type, $entity_id, $person_id, $tour_ind, $event_ind, $round_ind, $player_ind, $winner_id, $leader_id, $no_of_eagles,
                                    $no_of_birdies, $no_of_bogeys, $no_of_double_bogeys, $max_drive, $avg_net_score, $top10_cnt, $win_cnt, $position);
                $query->execute();
                $result = $query->get_result();
                
                if ($query){
                    //Success
                    header("Location: manageStatistics.php");
                }
                else{
                    $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                    error_reporting(E_ALL);
                    header("Location: manageStatistics.php");
                    // echo "Error connecting to database: " . $conn->error;
                }

                $conn->close();
            }
        }
        else if(isset($_POST['id'])){
            //this is to validate deleteing a player
            $_SESSION['id'] = $_POST["id"];
            if(!preg_match("/^\d+$/",$_SESSION['id'])){
                $_SESSION['messages'] = "Invalid ID, please ensure the ID only contains digits.";
                header("Location: manageStatistics.php");
            }
            else{
                $id = $_POST['id'];
                //first check to see if record exist
                $select = $conn->prepare("SELECT * FROM golf_statistics WHERE id=?");
                $select->bind_param("i",$id);
                $select->execute();
                $result = $select->get_result();

                if(mysqli_num_rows($result) == 0) {
                    $_SESSION['messages'] = 'That id does not exist in the database.';
                    header("Location: manageStatistics.php");
                }
                else{          
                    $query = $conn->prepare("DELETE FROM golf_statistics WHERE id=?");
                    $query->bind_param("i", $id);
                    $query->execute();
                    $result = $query->get_result();
                    
                    if ($query){
                        //Success                        
                        header("Location: manageStatistics.php");
                    }
                    else{
                        $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                        error_reporting(E_ALL);
                        header("Location: manageStatistics.php");
                        // echo "Error connecting to database: " . $conn->error;
                    }
                    
                    $conn->close();
                }
            }
        }
        else if(isset($_POST['filterOption1']) || isset($_POST['filterOption2']) || isset($_POST['filterOption3']) || isset($_POST['filterOption4']) || isset($_POST['filterOption5']) || isset($_POST['filterOption6']) || isset($_POST['filterOption7']) || isset($_POST['filterOption8']) || isset($_POST['filterOption9']) || isset($_POST['filterOption10'])){
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
            if (isset($_POST['filterOption7'])) {
                $_SESSION['filterOption7'] = $_POST['filterOption7'];
            }
            else{
                $_SESSION['filterOption7'] = null;
            }
            if (isset($_POST['filterOption8'])) {
                $_SESSION['filterOption8'] = $_POST['filterOption8'];
            }
            else{
                $_SESSION['filterOption8'] = null;
            }
            if (isset($_POST['filterOption9'])) {
                $_SESSION['filterOption9'] = $_POST['filterOption9'];
            }
            else{
                $_SESSION['filterOption9'] = null;
            }
            if (isset($_POST['filterOption10'])) {
                $_SESSION['filterOption10'] = $_POST['filterOption10'];
            }
            else{
                $_SESSION['filterOption10'] = null;
            }
            
            $select=null;
            $result = null;
            if($_SESSION['filterOption1'] != null){
                //view tours
                $select = $conn->prepare("SELECT * FROM golf_statistics WHERE entity_type=?");
                $select->bind_param("s",$_SESSION['filterOption1']);
                $select->execute();
                $result = $select->get_result();                 
            }
            else if($_SESSION['filterOption2'] != null){
                //view events
                $select = $conn->prepare("SELECT * FROM golf_statistics WHERE entity_type=?");
                $select->bind_param("s",$_SESSION['filterOption2']);
                $select->execute();
                $result = $select->get_result();  
                
            }
            else if($_SESSION['filterOption3'] != null){
                //view rounds
                $select = $conn->prepare("SELECT * FROM golf_statistics WHERE entity_type=?");
                $select->bind_param("s",$_SESSION['filterOption3']);
                $select->execute();
                $result = $select->get_result();  
                
            }
            else if($_SESSION['filterOption4'] != null){
                //view eagles >= 15
                $select = $conn->prepare("SELECT * FROM golf_statistics WHERE no_of_eagles>=?");
                $select->bind_param("i",$_SESSION['filterOption4']);
                $select->execute();
                $result = $select->get_result(); 

            }
            else if($_SESSION['filterOption5'] != null){
                //view birdies >= 5
                $select = $conn->prepare("SELECT * FROM golf_statistics WHERE no_of_birdies>=?");
                $select->bind_param("i",$_SESSION['filterOption5']);
                $select->execute();
                $result = $select->get_result();                
            }
            else if($_SESSION['filterOption6'] != null){
                //view bogeys >= 3
                $select = $conn->prepare("SELECT * FROM golf_statistics WHERE no_of_bogeys>=?");
                $select->bind_param("i",$_SESSION['filterOption6']);
                $select->execute();
                $result = $select->get_result();                
            }
            else if($_SESSION['filterOption7'] != null){
                //view double bogeys >= 5
                $select = $conn->prepare("SELECT * FROM golf_statistics WHERE no_of_double_bogeys>=?");
                $select->bind_param("i",$_SESSION['filterOption7']);
                $select->execute();
                $result = $select->get_result();                
            }
            else if($_SESSION['filterOption8'] != null){
                //view max drive >= 300
                $select = $conn->prepare("SELECT * FROM golf_statistics WHERE max_drive>=?");
                $select->bind_param("i",$_SESSION['filterOption8']);
                $select->execute();
                $result = $select->get_result();                
            }
            else if($_SESSION['filterOption9'] != null){
                //view avg net score <= -2
                $select = $conn->prepare("SELECT * FROM golf_statistics WHERE avg_net_score>=?");
                $select->bind_param("i",$_SESSION['filterOption9']);
                $select->execute();
                $result = $select->get_result();                
            }
            else{ //reset table
                $select = $conn->prepare("SELECT * FROM golf_statistics ");
                $select->execute();
                $result = $select->get_result();    
            }
            if (mysqli_num_rows($result)==0){
                $tableHeaders = "
                        <table class='Table'>
                          <thead rowspan='1'>
                            <th>id</th>
                            <th>entity_type</th>
                            <th>entity_id</th>
                            <th>person_id</th>
                            <th>tour_ind</th>
                            <th>event_ind</th>
                            <th>round_ind</th>
                            <th>player_ind</th>
                            <th>winner_id</th>
                            <th>leader_id</th>
                            <th>no_of_eagles</th>
                            <th>no_of_birdies</th>
                            <th>no_of_bogeys</th>
                            <th>no_of_double_bogeys</th>
                            <th>max_drive</th>
                            <th>avg_net_score</th>
                            <th>top10_cnt</th>
                            <th>win_cnt</th>
                            <th>position</th>
                           </thead>  
                        </table>
                ";
                $_SESSION['table'] = $tableHeaders;
                header("Location: manageStatistics.php");
            }
            else{    //now to rebuild
                $tableHeaders = "
                        <table class='Table'>
                           <thead rowspan='1'>
                            <th>id</th>
                            <th>entity_type</th>
                            <th>entity_id</th>
                            <th>person_id</th>
                            <th>tour_ind</th>
                            <th>event_ind</th>
                            <th>round_ind</th>
                            <th>player_ind</th>
                            <th>winner_id</th>
                            <th>leader_id</th>
                            <th>no_of_eagles</th>
                            <th>no_of_birdies</th>
                            <th>no_of_bogeys</th>
                            <th>no_of_double_bogeys</th>
                            <th>max_drive</th>
                            <th>avg_net_score</th>
                            <th>top10_cnt</th>
                            <th>win_cnt</th>
                            <th>position</th>
                        </thead>
                ";
                //first get first row then build from second row
                $row = mysqli_fetch_assoc($result);
                $tableRows = "
                            <tr class='TableRow' rowspan='1'>
                                <td>".$row['id']."</td>
                                <td>".$row['entity_type']."</td>
                                <td>".$row['person_id']."</td>
                                <td>".$row['tour_ind']."</td>
                                <td>".$row['event_ind']."</td>
                                <td>".$row['round_ind']."</td>
                                <td>".$row['player_ind']."</td>
                                <td>".$row['winner_id']."</td>
                                <td>".$row['leader_id']."</td>
                                <td>".$row['no_of_eagles']."</td>
                                <td>".$row['no_of_birdies']."</td>
                                <td>".$row['no_of_bogeys']."</td>
                                <td>".$row['no_double_bogeys']."</td>
                                <td>".$row['max_drive']."</td>
                                <td>".$row['agv_net_score']."</td>
                                <td>".$row['top10_cnt']."</td>
                                <td>".$row['win_cnt']."</td>
                                <td>".$row['position']."</td>
                            </tr>
                    ";
                //run through records
                while($row = mysqli_fetch_assoc($result)){
                    $tableRows .= "
                            <tr class='TableRow' rowspan='1'>
                                <td>".$row['id']."</td>
                                <td>".$row['entity_type']."</td>
                                <td>".$row['person_id']."</td>
                                <td>".$row['tour_ind']."</td>
                                <td>".$row['event_ind']."</td>
                                <td>".$row['round_ind']."</td>
                                <td>".$row['player_ind']."</td>
                                <td>".$row['winner_id']."</td>
                                <td>".$row['leader_id']."</td>
                                <td>".$row['no_of_eagles']."</td>
                                <td>".$row['no_of_birdies']."</td>
                                <td>".$row['no_of_bogeys']."</td>
                                <td>".$row['no_double_bogeys']."</td>
                                <td>".$row['max_drive']."</td>
                                <td>".$row['avg_net_score']."</td>
                                <td>".$row['top10_cnt']."</td>
                                <td>".$row['win_cnt']."</td>
                                <td>".$row['position']."</td>
                            </tr>
                    ";
                }
                $_SESSION['table'] = $tableHeaders . $tableRows . "</table>";
                if ($query){
                    //Success
                    header("Location: manageStatistics.php");
                }
                else{
                    $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                    error_reporting(E_ALL);
                    header("Location: manageStatistics.php");
                    // echo "Error connecting to database: " . $conn->error;
                }
                $conn->close();
            }

        }
        else if(isset($_POST['option1']) || isset($_POST['option2']) || isset($_POST['option3']) || isset($_POST['option4']) || isset($_POST['option5']) || isset($_POST['option6']) || isset($_POST['option7']) || isset($_POST['option8']) || isset($_POST['option9']) || isset($_POST['option10'])){
            //update a player's data
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
            if (isset($_POST['filterOption7'])) {
                $_SESSION['filterOption7'] = $_POST['filterOption7'];
            }
            else{
                $_SESSION['filterOption7'] = null;
            }
            if (isset($_POST['filterOption8'])) {
                $_SESSION['filterOption8'] = $_POST['filterOption8'];
            }
            else{
                $_SESSION['filterOption8'] = null;
            }
            if (isset($_POST['filterOption9'])) {
                $_SESSION['filterOption9'] = $_POST['filterOption9'];
            }
            else{
                $_SESSION['filterOption9'] = null;
            }
            if (isset($_POST['filterOption10'])) {
                $_SESSION['filterOption10'] = $_POST['filterOption10'];
            }
            else{
                $_SESSION['filterOption10'] = null;
            }
            $select=null;
            $result=null;
            $id = $_POST['idUpdate'];
            if($_SESSION['option1'] != null){
                //change entity type
                $select = $conn->prepare("SELECT * FROM golf_statistics WHERE id=?");
                $select->bind_param("i",$id);
                $select->execute();
                $result = $select->get_result();
                if(mysqli_num_rows($result) == 0) {
                    $_SESSION['messages'] = 'That id does not exist in the database.';
                    $_SESSION['showUpdateMenu'] = "true";
                    header("Location: manageStatistics.php");
                }
                else{          //****UPDATE TABLE**//
                    $query = $conn->prepare("UPDATE golf_statistics SET entity_type=? WHERE id=?");
                    $query->bind_param("si",$_SESSION['option1'], $id);
                    $query->execute();
                    $result = $query->get_result();
                    
                    if ($query){
                        //Success
                        header("Location: manageStatistics.php");
                    }
                    else{
                        $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                        error_reporting(E_ALL);
                        header("Location: manageStatistics.php");
                        // echo "Error connecting to database: " . $conn->error;
                    }  
                }                     
            }
            else if($_SESSION['option2'] != null){
                //change winner id
                $select = $conn->prepare("SELECT * FROM golf_statistics WHERE id=?");
                $select->bind_param("i",$id);
                $select->execute();
                $result = $select->get_result();    
                if(mysqli_num_rows($result) == 0) {
                    $_SESSION['messages'] = 'That id does not exist in the database.';
                    $_SESSION['showUpdateMenu'] = "true";
                    header("Location: manageStatistics.php");
                }
                else{          
                    $query = $conn->prepare("UPDATE golf_statistics SET winner_id=? WHERE id=?");
                    $query->bind_param("ii",$_SESSION['option2'],$id);
                    $query->execute();
                    $result = $query->get_result();
                    
                    if ($query){
                        //Success
                        header("Location: managePlayer.php");
                    }
                    else{
                        $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                        error_reporting(E_ALL);
                        header("Location: manageStatistics.php");
                        // echo "Error connecting to database: " . $conn->error;
                    }   
                }                       
            }
            else if($_SESSION['option3'] != null){
                //change eagles
                $select = $conn->prepare("SELECT * FROM golf_statistics WHERE id=?");
                $select->bind_param("i",$id);
                $select->execute();
                $result = $select->get_result();  
                if(mysqli_num_rows($result) == 0) {
                    $_SESSION['messages'] = 'That id does not exist in the database.';
                    $_SESSION['showUpdateMenu'] = "true";
                    header("Location: manageStatistics.php");
                }
                else{          
                    $query = $conn->prepare("UPDATE golf_statistics SET no_of_eagles=? WHERE id=?");
                    $query->bind_param("ii",$_SESSION['option3'],$id);
                    $query->execute();
                    $result = $query->get_result();
                    
                    if ($query){
                        //Success
                        header("Location: manageStatistics.php");
                    }
                    else{
                        $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                        error_reporting(E_ALL);
                        header("Location: manageStatistics.php");
                        // echo "Error connecting to database: " . $conn->error;
                    }   
                }                        
            }
            else if($_SESSION['option4'] != null){
                //change birdies
                $select = $conn->prepare("SELECT * FROM golf_statistics WHERE id=?");
                $select->bind_param("i",$id);
                $select->execute();
                $result = $select->get_result();  
                if(mysqli_num_rows($result) == 0) {
                    $_SESSION['messages'] = 'That id does not exist in the database.';
                    $_SESSION['showUpdateMenu'] = "true";
                    header("Location: manageStatistics.php");
                }
                else{          
                    $query = $conn->prepare("UPDATE golf_statistics SET no_of_birdies=? WHERE id=?");
                    $query->bind_param("ii",$_SESSION['option4'],$id);
                    $query->execute();
                    $result = $query->get_result();
                    
                    if ($query){
                        //Success                        
                        header("Location: manageStatistics.php");
                    }
                    else{
                        $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                        error_reporting(E_ALL);
                        header("Location: manageStatistics.php");
                        // echo "Error connecting to database: " . $conn->error;
                    }   
                }               
            }
            else if($_SESSION['option5'] != null){
                //change bogeys
                $select = $conn->prepare("SELECT * FROM golf_statistics WHERE id=?");
                $select->bind_param("i",$id);
                $select->execute();
                $result = $select->get_result(); 
                if(mysqli_num_rows($result) == 0) {
                    $_SESSION['messages'] = 'That id does not exist in the database.';
                    $_SESSION['showUpdateMenu'] = "true";
                    header("Location: manageStatistics.php");
                }
                else{          
                    $query = $conn->prepare("UPDATE golf_statistics SET no_of_bogeys=? WHERE id=?");
                    $query->bind_param("ii",$_SESSION['option5'],$id);
                    $query->execute();
                    $result = $query->get_result();
                    
                    if ($query){
                        //Success
                        header("Location: manageStatistics.php");
                    }
                    else{
                        $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                        error_reporting(E_ALL);
                        header("Location: manageStatistics.php");
                        // echo "Error connecting to database: " . $conn->error;
                    }   
                }                
            }
            else if($_SESSION['option6']!=null){ //change double bogeys
                $select = $conn->prepare("SELECT * FROM golf_statistics WHERE id=? ");
                $select->bind_param('i',$id);
                $select->execute();
                $result = $select->get_result(); 
                if(mysqli_num_rows($result) == 0) {
                    $_SESSION['messages'] = 'That id does not exist in the database.';
                    $_SESSION['showUpdateMenu'] = "true";
                    header("Location: manageStatistics.php");
                }
                else{          
                    $query = $conn->prepare("UPDATE golf_statistics SET no_of_double_bogeys=? WHERE id=?");
                    $query->bind_param("ii",$_SESSION['option6'],$id);
                    $query->execute();
                    $result = $query->get_result();
                    
                    if ($query){
                        //Success
                        header("Location: manageStatistics.php");
                    }
                    else{
                        $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                        error_reporting(E_ALL);
                        header("Location: manageStatistics.php");
                        // echo "Error connecting to database: " . $conn->error;
                    }   
                }    
            }
            else if($_SESSION['option7']!=null){ //change max drive
                $select = $conn->prepare("SELECT * FROM golf_statistics WHERE id=? ");
                $select->bind_param('i',$id);
                $select->execute();
                $result = $select->get_result(); 
                if(mysqli_num_rows($result) == 0) {
                    $_SESSION['messages'] = 'That id does not exist in the database.';
                    $_SESSION['showUpdateMenu'] = "true";
                    header("Location: manageStatistics.php");
                }
                else{          
                    $query = $conn->prepare("UPDATE golf_statistics SET max_drive=? WHERE id=?");
                    $query->bind_param("ii",$_SESSION['option7'],$id);
                    $query->execute();
                    $result = $query->get_result();
                    
                    if ($query){
                        //Success
                        header("Location: manageStatistics.php");
                    }
                    else{
                        $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                        error_reporting(E_ALL);
                        header("Location: manageStatistics.php");
                        // echo "Error connecting to database: " . $conn->error;
                    }   
                }    
            }
            else if($_SESSION['option8']!=null){ //change avg net score
                $select = $conn->prepare("SELECT * FROM golf_statistics WHERE id=? ");
                $select->bind_param('i',$id);
                $select->execute();
                $result = $select->get_result(); 
                if(mysqli_num_rows($result) == 0) {
                    $_SESSION['messages'] = 'That id does not exist in the database.';
                    $_SESSION['showUpdateMenu'] = "true";
                    header("Location: manageStatistics.php");
                }
                else{          
                    $query = $conn->prepare("UPDATE golf_statistics SET avg_net_score=? WHERE id=?");
                    $query->bind_param("ii",$_SESSION['option8'],$id);
                    $query->execute();
                    $result = $query->get_result();
                    
                    if ($query){
                        //Success
                        header("Location: manageStatistics.php");
                    }
                    else{
                        $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                        error_reporting(E_ALL);
                        header("Location: manageStatistics.php");
                        // echo "Error connecting to database: " . $conn->error;
                    }   
                }    
            }
            else if($_SESSION['option9']!=null){ //change win count
                $select = $conn->prepare("SELECT * FROM golf_statistics WHERE id=? ");
                $select->bind_param('i',$id);
                $select->execute();
                $result = $select->get_result(); 
                if(mysqli_num_rows($result) == 0) {
                    $_SESSION['messages'] = 'That id does not exist in the database.';
                    $_SESSION['showUpdateMenu'] = "true";
                    header("Location: manageStatistics.php");
                }
                else{          
                    $query = $conn->prepare("UPDATE golf_statistics SET win_cnt=? WHERE id=?");
                    $query->bind_param("ii",$_SESSION['option9'],$id);
                    $query->execute();
                    $result = $query->get_result();
                    
                    if ($query){
                        //Success
                        header("Location: manageStatistics.php");
                    }
                    else{
                        $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                        error_reporting(E_ALL);
                        header("Location: manageStatistics.php");
                        // echo "Error connecting to database: " . $conn->error;
                    }   
                }    
            }
            else if($_SESSION['option10']!=null){ //change position
                $select = $conn->prepare("SELECT * FROM golf_statistics WHERE id=? ");
                $select->bind_param('i',$id);
                $select->execute();
                $result = $select->get_result(); 
                if(mysqli_num_rows($result) == 0) {
                    $_SESSION['messages'] = 'That id does not exist in the database.';
                    $_SESSION['showUpdateMenu'] = "true";
                    header("Location: manageStatistics.php");
                }
                else{          
                    $query = $conn->prepare("UPDATE golf_statistics SET position=? WHERE id=?");
                    $query->bind_param("ii",$_SESSION['option10'],$id);
                    $query->execute();
                    $result = $query->get_result();
                    
                    if ($query){
                        //Success
                        header("Location: manageStatistics.php");
                    }
                    else{
                        $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                        error_reporting(E_ALL);
                        header("Location: manageStatistics.php");
                        // echo "Error connecting to database: " . $conn->error;
                    }   
                }    
            }
            
            //build first row then continue from second row
            //now to rebuild
            $tableHeaders = "
                    <table class='Table'>
                      <thead rowspan='1'>
                        <th>id</th>
                        <th>entity_type</th>
                        <th>entity_id</th>
                        <th>person_id</th>
                        <th>tour_ind</th>
                        <th>event_ind</th>
                        <th>round_ind</th>
                        <th>player_ind</th>
                        <th>winner_id</th>
                        <th>leader_id</th>
                        <th>no_of_eagles</th>
                        <th>no_of_birdies</th>
                        <th>no_of_bogeys</th>
                        <th>no_of_double_bogeys</th>
                        <th>max_drive</th>
                        <th>avg_net_score</th>
                        <th>top10_cnt</th>
                        <th>win_cnt</th>
                        <th>position</th>
                     </thead>
            ";
            //first get first row then build from second row
            $row = mysqli_fetch_assoc($result);
            $tableRows = "
                        <tr class='TableRow' rowspan='1'>
                            <td>".$row['id']."</td>
                            <td>".$row['entity_type']."</td>
                            <td>".$row['person_id']."</td>
                            <td>".$row['tour_ind']."</td>
                            <td>".$row['event_ind']."</td>
                            <td>".$row['round_ind']."</td>
                            <td>".$row['player_ind']."</td>
                            <td>".$row['winner_id']."</td>
                            <td>".$row['leader_id']."</td>
                            <td>".$row['no_of_eagles']."</td>
                            <td>".$row['no_of_birdies']."</td>
                            <td>".$row['no_of_bogeys']."</td>
                            <td>".$row['no_double_bogeys']."</td>
                            <td>".$row['max_drive']."</td>
                            <td>".$row['agv_net_score']."</td>
                            <td>".$row['top10_cnt']."</td>
                            <td>".$row['win_cnt']."</td>
                            <td>".$row['position']."</td>
                        </tr>
                ";
            //run through records
            while($row = mysqli_fetch_assoc($result)){
                $tableRows .= "
                        <tr class='TableRow' rowspan='1'>
                            <td>".$row['id']."</td>
                            <td>".$row['entity_type']."</td>
                            <td>".$row['person_id']."</td>
                            <td>".$row['tour_ind']."</td>
                            <td>".$row['event_ind']."</td>
                            <td>".$row['round_ind']."</td>
                            <td>".$row['player_ind']."</td>
                            <td>".$row['winner_id']."</td>
                            <td>".$row['leader_id']."</td>
                            <td>".$row['no_of_eagles']."</td>
                            <td>".$row['no_of_birdies']."</td>
                            <td>".$row['no_of_bogeys']."</td>
                            <td>".$row['no_double_bogeys']."</td>
                            <td>".$row['max_drive']."</td>
                            <td>".$row['avg_net_score']."</td>
                            <td>".$row['top10_cnt']."</td>
                            <td>".$row['win_cnt']."</td>
                            <td>".$row['position']."</td>
                        </tr>
                ";
            }
            $_SESSION['table'] = $tableHeaders . $tableRows . "</table>";
            if ($query){
                //Success
                header("Location: manageStatistics.php");
            }
            else{
                $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                error_reporting(E_ALL);
                header("Location: manageStatistics.php");
                // echo "Error connecting to database: " . $conn->error;
            }
            $conn->close();
        }
    }

?>