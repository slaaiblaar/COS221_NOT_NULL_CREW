<!-- This file is to represent the main menu page for the golfing website -->
<!-- background image taken from https://www.wallpaperflare.com/golf-high-resolution-desktop-backgrounds-golf-course-grass-wallpaper-hrhzv -->
<!-- icons included -->
  <!-- <a target="_blank" href="https://icons8.com/icon/EJ2ReOI6xOk3/golf-player">Golf Player</a> icon by <a target="_blank" href="https://icons8.com">Golf Player</a>
  <a target="_blank" href="https://icons8.com/icon/nOLgJplDUPQ4/golf">Golf</a> icon by <a target="_blank" href="https://icons8.com">Golf bag</a>
  <a target="_blank" href="https://icons8.com/icon/do6N9EHMyX0y/golf">Golf</a> icon by <a target="_blank" href="https://icons8.com">Golf cart</a>
  <a target="_blank" href="https://icons8.com/icon/zvuXdcGcdznE/golf">Golf</a> icon by <a target="_blank" href="https://icons8.com">Golf swing 1</a>
  <a target="_blank" href="https://icons8.com/icon/kXlPf6CIckW9/golf">Golf</a> icon by <a target="_blank" href="https://icons8.com">Golf swing 2</a>
  <a target="_blank" href="https://icons8.com/icon/gT2eJkI8NVD2/golf">Golf</a> icon by <a target="_blank" href="https://icons8.com">Golf Flag</a>
  <a href="https://www.flaticon.com/free-icons/golf" title="golf icons">Golf icons created by Vectors Market - Flaticon</a>
  <a href="https://www.flaticon.com/free-icons/trophy" title="trophy icons">Trophy icons created by Freepik - Flaticon</a>
  <a href="https://www.flaticon.com/free-icons/statistics" title="statistics icons">Statistics icons created by Freepik - Flaticon</a>
  <a href="https://www.flaticon.com/free-icons/travel" title="travel icons">Travel icons created by Freepik - Flaticon</a>
-->
  <!-- // -->
  <!-- images -->
  <!-- https://www.flaticon.com/free-icon/golf-field_2076961
    https://en.wikipedia.org/wiki/File:Great_Waters_at_Reynolds_Lake_Oconee_-_Oct_2019.jpg
-->

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
    <script src="https://kit.fontawesome.com/8fbf0cb444.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
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

      <div class="grid">
        <div id="grid-panel-1">
          <h1><img src="../img/golf-courses-icon.png" alt="icon" width="50" height="50">
          View Courses
          <img src="../img/golf-courses-icon.png" alt="icon" width="50" height="50">
          </h1>
          <hr>
        </div>
        <div id="grid-panel-2">
          <h1><img src="../img/golf-trophy.png" alt="trophy" width="50" height="50">
          View Tournaments
          <img src="../img/golf-trophy.png" alt="trophy" width="50" height="50">
          </h1>
          <hr>
        </div>
        <div id="grid-panel-3">
          <h1><img src="../img/golf-tour.png" alt="tour" width="50" height="50">
          View Tours
          <img src="../img/golf-tour.png" alt="tour" width="50" height="50">
          </h1>
          <hr>
        </div>
        <div id="grid-panel-4">
          <h1><img src="../img/golf-analysis.png" alt="trophy" width="50" height="50">
          View Statistics
          <img src="../img/golf-analysis.png" alt="trophy" width="50" height="50">
          </h1>
          <hr>
        </div>
      </div>
      

      <!-- inclusion of footer start -->
      <?php
        require_once("footer.php");
      ?>
      <!-- inclusion of footer end -->
      
    </div>
    <script src="../js/loader.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  </body>
</html>




