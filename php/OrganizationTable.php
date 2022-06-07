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

        $query = "SELECT * FROM affiliations";
        $result = $conn->query($query);

        echo '<table class = "Table" cellspacing="0" cellpadding="5">
                <thead class = "TableHeading">
                    <th>Organization ID</th>
                    <th>Organization Name</th>
                    <th>Type</th>
                    <th>Publisher Name</th>
                    <th>Managing Organization</th>
                    <th>Select Record</th>
                </thead>';

        echo "<tbody>";      
        if ($result->num_rows > 0) {
            while($data = $result->fetch_assoc()) 
            {
                $Publisher_query = $conn->prepare("SELECT * FROM users WHERE id = ?");
                $Publisher_query->bind_param("i", $data['publisher_id']);
                $Publisher_query->execute();
                $Publisher_result = $Publisher_query->get_result();
                $Publisher = $Publisher_result->fetch_assoc();

                $Publisher_Name = $Publisher["first_name"]. " ";
                if($Publisher["init"] != null)
                {
                    $Publisher_Name = $Publisher_Name. $Publisher["init"]. " " ;
                }
                $Publisher_Name =  $Publisher_Name . $Publisher["last_name"] . " (". $Publisher["email"].")";

                $Manager_query = $conn->prepare("SELECT * FROM affiliations WHERE id = ?");
                $Manager_query->bind_param("i", $data['manager_id']);
                $Manager_query->execute();
                $Manager_result = $Manager_query->get_result();

                if($Manager_result->num_rows >0 )
                {
                    $Manager = $Manager_result->fetch_assoc();
                    $Manager_Name = $Manager['affiliation_key'] ;
                }
                else
                {
                    $Manager_Name = null;
                }

                echo "<tr class='TableRow' id= Row" . $data['id'] .">".
                        "<td onclick='RecordChosen(".$data['id'].")'>" . $data['id'] . "</td>" .
                        "<td onclick='RecordChosen(".$data['id'].")'>" . $data['affiliation_key'] . "</td>" .
                        "<td onclick='RecordChosen(".$data['id'].")'>" . $data['affiliation_type'] . "</td>" .
                        "<td onclick='RecordChosen(".$data['id'].")'>" .$Publisher_Name . "</td>" .
                        "<td onclick='RecordChosen(".$data['id'].")'>" . $Manager_Name . "</td>" .
                        "<td onclick='RecordChosen(".$data['id'].")'>" . "<input type='radio' name='SelectRadio' value='". $data['id']."' id='RowSelect".$data['id']."' title='".$data['affiliation_key']."' />" . "</td>" .
                    "</tr>";
                }
        } 
        else 
        { 
            echo "<tr>".
                    "<td colspan='6'>No data found</td>".
                "</tr>";

        }
        echo "</tbody>";     
        echo "</table>";

        $conn->close();
    }

    // Filter Table -------------------------------------------------------------------------------------------------------------
    function FilterTable($OrgName, $OrgType, $PublisherName, $Manager)
    {
        if(($OrgName == "choose" || $OrgName == "none") && ($OrgType == "choose" || $OrgType == "none") &&
         ($PublisherName == "choose" || $PublisherName == "none") && ($Manager == "choose" || $Manager == "none"))
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

            $PublisherQuery = " ";
            if ($PublisherName != "choose" && $PublisherName != "none")
            {
                $PublisherEmail = explode("(",$PublisherName)[1];
                $PublisherEmail = trim($PublisherEmail,")");

                // Get publisher ID:
                $Publisher_query = $conn->prepare("SELECT id FROM users WHERE email = ? ");
                $Publisher_query->bind_param("s", $PublisherEmail);
                $Publisher_query->execute();
                $Publisheresult = $Publisher_query->get_result();
                $PublisherID = $Publisheresult->fetch_assoc();

                $PublisherQuery = " publisher_id = " . $PublisherID['id'];
            }
            
            $ManagerQuery = " ";
            if ($Manager != "choose" && $Manager != "none")
            {
                if($Manager != "NoManager")
                {
                    $Manager = str_replace("+"," ",$Manager);

                    $Manager_query = $conn->prepare("SELECT id FROM affiliations WHERE affiliation_key = ? ");
                    $Manager_query->bind_param("s", $Manager);
                    $Manager_query->execute();
                    $Manageresult = $Manager_query->get_result();
                    $ManagerID = ($Manageresult->fetch_assoc())['id'];

                    $ManagerQuery = " manager_id = " . $ManagerID;

                    if($PublisherQuery != " ")
                    {
                        $ManagerQuery = " AND" . $ManagerQuery;
                    }
                }
                else
                {
                    $ManagerQuery = " manager_id IS NULL";
                }
            }

            $OrgNameQuery = " ";
            if ($OrgName != "choose" && $OrgName != "none")
            {
                $OrgName = str_replace("+"," ",$OrgName);

                $OrgNameQuery = " affiliation_key = '" . $OrgName . "'";

                if($PublisherQuery != " " || $ManagerQuery != " ")
                {
                    $OrgNameQuery = " AND" . $OrgNameQuery;
                }
            }

            $OrgTypeQuery = " ";
            if ($OrgType != "choose" && $OrgType != "none")
            {
                $OrgType = str_replace("+"," ",$OrgType);

                $OrgTypeQuery = " affiliation_type = '" . $OrgType . "'";

                if($PublisherQuery != " " || $ManagerQuery != " " || $OrgNameQuery != " ")
                {
                    $OrgTypeQuery = " AND" . $OrgTypeQuery;
                }
            }

            $SelectQuery = "SELECT * FROM affiliations WHERE" . $PublisherQuery . $ManagerQuery . $OrgNameQuery .  $OrgTypeQuery;
            $result = $conn->query($SelectQuery);

            echo '<table class = "Table" cellspacing="0" cellpadding="5">
                    <thead class = "TableHeading">
                        <th>Organization ID</th>
                        <th>Organization Name</th>
                        <th>Type</th>
                        <th>Publisher Name</th>
                        <th>Managing Organization</th>
                        <th>Select Record</th>
                    </thead>';

            echo "<tbody>";

            if ($result->num_rows > 0) {
                while($data = $result->fetch_assoc()) 
                {
                    $Publisher_query = $conn->prepare("SELECT * FROM users WHERE id = ?");
                    $Publisher_query->bind_param("i", $data['publisher_id']);
                    $Publisher_query->execute();
                    $Publisher_result = $Publisher_query->get_result();
                    $Publisher = $Publisher_result->fetch_assoc();
    
                    $Publisher_Name = $Publisher["first_name"]. " ";
                    if($Publisher["init"] != null)
                    {
                        $Publisher_Name = $Publisher_Name. $Publisher["init"]. " " ;
                    }
                    $Publisher_Name =  $Publisher_Name . $Publisher["last_name"] . " (". $Publisher["email"].")";
    
                    $Manager_query = $conn->prepare("SELECT * FROM affiliations WHERE id = ?");
                    $Manager_query->bind_param("i", $data['manager_id']);
                    $Manager_query->execute();
                    $Manager_result = $Manager_query->get_result();
    
                    if($Manager_result->num_rows >0 )
                    {
                        $Manager = $Manager_result->fetch_assoc();
                        $Manager_Name = $Manager['affiliation_key'] ;
                    }
                    else
                    {
                        $Manager_Name = null;
                    }
    
                    echo "<tr class='TableRow' id= Row" . $data['id'] .">".
                            "<td onclick='RecordChosen(".$data['id'].")'>" . $data['id'] . "</td>" .
                            "<td onclick='RecordChosen(".$data['id'].")'>" . $data['affiliation_key'] . "</td>" .
                            "<td onclick='RecordChosen(".$data['id'].")'>" . $data['affiliation_type'] . "</td>" .
                            "<td onclick='RecordChosen(".$data['id'].")'>" .$Publisher_Name . "</td>" .
                            "<td onclick='RecordChosen(".$data['id'].")'>" . $Manager_Name . "</td>" .
                            "<td onclick='RecordChosen(".$data['id'].")'>" . "<input type='radio' name='SelectRadio' value='". $data['id']."' id='RowSelect".$data['id']."' title='".$data['affiliation_key']."' />" . "</td>" .
                        "</tr>";
                    }
            } 
            else 
            { 
                echo "<tr>".
                        "<td colspan='6'>No data found ". $SelectQuery . "</td>".
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

        // Get Organization Names
        $queryOrgNames = "SELECT DISTINCT affiliation_key FROM affiliations";
        $resultOrgNames = $conn->query($queryOrgNames);

        $OrgNames = "";
        if ($resultOrgNames->num_rows > 0) {
            while($data = $resultOrgNames->fetch_assoc()) 
            {
                $OName = str_replace(" ","+",$data['affiliation_key']);
                $OrgNames = $OrgNames . "<option value= ". $OName . ">" . $data['affiliation_key'] ."</option>";
            }
        } 

        // Get Organization Type
        $queryOrgTypes = "SELECT DISTINCT affiliation_type FROM affiliations";
        $resultOrgTypes = $conn->query($queryOrgTypes);
 
        $OrgTypes = "";
        if ($resultOrgTypes->num_rows > 0) {
            while($data = $resultOrgTypes->fetch_assoc()) 
            {
                $OType = str_replace(" ","+",$data['affiliation_type']);
                $OrgTypes = $OrgTypes . "<option value= ". $OType . ">" . $data['affiliation_type'] ."</option>";
            }
        } 

        // Get Publisher Names
        $queryPublisherNames = "SELECT * FROM users";
        $resultPublisherNames = $conn->query($queryPublisherNames);

        $PublisherNames = "";
        if ($resultPublisherNames->num_rows > 0) {
            while($data = $resultPublisherNames->fetch_assoc()) 
            {
                $PName = $data["first_name"]. " ";
                if($data["init"] != null)
                {
                    $PName = $PName. $data["init"]. " " ;
                }
                $PName =  $PName . $data["last_name"]. "(". $data["email"].")";

                $PNameValue = str_replace(" ","+",$PName);
                $PublisherNames = $PublisherNames . "<option value= ". $PNameValue . ">" . $PName ."</option>";
            }
        } 

        // Get Manager Names
        $queryManagerNames = "SELECT DISTINCT affiliation_key FROM affiliations";
        $resultManagerNames = $conn->query($queryManagerNames);

        $ManagerNames = "";
        if ($resultManagerNames->num_rows > 0) {
            while($data = $resultManagerNames->fetch_assoc()) 
            {
                $MName = str_replace(" ","+",$data['affiliation_key']);
                $ManagerNames = $ManagerNames . "<option value= ". $MName . ">" . $data['affiliation_key'] ."</option>";
            }
        } 

        // Organization Names:
        echo "<select name='OrgNameDrpDwn' id='OrgNameDrpDwn' class = 'FilterDropDown'>".
                "<option value= 'choose'>Choose an Organization Name</option>";

        echo $OrgNames;

        echo "<option value= 'none'>No Filter</option>";

        echo "</select><br/>";

        // Organization Types:
        echo "<select name='OrgTypeDrpDwn' id='OrgTypeDrpDwn' class = 'FilterDropDown'>".
                "<option value= 'choose'>Choose an Organization Type</option>";
        
        echo $OrgTypes;

        echo "<option value= 'none'>No Filter</option>";

        echo "</select><br/>";

        // Publisher Names:
        echo "<select name='PublisherNameDrpDwn' id='PublisherNameDrpDwn' class = 'FilterDropDown'>".
                "<option value= 'choose'>Choose a Publisher Name</option>";

        echo $PublisherNames;

        echo "<option value= 'none'>No Filter</option>";

        echo "</select><br/>";

        // Manager Names:
        echo "<select name='ManagerDrpDwn' id='ManagerDrpDwn' class = 'FilterDropDown'>".
                "<option value= 'choose'>Choose a Manager Name</option>";

        echo $ManagerNames;

        echo "<option value= 'NoManager'>No Manager</option>";
        echo "<option value= 'none'>No Filter</option>";

        echo "</select><br/>";

        $conn->close();
    }


    // Populate ADD Affiliation Name DropDown -------------------------------------------------------------------------------------------
    function PopulateAddPublisherDropDown($Type)
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
        $queryPublishersNames = "SELECT * FROM users";
        $resultPublishers = $conn->query($queryPublishersNames);

        $PublisherNames = "";
        if ($resultPublishers->num_rows > 0) {
            while($data = $resultPublishers->fetch_assoc()) 
            {
                $PName = $data["first_name"]. " ";
                if($data["init"] != null)
                {
                    $PName = $PName. $data["init"]. " " ;
                }
                $PName =  $PName.$data["last_name"]."(". $data["email"].")";

                $PNameValue = str_replace(" ","+", $PName);
                $PublisherNames = $PublisherNames . "<option value= ". $PNameValue . ">" .  $PName ."</option>";
            }
        } 

        if($Type == "Insert")
        {
            echo "<select name='AffiliationNamesCreate' id='PublisherNamesCreate' class='DropDowns'>";
        }
        else
        {
            echo "<select name='AffiliationNamesCreate' id='PublisherNamesUpdate' class='DropDowns'>";
        }
        
        echo $PublisherNames;

        echo "</select>";

        $conn->close();
    }

    function PopulateAddManagerDropDown($Type)
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
        $queryManagers = "SELECT * FROM affiliations";
        $resultManagers = $conn->query($queryManagers);

        $ManagerNames = "";
        if ($resultManagers->num_rows > 0) {
            while($data = $resultManagers->fetch_assoc()) 
            {
                $MName = str_replace(" ","+",$data["affiliation_key"]);
                $ManagerNames = $ManagerNames . "<option value= ". $MName . ">" . $data["affiliation_key"] ."</option>";
            }
        } 

        if($Type == "Insert")
        {
            echo "<select name='ManagerNamesCreate' id='ManagerNamesCreate' class='DropDowns'>";
        }
        else
        {
            echo "<select name='ManagerNamesUpdate' id='ManagerNamesUpdate' class='DropDowns'>";
        }
        
        echo $ManagerNames;

        echo "<option value= 'none'>No Manager</option>";

        echo "</select>";

        $conn->close();
    }

    function InsertRecord($NewOrganizationN, $NewType , $PublisherEmail, $Manager)
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

        // Check if organization's name is unique :
        $Name_query = $conn->prepare("SELECT * FROM affiliations WHERE affiliation_key = ? ");
        $Name_query->bind_param("s", $NewOrganizationN);
        $Name_query->execute();
        $Nameresult = $Name_query->get_result();

        if($Nameresult->num_rows == 0)
        {
            // name is unique : insert name

            // Get publisher ID:
            $Publisher_query = $conn->prepare("SELECT id FROM users WHERE email = ? ");
            $Publisher_query->bind_param("s", $PublisherEmail);
            $Publisher_query->execute();
            $Publisheresult = $Publisher_query->get_result();
            $PublisherID = $Publisheresult->fetch_assoc();

            // Get Manager ID:
            if($Manager == "none")
            {
                $ManagerID = null;
            }
            else
            {
                $Manager_query = $conn->prepare("SELECT id FROM affiliations WHERE affiliation_key = ? ");
                $Manager_query->bind_param("s", $Manager);
                $Manager_query->execute();
                $Manageresult = $Manager_query->get_result();
                $ManagerID = ($Manageresult->fetch_assoc())['id'];
            }

            $InsertOrg_query = $conn->prepare("INSERT INTO affiliations (affiliation_key, affiliation_type, publisher_id, manager_id) VALUES(?, ?, ?, ?)");
            $InsertOrg_query->bind_param("ssii", $NewOrganizationN, $NewType, $PublisherID['id'], $ManagerID);
            $Executed = $InsertOrg_query->execute();

            if ($Executed == true)
            {
                $output["message"]= "Successfully created Organization ".$NewOrganizationN ;
            }
            else
            {
                $output["message"]= "Could not create the Organization ".$NewOrganizationN ;
            }
        }
        else
        {
            $output["message"]= "Could not Create the Organization, an Organization already exists with the name ".$NewOrganizationN ;
        }

        $conn->close();

        return json_encode($output);

    }

    function UpdateRecord($OrgId, $oldOrgName, $newOrgName, $newOrgType, $newPublisherEmail, $newManager)
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

        if($oldOrgName != $newOrgName)
        {
            $NameQuery = $conn->prepare("SELECT * FROM affiliations WHERE affiliation_key = ?");
            $NameQuery->bind_param("s", $newOrgName);
            $NameQuery->execute();
            $Nameresult = $NameQuery->get_result();

            if($Nameresult->num_rows == 0)
            {
                // Name is unique = update name

                // Get publisher ID:
                $Publisher_query = $conn->prepare("SELECT id FROM users WHERE email = ? ");
                $Publisher_query->bind_param("s", $newPublisherEmail);
                $Publisher_query->execute();
                $Publisheresult = $Publisher_query->get_result();
                $PublisherID = $Publisheresult->fetch_assoc();

                // Get Manager ID:
                if($Manager == "none")
                {
                    $ManagerID = null;
                }
                else
                {
                    $Manager_query = $conn->prepare("SELECT id FROM affiliations WHERE affiliation_key = ? ");
                    $Manager_query->bind_param("s", $newManager);
                    $Manager_query->execute();
                    $Manageresult = $Manager_query->get_result();
                    $ManagerID = ($Manageresult->fetch_assoc())['id'];
                }

                $UpdateQuery = $conn->prepare("UPDATE affiliations SET affiliation_key = ?, affiliation_type = ?, publisher_id = ?, manager_id = ? WHERE id=?");
                $UpdateQuery->bind_param("ssiii", $newOrgName, $newOrgType, $PublisherID['id'], $ManagerID, $OrgId);
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
            else
            {
                $output["message"]= "Could not Update the Organization, an Organization already exists with the name ".$newOrgName ;
            }
        }
        else
        {
            // Get publisher ID:
            $Publisher_query = $conn->prepare("SELECT id FROM users WHERE email = ? ");
            $Publisher_query->bind_param("s", $newPublisherEmail);
            $Publisher_query->execute();
            $Publisheresult = $Publisher_query->get_result();
            $PublisherID = $Publisheresult->fetch_assoc();

            // Get Manager ID:
            if($newManager == "none")
            {
                $ManagerID = null;
            }
            else
            {
                $Manager_query = $conn->prepare("SELECT id FROM affiliations WHERE affiliation_key = ? ");
                $Manager_query->bind_param("s", $newManager);
                $Manager_query->execute();
                $Manageresult = $Manager_query->get_result();
                $ManagerID = ($Manageresult->fetch_assoc())['id'];
            }

            $UpdateQuery = $conn->prepare("UPDATE affiliations SET affiliation_key = ?, affiliation_type = ?, publisher_id = ?, manager_id = ? WHERE id=?");
            $UpdateQuery->bind_param("ssiii", $newOrgName, $newOrgType, $PublisherID['id'], $ManagerID, $OrgId);
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

        $conn->close();


        return json_encode($output);
       
    }

    function DeleteRecord($OrganizationID)
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

        // Check if Organization is a Manager:
        $MangrQuery = $conn->prepare("SELECT * FROM affiliations WHERE manager_id = ?");
        $MangrQuery->bind_param("i", $OrganizationID);
        $MangrQuery->execute();
        $Mangrresult = $MangrQuery->get_result();

        if($Mangrresult->num_rows == 0)
        {
            // Check if Organization is in Affiliation events:
            $AffilEventsQuery = $conn->prepare("SELECT * FROM affiliations_events WHERE affiliation_id = ?");
            $AffilEventsQuery->bind_param("i", $OrganizationID);
            $AffilEventsQuery->execute();
            $AffilEventresult = $AffilEventsQuery->get_result();

            if($AffilEventresult->num_rows == 0)
            {
                // Check if Organization is in Tours:
                $ToursQuery = $conn->prepare("SELECT * FROM tours WHERE affiliation_id = ?");
                $ToursQuery->bind_param("i", $OrganizationID);
                $ToursQuery->execute();
                $Toursresult = $ToursQuery->get_result();

                if($Toursresult->num_rows == 0)
                {
                    // Check if Organization is in Persons table:
                    $PersonsQuery = $conn->prepare("SELECT * FROM persons WHERE affiliation_id = ?");
                    $PersonsQuery->bind_param("i", $OrganizationID);
                    $PersonsQuery->execute();
                    $Personsresult = $PersonsQuery->get_result();

                    if($Personsresult->num_rows == 0)
                    {
                        $DeleteQuery = $conn->prepare("DELETE FROM affiliations WHERE id = ?");
                        $DeleteQuery->bind_param("i", $OrganizationID);
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
                        // Persons table: cannot delete:
                        $output["message"] = "Cannot delete organization\nPlayers is registered at this organization";
                    }
                }
                else
                {
                    // Managing a tour: cannot delete:
                    $output["message"] = "Cannot delete organization\nThis organization is managing a tour";
                }
            }
            else
            {
                // Affiliation events: cannot delete:
                $output["message"] = "Cannot delete organization\nThis organization is managing a tournament";
            }
        }
        else
        {
            // Managing Org cannot delete:
            $output["message"] = "Cannot delete organization\nThis organization is a managing organization";
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
            $OrgId = $input['OrgId'];
            $oldOrgName = $input['oldOrgName'];
            $newOrgName = $input['newOrgName'];
            $newOrgType = $input['newOrgType'];
            $newPublisherEmail = $input['newPublisherEmail'];
            $newManager = $input['newManager'];

           echo UpdateRecord($OrgId, $oldOrgName, $newOrgName, $newOrgType, $newPublisherEmail, $newManager);
        }
        else if($type == "delete")
        {
            $OrganizationID = $input['OrganizationID'];
            echo DeleteRecord($OrganizationID);
        }
        else if($type == "insert")
        {
            $NewOrganizationN= $input['NewOrganizationN'];
            $NewType=  $input['NewType'];
            $PublisherEmail =  $input['PublisherEmail'];
            $Manager =  $input['Manager'];
            
            echo InsertRecord($NewOrganizationN, $NewType , $PublisherEmail, $Manager);
        }
    }
    

?>