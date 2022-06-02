<?php
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
?>