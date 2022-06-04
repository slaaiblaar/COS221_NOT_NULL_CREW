
<?php

    echo '<script src="../js/sideMenu.js" defer></script>';

    if (strpos($_SERVER['SCRIPT_FILENAME'], 'home.php',0) != FALSE)
    {
        echo '
            <div id="sideMenu" class ="sidenav" style="color: white">
                <a href="javascript:void(0)" class="closebtn" onclick="closeMenu()">&times Close</a>
                
                <h1 style="color:white; font-size: 30px">Menu</h1><hr>

                <a href="organization.php">Organization</a>
                <a href="addresses.php">Addresses</a>
                <a href="locations.php">Locations</a>
                
                <div class="course-dropdown">
                    <a href="#" class="courses-btn">Courses
                    <span class="fas fa-caret-down first"></span></a>
                    <ul class="course-show">
                        <li><a href="viewCourses.php">View Courses</a></li>
                        <li><a href="viewHoles.php">View Holes</a></li>
                    </ul>
                    </a> 
                </div>                    

                <div class="tournament-dropdown">
                    <a href="#" class="tournaments-btn">Tournaments
                        <span class="fas fa-caret-down second"></span></a>
                        <ul class="tournament-show">
                            <li><a href="viewTournaments.php">View Tournaments</a></li>
                            <li><a href="schedule.php">Schedule</a></li>
                            <li><a href="registerPlayer.php">Register Player</a></li>
                        </ul>
                    </a>
                </div>                
                
                <a href="tours.php">Tours</a>
                <a href="users.php">Users</a>
                <a href="players.php">Players</a>
                <a href="scores.php">Scores</a>
                <a href="rounds.php">Rounds</a>
                <a href="media.php">Media</a>
                <a href="statistics.php">Statistics</a>               
            
            </div>
            <span class="active" style="color: white;font-size: 30px; cursor:pointer" onclick="openMenu()">&#9776; Home</span>
            <div class="loginRegister">
                <a id="Login" href="login.php">Login</a>
                <a id="Register" href="signup.php">Sign Up</a>   
            </div>      
            ';
    }
    else if (strpos($_SERVER['SCRIPT_FILENAME'], 'courses.php',0) != FALSE)
    {
        echo '
            <div>
                <nav class="topnav">
                <ul>
                    <li><a href="home.php">Home</a></li>
                    <li><a class="active" href="#">Courses</a></li>
                    <li><a href="?????">Tab 2 Name</a></li>
                    <li><a href="?????">Tab 3 Name</a></li>
                    <li id="Login"><a href="">Login</a></li>
                    <li id="Register"><a href="">Sign Up</a></li>
                    <li><a href="?????">Tab 4 Name</a></li>
                </ul>
                </nav>
            </div>
            ';
    }
    else if(strpos($_SERVER['SCRIPT_FILENAME'], 'managePlayers.php',0)!= FALSE){
        echo '
            <div>
                <nav class="topnav">
                <ul>
                    <li><a href="home.php">Home</a></li>
                    <li><a href="courses.php">Courses</a></li>
                    <li><a href="?????">Tab 2 Name</a></li>
                    <li><a href="?????">Tab 3 Name</a></li>
                    <li id="Login"><a href="">Login</a></li>
                    <li id="Register"><a href="">Sign Up</a></li>
                    <li><a href="?????">Tab 4 Name</a></li>
                </ul>
                </nav>
            </div>
        ';
    }
    else if(strpos($_SERVER['SCRIPT_FILENAME'], 'manageUsers.php',0) != FALSE){
        echo '
        <div>
            <nav class="topnav">
            <ul>
                <li><a href="home.php">Home</a></li>
                <li><a href="courses.php">Courses</a></li>
                <li><a href="?????">Tab 2 Name</a></li>
                <li><a href="?????">Tab 3 Name</a></li>
                <li id="Login"><a href="">Login</a></li>
                <li id="Register"><a href="">Sign Up</a></li>
                <li><a href="?????">Tab 4 Name</a></li>
            </ul>
            </nav>
        </div>
        ';
    }

?>