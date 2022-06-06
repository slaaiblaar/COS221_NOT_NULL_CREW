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
?>