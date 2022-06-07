<?php //Wian Koekemoer
  session_start();
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Sunrise Golfing</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/home.css">
    <script src="../Sample Data/populatePublishers.js"></script>
    <script src="../Sample Data/populateLocations.js"></script>
    <script src="../Sample Data/populateAddresses.js"></script>
    <script src="../Sample Data/populateSites.js"></script>
    <script src="../Sample Data/populateHoles.js"></script>
    <script src="../Sample Data/populateAffiliations.js"></script>
    <script src="../Sample Data/populateTours.js"></script>
    <script src="../Sample Data/populateEvents.js"></script>
    <script src="../Sample Data/populatePersons.js"></script>
    <script src="../Sample Data/populateDisplayNames.js"></script>
    <script src="../Sample Data/populateAffEvents.js"></script>
    <script src="../Sample Data/populateRounds.js"></script>
    <script src="../Sample Data/popTournSched.js"></script>
    <script src="../Sample Data/populateStrokes.js"></script>
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

      <!-- inclusion of footer start -->
      <?php
        require_once("footer.php");
      ?>
      <!-- inclusion of footer end -->
      
    </div>
    <script src="../js/loader.js"></script>
    <script>
        // console.log(locations);
        // console.log(addresses);
        // console.log(sites);
        // console.log(holes);
        // console.log(affiliations);
        // console.log(tours);
        // console.log(events);
        // console.log(persons);
        // console.log(displayNames);

        popPubs(true);
        console.log("Done");

    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  </body>
</html>




