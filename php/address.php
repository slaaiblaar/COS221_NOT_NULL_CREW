<!-- This file is to represent the main menu page for the golfing website -->
<!-- background image taken from https://www.wallpaperflare.com/golf-high-resolution-desktop-backgrounds-golf-course-grass-wallpaper-hrhzv -->
<!-- icons included -->
  <!-- <a target="_blank" href="https://icons8.com/icon/EJ2ReOI6xOk3/golf-player">Golf Player</a> icon by <a target="_blank" href="https://icons8.com">Golf Player</a>
  <a target="_blank" href="https://icons8.com/icon/nOLgJplDUPQ4/golf">Golf</a> icon by <a target="_blank" href="https://icons8.com">Golf bag</a>
  <a target="_blank" href="https://icons8.com/icon/do6N9EHMyX0y/golf">Golf</a> icon by <a target="_blank" href="https://icons8.com">Golf cart</a>
  <a target="_blank" href="https://icons8.com/icon/zvuXdcGcdznE/golf">Golf</a> icon by <a target="_blank" href="https://icons8.com">Golf swing 1</a>
  <a target="_blank" href="https://icons8.com/icon/kXlPf6CIckW9/golf">Golf</a> icon by <a target="_blank" href="https://icons8.com">Golf swing 2</a>
  <a target="_blank" href="https://icons8.com/icon/gT2eJkI8NVD2/golf">Golf</a> icon by <a target="_blank" href="https://icons8.com">Golf Flag</a> -->
  <!-- // -->
  <!-- images -->
  <!-- https://www.flaticon.com/free-icon/golf-field_2076961 -->

  <?php
  session_start();
  include_once('address_config.php');
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
          <!-- <div id="scrollDiv"> -->
          <table>
            <thead><tr class="top">
              <th><h3>Id</h3></th>
              <th><h3>Location Id</h3></th>
              <th><h3>Language</h3></th>
              <th><h3>Street Number</h3></th>
              <th><h3>Street</h3></th>
              <th><h3>Country</h3></th>
            </tr></thead>
            <tbody>
            <?php
            $dbCon = Database::getInstance();
            // for ($x=0; $x<20;$x++)
            // {
            //   console_log($dbCon->addAddress(1,"en-US", strval($x), "Test Street", "South Africa"));
            // }
            $response = $dbCon->getAddresses();
            if ($response['success'])
            {
              $data = $response['result'];

              foreach($data as $row)
              {
                echo "<tr><td class='id'>".$row['id']."</td>
                <td class='location_id'>".$row['location_id']."</td>
                <td class='language'>".$row['language']."</td>
                <td class='street_number'>".$row['street_number']."</td>
                <td class='street'>".$row['street']."</td>
                <td class='country'>".$row['country']."</td></tr>";
              }
            }
            else
            {
              echo '<h1>Database Retrieval Error</h1>';
            }
            ?>
            </tbody>
          </table><!--</div> -->
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




