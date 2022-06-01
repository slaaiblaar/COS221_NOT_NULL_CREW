<!-- <div>
                <nav class="topnav">
                <ul>
                    <li><a class="active" href="#">Home</a></li>
                    <li><a href="courses.php">Courses</a></li>
                    <li><a href="?????">Tab 2 Name</a></li>
                    <li><a href="?????">Tab 3 Name</a></li>
                    <li id="Login"><a href="">Login</a></li>
                    <li id="Register"><a href="">Sign Up</a></li>
                    <li><a href="?????">Tab 4 Name</a></li>
                </ul>
                </nav>
            </div> -->
<?php

echo '<script src="../js/sideMenu.js"></script>';

    if (strpos($_SERVER['SCRIPT_FILENAME'], 'home.php',0) != FALSE)
    {
        echo '
            <div class="menu-btn">
                <span class="fas fa-bars"></span>
            </div>
            <nav class="sidebar">
                <div class="text">Menu</div>
                <ul>
                    <li><a href="organization.php">Organization</li>
                    <li><a href="address.php">Addresses</li>
                    <li><a href="location.php">Locations</li>
                    <li>
                        <a href="#" class="courses-btn">Courses
                            <span class="fas fa-caret-down first"></span>
                        </a>
                        <ul class="course-show">
                            <li><a href="courses.php">View Courses</li>
                            <li><a href="holes.php">View Holes</li>
                        </ul>                    
                    </li>
                    <li>
                        <a href="#" class="tournaments-btn">Tournaments
                            <span class="fas fa-caret-down second"></span>
                        </a>
                        <ul class="tournament-show">
                            <li><a href="tournaments.php">View Tournaments</li>
                            <li><a href="schedule.php">Schedule</li>
                            <li><a href="registerPlayers.php">Register Player</li>
                        </ul>                    
                    </li>
                    <li><a href="tour.php">Tours</li>
                    <li><a href="users.php">Users</li>
                    <li><a href="players.php">Players</li>
                    <li><a href="scores.php">Scores</li>
                    <li><a href="rounds.php">Rounds</li>
                    <li><a href="media.php">Media</li>
                    <li><a href="stats.php">Statistics</li>
                </ul>
            </nav>
            
            <span class="active" style="color: white;font-size: 30px; cursor:pointer" onclick="openMenu()">&#9776; Home</span>
            <div class="loginRegister">
                <a id="Login" href="">Login</a>
                <a id="Register" href="">Sign Up</a>   
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

?>