
<?php

if (strpos($_SERVER['SCRIPT_FILENAME'], 'login.php',0) == FALSE || strpos($_SERVER['SCRIPT_FILENAME'], 'signup.php',0) == FALSE)
{
    echo '<script src="../js/sideMenu.js"></script>';
}

    if (strpos($_SERVER['SCRIPT_FILENAME'], 'home.php',0) != FALSE)
    {
        echo '
            <div id="sideMenu" class ="sidenav" style="color: white;border-right:1px solid white">
                <a href="javascript:void(0)" class="closebtn" onclick="closeMenu()">&times Close</a>
                
                <h1 style="color:white; font-size: 30px">Menu</h1><hr>

                <a href="#">Home</a>
                <a href="organization.php">Organization</a>
                <a href="addresses.php">Addresses</a>
                <a href="locations.php">Locations</a>
                
                <div class="course-dropdown">
                    <a style="cursor:pointer" class="courses-btn">Courses
                    <span class="fas fa-caret-down first"></span></a>
                    <ul class="course-show">
                        <li><a href="viewCourses.php">View Courses</a></li>
                        <li><a href="viewHoles.php">View Holes</a></li>
                    </ul>
                    </a> 
                </div>                    

                <div class="tournament-dropdown">
                    <a style="cursor:pointer" class="tournaments-btn">Tournaments
                        <span class="fas fa-caret-down second"></span></a>
                        <ul class="tournament-show">
                            <li><a href="viewTournaments.php">View Tournaments</a></li>
                            <li><a href="schedule.php">Schedule</a></li>
                            <li><a href="registerPlayer.php">Register Player</a></li>
                        </ul>
                    </a>
                </div>                
                
                <a href="tours.php">Tours</a>
                <a href="manageUsers.php">Users</a>
                <a href="managePlayers.php">Players</a>
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
    else if (strpos($_SERVER['SCRIPT_FILENAME'], 'organization.php',0) != FALSE)
    {
        echo '
            <div id="sideMenu" class ="sidenav" style="color: white;border-right:1px solid white">
                <a href="javascript:void(0)" class="closebtn" onclick="closeMenu()">&times Close</a>
                
                <h1 style="color:white; font-size: 30px">Menu</h1><hr>

                <a href="home.php">Home</a>
                <a href="#">Organization</a>
                <a href="addresses.php">Addresses</a>
                <a href="locations.php">Locations</a>
                
                <div class="course-dropdown">
                    <a style="cursor:pointer" class="courses-btn">Courses
                    <span class="fas fa-caret-down first"></span></a>
                    <ul class="course-show">
                        <li><a href="viewCourses.php">View Courses</a></li>
                        <li><a href="viewHoles.php">View Holes</a></li>
                    </ul>
                    </a> 
                </div>                    

                <div class="tournament-dropdown">
                    <a style="cursor:pointer" class="tournaments-btn">Tournaments
                        <span class="fas fa-caret-down second"></span></a>
                        <ul class="tournament-show">
                            <li><a href="viewTournaments.php">View Tournaments</a></li>
                            <li><a href="schedule.php">Schedule</a></li>
                            <li><a href="registerPlayer.php">Register Player</a></li>
                        </ul>
                    </a>
                </div>                
                
                <a href="tours.php">Tours</a>
                <a href="manageUsers.php">Users</a>
                <a href="managePlayers.php">Players</a>
                <a href="scores.php">Scores</a>
                <a href="rounds.php">Rounds</a>
                <a href="media.php">Media</a>
                <a href="statistics.php">Statistics</a>               
            
            </div>
            <span class="active" style="color: white;font-size: 30px; cursor:pointer" onclick="openMenu()">&#9776; Organization</span>
            <div class="loginRegister">
                <a id="Login" href="login.php">Login</a>
                <a id="Register" href="signup.php">Sign Up</a>   
            </div>      
            ';
    }
    else  if (strpos($_SERVER['SCRIPT_FILENAME'], 'addresses.php',0) != FALSE)
    {
        echo '
            <div id="sideMenu" class ="sidenav" style="color: white;border-right:1px solid white">
                <a href="javascript:void(0)" class="closebtn" onclick="closeMenu()">&times Close</a>
                
                <h1 style="color:white; font-size: 30px">Menu</h1><hr>

                <a href="home.php">Home</a>
                <a href="organization.php">Organization</a>
                <a href="#">Addresses</a>
                <a href="locations.php">Locations</a>
                
                <div class="course-dropdown">
                    <a style="cursor:pointer" class="courses-btn">Courses
                    <span class="fas fa-caret-down first"></span></a>
                    <ul class="course-show">
                        <li><a href="viewCourses.php">View Courses</a></li>
                        <li><a href="viewHoles.php">View Holes</a></li>
                    </ul>
                    </a> 
                </div>                    

                <div class="tournament-dropdown">
                    <a style="cursor:pointer" class="tournaments-btn">Tournaments
                        <span class="fas fa-caret-down second"></span></a>
                        <ul class="tournament-show">
                            <li><a href="viewTournaments.php">View Tournaments</a></li>
                            <li><a href="schedule.php">Schedule</a></li>
                            <li><a href="registerPlayer.php">Register Player</a></li>
                        </ul>
                    </a>
                </div>                
                
                <a href="tours.php">Tours</a>
                <a href="manageUsers.php">Users</a>
                <a href="managePlayers.php">Players</a>
                <a href="scores.php">Scores</a>
                <a href="rounds.php">Rounds</a>
                <a href="media.php">Media</a>
                <a href="statistics.php">Statistics</a>               
            
            </div>
            <span class="active" style="color: white;font-size: 30px; cursor:pointer" onclick="openMenu()">&#9776; Addresses</span>
            <div class="loginRegister">
                <a id="Login" href="login.php">Login</a>
                <a id="Register" href="signup.php">Sign Up</a>   
            </div>      
            ';
    }
    else  if (strpos($_SERVER['SCRIPT_FILENAME'], 'locations.php',0) != FALSE)
    {
        echo '
            <div id="sideMenu" class ="sidenav" style="color: white;border-right:1px solid white">
                <a href="javascript:void(0)" class="closebtn" onclick="closeMenu()">&times Close</a>
                
                <h1 style="color:white; font-size: 30px">Menu</h1><hr>

                <a href="home.php">Home</a>
                <a href="organization.php">Organization</a>
                <a href="addresses.php">Addresses</a>
                <a href="#">Locations</a>
                
                <div class="course-dropdown">
                    <a style="cursor:pointer" class="courses-btn">Courses
                    <span class="fas fa-caret-down first"></span></a>
                    <ul class="course-show">
                        <li><a href="viewCourses.php">View Courses</a></li>
                        <li><a href="viewHoles.php">View Holes</a></li>
                    </ul>
                    </a> 
                </div>                    

                <div class="tournament-dropdown">
                    <a style="cursor:pointer" class="tournaments-btn">Tournaments
                        <span class="fas fa-caret-down second"></span></a>
                        <ul class="tournament-show">
                            <li><a href="viewTournaments.php">View Tournaments</a></li>
                            <li><a href="schedule.php">Schedule</a></li>
                            <li><a href="registerPlayer.php">Register Player</a></li>
                        </ul>
                    </a>
                </div>                
                
                <a href="tours.php">Tours</a>
                <a href="manageUsers.php">Users</a>
                <a href="managePlayers.php">Players</a>
                <a href="scores.php">Scores</a>
                <a href="rounds.php">Rounds</a>
                <a href="media.php">Media</a>
                <a href="statistics.php">Statistics</a>               
            
            </div>
            <span class="active" style="color: white;font-size: 30px; cursor:pointer" onclick="openMenu()">&#9776; Locations</span>
            <div class="loginRegister">
                <a id="Login" href="login.php">Login</a>
                <a id="Register" href="signup.php">Sign Up</a>   
            </div>      
            ';
    }
    else  if (strpos($_SERVER['SCRIPT_FILENAME'], 'viewCourses.php',0) != FALSE)
    {
        echo '
            <div id="sideMenu" class ="sidenav" style="color: white;border-right:1px solid white">
                <a href="javascript:void(0)" class="closebtn" onclick="closeMenu()">&times Close</a>
                
                <h1 style="color:white; font-size: 30px">Menu</h1><hr>

                <a href="home.php">Home</a>
                <a href="organization.php">Organization</a>
                <a href="addresses.php">Addresses</a>
                <a href="locations.php">Locations</a>
                
                <div class="course-dropdown">
                    <a style="cursor:pointer" class="courses-btn">Courses
                    <span class="fas fa-caret-down first"></span></a>
                    <ul class="course-show">
                        <li><a href="#">View Courses</a></li>
                        <li><a href="viewHoles.php">View Holes</a></li>
                    </ul>
                    </a> 
                </div>                    

                <div class="tournament-dropdown">
                    <a style="cursor:pointer" class="tournaments-btn">Tournaments
                        <span class="fas fa-caret-down second"></span></a>
                        <ul class="tournament-show">
                            <li><a href="viewTournaments.php">View Tournaments</a></li>
                            <li><a href="schedule.php">Schedule</a></li>
                            <li><a href="registerPlayer.php">Register Player</a></li>
                        </ul>
                    </a>
                </div>                
                
                <a href="tours.php">Tours</a>
                <a href="manageUsers.php">Users</a>
                <a href="managePlayers.php">Players</a>
                <a href="scores.php">Scores</a>
                <a href="rounds.php">Rounds</a>
                <a href="media.php">Media</a>
                <a href="statistics.php">Statistics</a>               
            
            </div>
            <span class="active" style="color: white;font-size: 30px; cursor:pointer" onclick="openMenu()">&#9776; Courses</span>
            <div class="loginRegister">
                <a id="Login" href="login.php">Login</a>
                <a id="Register" href="signup.php">Sign Up</a>   
            </div>      
            ';
    }
    else  if (strpos($_SERVER['SCRIPT_FILENAME'], 'viewHoles.php',0) != FALSE)
    {
        echo '
            <div id="sideMenu" class ="sidenav" style="color: white;border-right:1px solid white">
                <a href="javascript:void(0)" class="closebtn" onclick="closeMenu()">&times Close</a>
                
                <h1 style="color:white; font-size: 30px">Menu</h1><hr>

                <a href="home.php">Home</a>
                <a href="organization.php">Organization</a>
                <a href="addresses.php">Addresses</a>
                <a href="locations.php">Locations</a>
                
                <div class="course-dropdown">
                    <a style="cursor:pointer" class="courses-btn">Courses
                    <span class="fas fa-caret-down first"></span></a>
                    <ul class="course-show">
                        <li><a href="viewCourses.php">View Courses</a></li>
                        <li><a href="#">View Holes</a></li>
                    </ul>
                    </a> 
                </div>                    

                <div class="tournament-dropdown">
                    <a style="cursor:pointer" class="tournaments-btn">Tournaments
                        <span class="fas fa-caret-down second"></span></a>
                        <ul class="tournament-show">
                            <li><a href="viewTournaments.php">View Tournaments</a></li>
                            <li><a href="schedule.php">Schedule</a></li>
                            <li><a href="registerPlayer.php">Register Player</a></li>
                        </ul>
                    </a>
                </div>                
                
                <a href="tours.php">Tours</a>
                <a href="manageUsers.php">Users</a>
                <a href="managePlayers.php">Players</a>
                <a href="scores.php">Scores</a>
                <a href="rounds.php">Rounds</a>
                <a href="media.php">Media</a>
                <a href="statistics.php">Statistics</a>               
            
            </div>
            <span class="active" style="color: white;font-size: 30px; cursor:pointer" onclick="openMenu()">&#9776; View Holes</span>
            <div class="loginRegister">
                <a id="Login" href="login.php">Login</a>
                <a id="Register" href="signup.php">Sign Up</a>   
            </div>      
            ';
    }
    else  if (strpos($_SERVER['SCRIPT_FILENAME'], 'viewTournaments.php',0) != FALSE)
    {
        echo '
            <div id="sideMenu" class ="sidenav" style="color: white;border-right:1px solid white">
                <a href="javascript:void(0)" class="closebtn" onclick="closeMenu()">&times Close</a>
                
                <h1 style="color:white; font-size: 30px">Menu</h1><hr>

                <a href="home.php">Home</a>
                <a href="organization.php">Organization</a>
                <a href="addresses.php">Addresses</a>
                <a href="locations.php">Locations</a>
                
                <div class="course-dropdown">
                    <a style="cursor:pointer" class="courses-btn">Courses
                    <span class="fas fa-caret-down first"></span></a>
                    <ul class="course-show">
                        <li><a href="viewCourses.php">View Courses</a></li>
                        <li><a href="viewHoles.php">View Holes</a></li>
                    </ul>
                    </a> 
                </div>                    

                <div class="tournament-dropdown">
                    <a style="cursor:pointer" class="tournaments-btn">Tournaments
                        <span class="fas fa-caret-down second"></span></a>
                        <ul class="tournament-show">
                            <li><a href="#">View Tournaments</a></li>
                            <li><a href="schedule.php">Schedule</a></li>
                            <li><a href="registerPlayer.php">Register Player</a></li>
                        </ul>
                    </a>
                </div>                
                
                <a href="tours.php">Tours</a>
                <a href="manageUsers.php">Users</a>
                <a href="managePlayers.php">Players</a>
                <a href="scores.php">Scores</a>
                <a href="rounds.php">Rounds</a>
                <a href="media.php">Media</a>
                <a href="statistics.php">Statistics</a>               
            
            </div>
            <span class="active" style="color: white;font-size: 30px; cursor:pointer" onclick="openMenu()">&#9776; Tournaments</span>
            <div class="loginRegister">
                <a id="Login" href="login.php">Login</a>
                <a id="Register" href="signup.php">Sign Up</a>   
            </div>      
            ';
    }
    else  if (strpos($_SERVER['SCRIPT_FILENAME'], 'schedule.php',0) != FALSE)
    {
        echo '
            <div id="sideMenu" class ="sidenav" style="color: white;border-right:1px solid white">
                <a href="javascript:void(0)" class="closebtn" onclick="closeMenu()">&times Close</a>
                
                <h1 style="color:white; font-size: 30px">Menu</h1><hr>

                <a href="home.php">Home</a>
                <a href="organization.php">Organization</a>
                <a href="addresses.php">Addresses</a>
                <a href="locations.php">Locations</a>
                
                <div class="course-dropdown">
                    <a style="cursor:pointer" class="courses-btn">Courses
                    <span class="fas fa-caret-down first"></span></a>
                    <ul class="course-show">
                        <li><a href="viewCourses.php">View Courses</a></li>
                        <li><a href="viewHoles.php">View Holes</a></li>
                    </ul>
                    </a> 
                </div>                    

                <div class="tournament-dropdown">
                    <a style="cursor:pointer" class="tournaments-btn">Tournaments
                        <span class="fas fa-caret-down second"></span></a>
                        <ul class="tournament-show">
                            <li><a href="viewTournaments.php">View Tournaments</a></li>
                            <li><a href="#">Schedule</a></li>
                            <li><a href="registerPlayer.php">Register Player</a></li>
                        </ul>
                    </a>
                </div>                
                
                <a href="tours.php">Tours</a>
                <a href="manageUsers.php">Users</a>
                <a href="managePlayers.php">Players</a>
                <a href="scores.php">Scores</a>
                <a href="rounds.php">Rounds</a>
                <a href="media.php">Media</a>
                <a href="statistics.php">Statistics</a>               
            
            </div>
            <span class="active" style="color: white;font-size: 30px; cursor:pointer" onclick="openMenu()">&#9776; Tournament Schedule</span>
            <div class="loginRegister">
                <a id="Login" href="login.php">Login</a>
                <a id="Register" href="signup.php">Sign Up</a>   
            </div>      
            ';
    }
    else  if (strpos($_SERVER['SCRIPT_FILENAME'], 'registerPlayer.php',0) != FALSE)
    {
        echo '
            <div id="sideMenu" class ="sidenav" style="color: white;border-right:1px solid white">
                <a href="javascript:void(0)" class="closebtn" onclick="closeMenu()">&times Close</a>
                
                <h1 style="color:white; font-size: 30px">Menu</h1><hr>

                <a href="home.php">Home</a>
                <a href="organization.php">Organization</a>
                <a href="addresses.php">Addresses</a>
                <a href="locations.php">Locations</a>
                
                <div class="course-dropdown">
                    <a style="cursor:pointer" class="courses-btn">Courses
                    <span class="fas fa-caret-down first"></span></a>
                    <ul class="course-show">
                        <li><a href="viewCourses.php">View Courses</a></li>
                        <li><a href="viewHoles.php">View Holes</a></li>
                    </ul>
                    </a> 
                </div>                    

                <div class="tournament-dropdown">
                    <a style="cursor:pointer" class="tournaments-btn">Tournaments
                        <span class="fas fa-caret-down second"></span></a>
                        <ul class="tournament-show">
                            <li><a href="viewTournaments.php">View Tournaments</a></li>
                            <li><a href="schedule.php">Schedule</a></li>
                            <li><a href="#">Register Player</a></li>
                        </ul>
                    </a>
                </div>                
                
                <a href="tours.php">Tours</a>
                <a href="manageUsers.php">Users</a>
                <a href="managePlayers.php">Players</a>
                <a href="scores.php">Scores</a>
                <a href="rounds.php">Rounds</a>
                <a href="media.php">Media</a>
                <a href="statistics.php">Statistics</a>               
            
            </div>
            <span class="active" style="color: white;font-size: 30px; cursor:pointer" onclick="openMenu()">&#9776; Players Scores</span>
            <div class="loginRegister">
                <a id="Login" href="login.php">Login</a>
                <a id="Register" href="signup.php">Sign Up</a>   
            </div>      
            ';
    }
    else  if (strpos($_SERVER['SCRIPT_FILENAME'], 'tours.php',0) != FALSE)
    {
        echo '
            <div id="sideMenu" class ="sidenav" style="color: white;border-right:1px solid white">
                <a href="javascript:void(0)" class="closebtn" onclick="closeMenu()">&times Close</a>
                
                <h1 style="color:white; font-size: 30px">Menu</h1><hr>

                <a href="home.php">Home</a>
                <a href="organization.php">Organization</a>
                <a href="addresses.php">Addresses</a>
                <a href="locations.php">Locations</a>
                
                <div class="course-dropdown">
                    <a style="cursor:pointer" class="courses-btn">Courses
                    <span class="fas fa-caret-down first"></span></a>
                    <ul class="course-show">
                        <li><a href="viewCourses.php">View Courses</a></li>
                        <li><a href="viewHoles.php">View Holes</a></li>
                    </ul>
                    </a> 
                </div>                    

                <div class="tournament-dropdown">
                    <a style="cursor:pointer" class="tournaments-btn">Tournaments
                        <span class="fas fa-caret-down second"></span></a>
                        <ul class="tournament-show">
                            <li><a href="viewTournaments.php">View Tournaments</a></li>
                            <li><a href="schedule.php">Schedule</a></li>
                            <li><a href="registerPlayer.php">Register Player</a></li>
                        </ul>
                    </a>
                </div>                
                
                <a href="#">Tours</a>
                <a href="manageUsers.php">Users</a>
                <a href="managePlayers.php">Players</a>
                <a href="scores.php">Scores</a>
                <a href="rounds.php">Rounds</a>
                <a href="media.php">Media</a>
                <a href="statistics.php">Statistics</a>               
            
            </div>
            <span class="active" style="color: white;font-size: 30px; cursor:pointer" onclick="openMenu()">&#9776; Tours</span>
            <div class="loginRegister">
                <a id="Login" href="login.php">Login</a>
                <a id="Register" href="signup.php">Sign Up</a>   
            </div>      
            ';
    }
    else  if (strpos($_SERVER['SCRIPT_FILENAME'], 'manageUsers.php',0) != FALSE)
    {
        echo '
            <div id="sideMenu" class ="sidenav" style="color: white;border-right:1px solid white">
                <a href="javascript:void(0)" class="closebtn" onclick="closeMenu()">&times Close</a>
                
                <h1 style="color:white; font-size: 30px">Menu</h1><hr>

                <a href="home.php">Home</a>
                <a href="organization.php">Organization</a>
                <a href="addresses.php">Addresses</a>
                <a href="locations.php">Locations</a>
                
                <div class="course-dropdown">
                    <a style="cursor:pointer" class="courses-btn">Courses
                    <span class="fas fa-caret-down first"></span></a>
                    <ul class="course-show">
                        <li><a href="viewCourses.php">View Courses</a></li>
                        <li><a href="viewHoles.php">View Holes</a></li>
                    </ul>
                    </a> 
                </div>                    

                <div class="tournament-dropdown">
                    <a style="cursor:pointer" class="tournaments-btn">Tournaments
                        <span class="fas fa-caret-down second"></span></a>
                        <ul class="tournament-show">
                            <li><a href="viewTournaments.php">View Tournaments</a></li>
                            <li><a href="schedule.php">Schedule</a></li>
                            <li><a href="registerPlayer.php">Register Player</a></li>
                        </ul>
                    </a>
                </div>                
                
                <a href="tours.php">Tours</a>
                <a href="#">Users</a>
                <a href="managePlayers.php">Players</a>
                <a href="scores.php">Scores</a>
                <a href="rounds.php">Rounds</a>
                <a href="media.php">Media</a>
                <a href="statistics.php">Statistics</a>               
            
            </div>
            <span class="active" style="color: white;font-size: 30px; cursor:pointer" onclick="openMenu()">&#9776; Users</span>
            <div class="loginRegister">
                <a id="Login" href="login.php">Login</a>
                <a id="Register" href="signup.php">Sign Up</a>   
            </div>      
            ';
    }
    else  if (strpos($_SERVER['SCRIPT_FILENAME'], 'managePlayers.php',0) != FALSE)
    {
        echo '
            <div id="sideMenu" class ="sidenav" style="color: white;border-right:1px solid white">
                <a href="javascript:void(0)" class="closebtn" onclick="closeMenu()">&times Close</a>
                
                <h1 style="color:white; font-size: 30px">Menu</h1><hr>

                <a href="home.php">Home</a>
                <a href="organization.php">Organization</a>
                <a href="addresses.php">Addresses</a>
                <a href="locations.php">Locations</a>
                
                <div class="course-dropdown">
                    <a style="cursor:pointer" class="courses-btn">Courses
                    <span class="fas fa-caret-down first"></span></a>
                    <ul class="course-show">
                        <li><a href="viewCourses.php">View Courses</a></li>
                        <li><a href="viewHoles.php">View Holes</a></li>
                    </ul>
                    </a> 
                </div>                    

                <div class="tournament-dropdown">
                    <a style="cursor:pointer" class="tournaments-btn">Tournaments
                        <span class="fas fa-caret-down second"></span></a>
                        <ul class="tournament-show">
                            <li><a href="viewTournaments.php">View Tournaments</a></li>
                            <li><a href="schedule.php">Schedule</a></li>
                            <li><a href="registerPlayer.php">Register Player</a></li>
                        </ul>
                    </a>
                </div>                
                
                <a href="tours.php">Tours</a>
                <a href="manageUsers.php">Users</a>
                <a href="#">Players</a>
                <a href="scores.php">Scores</a>
                <a href="rounds.php">Rounds</a>
                <a href="media.php">Media</a>
                <a href="statistics.php">Statistics</a>               
            
            </div>
            <span class="active" style="color: white;font-size: 30px; cursor:pointer" onclick="openMenu()">&#9776; Players</span>
            <div class="loginRegister">
                <a id="Login" href="login.php">Login</a>
                <a id="Register" href="signup.php">Sign Up</a>   
            </div>      
            ';
    }
    else  if (strpos($_SERVER['SCRIPT_FILENAME'], 'scores.php',0) != FALSE)
    {
        echo '
            <div id="sideMenu" class ="sidenav" style="color: white;border-right:1px solid white">
                <a href="javascript:void(0)" class="closebtn" onclick="closeMenu()">&times Close</a>
                
                <h1 style="color:white; font-size: 30px">Menu</h1><hr>

                <a href="home.php">Home</a>
                <a href="organization.php">Organization</a>
                <a href="addresses.php">Addresses</a>
                <a href="locations.php">Locations</a>
                
                <div class="course-dropdown">
                    <a style="cursor:pointer" class="courses-btn">Courses
                    <span class="fas fa-caret-down first"></span></a>
                    <ul class="course-show">
                        <li><a href="viewCourses.php">View Courses</a></li>
                        <li><a href="viewHoles.php">View Holes</a></li>
                    </ul>
                    </a> 
                </div>                    

                <div class="tournament-dropdown">
                    <a style="cursor:pointer" class="tournaments-btn">Tournaments
                        <span class="fas fa-caret-down second"></span></a>
                        <ul class="tournament-show">
                            <li><a href="viewTournaments.php">View Tournaments</a></li>
                            <li><a href="schedule.php">Schedule</a></li>
                            <li><a href="registerPlayer.php">Register Player</a></li>
                        </ul>
                    </a>
                </div>                
                
                <a href="tours.php">Tours</a>
                <a href="manageUsers.php">Users</a>
                <a href="managePlayers.php">Players</a>
                <a href="#">Scores</a>
                <a href="rounds.php">Rounds</a>
                <a href="media.php">Media</a>
                <a href="statistics.php">Statistics</a>               
            
            </div>
            <span class="active" style="color: white;font-size: 30px; cursor:pointer" onclick="openMenu()">&#9776; Scores</span>
            <div class="loginRegister">
                <a id="Login" href="login.php">Login</a>
                <a id="Register" href="signup.php">Sign Up</a>   
            </div>      
            ';
    }
    else  if (strpos($_SERVER['SCRIPT_FILENAME'], 'rounds.php',0) != FALSE)
    {
        echo '
            <div id="sideMenu" class ="sidenav" style="color: white;border-right:1px solid white">
                <a href="javascript:void(0)" class="closebtn" onclick="closeMenu()">&times Close</a>
                
                <h1 style="color:white; font-size: 30px">Menu</h1><hr>

                <a href="home.php">Home</a>
                <a href="organization.php">Organization</a>
                <a href="addresses.php">Addresses</a>
                <a href="locations.php">Locations</a>
                
                <div class="course-dropdown">
                    <a style="cursor:pointer" class="courses-btn">Courses
                    <span class="fas fa-caret-down first"></span></a>
                    <ul class="course-show">
                        <li><a href="viewCourses.php">View Courses</a></li>
                        <li><a href="viewHoles.php">View Holes</a></li>
                    </ul>
                    </a> 
                </div>                    

                <div class="tournament-dropdown">
                    <a style="cursor:pointer" class="tournaments-btn">Tournaments
                        <span class="fas fa-caret-down second"></span></a>
                        <ul class="tournament-show">
                            <li><a href="viewTournaments.php">View Tournaments</a></li>
                            <li><a href="schedule.php">Schedule</a></li>
                            <li><a href="registerPlayer.php">Register Player</a></li>
                        </ul>
                    </a>
                </div>                
                
                <a href="tours.php">Tours</a>
                <a href="manageUsers.php">Users</a>
                <a href="managePlayers.php">Players</a>
                <a href="scores.php">Scores</a>
                <a href="#">Rounds</a>
                <a href="media.php">Media</a>
                <a href="statistics.php">Statistics</a>               
            
            </div>
            <span class="active" style="color: white;font-size: 30px; cursor:pointer" onclick="openMenu()">&#9776; Rounds</span>
            <div class="loginRegister">
                <a id="Login" href="login.php">Login</a>
                <a id="Register" href="signup.php">Sign Up</a>   
            </div>      
            ';
    }
    else  if (strpos($_SERVER['SCRIPT_FILENAME'], 'media.php',0) != FALSE)
    {
        echo '
            <div id="sideMenu" class ="sidenav" style="color: white;border-right:1px solid white">
                <a href="javascript:void(0)" class="closebtn" onclick="closeMenu()">&times Close</a>
                
                <h1 style="color:white; font-size: 30px">Menu</h1><hr>

                <a href="home.php">Home</a>
                <a href="organization.php">Organization</a>
                <a href="addresses.php">Addresses</a>
                <a href="locations.php">Locations</a>
                
                <div class="course-dropdown">
                    <a style="cursor:pointer" class="courses-btn">Courses
                    <span class="fas fa-caret-down first"></span></a>
                    <ul class="course-show">
                        <li><a href="viewCourses.php">View Courses</a></li>
                        <li><a href="viewHoles.php">View Holes</a></li>
                    </ul>
                    </a> 
                </div>                    

                <div class="tournament-dropdown">
                    <a style="cursor:pointer" class="tournaments-btn">Tournaments
                        <span class="fas fa-caret-down second"></span></a>
                        <ul class="tournament-show">
                            <li><a href="viewTournaments.php">View Tournaments</a></li>
                            <li><a href="schedule.php">Schedule</a></li>
                            <li><a href="registerPlayer.php">Register Player</a></li>
                        </ul>
                    </a>
                </div>                
                
                <a href="media.php">Tours</a>
                <a href="manageUsers.php">Users</a>
                <a href="managePlayers.php">Players</a>
                <a href="scores.php">Scores</a>
                <a href="rounds.php">Rounds</a>
                <a href="#">Media</a>
                <a href="statistics.php">Statistics</a>               
            
            </div>
            <span class="active" style="color: white;font-size: 30px; cursor:pointer" onclick="openMenu()">&#9776; Media</span>
            <div class="loginRegister">
                <a id="Login" href="login.php">Login</a>
                <a id="Register" href="signup.php">Sign Up</a>   
            </div>      
            ';
    }
    else  if (strpos($_SERVER['SCRIPT_FILENAME'], 'statistics.php',0) != FALSE)
    {
        echo '
            <div id="sideMenu" class ="sidenav" style="color: white;border-right:1px solid white">
                <a href="javascript:void(0)" class="closebtn" onclick="closeMenu()">&times Close</a>
                
                <h1 style="color:white; font-size: 30px">Menu</h1><hr>

                <a href="home.php">Home</a>
                <a href="organization.php">Organization</a>
                <a href="addresses.php">Addresses</a>
                <a href="locations.php">Locations</a>
                
                <div class="course-dropdown">
                    <a style="cursor:pointer" class="courses-btn">Courses
                    <span class="fas fa-caret-down first"></span></a>
                    <ul class="course-show">
                        <li><a href="viewCourses.php">View Courses</a></li>
                        <li><a href="viewHoles.php">View Holes</a></li>
                    </ul>
                    </a> 
                </div>                    

                <div class="tournament-dropdown">
                    <a style="cursor:pointer" class="tournaments-btn">Tournaments
                        <span class="fas fa-caret-down second"></span></a>
                        <ul class="tournament-show">
                            <li><a href="viewTournaments.php">View Tournaments</a></li>
                            <li><a href="schedule.php">Schedule</a></li>
                            <li><a href="registerPlayer.php">Register Player</a></li>
                        </ul>
                    </a>
                </div>                
                
                <a href="#">Tours</a>
                <a href="manageUsers.php">Users</a>
                <a href="managePlayers.php">Players</a>
                <a href="scores.php">Scores</a>
                <a href="rounds.php">Rounds</a>
                <a href="media.php">Media</a>
                <a href="#">Statistics</a>               
            
            </div>
            <span class="active" style="color: white;font-size: 30px; cursor:pointer" onclick="openMenu()">&#9776; Statistics</span>
            <div class="loginRegister">
                <a id="Login" href="login.php">Login</a>
                <a id="Register" href="signup.php">Sign Up</a>   
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