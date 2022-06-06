<?php
	include_once "configDB.php";
	if (!isset($_SESSION)) session_start();

	$rels = "";             //for validation purposes
	$RoundNo = $eventId = $leaderId = $state = "";

	if ($_SERVER["REQUEST_METHOD"] == "POST") 
	{
		$RoundNo = $_POST["RoundNo"];
		$eventId = $_POST["eventId"];
		$leaderId = $_POST["leaderId"];
		$state = $_POST["state"];

		if (!empty($_POST["RoundNo"]))
		{
			if (!preg_match("/^[0-9]|[1-9][0-9]$/", $_POST["RoundNo"]))
				$_SESSION["RoundNoError"] = "Invalid round number. The value must be between [1-99]";
			else $rels .= "r";
		}
		else $_SESSION["RoundNoError"] = "Please enter the round number";

		if (!empty($_POST["eventId"]))
		{
			if (!preg_match("/^\\d+$/", $_POST["siteId"]))
				$_SESSION["eventIdError"] = "Invalid event Id. Only numbers allowed";
			else $rels .= "e";
		}
		else $_SESSION["eventIdError"] = "Please enter the event Id";

		if (!empty($_POST["leaderId"]))
		{
			if (!preg_match("/^\\d+$/", $_POST["leaderId"]))
				$_SESSION["leaderIdError"] = "Invalid leader Id. Only numbers allowed";
			else $rels .= "l";
		}
		else $_SESSION["leaderIdError"] = "Please enter the leader Id";

		if (!empty($_POST["state"]))
		{
			if (!preg_match("/^[a-z][A-Z]\s$/", $_POST["state"]))
				$_SESSION["stateError"] = "Invalid state. Only letters and whitespace allowed";
			else $rels .= "s";
		}
		else $_SESSION["stateError"] = "Please enter the state";

		if ($rels != "rels")
			Header("Location: rounds.php");
	}

	$sql_query = "SELECT * FROM rounds WHERE round_no = '$RoundNo' AND event_id = '$eventId'";
	$result = $conn->query($sql_query);

	if ($result == TRUE)
	{
		if ($rels == "rels")
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
                $query = "DELETE FROM rounds WHERE round_no = '$RoundNo' AND event_id = '$eventId' AND leader_id = '$leaderId AND state = '$state'";
                $res = $conn->query($query);
            }
            else {
                $_SESSION["roundMsg"] = "Invalid event id and leader id";
                header("Location: rounds.php");
            }
			
			if ($res === TRUE)
			{
				echo "
					<script> 
						document.getElementById('fullScreenPopupReg').style.visibility = 'visible'; 
						$('#fullScreenPopupReg').fadeIn('slow');
						document.getElementById('fullScreenPopupAdd').style.visisbility = 'hidden';
						$('#fullScreenPopupAdd').fadeOut('slow');
					</script>
				";
			}
			else
			{
				$_SESSION["message"] = "Error connecting to database" . $conn->error;
				error_reporting(E_ALL);
				header("Location: rounds.php");
				die;
			}
		}
	}
	else echo "Error: " . $sql_query . "<br>" . $conn->error;
	$conn->close();
?>