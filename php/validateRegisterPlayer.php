<?php
    require_once("setDBEnvVar.php");
    include_once("configDB.php");
    session_start();

    if ($_SERVER['REQUEST_METHOD'] == 'POST'){
        if (isset($_POST['person_id']) && isset($_POST['round_id']) && isset($_POST['hole_id']) && isset($_POST['stroke_count']) && isset($_POST['net_score']) && isset($_POST['strokeType'])){
            //this is to validate adding a new scores
            $_SESSION['person_id'] = $_POST['person_id'];
            $_SESSION['round_id'] = $_POST['round_id'];
            $_SESSION['hole_id'] = $_POST['hole_id'];
            $_SESSION['stroke_count'] = $_POST['stroke_count'];
            $_SESSION['net_score']=$_POST['net_score'];
            if (isset($_POST['birdie'])) {
                $_SESSION['birdie'] = $_POST['birdie'];
            }
            else{
                $_SESSION['birdie'] = null;
            }
            if (isset($_POST['eagle'])) {
                $_SESSION['eagle'] = $_POST['eagle'];
            }
            else{
                $_SESSION['eagle'] = null;
            }
            if (isset($_POST['bogey'])) {
                $_SESSION['bogey'] = $_POST['bogey'];
            }
            else{
                $_SESSION['bogey'] = null;
            }
            if (isset($_POST['double_bogey'])) {
                $_SESSION['double_bogey'] = $_POST['double_bogey'];
            }
            else{
                $_SESSION['double_bogey'] = null;
            }
            
            if(!preg_match("/^\d+$/",$_SESSION['person_id'])){
                $_SESSION['messages'] = "Invalid person_id. person_id must be a digit.";
                header("Location: registerPlayer.php");
            }
            else if(!preg_match("/^\d+$/",$_SESSION['round_id'])){
                $_SESSION['messages'] = "Invalid round_id. round_id must be a digit.";
                header("Location: registerPlayer.php");
            }
            else if(!preg_match("/^\d+$/",$_SESSION['hole_id'])){
                $_SESSION['messages'] = "Invalid hole_id. hole_id must be a digit.";
                header("Location: registerPlayer.php");
            }
            else if(!preg_match("/^\d+$/",$_SESSION['stroke_count'])){
                $_SESSION['messages'] = "Invalid stroke_count. stroke_count must be a digit.";
                header("Location: registerPlayer.php");
            }
            else if(!preg_match("/^\d+$/",$_SESSION['net_score'])){
                $_SESSION['messages'] = "Invalid net_score. net_score must be a digit.";
                header("Location: registerPlayer.php");
            }
            else if($_SESSION['birdie'] != null && !preg_match("/^\d+$/",$_SESSION['birdie'])){
                $_SESSION['messages'] = "Invalid stroke type. You need to choose a stroke type";
                header("Location: registerPlayer.php");
            }
            else if($_SESSION['eagle'] != null && !preg_match("/^\d+$/",$_SESSION['eagle'])){
                $_SESSION['messages'] = "Invalid stroke type. You need to choose a stroke type";
                header("Location: registerPlayer.php");
            }
            else if($_SESSION['bogey'] != null && !preg_match("/^\d+$/",$_SESSION['bogey'])){
                $_SESSION['messages'] = "Invalid stroke type. You need to choose a stroke type";
                header("Location: registerPlayer.php");
            }
            else if($_SESSION['double_bogey'] != null && !preg_match("/^\d+$/",$_SESSION['double_bogey'])){
                $_SESSION['messages'] = "Invalid stroke type. You need to choose a stroke type";
                header("Location: registerPlayer.php");
            }
            else{
                $person_id = $_POST['person_id'];
                $round_id = $_POST['round_id'];
                $hole_id = $_POST['hole_id'];
                $stroke_count = $_POST['stroke_count'];
                $net_score=$_POST['net_score'];
                $eagle = "";
                $birdie ="";
                $bogey = "";
                $double_bogey = "";
                if ($_SESSION['eagle']!=null){
                    $GLOBALS['eagle'] = 1;
                }
                else if ($_SESSION['birdie']!=null){
                    $GLOBALS['birdie'] = 1;
                }
                else if ($_SESSION['bogey']!=null){
                    $GLOBALS['bogey'] = 1;
                }
                else {
                    $GLOBALS['double_bogey'] = 1;
                }

                
                //insert user into database
                $query = "INSERT INTO scores (person_id, round_id, hole_id, stroke_count, net_score, birdie, eagle, bogey, double_bogey) 
                VALUES ('$person_id', '$round_id', '$hole_id', '$stroke_count', '$net_score', '$birdie', '$eagle', '$bogey', '$double_bogey')";
                
                if ($conn->query($query)){
                    //Success
                    header("Location: registerPlayer.php");
                }
                else{
                    $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                    error_reporting(E_ALL);
                    header("Location: registerPlayer.php");
                    // echo "Error connecting to database: " . $conn->error;
                }

                $conn->close();
            }
        }
        else if(isset($_POST['person_idDelete']) && isset($_POST['round_idDelete']) && isset($_POST['hole_idDelete'])){
            //this is to validate deleteing a player
            $_SESSION['person_id'] = $_POST["person_id"];
            $_SESSION['round_id'] = $_POST["round_id"];
            $_SESSION['hole_id'] = $_POST["hole_id"];
            if(!preg_match("/^\d+$/",$_SESSION['person_id'])){
                $_SESSION['messages'] = "Invalid ID , please ensure the ID contains digits.";
                header("Location: registerPlayer.php");
            }
            else if(!preg_match("/^\d+$/",$_SESSION['round_id'])){
                $_SESSION['messages'] = "Invalid ID , please ensure the ID contains digits.";
                header("Location: registerPlayer.php");
            }
            else if(!preg_match("/^\d+$/",$_SESSION['hole_id'])){
                $_SESSION['messages'] = "Invalid ID , please ensure the ID contains digits.";
                header("Location: registerPlayer.php");
            }
            else{
                $person_id = $_SESSION['person_id'];
                $round_id = $_SESSION['round_id'];
                $hole_id = $_SESSION['hole_id'];

                //first check to see if record exist
                $select = $conn->prepare("SELECT * FROM scores WHERE person_id=? AND round_id AND hole_id");
                $select->bind_param("iii",$person_id, $round_id, $hole_id);
                $select->execute();
                $result = $select->get_result();

                if(mysqli_num_rows($result) == 0) {
                    $_SESSION['messages'] = 'Those ids do not exist in the database.';
                    header("Location: registerPlayer.php");
                }
                else{          
                    $query = $conn->prepare("DELETE FROM scores WHERE person_id=? AND round_id AND hole_id");
                    $select->bind_param("iii",$person_id, $round_id, $hole_id);
                    $query->execute();
                    $result = $query->get_result();
                    
                    if ($query){
                        //Success                        
                        header("Location: registerPlayer.php");
                    }
                    else{
                        $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                        error_reporting(E_ALL);
                        header("Location: registerPlayer.php");
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
                //view males
                $select = $conn->prepare("SELECT * FROM scores WHERE net_score<=?");
                $select->bind_param("i",$_SESSION['filterOption1']);
                $select->execute();
                $result = $select->get_result();                 
            }
            else if($_SESSION['filterOption2'] != null){
                //view females
                $select = $conn->prepare("SELECT * FROM scores WHERE birdie=?");
                $select->bind_param("i",$_SESSION['filterOption2']);
                $select->execute();
                $result = $select->get_result();  
                
            }
            else if($_SESSION['filterOption3'] != null){
                //view females
                $select = $conn->prepare("SELECT * FROM scores WHERE eagle=?");
                $select->bind_param("i",$_SESSION['filterOption3']);
                $select->execute();
                $result = $select->get_result();  
                
            }
            else if($_SESSION['filterOption4'] != null){
                //view females
                $select = $conn->prepare("SELECT * FROM scores WHERE bogey=?");
                $select->bind_param("i",$_SESSION['filterOption4']);
                $select->execute();
                $result = $select->get_result();  
                
            }
            else if($_SESSION['filterOption5'] != null){
                //view females
                $select = $conn->prepare("SELECT * FROM scores WHERE double_bogey=?");
                $select->bind_param("i",$_SESSION['filterOption5']);
                $select->execute();
                $result = $select->get_result();  
                
            }
            else{ //reset table
                $select = $conn->prepare("SELECT * FROM scores ");
                $select->execute();
                $result = $select->get_result();    
            }
            if (mysqli_num_rows($result)==0){
                $tableHeaders = "
                        <table class='Table'>
                          <thead rowspan='1'>
                            <th>person_id</th>
                            <th>round_id</th>
                            <th>hole_id</th>
                            <th>stroke_count</th>
                            <th>net_score</th>
                            <th>birdie</th>
                            <th>eagle</th>
                            <th>bogey</th>
                            <th>double_bogey</th>
                          </thead>
                        </table>
                ";
                $_SESSION['table'] = $tableHeaders;
                header("Location: registerPlayer.php");
            }
            else{    //now to rebuild
                $tableHeaders = "
                            <table class='Table'>
                                <thead rowspan='1'>
                                    <th>person_id</th>
                                    <th>round_id</th>
                                    <th>hole_id</th>
                                    <th>stroke_count</th>
                                    <th>net_score</th>
                                    <th>birdie</th>
                                    <th>eagle</th>
                                    <th>bogey</th>
                                    <th>double_bogey</th>
                                </thead>
                            </table>
                ";
                //first get first row then build from second row
                $row = mysqli_fetch_assoc($result);
                $tableRows .= "
                            <tr class='TableRow' rowspan='1'>
                                <td>".$row['person_id']."</td>
                                <td>".$row['round_id']."</td>
                                <td>".$row['hole_id']."</td>
                                <td>".$row['stroke_count']."</td>
                                <td>".$row['net_score']."</td>
                                <td>".$row['birdie']."</td>
                                <td>".$row['eagle']."</td>
                                <td>".$row['bogey']."</td>
                                <td>".$row['double_bogey']."</td>
                            </tr>
                ";
                //run through records
                while($row = mysqli_fetch_assoc($result)){
                    $tableRows .= "
                            <tr class='TableRow' rowspan='1'>
                                <td>".$row['person_id']."</td>
                                <td>".$row['round_id']."</td>
                                <td>".$row['hole_id']."</td>
                                <td>".$row['stroke_count']."</td>
                                <td>".$row['net_score']."</td>
                                <td>".$row['birdie']."</td>
                                <td>".$row['eagle']."</td>
                                <td>".$row['bogey']."</td>
                                <td>".$row['double_bogey']."</td>
                            </tr>
                    ";
                }
                $_SESSION['table'] = $tableHeaders . $tableRows . "</table>";
                if ($query){
                    //Success
                    header("Location: registerPlayer.php");
                }
                else{
                    $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                    error_reporting(E_ALL);
                    header("Location: registerPlayer.php");
                    // echo "Error connecting to database: " . $conn->error;
                }
                $conn->close();
            }

        }
        else if(isset($_POST['option1']) || isset($_POST['option2'])){
            //update a player's data
            if (isset($_POST['option1'])) {
                $_SESSION['option1'] = $_POST['option1'];
            }
            else{
                $_SESSION['option1'] = null;
            }
            if (isset($_POST['option2'])) {
                $_SESSION['option2'] = $_POST['option2'];
            }
            else{
                $_SESSION['option2'] = null;
            }
            $select=null;
            $result=null;
            $person_id = $_POST['person_id'];
            $round_id = $_POST['round_id'];
            $hole_id = $_POST['hole_id'];
            if($_SESSION['option1'] != null){
                //view males
                $select = $conn->prepare("SELECT * FROM scores WHERE person_id=? AND round_id=? AND hole_id=?");
                $select->bind_param("iii",$person_id, $round_id, $hole_id);
                $select->execute();
                $result = $select->get_result();
                if(mysqli_num_rows($result) == 0) {
                    $_SESSION['messages'] = 'That id does not exist in the database.';
                    header("Location: registerPlayer.php");
                }
                else{          //****UPDATE TABLE**//
                    $query = $conn->prepare("UPDATE scores SET stroke_count=? WHERE person_id=? AND round_id=? AND hole_id=?");
                    $query->bind_param("iiii",$_SESSION['option1'], $person_id, $round_id, $hole_id);
                    $query->execute();
                    $result = $query->get_result();
                    
                    if ($query){
                        //Success
                        header("Location: registerPlayer.php");
                    }
                    else{
                        $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                        error_reporting(E_ALL);
                        header("Location: registerPlayer.php");
                        // echo "Error connecting to database: " . $conn->error;
                    }  
                }                     
            }
            else if($_SESSION['option2'] != null){
                //view males
                $select = $conn->prepare("SELECT * FROM scores WHERE person_id=? AND round_id=? AND hole_id=?");
                $select->bind_param("iii",$person_id, $round_id, $hole_id);
                $select->execute();
                $result = $select->get_result();
                if(mysqli_num_rows($result) == 0) {
                    $_SESSION['messages'] = 'That id does not exist in the database.';
                    header("Location: registerPlayer.php");
                }
                else{          //****UPDATE TABLE**//
                    $query = $conn->prepare("UPDATE scores SET net_score=? WHERE person_id=? AND round_id=? AND hole_id=?");
                    $query->bind_param("iiii",$_SESSION['option2'], $person_id, $round_id, $hole_id);
                    $query->execute();
                    $result = $query->get_result();
                    
                    if ($query){
                        //Success
                        header("Location: registerPlayer.php");
                    }
                    else{
                        $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                        error_reporting(E_ALL);
                        header("Location: registerPlayer.php");
                        // echo "Error connecting to database: " . $conn->error;
                    }  
                }                     
            }
            
            //build first row then continue from second row
            //now to rebuild
            $tableHeaders = "
                            <table class='Table'>
                                <thead rowspan='1'>
                                    <th>person_id</th>
                                    <th>round_id</th>
                                    <th>hole_id</th>
                                    <th>stroke_count</th>
                                    <th>net_score</th>
                                    <th>birdie</th>
                                    <th>eagle</th>
                                    <th>bogey</th>
                                    <th>double_bogey</th>
                                </thead>
                            </table>
                ";
                //first get first row then build from second row
                $row = mysqli_fetch_assoc($result);
                $tableRows .= "
                            <tr class='TableRow' rowspan='1'>
                                <td>".$row['person_id']."</td>
                                <td>".$row['round_id']."</td>
                                <td>".$row['hole_id']."</td>
                                <td>".$row['stroke_count']."</td>
                                <td>".$row['net_score']."</td>
                                <td>".$row['birdie']."</td>
                                <td>".$row['eagle']."</td>
                                <td>".$row['bogey']."</td>
                                <td>".$row['double_bogey']."</td>
                            </tr>
                ";
                //run through records
                while($row = mysqli_fetch_assoc($result)){
                    $tableRows .= "
                            <tr class='TableRow' rowspan='1'>
                                <td>".$row['person_id']."</td>
                                <td>".$row['round_id']."</td>
                                <td>".$row['hole_id']."</td>
                                <td>".$row['stroke_count']."</td>
                                <td>".$row['net_score']."</td>
                                <td>".$row['birdie']."</td>
                                <td>".$row['eagle']."</td>
                                <td>".$row['bogey']."</td>
                                <td>".$row['double_bogey']."</td>
                            </tr>
                    ";
                }
            $_SESSION['table'] = $tableHeaders . $tableRows . "</table>";
            if ($query){
                //Success
                header("Location: registerPlayer.php");
            }
            else{
                $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                error_reporting(E_ALL);
                header("Location: registerPlayer.php");
                // echo "Error connecting to database: " . $conn->error;
            }
            $conn->close();
        }
    }

?>