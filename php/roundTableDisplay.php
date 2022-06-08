<?php
    require_once "configDB.php";
    $sql_query = "SELECT * FROM rounds ORDER BY id ASC";
    $result = $conn->query($sql_query);

    if ($result->num_rows > 0)
    {
       $result_array = array();
       while ($row = $result->fetch_assoc()) {
           array_push($result_array, $row);
       }
    }
    echo json_encode($result_array);
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

        $query = "SELECT * FROM rounds";
        $result = $conn->query($query);

        echo '<table class = "Table" cellspacing="0" cellpadding="5">
                <thead class = "TableHeading">
                    <th>Round ID</th>
                    <th>Round Nuber</th>
                    <th>Tournament</th>
                    <th>Leader</th>
                    <th>State</th>
                    <th>Select Record</th>
                </thead>';

        echo "<tbody>";    

        if ($result->num_rows > 0) {
            while($data = $result->fetch_assoc()) 
            {
                // Get Event name :
                $Event_query = $conn->prepare("SELECT event_key FROM events WHERE id = ?");
                $Event_query->bind_param("i", $data['event_id']);
                $Event_query->execute();
                $Event_result = $Event_query->get_result();
                $Event_name = $Event_result->fetch_assoc();

                // Leader Name :
                if($data['leader_id'] != null || $data['leader_id'] != "")
                {
                    $Leader_query = $conn->prepare("SELECT person_key FROM persons WHERE id = ?");
                    $Leader_query->bind_param("i", $data['leader_id']);
                    $Leader_query->execute();
                    $Leader_result = $Event_query->get_result();
                    $Leader_name = $Leader_result->fetch_assoc();
                    $Leader = $Leader_name['person_key'];
                }
                else
                {
                    $Leader = "";
                }
               

                echo "<tr class='TableRow' id= Row" . $data['id'] .">".
                        "<td onclick='RecordChosen(".$data['id'].")'>" . $data['id'] . "</td>" .
                        "<td onclick='RecordChosen(".$data['id'].")'>" . $data['round_no'] . "</td>" .
                        "<td onclick='RecordChosen(".$data['id'].")'>" .  $Event_name["event_key"] . "</td>" .
                        "<td onclick='RecordChosen(".$data['id'].")'>" . $Leader . "</td>" .
                        "<td onclick='RecordChosen(".$data['id'].")'>" . $data['state'] . "</td>" .
                        "<td onclick='RecordChosen(".$data['id'].")'>" . "<input type='radio' name='SelectRadio' value='". $data['id']."' id='RowSelect".$data['id']."' title='".$data['round_no']. $data['event_id']."' />" . "</td>" .
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

    // Populate ADD Event Name DropDown -------------------------------------------------------------------------------------------
    function PopulateAddEventNDropDown($Type)
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
        $queryEventNames = "SELECT DISTINCT event_key FROM events";
        $resultEventNames = $conn->query($queryEventNames);

        $EventNames = "";
        if ($resultEventNames->num_rows > 0) {
            while($data = $resultEventNames->fetch_assoc()) 
            {
                $EName = str_replace(" ","+",$data["event_key"]);
                $EventNames = $EventNames . "<option value= ". $EName . ">" . $data["event_key"] ."</option>";
            }
        } 

        if($Type == "Insert")
        {
            echo "<select name='EventNamesCreate' id='EventNamesCreate' class='RoundsCreateInput'>";
        }
        else
        {
            echo "<select name='EventNamesUpdate' id='EventNamesUpdate' class='RoundsCreateInput'>";
        }
        
        echo $EventNames;

        echo "</select>";

        $conn->close();
    }

    // Populate ADD Leader Name DropDown -------------------------------------------------------------------------------------------
    function PopulateAddLeaderNDropDown($Type)
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

        // Get Leader Names
        $queryLeaderNames = "SELECT DISTINCT person_key FROM persons";
        $resultLeaderNames = $conn->query($queryLeaderNames);

        $LeaderNames = "";

        if ($resultLeaderNames->num_rows > 0) {
            while($data = $resultLeaderNames->fetch_assoc()) 
            {
                $LName = str_replace(" ","+",$data["person_key"]);
                $LeaderNames = $LeaderNames . "<option value= ". $LName . ">" . $data["person_key"] ."</option>";
            }
        } 

        if ($LeaderNames == "")
        {
            $LeaderNames = $LeaderNames . "<option value= 'none'>No current players to choose from</option>";
        }

        if($Type == "Insert")
        {
            echo "<select name='LeaderNamesCreate' id='LeaderNamesCreate' class='RoundsCreateInput'>";
        }
        else
        {
            echo "<select name='LeaderNamesUpdate' id='LeaderNamesUpdate' class='RoundsCreateInput'>";
        }
        
        echo $LeaderNames;

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

        // Get Round Num
        $queryRoundNum = "SELECT DISTINCT round_no FROM rounds";
        $resultRoundNum = $conn->query($queryRoundNum);

        $RoundNum = "";
        if ($resultRoundNum->num_rows > 0) {
            while($data = $resultRoundNum->fetch_assoc()) 
            {
                $RoundNum = $RoundNum . "<option value= ". $data['round_no'] . ">" . $data['round_no'] ."</option>";
            }
        } 

        // Get Event Name
        $queryEventName = "SELECT DISTINCT event_key FROM events";
        $resultEventName= $conn->query($queryEventName);

        $EventName = "";
        if ($resultEventName->num_rows > 0) {
            while($data = $resultEventName->fetch_assoc()) 
            {
                $EName = str_replace(" ","+",$data['event_key']);
                $EventName = $EventName . "<option value= ". $EName . ">" . $data['event_key'] ."</option>";
            }
        } 

        // Get Leader Name
        $queryLeaderName = "SELECT DISTINCT person_key FROM persons";
        $resultLeaderName= $conn->query($queryLeaderName);

        $LeaderName = "";
        if ($resultLeaderName->num_rows > 0) {
            while($data = $resultLeaderName->fetch_assoc()) 
            {
                $LName = str_replace(" ","+",$data['event_key']);
                $LeaderName = $LeaderName . "<option value= ". $LName . ">" . $data['person_key'] ."</option>";
            }
        }
        else
        {
            $LeaderName = $LeaderName . "<option value= 'noPlayers'>No players to choose from</option>";
        } 

        // Set States 
        $States = " <select name='RoundStateFilter' id='RoundStateFilter' class='FilterDropDown'>
                        <option value= 'choose'>Choose a State</option>
                        <option value= 'Scheduled'>Scheduled</option>
                        <option value= 'In+progress'>In progress</option>
                        <option value= 'Finished'>Finished</option>
                        <option value= 'Cancelled'>Cancelled</option>
                        <option value= 'Postponed'>Postponed</option>
                        <option value= 'none'>No Filter</option>
                    </select><br/>";

        
        // Round Numbers:
        echo "<select name='RoundNumDrpDwn' id='RoundNumDrpDwn' class = 'FilterDropDown'>".
                "<option value= 'choose'>Choose a Round number</option>";

        echo $RoundNum;

        echo "<option value= 'none'>No Filter</option>";

        echo "</select><br/>";

        // Event Names:
        echo "<select name='EventNameDrpDwn' id='EventNameDrpDwn' class = 'FilterDropDown'>".
                "<option value= 'choose'>Choose a Tournament</option>";
        
        echo $EventName;

        echo "<option value= 'none'>No Filter</option>";

        echo "</select><br/>";

        // Leader Names:
        echo "<select name='LeaderNameDrpDwn' id='LeaderNameDrpDwn' class = 'FilterDropDown'>".
                "<option value= 'choose'>Choose a Leader</option>";

        echo $LeaderName;

        echo "<option value= 'none'>No Filter</option>";

        echo "</select><br/>";

        echo $States;


        $conn->close();
    }

    // Filter Table -------------------------------------------------------------------------------------------------------------
    function FilterTable($RoundNum, $EventName, $LeaderName, $State)
    {
        if(($RoundNum == "choose" || $RoundNum == "none") && ($EventName == "choose" || $EventName == "none") &&
         ($LeaderName == "choose" || $LeaderName == "none" || $LeaderName == "noPlayers") || ($State == "choose" || $State == "none") )
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
            

            $RoundNumQuery = " ";
            if ($RoundNum != "choose" && $RoundNum != "none")
            {
                $RoundNumQuery = " round_no = " . $RoundNum;
            }
            
            $EventNameQuery = " ";
            if ($EventName != "choose" && $EventName != "none")
            {
                $EventName = str_replace("+"," ",$EventName);

                $Event_query = $conn->prepare("SELECT id FROM events WHERE event_key = ?");
                $Event_query->bind_param("i", $EventName);
                $Event_query->execute();
                $Event_result = $Event_query->get_result();
                $Event_name = $Event_result->fetch_assoc();
                $EventId = $Event_name['id'];

                $EventNameQuery = " event_id = " . $EventId;

                if($RoundNumQuery != " ")
                {
                    $EventNameQuery = " AND" . $EventNameQuery;
                }
            }

            $LeaderNameQuery = " ";
            if ($LeaderName != "choose" && $LeaderName != "none" && $LeaderName != "noPlayers")
            {
                $LeaderName = str_replace("+"," ",$LeaderName);

                $Leader_query = $conn->prepare("SELECT id FROM persons WHERE person_key = ?");
                $Leader_query->bind_param("i", $LeaderName);
                $Leader_query->execute();
                $Leader_result = $Leader_query->get_result();
                $Leader_name = $Leader_result->fetch_assoc();
                $LeaderId = $Leader_name['id'];

                $LeaderNameQuery = " leader_id = " . $LeaderId;

                if($RoundNumQuery != " " || $EventNameQuery != " ")
                {
                    $LeaderNameQuery = " AND" . $LeaderNameQuery;
                }
            }

            $StateQuery = " ";
            if ($State != "choose" && $State != "none")
            {
                $StateQuery = " state = " . $State ;

                if($RoundNumQuery != " " || $EventNameQuery != " " || $LeaderNameQuery != " " )
                {
                    $StateQuery = " AND" . $StateQuery;
                }
            }

            $SelectQuery = "SELECT * FROM rounds WHERE" . $RoundNumQuery . $EventNameQuery .  $LeaderNameQuery. $StateQuery;
            $result = $conn->query($SelectQuery);

            echo '<table class = "Table" cellspacing="0" cellpadding="5">
                        <thead class = "TableHeading">
                            <th>Round ID</th>
                            <th>Round Nuber</th>
                            <th>Tournament</th>
                            <th>Leader</th>
                            <th>State</th>
                            <th>Select Record</th>
                        </thead>';

            echo "<tbody>";  


            if ($result->num_rows > 0) {
                while($data = $result->fetch_assoc()) 
                {
                
                    // Get Event name :
                    $Event_query = $conn->prepare("SELECT event_key FROM events WHERE id = ?");
                    $Event_query->bind_param("i", $data['event_id']);
                    $Event_query->execute();
                    $Event_result = $Event_query->get_result();
                    $Event_name = $Event_result->fetch_assoc();

                    // Leader Name :
                    if($data['leader_id'] != null || $data['leader_id'] != "")
                    {
                        $Leader_query = $conn->prepare("SELECT person_key FROM persons WHERE id = ?");
                        $Leader_query->bind_param("i", $data['leader_id']);
                        $Leader_query->execute();
                        $Leader_result = $Event_query->get_result();
                        $Leader_name = $Leader_result->fetch_assoc();
                        $Leader = $Leader_name['person_key'];
                    }
                    else
                    {
                        $Leader = "";
                    }
                

                    echo "<tr class='TableRow' id= Row" . $data['id'] .">".
                            "<td onclick='RecordChosen(".$data['id'].")'>" . $data['id'] . "</td>" .
                            "<td onclick='RecordChosen(".$data['id'].")'>" . $data['round_no'] . "</td>" .
                            "<td onclick='RecordChosen(".$data['id'].")'>" .  $Event_name["event_key"] . "</td>" .
                            "<td onclick='RecordChosen(".$data['id'].")'>" . $Leader . "</td>" .
                            "<td onclick='RecordChosen(".$data['id'].")'>" . $data['state'] . "</td>" .
                            "<td onclick='RecordChosen(".$data['id'].")'>" . "<input type='radio' name='SelectRadio' value='". $data['id']."' id='RowSelect".$data['id']."' title='".$data['round_no']. $data['event_id']."' />" . "</td>" .
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

    function InsertRecord($RoundNum, $EventName , $LeaderName, $State)
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

        // Check if Round No + Event name is unique :
        $Event_query = $conn->prepare("SELECT id FROM events WHERE event_key = ? ");
        $Event_query->bind_param("s", $EventName);
        $Event_query->execute();
        $Eventresult = $Event_query->get_result();
        $EventID = $Eventresult->fetch_assoc()['id'];

        $Round_query = $conn->prepare("SELECT * FROM rounds WHERE round_no = ? AND event_id = ? ");
        $Round_query->bind_param("ii", $RoundNum, $EventID);
        $Round_query->execute();
        $Roundresult = $Round_query->get_result();

        if($Roundresult->num_rows == 0)
        {
            //  Round + event is unique : insert name

            if($LeaderName == "none")
            {
                $LeaderID = null;
            }
            else
            {
                $Leader_query = $conn->prepare("SELECT id FROM persons WHERE person_key = ? ");
                $Leader_query->bind_param("s", $LeaderName);
                $Leader_query->execute();
                $Leaderresult = $Leader_query->get_result();
                $LeaderID = $Leaderresult->fetch_assoc()['id'];
            }

            $InsertOrg_query = $conn->prepare("INSERT INTO rounds (round_no, event_id, leader_id, state) VALUES(?, ?, ?, ?)");
            $InsertOrg_query->bind_param("iiis", $RoundNum, $EventID, $LeaderID, $State);
            $Executed = $InsertOrg_query->execute();

            if ($Executed == true)
            {
                $output["message"]= "Successfully created Round ".$RoundNum . " for ". $EventName ;
            }
            else
            {
                $output["message"]= "Could not create Round ".$RoundNum . " for ". $EventName ;
            }
        }
        else
        {
            $LeaderName = $LeaderName . "<option value= 'noPlayers'>No players to choose from</option>";
        } 

        // Set States 
        $States = " <select name='RoundStateUpdate' id='RoundStateUpdate' class='FilterDropDown'>
                        <option value= 'choose'>Choose a State</option>
                        <option value= 'scheduled'>Scheduled</option>
                        <option value= 'in+progress'>In progress</option>
                        <option value= 'finished'>Finished</option>
                        <option value= 'cancelled'>Cancelled</option>
                        <option value= 'postponed'>Postponed</option>
                        <option value= 'none'>No Filter</option>
                    </select><br/>";

        
        // Round Numbers:
        echo "<select name='RoundNumDrpDwn' id='RoundNumDrpDwn' class = 'FilterDropDown'>".
                "<option value= 'choose'>Choose a Round number</option>";

        echo $RoundNum;

        echo "<option value= 'none'>No Filter</option>";

        echo "</select><br/>";

        // Event Names:
        echo "<select name='EventNameDrpDwn' id='EventNameDrpDwn' class = 'FilterDropDown'>".
                "<option value= 'choose'>Choose a Tournament</option>";
        
        echo $EventName;

        echo "<option value= 'none'>No Filter</option>";

        echo "</select><br/>";

        // Leader Names:
        echo "<select name='LeaderNameDrpDwn' id='LeaderNameDrpDwn' class = 'FilterDropDown'>".
                "<option value= 'choose'>Choose a Leader</option>";

        echo $LeaderName;

        echo "<option value= 'none'>No Filter</option>";

        echo "</select><br/>";

        echo $States;

        
            $output["message"]= "Could not Create the Round\nRound ".$RoundNum." already exists for ".$EventName ;

        $conn->close();

        return json_encode($output);

    }

    function DeleteRecord($RoundID)
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

        // Check if Round is in strokes:
        $StrokeQuery = $conn->prepare("SELECT * FROM strokes WHERE round_id = ?");
        $StrokeQuery->bind_param("i", $RoundID);
        $StrokeQuery->execute();
        $Strokeresult = $StrokeQuery->get_result();

        if($Strokeresult->num_rows == 0)
        {
            // Check if Round is in scores :
            $ScoresQuery = $conn->prepare("SELECT * FROM scores WHERE round_id = ?");
            $ScoresQuery->bind_param("i", $RoundID);
            $ScoresQuery->execute();
            $Scoresresult = $ScoresQuery->get_result();

            if($Scoresresult->num_rows == 0)
            {
                
                $DeleteQuery = $conn->prepare("DELETE FROM rounds WHERE id = ?");
                $DeleteQuery->bind_param("i", $RoundID);
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
                $output["message"] = "Cannot delete this Round\nA score has been entered for this round";
            }
        }
        else
        {
            // Strokes delete:
            $output["message"] = "Cannot delete this Round\nA score has been entered for this round";
        }

        $conn->close();

        return json_encode($output);
    }

    function UpdateRecord($RoundID, $oldRoundNum, $oldEvent, $newRoundNum, $newEvent, $newLeader, $newState)
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

        if($newRoundNum != $oldRoundNum || $oldEvent != $newEvent)
        {
            // Check if Round No + Event name is unique :
            $Event_query = $conn->prepare("SELECT id FROM events WHERE event_key = ? ");
            $Event_query->bind_param("s", $newEvent);
            $Event_query->execute();
            $Eventresult = $Event_query->get_result();
            $EventID = $Eventresult->fetch_assoc()['id'];

            $Round_query = $conn->prepare("SELECT * FROM rounds WHERE round_no = ? AND event_id = ? ");
            $Round_query->bind_param("ii", $newRoundNum, $newEvent);
            $Round_query->execute();
            $Roundresult = $Round_query->get_result();

            if($Roundresult->num_rows == 0)
            {
                //  Round + event is unique : update round

                if($newLeader == "none")
                {
                    $LeaderID = null;
                }
                else
                {
                    $Leader_query = $conn->prepare("SELECT id FROM persons WHERE person_key = ? ");
                    $Leader_query->bind_param("s", $newLeader);
                    $Leader_query->execute();
                    $Leaderresult = $Leader_query->get_result();
                    $LeaderID = $Leaderresult->fetch_assoc()['id'];
                }

                $UpdateQuery = $conn->prepare("UPDATE rounds SET round_no = ?, event_id = ?, leader_id = ?, state = ? WHERE id=?");
                $UpdateQuery->bind_param("iiisi", $newRoundNum, $EventID, $LeaderID, $newState, $RoundID);
                $updated = $UpdateQuery->execute();

                if ($updated == true)
                {
                    $output["message"]= "Successfully updated";
                }
                else
                {
                    $output["message"]= "Could not update" ;
                }
            }
            else
            {
                $output["message"]= "Could not Create the Round\nRound ".$RoundNum." already exists for ".$EventName ;
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
            $RoundID = $input['RoundID'];
            $oldRoundNum = $input['oldRoundNum'];
            $oldEvent = $input['oldEvent'];
            $newRoundNum = $input['newRoundNum'];
            $newEvent = $input['newEvent'];
            $newLeader = $input['newLeader'];
            $newState = $input['newState'];

           echo UpdateRecord($RoundID, $oldRoundNum, $oldEvent, $newRoundNum, $newEvent, $newLeader, $newState);
        }
        else if($type == "delete")
        {
            $RoundID = $input['RoundID'];
            echo DeleteRecord($RoundID);
        }
        else if($type == "insert")
        {
            $RoundNum= $input['RoundNum'];
            $EventName=  $input['EventName'];
            $LeaderName =  $input['LeaderName'];
            $State =  $input['State'];
            
            echo InsertRecord($RoundNum, $EventName , $LeaderName, $State);
        }
    }
?>