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


        $conn->close();
    }
?>