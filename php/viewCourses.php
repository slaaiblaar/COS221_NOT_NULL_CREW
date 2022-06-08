<?php //Wian Kokemeoer u19043512
  session_start();
  require_once("setDBEnvVar.php");
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Sunrise Golfing</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/courses.css">
    <link rel="stylesheet" href="../css/controls_and_tables.css">
    <script src="https://kit.fontawesome.com/8fbf0cb444.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  </head>
  
  <body>
    <div class="loaderFlag">
      <div>
          <img src="../img/flag-in-hole-joypixels.gif" alt="Flag Loader">
      </div>
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
        <h1>Manage Courses</h1>
        <hr>
        <div id="secondaryContainer">
          <div id="controls">
            <h2>Controls</h2>
            <div style="padding:0 10px; margin: auto">
              <button class="controlButton" id="add" onclick="add()"><h2>Add Course</h2></button>
              <button class="controlButton" id="modify" onclick="mod()"><h2>Modify Course</h2></button>
              <button class="controlButton" id="delete" onclick="del()"><h2>Delete Course</h2></button>
            </div>
          </div>
          <div id="tableContainer">
            <table id="table">
              <thead><tr>
                <th><h3>ID</h3></th>
                <th><h3>Course Key</h3></th>
                <th><h3>Publisher ID</h3></th>
                <th><h3>Location ID</h3></th>
                <th><h3>Address ID</h3></th>
                </tr>
              </thead>
              <tbody>
              </tbody>
            </table>
          </div>
        </div>
        <div class="popup" id="addPopup">
          <div id="addForm">
            <h1>Add Course</h1>
            <hr>
            <h3>Course Key</h3>
            <input class="inputField" oninput="disableButtons()" type="text"></input>
            <h3>Publisher ID</h3>
            <input class="inputField" oninput="disableButtons()" type="text"></input>
            <h3>Location ID</h3>
            <input class="inputField" oninput="disableButtons()" type="text"></input>
            <h3>Address ID</h3>
            <input class="inputField" oninput="disableButtons()" type="text"></input>
            <div>
              <button class="cancelButton" onclick="cancelAdd()"><h2>Cancel</h2></button>
              <button class="validateButton" onclick="validateAdd()"><h2>Validate</h2></button>
            </div>
            <button id="addButton" onclick="confirmAdd()" disabled><h2>Confirm</h2></button>
          </div>
        </div>
        <div class="popup" id="modPopup">
          <div id="modForm">
            <h1>Modify Course</h1>
            <hr>
            <h3>Course ID</h3>
            <input class="inputField" type="text" disabled></input>
            <h3>Course Key</h3>
            <input class="inputField" oninput="disableButtons()" type="text"></input>
            <h3>Publisher ID</h3>
            <input class="inputField" oninput="disableButtons()" type="text"></input>
            <h3>Location ID</h3>
            <input class="inputField" oninput="disableButtons()" type="text"></input>
            <h3>Address ID</h3>
            <input class="inputField" oninput="disableButtons()" type="text"></input>
            <div>
              <button class="cancelButton" onclick="cancelMod()"><h2>Cancel</h2></button>
              <button class="validateButton" onclick="validateMod()"><h2>Validate</h2></button>
            </div>
            <button id="modButton" onclick="confirmMod()" disabled><h2>Confirm</h2></button>
          </div>
        </div>
        <div class="popup" id="delPopup">
          <div id="delForm">
            <h1>Delete Course</h1>
            <hr>
            <h3>Course ID</h3>
            <input class="inputField" type="text" disabled></input>
            <h3>Course Key</h3>
            <input class="inputField" type="text" disabled></input>
            <h3>Publisher ID</h3>
            <input class="inputField" type="text" disabled></input>
            <h3>Location ID</h3>
            <input class="inputField" type="text" disabled></input>
            <h3>Address ID</h3>
            <input class="inputField" type="text" disabled></input>
            <div>
              <button class="cancelButton" onclick="cancelDel()"><h2>Cancel</h2></button>
              <button class="confirmButton" onclick="confirmDel()"><h2>Confirm</h2></button>
            </div>
          </div>
        </div>
      </div>
      
      

      <!-- inclusion of footer start -->
      <?php
        require_once("footer.php");
      ?>
      <!-- inclusion of footer end -->
      
    </div>
    <script language="Javascript" type="text/javascript" src="../js/loaderFlag.js"></script>
    <script language="Javascript" type="text/javascript" src="../js/viewCourses.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  </body>
</html>




