<?php
	include_once "configDB.php";
	if (!isset($_SESSION)) session_start();

	$hspl = "";             //for validation purposes
	$holeNo = $siteId = $par = $len = "";

	if ($_SERVER["REQUEST_METHOD"] == "POST") 
	{
		$holeNo = $_POST["holeNo"];
		$siteId = $_POST["siteId"];
		$par = $_POST["par"];
		$len = $_POST["len"];

		if (!empty($_POST["holeNo"]))
		{
			if (!preg_match("/^[0-9]|[1-9][0-9]$/", $_POST["holeNo"]))
				$_SESSION["holeNoError"] = "Invalid hole number. The value must be between [0-99]";
			else $hspl .= "h";
		}
		else $_SESSION["holeNoError"] = "Please enter the hole number";

		if (!empty($_POST["siteId"]))
		{
			if (!preg_match("/^\\d+$/", $_POST["siteId"]))
				$_SESSION["siteIdError"] = "Invalid site Id. Only numbers allowed";
			else $hspl .= "s";
		}
		else $_SESSION["siteIdError"] = "Please enter the site Id";

		if (!empty($_POST["par"]))
		{
			if (!preg_match("/^[0-9]|[1-9][0-9]$/", $_POST["par"]))
				$_SESSION["parError"] = "Invalid par number. The value must be between [0-99]";
			else $hspl .= "p";
		}
		else $_SESSION["parError"] = "Please enter the par number";

		if (!empty($_POST["len"]))
		{
			if (!preg_match("/^\d+\.\d{2}$/", $_POST["len"]))
				$_SESSION["lenError"] = "Invalid length. Only decimal numbers allowed";
			else $hspl .= "l";
		}
		else $_SESSION["lenError"] = "Please enter the length";

		if ($hspl != "hspl")
			Header("Location: viewHoles.php");
	}

	$sql_query = "SELECT * FROM holes WHERE hole_no = '$holeNo' AND site_id = '$siteId'";
	$result = $conn->query($sql_query);

	if ($result == TRUE)
	{
		if ($hspl == "hspl")
		{

			$siteQ = "SELECT * from sites WHERE id = '$siteId' LIMIT 1";
			$relt = $conn->query($siteQ);
			$row = $relt->fetch_assoc();

			$siteId = $row['id'];
			if (isset($siteId)) {
				$sql = "DELETE FROM holes WHERE hole_no = '$holeNo' AND site_id = '$siteId' AND par = '$par' AND length = '$len'";
				$res = $conn->query($sql);
			}
			else {
				$_SESSION["holeMsg"] = "You need to add that site in the view courses link";
				header("Location: viewCourses.php");
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
				header("Location: viewHoles.php");
				die;
			}
		}
	}
	else echo "Error: " . $sql_query . "<br>" . $conn->error;
	$conn->close();
?>