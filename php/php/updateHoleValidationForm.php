<?php
	include_once "configDB.php";
	if (!isset($_SESSION)) session_start();

	$holeNo = $siteId = $par = $len = "";

	if ($_SERVER["REQUEST_METHOD"] == "POST") 
	{
		$holeNo = $_POST["holeNo"];
		$siteId = $_POST["siteId"];
		$par = $_POST["par"];
		$len = $_POST["len"];

		if (!empty($_POST["holeNo"]) || !empty($_POST["siteId"]) || !empty($_POST["par"]) || !empty($_POST["len"]))
		{
			if (!preg_match("/^[0-9]|[1-9][0-9]$/", $_POST["holeNo"]))
            {
				$_SESSION["holeNoError"] = "Invalid hole number. The value must be between [0-99]";
                header("Location: viewHoles");
            }
			else 
            {
                if (isset($_POST["holeNo"]))
                {
                    $siteQ = "SELECT * from sites WHERE id = '$siteId' LIMIT 1";
                    $relt = $conn->query($siteQ);
                    $row = $relt->fetch_assoc();
                
                    $siteId = $row['id'];
                    if (isset($siteId)) {
                        $sql_query = "UPDATE holes SET hole_no = '$holeNo' WHERE site_id = '$siteId'";
                        $res = $conn->query($sql_query);
                    }
                    else {
                        $_SESSION["siteMsg"] = "You need to add that site in the view courses link";
                        header("Location: viewCourses.php");
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

            if (!preg_match("/^d+$/", $_POST["siteId"]))
            {
                $_SESSION["siteIdError"] = "Invalid site Id. Only numbers allowed";
                header("Location: viewHoles");
            }
            else
            {
                if (isset($_POST["siteId"]))
                {
                    $siteQ = "SELECT * from sites WHERE id = '$siteId' LIMIT 1";
                    $relt = $conn->query($siteQ);
                    $row = $relt->fetch_assoc();
                
                    $siteId = $row['id'];
                    if (isset($siteId)) {
                        $sql_query = "UPDATE holes SET site_id = '$siteId'";
                        $res = $conn->query($sql_query);
                    }
                    else {
                        $_SESSION["siteMsg"] = "You need to add that site in the view courses link";
                        header("Location: viewCourses.php");
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

            if (!preg_match("/^[0-9]|[1-9][0-9]$/", $_POST["par"]))
            {
                $_SESSION["parError"] = "Invalid par number. The value must be between [0-99]";
                header("Location: viewHoles");
            }
            else
            {
                if (isset($_POST["par"]))
                {
                    $siteQ = "SELECT * from sites WHERE id = '$siteId' LIMIT 1";
                    $relt = $conn->query($siteQ);
                    $row = $relt->fetch_assoc();
                
                    $siteId = $row['id'];
                    if (isset($siteId)) {
                        $sql_query = "UPDATE holes SET par = '$par' WHERE site_id = '$siteId'";
                        $res = $conn->query($sql_query);
                    }
                    else {
                        $_SESSION["siteMsg"] = "You need to add that site in the view courses link";
                        header("Location: viewCourses.php");
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

            if (!preg_match("/^\d+\.\d{2}$/", $_POST["len"]) )
            {
                $_SESSION["lenError"] = "Invalid length. Only decimal numbers allowed";
                header("Location: viewHoles");
            }
            else
            {
                if (isset($_POST["len"]))
                {
                    $siteQ = "SELECT * from sites WHERE id = '$siteId' LIMIT 1";
                    $relt = $conn->query($siteQ);
                    $row = $relt->fetch_assoc();
                
                    $siteId = $row['id'];
                    if (isset($siteId)) {
                        $sql_query = "UPDATE holes SET length = '$len' WHERE site_id = '$siteId'";
                        $res = $conn->query($sql_query);
                    }
                    else {
                        $_SESSION["siteMsg"] = "You need to add that site in the view courses link";
                        header("Location: viewCourses.php");
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
            if (!isset($_POST["holeNo"]))
                $_SESSION["holeNoError"] = "Please enter the hole number";
            if (!isset($_POST["siteId"]))
                $_SESSION["siteIdError"] = "Please enter the site Id";
            if (!isset($_POST["par"]))
                $_SESSION["parError"] = "Please enter the par number";
            if (!isset($_POST["len"]))
                $_SESSION["lenError"] = "Please enter the length";
        }
	}
    $conn->close();
?>