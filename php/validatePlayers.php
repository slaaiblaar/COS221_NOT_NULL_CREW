<?php
    include_once("configDB.php");
    session_start();

    if ($_SERVER['REQUEST_METHOD'] == 'POST'){
        if (isset($_POST['dateOfBirth']) && isset($_POST['handicap']) && isset($_POST['age']) && isset($_POST['gender']) && isset($_POST['idNumber'])){
            //this is to validate adding a new player
            $_SESSION['dateOfBirth'] = $_POST['dateOfBirth'];
            $_SESSION['handicap'] = $_POST['handicap'];
            $_SESSION['age'] = $_POST['age'];
            $_SESSION['gender'] = $_POST['gender'];
            $_SESSION['idNumber'] = $_POST['idNumber'];
            if(!preg_match("/^(\d){4}\-(\d){2}\-(\d){2}$/",$_SESSION['dateOfBirth'])){
                $_SESSION['messages'] = "Invalid Date format. Format needs to be in MM/DD/YYYY.";
                $_SESSION['showAddMenu'] = "true";
                header("Location: managePlayers.php");
            }
            else if(!preg_match("/^\d{1,2}$/",$_SESSION['handicap'])){ //test valid range 0-54
                $_SESSION['messages'] = 'Invalid handicap value. The value must be a whole number between [0-54].';
                $_SESSION['showAddMenu'] = "true";
                header("Location: managePlayers.php");
            }
            else if($_SESSION['gender'] == ""){
                $_SESSION['messages'] = "You did not select a Gender. Please do so.";
                $_SESSION['showAddMenu'] = "true";
                header("Location: managePlayers.php");
            }
            else if(!preg_match("/^[0-9]{13}$/",$_SESSION['idNumber']) && !validateID_DoB()){
                $_SESSION['messages'] = "Invalid ID or Date of Birth. Ensure the the ID's first 6 digits reflect the Date of Birth.";
                $_SESSION['showAddMenu'] = "true";
                header("Location: managaePlayers.php");
            }
            else{
                $dateOfBirth = $_POST['dateOfBirth'];
                $handicap = $_POST['handicap'];
                $age = $_POST['age'];
                $gender = $_POST['gender'];
                $idNumber = $_POST['idNumber'];
                
                //insert user into database
                $query = "INSERT INTO persons (person_key, publisher_id, gender, birth_date, death_date, resting_location_id,
                birth_location_id,hometown_location_id, residence_location_id, death_location_id, age, handicap, affiliation_id) 
                VALUES ('$idNumber','1','$gender','$dateOfBirth','1','1','1','1','1','1','$age','$handicap','1')";
                
                if ($conn->query($query)){
                    //Success
                    $_SESSION['showRegPopupAdd'] = "true";
                    header("Location: managePlayers.php");
                }
                else{
                    $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                    error_reporting(E_ALL);
                    $_SESSION['showAddMenu'] = "true";
                    header("Location: managePlayers.php");
                    // echo "Error connecting to database: " . $conn->error;
                }

                $conn->close();
            }
        }
        else if(isset($_POST['id'])){
            //this is to validate deleteing a player
            $_SESSION['id'] = $_POST["id"];
            if(!preg_match("/^\d{1,11}$/",$_SESSION['id'])){
                $_SESSION['messages'] = "Invalid ID Number, please ensure the ID contains between 1 and 11 digits (only digits).";
                $_SESSION['showDeleteMenu'] = "true";
                header("Location: managePlayers.php");
            }
            else{
                $id = $_POST['id'];
                //first check to see if record exist
                $select = $conn->prepare("SELECT * FROM persons WHERE id=?");
                $select->bind_param("i",$id);
                $select->execute();
                $result = $select->get_result();

                if(mysqli_num_rows($result) == 0) {
                    $_SESSION['messages'] = 'That id does not exist in the database.';
                    $_SESSION['showDeleteMenu'] = "true";
                    header("Location: managePlayers.php");
                }
                else{          
                    $query = $conn->prepare("DELETE FROM persons WHERE id=?");
                    $query->bind_param("i", $id);
                    $query->execute();
                    $result = $query->get_result();
                    
                    if ($query){
                        //Success                        
                        $_SESSION['showRegPopupDelete'] = "true";
                        header("Location: managePlayers.php");
                    }
                    else{
                        $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                        error_reporting(E_ALL);
                        $_SESSION['showDeleteMenu'] = "true";
                        header("Location: managePlayers.php");
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
            if (isset($_POST['filterOption7'])) {
                $_SESSION['filterOption7'] = $_POST['filterOption7'];
            }
            else{
                $_SESSION['filterOption7'] = null;
            }
            $select=null;
            $result = null;
            if($_SESSION['filterOption1'] != null){
                //view males
                $select = $conn->prepare("SELECT * FROM persons WHERE gender=?");
                $select->bind_param("s",$_SESSION['filterOption1']);
                $select->execute();
                $result = $select->get_result();                 
            }
            else if($_SESSION['filterOption2'] != null){
                //view females
                $select = $conn->prepare("SELECT * FROM persons WHERE gender=?");
                $select->bind_param("s",$_SESSION['filterOption2']);
                $select->execute();
                $result = $select->get_result();  
                
            }
            else if($_SESSION['filterOption3'] != null){
                //view age >= 45
                $select = $conn->prepare("SELECT * FROM persons WHERE age>=?");
                $select->bind_param("i",$_SESSION['filterOption3']);
                $select->execute();
                $result = $select->get_result(); 

            }
            else if($_SESSION['filterOption4'] != null){
                //view age < 45
                $select = $conn->prepare("SELECT * FROM persons WHERE age<?");
                $select->bind_param("i",$_SESSION['filterOption4']);
                $select->execute();
                $result = $select->get_result();                
            }
            else if($_SESSION['filterOption5'] != null){
                //view handicap >= 30
                $select = $conn->prepare("SELECT * FROM persons WHERE handicap>=?");
                $select->bind_param("i",$_SESSION['filterOption5']);
                $select->execute();
                $result = $select->get_result();                
            }
            else{ //reset table
                $select = $conn->prepare("SELECT * FROM persons ");
                $select->execute();
                $result = $select->get_result();    
            }
            if (mysqli_num_rows($result)==0){
                $tableHeaders = "
                        <table class='Table'>
                        <thead rowspan='1'>
                            <th>id</th>
                            <th>person_key</th>
                            <th>publisher_id</th>
                            <th>gender</th>
                            <th>birth_date</th>
                            <th>death_date</th>
                            <th>final_resting_location</th>
                            <th>birth_location_id</th>
                            <th>hometown_location_id</th>
                            <th>residence_location</th>
                            <th>death_location_id</th>
                            <th>age</th>
                            <th>handicap</th>
                            <th>affiliation_id</th>
                            </thead>
                            <tr>
                                <td colspan='3'> No Data Found </td>
                            </tr>
                            </table>
                ";
                $_SESSION['table'] = $tableHeaders;
                header("Location: managePlayers.php");
            }
            else{    //now to rebuild
                $tableHeaders = "
                        <table class='Table'>
                            <thead rowspan='1'>
                            <th>id</th>
                            <th>person_key</th>
                            <th>publisher_id</th>
                            <th>gender</th>
                            <th>birth_date</th>
                            <th>death_date</th>
                            <th>final_resting_location</th>
                            <th>birth_location_id</th>
                            <th>hometown_location_id</th>
                            <th>residence_location</th>
                            <th>death_location_id</th>
                            <th>age</th>
                            <th>handicap</th>
                            <th>affiliation_id</th>
                            </thead>
                ";
                //first get first row then build from second row
                $row = mysqli_fetch_assoc($result);
                $tableRows = "
                            <tr class='TableRow' rowspan='1'>
                                <td>".$row['id']."</td>
                                <td>".$row['person_key']."</td>
                                <td>".$row['publisher_id']."</td>
                                <td>".$row['gender']."</td>
                                <td>".$row['birth_date']."</td>
                                <td>".$row['death_date']."</td>
                                <td>".$row['final_resting_location']."</td>
                                <td>".$row['birth_location_id']."</td>
                                <td>".$row['hometown_location_id']."</td>
                                <td>".$row['residence_location']."</td>
                                <td>".$row['death_location_id']."</td>
                                <td>".$row['age']."</td>
                                <td>".$row['handicap']."</td>
                                <td>".$row['affiliation_id']."</td>
                            </tr>
                    ";
                //run through records
                while($row = mysqli_fetch_assoc($result)){
                    $tableRows .= "
                            <tr class='TableRow' rowspan='1'>
                                <td>".$row['id']."</td>
                                <td>".$row['person_key']."</td>
                                <td>".$row['publisher_id']."</td>
                                <td>".$row['gender']."</td>
                                <td>".$row['birth_date']."</td>
                                <td>".$row['death_date']."</td>
                                <td>".$row['final_resting_location']."</td>
                                <td>".$row['birth_location_id']."</td>
                                <td>".$row['hometown_location_id']."</td>
                                <td>".$row['residence_location']."</td>
                                <td>".$row['death_location_id']."</td>
                                <td>".$row['age']."</td>
                                <td>".$row['handicap']."</td>
                                <td>".$row['affiliation_id']."</td>
                            </tr>
                    ";
                }
                $_SESSION['table'] = $tableHeaders . $tableRows . "</table>";
                if ($query){
                    //Success
                    $_SESSION['showRegPopupFilter'] = "true";
                    header("Location: managePlayers.php");
                }
                else{
                    $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                    error_reporting(E_ALL);
                    header("Location: managePlayers.php");
                    // echo "Error connecting to database: " . $conn->error;
                }
                $conn->close();
            }

        }
        else if(isset($_POST['option1']) || isset($_POST['option2']) || isset($_POST['option3']) || isset($_POST['option4']) || isset($_POST['option5']) || isset($_POST['option6'])){
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
            $select=null;
            $result=null;
            $id = $_POST['idUpdate'];
            if($_SESSION['option1'] != null){
                //view males
                $select = $conn->prepare("SELECT * FROM persons WHERE id=?");
                $select->bind_param("i",$id);
                $select->execute();
                $result = $select->get_result();
                if(mysqli_num_rows($result) == 0) {
                    $_SESSION['messages'] = 'That id does not exist in the database.';
                    $_SESSION['showUpdateMenu'] = "true";
                    header("Location: managePlayers.php");
                }
                else{          //****UPDATE TABLE**//
                    $query = $conn->prepare("UPDATE persons SET person_key=? WHERE id=?");
                    $query->bind_param("si",$_SESSION['option1'], $id);
                    $query->execute();
                    $result = $query->get_result();
                    
                    if ($query){
                        //Success
                        $_SESSION['showRegPopupAdd'] = "true";
                        header("Location: managePlayers.php");
                    }
                    else{
                        $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                        error_reporting(E_ALL);
                        $_SESSION['showRegPopupUpdate'] = "true";
                        header("Location: managePlayers.php");
                        // echo "Error connecting to database: " . $conn->error;
                    }  
                }                     
            }
            else if($_SESSION['option2'] != null){
                //view females
                $select = $conn->prepare("SELECT * FROM persons WHERE id=?");
                $select->bind_param("i",$id);
                $select->execute();
                $result = $select->get_result();    
                if(mysqli_num_rows($result) == 0) {
                    $_SESSION['messages'] = 'That id does not exist in the database.';
                    $_SESSION['showUpdateMenu'] = "true";
                    header("Location: managePlayers.php");
                }
                else{          
                    $query = $conn->prepare("UPDATE persons SET birth_date=? WHERE id=?");
                    $query->bind_param("si",$_SESSION['option2'],$id);
                    $query->execute();
                    $result = $query->get_result();
                    
                    if ($query){
                        //Success
                        $_SESSION['showRegPopupUpdate'] = "true";
                        header("Location: managePlayer.php");
                    }
                    else{
                        $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                        error_reporting(E_ALL);
                        $_SESSION['showUpdateMenu'] = "true";
                        header("Location: managePlayers.php");
                        // echo "Error connecting to database: " . $conn->error;
                    }   
                }                       
            }
            else if($_SESSION['option3'] != null){
                //view age >= 45
                $select = $conn->prepare("SELECT * FROM persons WHERE id=?");
                $select->bind_param("i",$id);
                $select->execute();
                $result = $select->get_result();  
                if(mysqli_num_rows($result) == 0) {
                    $_SESSION['messages'] = 'That id does not exist in the database.';
                    $_SESSION['showUpdateMenu'] = "true";
                    header("Location: managePlayers.php");
                }
                else{          
                    $query = $conn->prepare("UPDATE persons SET age=? WHERE id=?");
                    $query->bind_param("ii",$_SESSION['option3'],$id);
                    $query->execute();
                    $result = $query->get_result();
                    
                    if ($query){
                        //Success
                        $_SESSION['showRegPopupUpdate'] = "true";
                        header("Location: managePlayers.php");
                    }
                    else{
                        $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                        error_reporting(E_ALL);
                        $_SESSION['showUpdateMenu'] = "true";
                        header("Location: managePlayers.php");
                        // echo "Error connecting to database: " . $conn->error;
                    }   
                }                        
            }
            else if($_SESSION['option4'] != null){
                //view age < 45
                $select = $conn->prepare("SELECT * FROM persons WHERE id=?");
                $select->bind_param("i",$id);
                $select->execute();
                $result = $select->get_result();  
                if(mysqli_num_rows($result) == 0) {
                    $_SESSION['messages'] = 'That id does not exist in the database.';
                    $_SESSION['showUpdateMenu'] = "true";
                    header("Location: managePlayers.php");
                }
                else{          
                    $query = $conn->prepare("UPDATE persons SET handicap=? WHERE id=?");
                    $query->bind_param("ii",$_SESSION['option4'],$id);
                    $query->execute();
                    $result = $query->get_result();
                    
                    if ($query){
                        //Success                        
                        $_SESSION['showRegPopupUpdate'] = "true";
                        header("Location: managePlayers.php");
                    }
                    else{
                        $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                        error_reporting(E_ALL);
                        $_SESSION['showUpdateMenu'] = "true";
                        header("Location: managePlayers.php");
                        // echo "Error connecting to database: " . $conn->error;
                    }   
                }               
            }
            else if($_SESSION['option5'] != null){
                //view handicap >= 30
                $select = $conn->prepare("SELECT * FROM persons WHERE id=?");
                $select->bind_param("i",$id);
                $select->execute();
                $result = $select->get_result(); 
                if(mysqli_num_rows($result) == 0) {
                    $_SESSION['messages'] = 'That id does not exist in the database.';
                    $_SESSION['showUpdateMenu'] = "true";
                    header("Location: managePlayers.php");
                }
                else{          
                    $query = $conn->prepare("UPDATE persons SET death_date=? WHERE id=?");
                    $query->bind_param("si",$_SESSION['option5'],$id);
                    $query->execute();
                    $result = $query->get_result();
                    
                    if ($query){
                        //Success
                        $_SESSION['showRegPopupUpdate'] = "true";
                        header("Location: managePlayers.php");
                    }
                    else{
                        $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                        error_reporting(E_ALL);
                        $_SESSION['showUpdateMenu'] = "true";
                        header("Location: managePlayers.php");
                        // echo "Error connecting to database: " . $conn->error;
                    }   
                }                
            }
            else if($_SESSION['option6']!=null){ //set gender table
                $select = $conn->prepare("SELECT * FROM persons WHERE id=? ");
                $select->bind_param('i',$id);
                $select->execute();
                $result = $select->get_result(); 
                if(mysqli_num_rows($result) == 0) {
                    $_SESSION['messages'] = 'That id does not exist in the database.';
                    $_SESSION['showUpdateMenu'] = "true";
                    header("Location: managePlayers.php");
                }
                else{          
                    $query = $conn->prepare("UPDATE persons SET gender=? WHERE id=?");
                    $query->bind_param("ii",$_SESSION['option6'],$id);
                    $query->execute();
                    $result = $query->get_result();
                    
                    if ($query){
                        //Success
                        $_SESSION['showRegPopupUpdate'] = "true";
                        header("Location: managePlayers.php");
                    }
                    else{
                        $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                        error_reporting(E_ALL);
                        $_SESSION['showUpdateMenu'] = "true";
                        header("Location: managePlayers.php");
                        // echo "Error connecting to database: " . $conn->error;
                    }   
                }    
            }
            
            //build first row then continue from second row
            //now to rebuild
            $tableHeaders = "
                    <table class='Table'>
                     <thead rowspan'1'>
                        <th>id</th>
                        <th>person_key</th>
                        <th>publisher_id</th>
                        <th>gender</th>
                        <th>birth_date</th>
                        <th>death_date</th>
                        <th>final_resting_location</th>
                        <th>birth_location_id</th>
                        <th>hometown_location_id</th>
                        <th>residence_location</th>
                        <th>death_location_id</th>
                        <th>age</th>
                        <th>handicap</th>
                        <th>affiliation_id</th>
                        </thead>
            ";
            $row = mysqli_fetch_assoc($result);
            $tableRows = $tableHMTL . "
                        <tr class='TableRow' rowspan='1'>
                        <td>".$row['id']."</td>
                        <td>".$row['person_key']."</td>
                        <td>".$row['publisher_id']."</td>
                        <td>".$row['gender']."</td>
                        <td>".$row['birth_date']."</td>
                        <td>".$row['death_date']."</td>
                        <td>".$row['final_resting_location']."</td>
                        <td>".$row['birth_location_id']."</td>
                        <td>".$row['hometown_location_id']."</td>
                        <td>".$row['residence_location']."</td>
                        <td>".$row['death_location_id']."</td>
                        <td>".$row['age']."</td>
                        <td>".$row['handicap']."</td>
                        <td>".$row['affiliation_id']."</td>
                        </tr>
                ";
            //run through records
            while($row = mysqli_fetch_assoc($result)){
                $tableRows .= $tableHMTL . "
                        <tr class='TableRow' rowspan='1'>
                        <td>".$row['id']."</td>
                        <td>".$row['person_key']."</td>
                        <td>".$row['publisher_id']."</td>
                        <td>".$row['gender']."</td>
                        <td>".$row['birth_date']."</td>
                        <td>".$row['death_date']."</td>
                        <td>".$row['final_resting_location']."</td>
                        <td>".$row['birth_location_id']."</td>
                        <td>".$row['hometown_location_id']."</td>
                        <td>".$row['residence_location']."</td>
                        <td>".$row['death_location_id']."</td>
                        <td>".$row['age']."</td>
                        <td>".$row['handicap']."</td>
                        <td>".$row['affiliation_id']."</td>
                        </tr>
                ";
            }
            $_SESSION['table'] = $tableHeaders . $tableRows . "</table>";
            if ($query){
                //Success
                $_SESSION['showRegPopupUpdate'] = "true";
                header("Location: managePlayers.php");
            }
            else{
                $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                error_reporting(E_ALL);
                $_SESSION['showUpdateMenu'] = "true";
                header("Location: managePlayers.php");
                // echo "Error connecting to database: " . $conn->error;
            }
            $conn->close();
        }
    }
    function validateID_DoB($ID,$DoB){
        if (substr($ID, 0,2) != substr($DoB,8) || substr($ID, 2,4) != substr($DoB,0,2) || substr($ID, 4,6) != substr($DoB,3,5)){
            return FALSE;
        }
        return TRUE;
    }

?>