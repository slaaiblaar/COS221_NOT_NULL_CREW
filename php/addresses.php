<?php
  session_start();
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Go Golfing</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/home.css">
    <link rel="stylesheet" href="../css/address.css">
    <script src="https://kit.fontawesome.com/8fbf0cb444.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  </head>
  
  <body>
    <div class="loader">
      <div></div>
    </div>
  
    <div class="content">
      <div class="top-content">
        <img id="Logo" src="../img/Golf-full-logo-transparent.png" width="150" height="150">
        <h1 id="webTitle">Sunrise Golfing</h1>
      </div>    

      <!-- inclusion of navbar start -->
      <?php
        require_once("header.php");
      ?>
      <!-- inclusion of navbar end-->

      <div id="mainContainer">
        <h1>Addresses Table</h1>
        <hr>
        <div id="tableContainer">
          <table id="table">
            <thead><tr>
              <th><h3>Id</h3></th>
              <th><h3>Location Id</h3></th>
              <th><h3>Language</h3></th>
              <th><h3>Street Number</h3></th>
              <th><h3>Street</h3></th>
              <th><h3>Country</h3></th>
            </tr></thead>
            <tbody>
            </tbody>
          </table>
        </div>
      </div>

      <!-- inclusion of footer start -->
      <?php
        require_once("footer.php");
      ?>
      <!-- inclusion of footer end -->
      
    </div>
    <script src="../js/loader.js"></script>
    <script src="../js/addresses.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  </body>
</html>




