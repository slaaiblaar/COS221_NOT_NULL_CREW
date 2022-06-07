<?php
	include_once "configDB.php";
	if (!isset($_SESSION)) session_start();

	$RoundNo = $eventId = $leaderId = $state = "";

	if ($_SERVER["REQUEST_METHOD"] == "POST") 
	{
		$RoundNo = $_POST["RoundNo"];
		$eventId = $_POST["eventId"];
		$leaderId = $_POST["leaderId"];
		$state = $_POST["state"];

		if (!empty($_POST["RoundNo"]) || !empty($_POST["eventId"]) || !empty($_POST["leaderId"]) || !empty($_POST["state"]))
		{
			if (!preg_match("/^[0-9]|[1-9][0-9]$/", $_POST["RoundNo"]))
            {
				$_SESSION["RoundNoError"] = "Invalid round number. The value must be between [1-99]";
                header("Location: rounds");
            }
			else 
            {
                if (isset($_POST["RoundNo"]))
                {
                    $siteQ = "SELECT * FROM events WHERE id = '$eventId' LIMIT 1";
                    $relt = $conn->query($siteQ);
                    $row = $relt->fetch_assoc();
                    $eventId = $row['id'];
        
                    $leaderQ = "SELECT * FROM persons WHERE id = '$leaderId' LIMIT 1";
                    $relts = $conn->query($leaderQ);
                    $rows = $relts->fetch_assoc();
                    $leaderId = $rows['id'];
        
                    if (isset($eventId) && isset($leaderId)) {
                        $query = "UPDATE rounds SET round_no = '$RoundNo'  WHERE event_id = '$eventId' AND leader_id = '$leaderId' AND state = '$state'";
                        $res = $conn->query($query);
                    }
                    else {
                        $_SESSION["roundMsg"] = "Invalid event id and leader id";
                        header("Location: rounds.php");
                    }
                   
                    if ($res == TRUE)
                    {
                        Header("Location: viewHoles.php");
                        die;
                    }
                    else
                    {
                        $_SESSION["message"] = "Error connecting to database" . $conn->error;
                        error_reporting(E_ALL);
                        header("Location: viewHoles.php");
                        die;
                    }
                }
            }

            if (!preg_match("/^d+$/", $_POST["eventId"]))
            {
                $_SESSION["eventIdError"] = "Invalid event Id. Only numbers allowed";
                header("Location: viewHoles");
            }
            else
            {
                if (isset($_POST["eventId"]))
                {
                    $siteQ = "SELECT * FROM events WHERE id = '$eventId' LIMIT 1";
                    $relt = $conn->query($siteQ);
                    $row = $relt->fetch_assoc();
                    $eventId = $row['id'];
        
                    $roundQ = "SELECT * FROM rounds WHERE rounds_no = '$RoundNo' LIMIT 1";
                    $relts = $conn->query($roundQ);
                    $rows = $relts->fetch_assoc();
                    $RoundNo = $rows['round_no'];
        
                    if (isset($RoundNo) && isset($leaderId)) {
                        $query = "UPDATE rounds SET event_id = '$eventId' WHERE round_no = '$RoundNo' AND leader_id = '$leaderId' AND state = '$state'";
                        $res = $conn->query($query);
                    }
                    else {
                        $_SESSION["roundMsg"] = "Invalid round number and leader id";
                        header("Location: rounds.php");
                    }
                    
                    if ($res == TRUE)
                    {
                        Header("Location: viewHoles.php");
                        die;
                    }
                    else
                    {
                        $_SESSION["message"] = "Error connecting to database" . $conn->error;
                        error_reporting(E_ALL);
                        header("Location: viewHoles.php");
                        die;
                    }
                }
            }

            if (!preg_match("/^[0-9]|[1-9][0-9]$/", $_POST["leaderId"]))
            {
                $_SESSION["leaderIdError"] = "Invalid leader Id. Only numbers allowed";
                header("Location: viewHoles");
            }
            else
            {
                if (isset($_POST["leaderId"]))
                {
                    $siteQ = "SELECT * FROM events WHERE id = '$eventId' LIMIT 1";
                    $relt = $conn->query($siteQ);
                    $row = $relt->fetch_assoc();
                    $eventId = $row['id'];
        
                    $roundQ = "SELECT * FROM rounds WHERE round_no = '$RoundNo' LIMIT 1";
                    $relts = $conn->query($roundQ);
                    $rows = $relts->fetch_assoc();
                    $RoundNo= $rows['round_no'];
        
                    if (isset($eventId) && isset($RoundNo)) {
                        $query = "UPDATE rounds SET leader_id = '$leaderId' WHERE round_no = '$RoundNo' AND event_id = '$eventId' AND state = '$state'";
                        $res = $conn->query($query);
                    }
                    else {
                        $_SESSION["roundMsg"] = "Invalid event id and round number";
                        header("Location: rounds.php");
                    }
                    
                    if ($res == TRUE)
                    {
                        Header("Location: viewHoles.php");
                        die;
                    }
                    else
                    {
                        $_SESSION["message"] = "Error connecting to database" . $conn->error;
                        error_reporting(E_ALL);
                        header("Location: viewHoles.php");
                        die;
                    }
                }
            }

            if (!preg_match("/^\d+\.\d{2}$/", $_POST["state"]) )
            {
                $_SESSION["stateError"] = "Invalid state. Only letters and whitespace allowed";
                header("Location: viewHoles");
            }
            else
            {
                if (isset($_POST["state"]))
                {
                    $siteQ = "SELECT * FROM events WHERE id = '$eventId' LIMIT 1";
                    $relt = $conn->query($siteQ);
                    $row = $relt->fetch_assoc();
                    $eventId = $row['id'];
        
                    $leaderQ = "SELECT * FROM persons WHERE id = '$leaderId' LIMIT 1";
                    $relts = $conn->query($leaderQ);
                    $rows = $relts->fetch_assoc();
                    $leaderId = $rows['id'];
        
                    if (isset($eventId) && isset($leaderId)) {
                        $query = "UPDATE rounds SET state = '$state' WHERE round_no = '$RoundNo' AND event_id = '$eventId' AND leader_id = '$leaderId'";
                        $res = $conn->query($query);
                    }
                    else {
                        $_SESSION["roundMsg"] = "Invalid event id and leader id";
                        header("Location: rounds.php");
                    }
                    
                    if ($res == TRUE)
                    {
                        Header("Location: viewHoles.php");
                        die;
                    }
                    else
                    {
                        $_SESSION["message"] = "Error connecting to database" . $conn->error;
                        error_reporting(E_ALL);
                        header("Location: viewHoles.php");
                        die;
                    }
                }
            }	
		}
		else 
        {
            if (!isset($_POST["RoundNo"]))
                $_SESSION["RoundNoError"] = "Please enter the round number";
            if (!isset($_POST["eventId"]))
                $_SESSION["eventIdError"] = "Please enter the event Id";
            if (!isset($_POST["leaderId"]))
                $_SESSION["leaderIdError"] = "Please enter the leader Id";
            if (!isset($_POST["state"]))
                $_SESSION["stateError"] = "Please enter the state";
        }
	}
    $conn->close();
?>