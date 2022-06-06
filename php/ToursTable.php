<?php

    // Populate Table -------------------------------------------------------------------------------------------------------------
    function NormalTable()
    {
        $servername = getenv("GOLF_DB_HOST");
        $username = getenv("GOLF_DB_USERNAME");
        $password = getenv("GOLF_DB_PASSWORD");
        $dbName = getenv("GOLF_DB_NAME");

        // Create connection
        $conn = new mysqli($servername, $username,$password,$dbName);
        
        // Check connection
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        $query = "SELECT * FROM tours";
        $result = $conn->query($query);

        echo '<table class = "Table" cellspacing="0" cellpadding="5">
                <thead class = "TableHeading">
                    <th>Tour ID</th>
                    <th>Tour Name</th>
                    <th>Affiliation</th>
                    <th>Select Record</th>
                </thead>';

        echo "<tbody>";      
        if ($result->num_rows > 0) {
            while($data = $result->fetch_assoc()) 
            {
                // Get Affiliation name :
                $Affiliation_query = $conn->prepare("SELECT affiliation_key FROM affiliations WHERE id = ?");
                $Affiliation_query->bind_param("i", $data['affiliation_id']);
                $Affiliation_query->execute();
                $Affiliation_result = $Affiliation_query->get_result();
                $Affiliation_name = $Affiliation_result->fetch_assoc();
                
                echo "<tr class='TableRow' id= Row" . $data['id'] .">".
                        "<td onclick='RecordChosen(".$data['id'].")'>" . $data['id'] . "</td>" .
                        "<td onclick='RecordChosen(".$data['id'].")'>" . $data['tour_name'] . "</td>" .
                        "<td onclick='RecordChosen(".$data['id'].")'>" .  $Affiliation_name["affiliation_key"] . "</td>" .
                        "<td onclick='RecordChosen(".$data['id'].")'>" . "<input type='radio' name='SelectRadio' value='". $data['id']."' id='RowSelect".$data['id']."' title='".$data['tour_name']."' />" . "</td>" .
                    "</tr>";
                }
        } 
        else 
        { 
            echo "<tr>".
                    "<td colspan='3'>No data found</td>".
                "</tr>";

        }
        echo "</tbody>";     
        echo "</table>";

        $conn->close();
    }

    // Filter Table -------------------------------------------------------------------------------------------------------------
    function FilterTable($TourName, $AffiliationName)
    {
        if(($TourName == "choose" || $TourName == "none") && ($AffiliationName == "choose" || $AffiliationName == "none"))
        {
            NormalTable();
        }
        else
        {
            $servername = getenv("GOLF_DB_HOST");
            $username = getenv("GOLF_DB_USERNAME");
            $password = getenv("GOLF_DB_PASSWORD");
            $dbName = getenv("GOLF_DB_NAME");

            // Create connection
            $conn = new mysqli($servername, $username,$password,$dbName);
            
            // Check connection
            if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
            }

            if($TourName != "choose" && $TourName != "none")
            {
                $NameQuery = $conn->prepare("SELECT a.*, t.* FROM tours AS t INNER JOIN affiliations AS a ON t.affiliation_id = a.id WHERE tour_name = ?");
                $NameQuery->bind_param("s", $TourName);
            }
            else
            {
                $NameQuery = $conn->prepare("SELECT t.* , a.* FROM tours AS t INNER JOIN affiliations AS a ON t.affiliation_id = a.id ");
            }

            $NameQuery->execute();
            $Nameresult = $NameQuery->get_result();


            echo '<table class = "Table" cellspacing="0" cellpadding="5">
                    <thead class = "TableHeading">
                        <th>Tour ID</th>
                        <th>Tour Name</th>
                        <th>Affiliation</th>
                    </thead>';

            echo "<tbody>";

            if ($Nameresult->num_rows > 0) {
                while($data = $Nameresult->fetch_assoc()) 
                {
                    $AffiliationName = str_replace("+"," ",$AffiliationName);
                    if($AffiliationName == "choose" || $AffiliationName == "none" || $data["affiliation_key"] == $AffiliationName)
                    {
                        echo  "<tr class='TableRow' id='Row".$data['id']."' onclick='RecordChosen(".$data['id'].")'>".
                                "<td>" . $data['id'] . "</td>" .
                                "<td>" . $data['tour_name'] . "</td>" .
                                "<td>" .  $data["affiliation_key"] . "</td>" .
                            "</tr>";
                    }
                }
            } 
            else 
            { 
                echo "<tr>".
                        "<td colspan='3'>No data found</td>".
                    "</tr>";

            }

            echo "</tbody>";     
            echo "</table>";

            $conn->close();
        }

    }

    // Populate DropDown -------------------------------------------------------------------------------------------------------------
    function PopulateDropDown()
    {
        $servername = getenv("GOLF_DB_HOST");
        $username = getenv("GOLF_DB_USERNAME");
        $password = getenv("GOLF_DB_PASSWORD");
        $dbName = getenv("GOLF_DB_NAME");

        // Create connection
        $conn = new mysqli($servername, $username,$password,$dbName);
        
        // Check connection
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        // Get Tour Names
        $queryTourNames = "SELECT DISTINCT tour_name FROM tours";
        $resultTourNames = $conn->query($queryTourNames);

        $TourNames = "";
        if ($resultTourNames->num_rows > 0) {
            while($data = $resultTourNames->fetch_assoc()) 
            {
                $TName = str_replace(" ","+",$data['tour_name']);
                $TourNames = $TourNames . "<option value= ". $TName . ">" . $data['tour_name'] ."</option>";
            }
        } 

        // Get Afiliation Names
        $queryAffNames = "SELECT DISTINCT affiliation_key FROM affiliations";
        $resultAffNames = $conn->query($queryAffNames);

        $AffiliationNames = "";
        if ($resultAffNames->num_rows > 0) {
            while($data = $resultAffNames->fetch_assoc()) 
            {
                $AName = str_replace(" ","+",$data["affiliation_key"]);
                $AffiliationNames = $AffiliationNames . "<option value= ". $AName . ">" . $data["affiliation_key"] ."</option>";
            }
        } 

       

        echo "<select name='TourNames' id='TourNames'>".
                "<option value= 'choose'>Choose a Tour Name</option>";

        echo $TourNames;

        echo "<option value= 'none'>No Filter</option>";

        echo "</select>";

        echo "<select name='AffiliationNames' id='AffiliationNames'>".
                "<option value= 'choose'>Choose a Affiliation Name</option>";
        
        echo $AffiliationNames;

        echo "<option value= 'none'>No Filter</option>";

        echo "</select>";

        $conn->close();
    }


    // Populate ADD Affiliation Name DropDown -------------------------------------------------------------------------------------------
    function PopulateAddAffilNDropDown($Type)
    {
        $servername = getenv("GOLF_DB_HOST");
        $username = getenv("GOLF_DB_USERNAME");
        $password = getenv("GOLF_DB_PASSWORD");
        $dbName = getenv("GOLF_DB_NAME");

        // Create connection
        $conn = new mysqli($servername, $username,$password,$dbName);
        
        // Check connection
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        // Get Afiliation Names
        $queryAffNames = "SELECT DISTINCT affiliation_key FROM affiliations";
        $resultAffNames = $conn->query($queryAffNames);

        $AffiliationNames = "";
        if ($resultAffNames->num_rows > 0) {
            while($data = $resultAffNames->fetch_assoc()) 
            {
                $AName = str_replace(" ","+",$data["affiliation_key"]);
                $AffiliationNames = $AffiliationNames . "<option value= ". $AName . ">" . $data["affiliation_key"] ."</option>";
            }
        } 

        if($Type == "Insert")
        {
            echo "<select name='AffiliationNamesCreate' id='AffiliationNamesCreate'>";
        }
        else
        {
            echo "<select name='AffiliationNamesCreate' id='AffiliationNamesUpdate'>";
        }
        
        echo $AffiliationNames;

        echo "</select>";

        $conn->close();
    }

    function InsertRecord($TourName, $AffilName)
    {

        $servername = getenv("GOLF_DB_HOST");
        $username = getenv("GOLF_DB_USERNAME");
        $password = getenv("GOLF_DB_PASSWORD");
        $dbName = getenv("GOLF_DB_NAME");

        // Create connection
        $conn = new mysqli($servername, $username,$password,$dbName);
        
        // Check connection
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        $NameQuery = $conn->prepare("SELECT tour_name FROM tours WHERE tour_name = ?");
        $NameQuery->bind_param("s", $TourName);
        $NameQuery->execute();
        $Nameresult = $NameQuery->get_result();

        $message = "";
        if($Nameresult->num_rows == 0)
        {
            // Name is unique = insert name

            $AffilName = str_replace("+"," ",$AffilName);
            $Affiliation_query = $conn->prepare("SELECT id FROM affiliations WHERE affiliation_key = ?");
            $Affiliation_query->bind_param("s", $AffilName);
            $Affiliation_query->execute();
            $Affiliation_result = $Affiliation_query->get_result();
            $Affiliation_id = $Affiliation_result->fetch_assoc();

            $InsertTour_query = $conn->prepare("INSERT INTO tours (tour_name, affiliation_id) VALUES(?, ?)");
            $InsertTour_query->bind_param("si", $TourName, $Affiliation_id["id"]);
            $Executed = $InsertTour_query->execute();

            if ($Executed == true)
            {
                $output["message"]= "Successfully created tour ".$TourName ;
            }
            else
            {
                $output["message"]= "Could not create the tour ".$TourName ;
            }


        }
        else
        {
            // Name is not unique = enter new name
            $output["message"]= "Could not Create the tour, a tour already exists with the name ".$TourName ;
        }

        $conn->close();

        return json_encode($output);

    }

    function UpdateRecord($TourId, $oldAffiliation, $oldTourName, $newAffiliation, $newTourName)
    {
        $servername = getenv("GOLF_DB_HOST");
        $username = getenv("GOLF_DB_USERNAME");
        $password = getenv("GOLF_DB_PASSWORD");
        $dbName = getenv("GOLF_DB_NAME");
    
        // Create connection
        $conn = new mysqli($servername, $username,$password,$dbName);
            
        // Check connection
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        if($oldTourName != $newTourName)
        {
            $NameQuery = $conn->prepare("SELECT * FROM tours WHERE tour_name = ?");
            $NameQuery->bind_param("s", $newTourName);
            $NameQuery->execute();
            $Nameresult = $NameQuery->get_result();

            if($Nameresult->num_rows == 0)
            {
                // Name is unique = update name
                $Affiliation_query = $conn->prepare("SELECT id FROM affiliations WHERE affiliation_key = ?");
                $Affiliation_query->bind_param("s", $newAffiliation);
                $Affiliation_query->execute();
                $Affiliation_result = $Affiliation_query->get_result();
                $Affiliation_id = $Affiliation_result->fetch_assoc();

                $UpdateQuery = $conn->prepare("UPDATE tours SET tour_name = ?, affiliation_id = ?  WHERE id=?");
                $UpdateQuery->bind_param("sii", $newTourName, $Affiliation_id['id'] ,$TourId);
                $updated = $UpdateQuery->execute();

                if($updated == true)
                {
                    $output["message"] = "Successfully update";
                }
                else
                {
                    $output["message"] = "Could not update";
                }

            }
            else
            {
                $output["message"]= "Could not update the Tour, a Tour already exists with the name ".$newTourName ;
            }
        }
        else
        {
            $Affiliation_query = $conn->prepare("SELECT id FROM affiliations WHERE affiliation_key = ?");
            $Affiliation_query->bind_param("s", $newAffiliation);
            $Affiliation_query->execute();
            $Affiliation_result = $Affiliation_query->get_result();
            $Affiliation_id = $Affiliation_result->fetch_assoc();

            $UpdateQuery = $conn->prepare("UPDATE tours SET affiliation_id = ?  WHERE id=?");
            $UpdateQuery->bind_param("ii", $Affiliation_id['id'] ,$TourId);
            $updated = $UpdateQuery->execute();

            if($updated == true)
            {
                $output["message"] = "Successfully updated";
            }
            else
            {
                $output["message"] = "Could not update";
            }
        }

        $conn->close();


        return json_encode($output);
       
    }

    function DeleteRecord($TourId)
    {
        $servername = getenv("GOLF_DB_HOST");
        $username = getenv("GOLF_DB_USERNAME");
        $password = getenv("GOLF_DB_PASSWORD");
        $dbName = getenv("GOLF_DB_NAME");
    
        // Create connection
        $conn = new mysqli($servername, $username,$password,$dbName);
            
        // Check connection
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        $EventQuery = $conn->prepare("SELECT * FROM events WHERE tour_id = ?");
        $EventQuery->bind_param("s", $TourId);
        $EventQuery->execute();
        $Eventresult = $EventQuery->get_result();

        if($Eventresult->num_rows == 0)
        {
            $DeleteQuery = $conn->prepare("DELETE FROM tours WHERE id = ?");
            $DeleteQuery->bind_param("i", $TourId);
            $Deleted = $DeleteQuery->execute();

            if($Deleted == true)
            {
                $output["message"] = "Successfully deleted";
            }
            else
            {
                $output["message"] = "Could not delete";
            }
        }
        else
        {
            $output["message"] = "Cannot delete tour\nThis tour is linked to a Tournament";
        }

        $conn->close();

        return json_encode($output);
    }

    //-------=--------------------------------------------------------------------------------------------------------------------------

    $input = json_decode(file_get_contents('php://input'), true);

    if($input != null)
    {
        $type = $input['type'];

        if($type == "update")
        {
            $TourId = $input['TourId'];
            $oldTourName = $input['oldTourName'];
            $oldAffiliation = $input['oldAffiliation'];
            $newTourName = $input['newTourName'];
            $newAffiliation = $input['newAffiliation'];

           echo UpdateRecord($TourId, $oldAffiliation, $oldTourName, $newAffiliation, $newTourName);
        }
        else if($type == "delete")
        {
            $TourId = $input['TourId'];
            echo DeleteRecord($TourId);
        }
        else if($type == "insert")
        {
            $TourName = $input['newTourN'];
            $AffilName = $input['newAffilN'];
            echo InsertRecord($TourName, $AffilName);
        }
    }
    

?>