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

        $query = "SELECT * FROM holes";
        $result = $conn->query($query);

        echo '<table class = "Table" cellspacing="0" cellpadding="5">
                <thead class = "TableHeading">
                    <th>Hole ID</th>
                    <th>Hole Number</th>
                    <th>Course</th>
                    <th>Par</th>
                    <th>Length</th>
                    <th>Select Record</th>
                </thead>';

        echo "<tbody>";      
        if ($result->num_rows > 0) {
            while($data = $result->fetch_assoc()) 
            {
                // Get Affiliation name :
                $Site_query = $conn->prepare("SELECT site_key FROM sites WHERE id = ?");
                $Site_query->bind_param("i", $data['site_id']);
                $Site_query->execute();
                $Site_result = $Site_query->get_result();
                $Site_name = $Site_result->fetch_assoc();
                
                echo "<tr class='TableRow' id= Row" . $data['id'] .">".
                        "<td onclick='RecordChosen(".$data['id'].")'>" . $data['id'] . "</td>" .
                        "<td onclick='RecordChosen(".$data['id'].")'>" . $data['hole_no'] . "</td>" .
                        "<td onclick='RecordChosen(".$data['id'].")'>" .  $Site_name["site_key"] . "</td>" .
                        "<td onclick='RecordChosen(".$data['id'].")'>" . $data['par'] . "</td>" .
                        "<td onclick='RecordChosen(".$data['id'].")'>" . $data['length'] . "</td>" .
                        "<td onclick='RecordChosen(".$data['id'].")'>" . "<input type='radio' name='SelectRadio' value='". $data['id']."' id='RowSelect".$data['id']."' title='".$data['hole_no']. $data['site_id']."' />" . "</td>" .
                    "</tr>";
                }
        } 
        else 
        { 
            echo "<tr>".
                    "<td colspan='5'>No data found</td>".
                "</tr>";

        }
        echo "</tbody>";     
        echo "</table>";

        $conn->close();
    }

    // Filter Table -------------------------------------------------------------------------------------------------------------
    function FilterTable($HoleNum, $SiteName, $ParNum)
    {
        if(($HoleNum == "choose" || $HoleNum == "none") && ($SiteName == "choose" || $SiteName == "none") &&
         ($ParNum == "choose" || $ParNum == "none") )
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

            $HoleNumQuery = " ";
            if ($HoleNum != "choose" && $HoleNum != "none")
            {
                $HoleNumQuery = " hole_no = " . $HoleNum;
            }
            
            $SiteNameQuery = " ";
            if ($SiteName != "choose" && $SiteName != "none")
            {
                $SiteName = str_replace("+"," ",$SiteName);

                $Site_query = $conn->prepare("SELECT id FROM sites WHERE site_key = ?");
                $Site_query->bind_param("i", $SiteName);
                $Site_query->execute();
                $Site_result = $Site_query->get_result();
                $Site_name = $Site_result->fetch_assoc();
                $SiteId = $Site_name['id'];

                $SiteNameQuery = " site_id = " . $SiteId;

                if($HoleNumQuery != " ")
                {
                    $SiteNameQuery = " AND" . $SiteNameQuery;
                }
            }

            $ParNumQuery = " ";
            if ($ParNum != "choose" && $ParNum != "none")
            {
                $ParNumQuery = " par = '" . $ParNum . "'";

                if($SiteNameQuery != " " || $HoleNumQuery != " ")
                {
                    $ParNumQuery = " AND" . $ParNumQuery;
                }
            }

            $SelectQuery = "SELECT * FROM holes WHERE" . $HoleNumQuery . $SiteNameQuery .  $ParNumQuery;
            $result = $conn->query($SelectQuery);

            echo '<table class = "Table" cellspacing="0" cellpadding="5">
                <thead class = "TableHeading">
                    <th>Hole ID</th>
                    <th>Hole Number</th>
                    <th>Course</th>
                    <th>Par</th>
                    <th>Length</th>
                    <th>Select Record</th>
                </thead>';

            echo "<tbody>";  

            if ($result->num_rows > 0) {
                while($data = $result->fetch_assoc()) 
                {
                    // Get Affiliation name :
                    $Site_query = $conn->prepare("SELECT site_key FROM sites WHERE id = ?");
                    $Site_query->bind_param("i", $data['site_id']);
                    $Site_query->execute();
                    $Site_result = $Site_query->get_result();
                    $Site_name = $Site_result->fetch_assoc();
                    
                    echo "<tr class='TableRow' id= Row" . $data['id'] .">".
                            "<td onclick='RecordChosen(".$data['id'].")'>" . $data['id'] . "</td>" .
                            "<td onclick='RecordChosen(".$data['id'].")'>" . $data['hole_no'] . "</td>" .
                            "<td onclick='RecordChosen(".$data['id'].")'>" .  $Site_name["site_key"] . "</td>" .
                            "<td onclick='RecordChosen(".$data['id'].")'>" . $data['par'] . "</td>" .
                            "<td onclick='RecordChosen(".$data['id'].")'>" . $data['length'] . "</td>" .
                            "<td onclick='RecordChosen(".$data['id'].")'>" . "<input type='radio' name='SelectRadio' value='". $data['id']."' id='RowSelect".$data['id']."' title='".$data['hole_no']. $data['site_id']."' />" . "</td>" .
                        "</tr>";
                    }
            } 
            else 
            { 
                echo "<tr>".
                        "<td colspan='5'>No data found</td>".
                    "</tr>";

            }
            echo "</tbody>";     
            echo "</table>";

            $conn->close();
        }

    }

    // Populate ADD Sites Name DropDown -------------------------------------------------------------------------------------------
    function PopulateAddSiteNDropDown($Type)
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
        $querySiteNames = "SELECT DISTINCT site_key FROM sites";
        $resultSiteNames = $conn->query($querySiteNames);

        $SiteNames = "";
        if ($resultSiteNames->num_rows > 0) {
            while($data = $resultSiteNames->fetch_assoc()) 
            {
                $SName = str_replace(" ","+",$data["site_key"]);
                $SiteNames = $SiteNames . "<option value= ". $SName . ">" . $data["site_key"] ."</option>";
            }
        } 

        if($Type == "Insert")
        {
            echo "<select name='SiteNamesCreate' id='SiteNamesCreate' class='HolesCreateInput'>";
        }
        else
        {
            echo "<select name='SiteNamesCreate' id='SiteNamesUpdate' class='HolesCreateInput'>";
        }
        
        echo $SiteNames;

        echo "</select>";

        $conn->close();
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

        // Get Site Names
        $querySiteNames = "SELECT DISTINCT site_key FROM sites";
        $resultSiteNames = $conn->query($querySiteNames);

        $SiteName = "";
        if ($resultSiteNames->num_rows > 0) {
            while($data = $resultSiteNames->fetch_assoc()) 
            {
                $SName = str_replace(" ","+",$data['site_key']);
                $SiteName = $SiteName . "<option value= ". $SName . ">" . $data['site_key'] ."</option>";
            }
        } 

        // Set up hole number
        $HoleNum = "";
        for($i = 1; $i <= 18 ; $i++)
        {
            $HoleNum = $HoleNum . "<option value= ".$i . ">" . $i ."</option>";
        }

        // Set up Par number
        $ParNum = "";
        for($i = 1; $i <= 5 ; $i++)
        {
            $ParNum = $ParNum . "<option value= ".$i . ">" . $i ."</option>";
        }

        // Hole Numbers:
        echo "<select name='HoleNumDrpDwn' id='HoleNumDrpDwn' class = 'FilterDropDown'>".
                "<option value= 'choose'>Choose a Hole number</option>";

        echo $HoleNum;

        echo "<option value= 'none'>No Filter</option>";

        echo "</select><br/>";

        // Site Names:
        echo "<select name='SiteNameDrpDwn' id='SiteNameDrpDwn' class = 'FilterDropDown'>".
                "<option value= 'choose'>Choose a Site name</option>";
        
        echo $SiteName;

        echo "<option value= 'none'>No Filter</option>";

        echo "</select><br/>";

        // Par Number:
        echo "<select name='ParNumDrpDwn' id='ParNumDrpDwn' class = 'FilterDropDown'>".
                "<option value= 'choose'>Choose a Par number</option>";

        echo $ParNum;

        echo "<option value= 'none'>No Filter</option>";

        echo "</select><br/>";


        $conn->close();
    }

    function InsertRecord($HoleNum, $HoleParCreate , $HoleLengthCreate, $Sites)
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

        // Check if Hole + site name is unique :
        $Site_query = $conn->prepare("SELECT id FROM sites WHERE site_key = ? ");
        $Site_query->bind_param("s", $Sites);
        $Site_query->execute();
        $Siteresult = $Site_query->get_result();
        $SiteID = $Siteresult->fetch_assoc()['id'];

        $Hole_query = $conn->prepare("SELECT * FROM holes WHERE hole_no = ? AND site_id = ? ");
        $Hole_query->bind_param("ii", $HoleNum, $SiteID);
        $Hole_query->execute();
        $Holeresult = $Hole_query->get_result();

        if($Holeresult->num_rows == 0)
        {
            //  Hole + site is unique : insert name

            $InsertOrg_query = $conn->prepare("INSERT INTO holes (hole_no, site_id, par, length) VALUES(?, ?, ?, ?)");
            $InsertOrg_query->bind_param("iiii", $HoleNum, $SiteID, $HoleParCreate, $HoleLengthCreate);
            $Executed = $InsertOrg_query->execute();

            if ($Executed == true)
            {
                $output["message"]= "Successfully created Hole ".$HoleNum . " at ". $Sites ;
            }
            else
            {
                $output["message"]= "Could not create Hole ".$HoleNum . " at ". $Sites ;
            }
        }
        else
        {
            $output["message"]= "Could not Create the Hole\nHole ".$HoleNum." already exists at ".$Sites ;
        }

        $conn->close();

        return json_encode($output);

    }

    function DeleteRecord($HoleID)
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

        // Check if Hole is in strokes:
        $StrokeQuery = $conn->prepare("SELECT * FROM strokes WHERE hole_id = ?");
        $StrokeQuery->bind_param("i", $HoleID);
        $StrokeQuery->execute();
        $Strokeresult = $StrokeQuery->get_result();

        if($Strokeresult->num_rows == 0)
        {
            // Check if Hole is in scores :
            $ScoresQuery = $conn->prepare("SELECT * FROM scores WHERE hole_id = ?");
            $ScoresQuery->bind_param("i", $HoleID);
            $ScoresQuery->execute();
            $Scoresresult = $ScoresQuery->get_result();

            if($Scoresresult->num_rows == 0)
            {
                
                $DeleteQuery = $conn->prepare("DELETE FROM holes WHERE id = ?");
                $DeleteQuery->bind_param("i", $HoleID);
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
                // Scores: cannot delete:
                $output["message"] = "Cannot delete this Hole\nA score has been entered for this Hole";
            }
        }
        else
        {
            // Strokes delete:
            $output["message"] = "Cannot delete this Hole\nA score has been entered for this Hole";
        }

        $conn->close();

        return json_encode($output);
    }

    function UpdateRecord($HoleID, $oldHoleNum, $oldSite, $newHoleNum, $newSite, $newHolePar, $newHoleLength)
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

        if($newHoleNum != $oldHoleNum || $oldSite != $newSite)
        {
            // Check if Hole + site name is unique :
            $Site_query = $conn->prepare("SELECT id FROM sites WHERE site_key = ? ");
            $Site_query->bind_param("s", $newSite);
            $Site_query->execute();
            $Siteresult = $Site_query->get_result();
            $SiteID = $Siteresult->fetch_assoc()['id'];

            $Hole_query = $conn->prepare("SELECT * FROM holes WHERE hole_no = ? AND site_id = ? ");
            $Hole_query->bind_param("ii", $newHoleNum, $SiteID);
            $Hole_query->execute();
            $Holeresult = $Hole_query->get_result();

            if($Holeresult->num_rows == 0)
            {
                //  Hole + site is unique : update name

                $UpdateQuery = $conn->prepare("UPDATE holes SET hole_no = ?, site_id = ?, par = ?, length = ? WHERE id=?");
                $UpdateQuery->bind_param("iiiii", $newHoleNum, $SiteID, $newHolePar, $newHoleLength, $HoleID);
                $updated = $UpdateQuery->execute();

                if ($updated == true)
                {
                    $output["message"]= "Successfully updated";
                }
                else
                {
                    $output["message"]= "Could not update";
                }
            }
            else
            {
                $output["message"]= "Could not Create the Hole\nHole ".$newHoleNum." already exists at ".$newSite ;
            }
        }    
        else
        {
            // Get Site ID
            $Site_query = $conn->prepare("SELECT id FROM sites WHERE site_key = ? ");
            $Site_query->bind_param("s", $newSite);
            $Site_query->execute();
            $Siteresult = $Site_query->get_result();
            $SiteID = $Siteresult->fetch_assoc()['id'];

            $UpdateQuery = $conn->prepare("UPDATE holes SET hole_no = ?, site_id = ?, par = ?, length = ? WHERE id=?");
            $UpdateQuery->bind_param("iiiii", $newHoleNum, $SiteID, $newHolePar, $newHoleLength, $HoleID);
            $updated = $UpdateQuery->execute();

            if ($updated == true)
            {
                 $output["message"]= "Successfully updated";
            }
            else
            {
                $output["message"]= "Could not update";
            }

        }

        $conn->close();


        return json_encode($output);
       
    }


    //----------------------------------------------------------------------------------------------------------------------------------

    $input = json_decode(file_get_contents('php://input'), true);

    if($input != null)
    {
        $type = $input['type'];

        if($type == "update")
        {
            $HoleID = $input['HoleID'];
            $oldHoleNum = $input['oldHoleNum'];
            $oldSite = $input['oldSite'];
            $newHoleNum = $input['newHoleNum'];
            $newSite = $input['newSite'];
            $newHolePar = $input['newHolePar'];
            $newHoleLength = $input['newHoleLength'];

           echo UpdateRecord($HoleID, $oldHoleNum, $oldSite, $newHoleNum, $newSite, $newHolePar, $newHoleLength);
        }
        else if($type == "delete")
        {
            $HoleID = $input['HoleID'];
            echo DeleteRecord($HoleID);
        }
        else if($type == "insert")
        {
            $HoleNum= $input['HoleNum'];
            $HoleParCreate=  $input['HoleParCreate'];
            $HoleLengthCreate =  $input['HoleLengthCreate'];
            $Sites =  $input['Sites'];
            
            echo InsertRecord($HoleNum, $HoleParCreate , $HoleLengthCreate, $Sites);
        }
    }

?>