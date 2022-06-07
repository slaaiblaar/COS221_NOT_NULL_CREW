<?php
    require_once("setDBEnvVar.php");
    include_once("configDB.php");
    session_start();

    if ($_SERVER['REQUEST_METHOD'] == 'POST'){
        if (isset($_POST['object_id']) && isset($_POST['source_id']) && isset($_POST['revision_id']) && isset($_POST['publisher_id']) && isset($_POST['credit_id']) && isset($_POST['creation_location_id']) && isset($_POST['mediaType']) && isset($_POST['dateTime'])){
            //this is to validate adding a new media
            $_SESSION['object_id'] = $_POST['object_id'];
            $_SESSION['source_id'] = $_POST['source_id'];
            $_SESSION['revision_id'] = $_POST['revision_id'];
            $_SESSION['publisher_id'] = $_POST['publisher_id'];
            $_SESSION['credit_id']=$_POST['credit_id'];
            $_SESSION['creation_location_id']=$_POST['creation_location_id'];
            $_SESSION['mediaType']=$_POST['mediaType'];
            $_SESSION['dateTime']=$_POST['dateTime'];
            
            if(!preg_match("/^\d+$/",$_SESSION['object_id'])){
                $_SESSION['messages'] = "Invalid object_id. Object_id must be a digit.";
                header("Location: manageMedia.php");
            }
            else if(!preg_match("/^\d+$/",$_SESSION['source_id'])){
                $_SESSION['messages'] = "Invalid source_id. Source_id must be a digit.";
                header("Location: manageMedia.php");
            }
            else if(!preg_match("/^\d+$/",$_SESSION['revision_id'])){
                $_SESSION['messages'] = "Invalid revision_id. Revision_id must be a digit.";
                header("Location: manageMedia.php");
            }
            else if(!preg_match("/^\d+$/",$_SESSION['publisher_id'])){
                $_SESSION['messages'] = "Invalid publisher_id. publisher_id must be a digit.";
                header("Location: manageMedia.php");
            }
            else if(!preg_match("/^\d+$/",$_SESSION['credit_id'])){
                $_SESSION['messages'] = "Invalid credit_id. credit_id must be a digit.";
                header("Location: manageMedia.php");
            }
            else if(!preg_match("/^\d+$/",$_SESSION['creation_location_id'])){
                $_SESSION['messages'] = "Invalid creation_location_id. creation_location_id must be a digit.";
                header("Location: manageMedia.php");
            }
            else if($_SESSION['mediaType']==""){
                $_SESSION['messages'] = "Invalid media type. Please choose a media type (photo / video).";
                header("Location: manageMedia.php");
            }
            else if($_SESSION['dateTime']){
                $_SESSION['messages'] = "Invalid date time. Date time must be a digit.";
                header("Location: manageMedia.php");
            }
            else{
                $object_id = $_POST['object_id'];
                $source_id = $_POST['source_id'];
                $revision_id = $_POST['revision_id'];
                $publisher_id = $_POST['publisher_id'];
                $credit_id=$_POST['credit_id'];
                $creation_location_id=$_POST['creation_location_id'];
                $mediaType=$_POST['mediaType'];
                $dateTime=$_POST['dateTime'];
                
                //insert user into database
                $db_dateTime = date("Y/m/d")." ".date("h:i");
                $query = "INSERT INTO media (object_id, source_id, revision_id, media_type, publisher_id, date_time,
                credit_id,db_loading_date_time, creation_locaation_id) 
                VALUES ('$object_id', '$source_id', '$revision_id', '$mediaType', '$dateTime', '$credit_id', '$db_dateTime', '$creation_location_id')";
                
                if ($conn->query($query)){
                    //Success
                    header("Location: manageMedia.php");
                }
                else{
                    $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                    error_reporting(E_ALL);
                    header("Location: manageMedia.php");
                    // echo "Error connecting to database: " . $conn->error;
                }

                $conn->close();
            }
        }
        else if(isset($_POST['id'])){
            //this is to validate deleteing a player
            $_SESSION['id'] = $_POST["id"];
            if(!preg_match("/^\d+$/",$_SESSION['id'])){
                $_SESSION['messages'] = "Invalid ID , please ensure the ID contains digits.";
                header("Location: manageMedia.php");
            }
            else{
                $id = $_POST['id'];
                //first check to see if record exist
                $select = $conn->prepare("SELECT * FROM media WHERE id=?");
                $select->bind_param("i",$id);
                $select->execute();
                $result = $select->get_result();

                if(mysqli_num_rows($result) == 0) {
                    $_SESSION['messages'] = 'That id does not exist in the database.';
                    header("Location: manageMedia.php");
                }
                else{          
                    $query = $conn->prepare("DELETE FROM media WHERE id=?");
                    $query->bind_param("i", $id);
                    $query->execute();
                    $result = $query->get_result();
                    
                    if ($query){
                        //Success                        
                        header("Location: manageMedia.php");
                    }
                    else{
                        $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                        error_reporting(E_ALL);
                        header("Location: manageMedia.php");
                        // echo "Error connecting to database: " . $conn->error;
                    }
                    
                    $conn->close();
                }
            }
        }
        else if(isset($_POST['filterOption1']) || isset($_POST['filterOption2']) || isset($_POST['filterOption3'])){
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
            
            $select=null;
            $result = null;
            if($_SESSION['filterOption1'] != null){
                //view males
                $select = $conn->prepare("SELECT * FROM media WHERE media_type=?");
                $select->bind_param("s",$_SESSION['filterOption1']);
                $select->execute();
                $result = $select->get_result();                 
            }
            else if($_SESSION['filterOption2'] != null){
                //view females
                $select = $conn->prepare("SELECT * FROM media WHERE media_type=?");
                $select->bind_param("s",$_SESSION['filterOption2']);
                $select->execute();
                $result = $select->get_result();  
                
            }
            else{ //reset table
                $select = $conn->prepare("SELECT * FROM media ");
                $select->execute();
                $result = $select->get_result();    
            }
            if (mysqli_num_rows($result)==0){
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
                        </table>
                ";
                $_SESSION['table'] = $tableHeaders;
                header("Location: manageMedia.php");
            }
            else{    //now to rebuild
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
                //first get first row then build from second row
                $row = mysqli_fetch_assoc($result);
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
                //run through records
                while($row = mysqli_fetch_assoc($result)){
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
                $_SESSION['table'] = $tableHeaders . $tableRows . "</table>";
                if ($query){
                    //Success
                    header("Location: manageMedia.php");
                }
                else{
                    $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                    error_reporting(E_ALL);
                    header("Location: manageMedia.php");
                    // echo "Error connecting to database: " . $conn->error;
                }
                $conn->close();
            }

        }
        else if(isset($_POST['updatePopupInput']) && (isset($_POST['option1']))){
            //update a player's data
            $_SESSION['option1'] = $_POST['option1'];
            $select=null;
            $result=null;
            if($_SESSION['option1'] != null){
                //view males
                $select = $conn->prepare("SELECT * FROM media WHERE id=?");
                $select->bind_param("i",$id);
                $select->execute();
                $result = $select->get_result();
                if(mysqli_num_rows($result) == 0) {
                    $_SESSION['messages'] = 'That id does not exist in the database.';
                    header("Location: manageMedia.php");
                }
                else{          //****UPDATE TABLE**//
                    $query = $conn->prepare("UPDATE media SET media_type=? WHERE id=?");
                    $query->bind_param("si",$_SESSION['option1'], $id);
                    $query->execute();
                    $result = $query->get_result();
                    
                    if ($query){
                        //Success
                        header("Location: manageMedia.php");
                    }
                    else{
                        $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                        error_reporting(E_ALL);
                        header("Location: manageMedia.php");
                        // echo "Error connecting to database: " . $conn->error;
                    }  
                }                     
            }
            
            //build first row then continue from second row
            //now to rebuild
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
            //first get first row then build from second row
            $row = mysqli_fetch_assoc($result);
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
            //run through records
            while($row = mysqli_fetch_assoc($result)){
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
            $_SESSION['table'] = $tableHeaders . $tableRows . "</table>";
            if ($query){
                //Success
                header("Location: manageMedia.php");
            }
            else{
                $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                error_reporting(E_ALL);
                header("Location: manageMedia.php");
                // echo "Error connecting to database: " . $conn->error;
            }
            $conn->close();
        }
    }

?>