<?php
    include_once("configDB.php");
    session_start();

    if ($_SERVER['REQUEST_METHOD'] == 'POST'){
        if (!(isset($_POST['clubUsed']) && isset($_POST['distance']) && isset($_POST['landing']))){
            $_SESSION['clubUsed'] = $_POST['clubUsed'];
            $_SESSION['distance'] = $_POST['distance'];
            $_SESSION['landing'] = $_POST['landing'];
            
            if(!preg_match("/^[A-Z][a-z]+\s([a-z]+|[A-Z][a-z]+)$/",$_SESSION['clubUsed'])){
                $_SESSION['messages'] = "Invalid club name format. Format needs to start with a capital letter and only contain characters.";
                header("Location: viewTournaments.php");
            }
            else{
                $clubUsed = $_POST['clubUsed'];
                $distance = $_POST['distance'];
                $landing = $_POST['landing'];
                
                //insert user into database
            
                $query = "INSERT INTO strokes (round_id, hole_id, person_id, clubused, distance, landing) 
                VALUES (1,1,1,?,?,?)";
                $query->bind_param("sii", $clubUsed, $distance, $landing);
                $query->execute();
                $result = $query->get_result();
                
                if ($query){
                    //Success
                    //we don't want to be redirected to another page, we just want a popup to display
                    echo "
                        <script> 
                            document.getElementById("fullScreenPopupReg").style.visibility = "visible"; 
                            $("'#'fullScreenPopupReg").fadeIn("slow");
                            document.getElementById("fullScreenPopupAdd").style.visisbility = "hidden";
                            $("'#'fullScreenPopupAdd").fadeOut("slow");
                        </script>
                    ";
                }
                else{
                    $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                    error_reporting(E_ALL);
                    header("Location: scores.php");
                    // echo "Error connecting to database: " . $conn->error;
                }

                $conn->close();
            }
        }
        else if(isset($_POST['stroke_no'])){
            //this is to validate deleteing a player
            $_SESSION['stroke_no'] = $_POST["stroke_no"];
            if(!preg_match("/^\d+$/",$_SESSION['stroke_no'])){
                $_SESSION['messages'] = "Invalid ID , please ensure the stroke number contains digits.";
                header("Location: scores.php");
            }
            else{
                $strokeNo = $_POST['stroke_no'];
                //first check to see if record exist
                $select = $conn->prepare("SELECT * FROM strokes WHERE stroke_no=?");
                $select->bind_param("i",$strokeNo);
                $select->execute();
                $result = $select->get_result();

                if(mysqli_num_rows($result) == 0) {
                    $_SESSION['messages'] = 'That stroke number does not exist in the database.';
                    header("Location: scores.php");
                }
                else{          
                    $query = $conn->prepare("DELETE FROM strokes WHERE id=?");
                    $query->bind_param("i", $strokeNo);
                    $query->execute();
                    $result = $query->get_result();
                    
                    if ($query){
                        //Success                        
                        header("Location: scores.php");
                    }
                    else{
                        $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                        error_reporting(E_ALL);
                        header("Location: scores.php");
                        // echo "Error connecting to database: " . $conn->error;
                    }
                    
                    $conn->close();
                }
            }
        }
        else if(isset($_POST['filterOption1']) || isset($_POST['filterOption2']) || isset($_POST['filterOption3']) || isset($_POST['filterOption4'])){
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
                $_SESSION['filterOption5'] = null;
            }
            
            $select=null;
            $result = null;
            if($_SESSION['filterOption1'] != null){
                //view males
                $select = $conn->prepare("SELECT * FROM strokes WHERE distance <= ?");
                $select->bind_param("i",$_SESSION['filterOption1']);
                $select->execute();
                $result = $select->get_result();                 
            }
            else if($_SESSION['filterOption2'] != null){
                //view females
                $select = $conn->prepare("SELECT clubs_used, distance FROM strokes");
                // $select->bind_param("s",$_SESSION['filterOption2']);
                $select->execute();
                $result = $select->get_result();  
            }
            else if($_SESSION['filterOption3'] != null){
                //view females
                $select = $conn->prepare("SELECT * FROM strokes WHERE distance >= ?");
                $select->bind_param("s",$_SESSION['filterOption3']);
                $select->execute();
                $result = $select->get_result();  
            }
            else if($_SESSION['filterOption4'] != null){
                $select = $conn->prepare("SELECT distance, landing FROM strokes");
                // $select->bind_param("s",$_SESSION['filterOption4']);
                $select->execute();
                $result = $select->get_result();    
            }
            else{ //reset table
                $select = $conn->prepare("SELECT * FROM strokes");
                $select->execute();
                $result = $select->get_result();    
            }

        }
            if (mysqli_num_rows($result)==0){
                $tableHeaders = "
                        <table class='Table'>
                            <th>stroke_no</th>
                            <th>round_id</th>
                            <th>hole_id</th>
                            <th>person_id</th>
                            <th>club_used</th>
                            <th>distance</th>
                            <th>landing</th>
                        </table>
                ";
                $_SESSION['table'] = $tableHeaders;
                header("Location: scores.php");
            }
            else{    //now to rebuild
                $tableHeaders = "
                                <table class='Table'>
                                    <th>stroke_no</th>
                                    <th>round_id</th>
                                    <th>hole_id</th>
                                    <th>person_id</th>
                                    <th>club_used</th>
                                    <th>distance</th>
                                    <th>landing</th>
                                </table>
                ";
                //first get first row then build from second row
                $row = mysqli_fetch_assoc($result);
                $tableRows .= "
                            <tr class='TableRow'>
                                <td>".$row['stroke_no']."</td>
                                <td>".$row['round_id']."</td>
                                <td>".$row['hole_id']."</td>
                                <td>".$row['person_id']."</td>
                                <td>".$row['club_used']."</td>
                                <td>".$row['distance']."</td>
                                <td>".$row['landing']."</td>
                            </tr>
                ";
                //run through records
                while($row = mysqli_fetch_assoc($result)){
                    $tableRows .= "
                            <tr class='TableRow'>
                                <td>".$row['stroke_no']."</td>
                                <td>".$row['round_id']."</td>
                                <td>".$row['hole_id']."</td>
                                <td>".$row['person_id']."</td>
                                <td>".$row['club_used']."</td>
                                <td>".$row['distance']."</td>
                                <td>".$row['landing']."</td>
                            </tr>
                    ";
                }
                $_SESSION['table'] = $tableHeaders . $tableRows . "</table>";
                if ($query){
                    //Success
                    header("Location: scores.php");
                }
                else{
                    $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                    error_reporting(E_ALL);
                    header("Location: scores.php");
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
                $select = $conn->prepare("SELECT * FROM strokes WHERE stroke_no=?");
                $select->bind_param("i",$strokeNo);
                $select->execute();
                $result = $select->get_result();
                if(mysqli_num_rows($result) == 0) {
                    $_SESSION['messages'] = 'That stroke number does not exist in the database.';
                    header("Location: scores.php");
                }
                else{          //****UPDATE TABLE**//
                    $query = $conn->prepare("UPDATE strokes SET club_used=? WHERE stroke_no=?");
                    $query->bind_param("si",$_SESSION['option1'], $strokeNo);
                    $query->execute();
                    $result = $query->get_result();
                    
                    if ($query){
                        //Success
                        header("Location: scores.php");
                    }
                    else{
                        $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                        error_reporting(E_ALL);
                        header("Location: scores.php");
                        // echo "Error connecting to database: " . $conn->error;
                    }  
                }                     
            }
            
            //build first row then continue from second row
            //now to rebuild
            $tableHeaders = "
                            <table class='Table'>
                                <th>stroke_no</th>
                                <th>round_id</th>
                                <th>hole_id</th>
                                <th>person_id</th>
                                <th>club_used</th>
                                <th>distance</th>
                                <th>landing</th>
                            </table>
            ";
            //first get first row then build from second row
            $row = mysqli_fetch_assoc($result);
            $tableRows .= "
                            <tr class='TableRow'>
                                <td>".$row['stroke_no']."</td>
                                <td>".$row['round_id']."</td>
                                <td>".$row['hole_id']."</td>
                                <td>".$row['person_id']."</td>
                                <td>".$row['club_used']."</td>
                                <td>".$row['distance']."</td>
                                <td>".$row['landing']."</td>
                            </tr>
            ";
            //run through records
            while($row = mysqli_fetch_assoc($result)){
                $tableRows .= "
                            <tr class='TableRow'>
                                <td>".$row['stroke_no']."</td>
                                <td>".$row['round_id']."</td>
                                <td>".$row['hole_id']."</td>
                                <td>".$row['person_id']."</td>
                                <td>".$row['club_used']."</td>
                                <td>".$row['distance']."</td>
                                <td>".$row['landing']."</td>
                            </tr>
                ";
            }
            $_SESSION['table'] = $tableHeaders . $tableRows . "</table>";
            if ($query){
                //Success
                header("Location: scores.php");
            }
            else{
                $_SESSION['messages'] = 'Error connecting to database: '.$conn->error;
                error_reporting(E_ALL);
                header("Location: scores.php");
                // echo "Error connecting to database: " . $conn->error;
            }
            $conn->close();
        }
    }
    // function validateID_DoB($ID,$DoB){
    //     if (substr($ID, 0,2) != substr($DoB,8) || substr($ID, 2,4) != substr($DoB,0,2) || substr($ID, 4,6) != substr($DoB,3,5)){
    //         return FALSE;
    //     }
    //     return TRUE;
    // }
?>