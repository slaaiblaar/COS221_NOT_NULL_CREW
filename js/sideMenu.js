function openMenu(){

    //home page
    if (window.location.pathname === "/COS221_NOT_NULL_CREW/php/home.php")
    {
        document.querySelector(".sidenav a").classList.toggle("show");
        document.getElementById("sideMenu").style.width = "250px";
        document.querySelector(".top-content").style.backgroundColor = "rgba(0, 108, 32,0.7)";
        document.querySelector("#webTitle").style.backgroundColor = "transparent";
        document.querySelector("#webTitle").style.color = "rgba(255, 255, 255,0.7)";
        document.querySelector(".content").style.backgroundColor = "rgba(0,0,0,0.7)";
        document.querySelector(".content").style.color = "rgba(0,0,0,0.7)";
        document.querySelector(".loginRegister").style.backgroundColor = "rgba(0, 108, 32,0.7)";
        document.querySelector("#Login").style.color = "rgba(255, 255, 255,0.5)";
        document.querySelector("#Register").style.color = "rgba(255, 255, 255,0.5)";
        document.querySelector("#Login").style.pointerEvents = "none";
        document.querySelector("#Register").style.pointerEvents = "none";
        document.querySelector(".loginRegister").style.pointerEvents = "none";
        document.querySelector("#sideMenu").style.pointerEvents = "auto";
        document.querySelector("#grid-panel-1").style.backgroundColor = "rgba(140, 143, 141,0.9)";
        $("#courses-img").hide();
        $("#courses-dark-img").show();
        document.querySelector("#courses-btn").style.backgroundColor = "rgba(2, 186, 85,0.7)";
        document.querySelector("#courses-btn").style.pointerEvents = "none";
        document.querySelector("#grid-panel-2").style.backgroundColor = "rgba(140, 143, 141,0.9)";
        $("#tournaments-img").hide();
        $("#tournaments-dark-img").show();
        document.querySelector("#tournaments-btn").style.backgroundColor = "rgba(2, 186, 85,0.7)";
        document.querySelector("#tournaments-btn").style.pointerEvents = "none";
        document.querySelector("#grid-panel-3").style.backgroundColor = "rgba(140, 143, 141,0.9)";
        $("#tours-img").hide();
        $("#tours-dark-img").show();
        document.querySelector("#tours-btn").style.backgroundColor = "rgba(2, 186, 85,0.7)";
        document.querySelector("#tours-btn").style.pointerEvents = "none";
        document.querySelector("#grid-panel-4").style.backgroundColor = "rgba(140, 143, 141,0.9)";
        $("#statistics-img").hide();
        $("#statistics-dark-img").show();
        document.querySelector("#statistics-btn").style.backgroundColor = "rgba(2, 186, 85,0.7)";
        document.querySelector("#statistics-btn").style.pointerEvents = "none";
        document.querySelector('.footer').style.color = "rgba(255, 255, 255,0.7)";
    }
    //organization
    else if(window.location.pathname === "/COS221_NOT_NULL_CREW/php/organization.php")
    {

    }
    //addresses
    else if(window.location.pathname === "/COS221_NOT_NULL_CREW/php/addresses.php")
    {

    }
    //locations
    else if(window.location.pathname === "/COS221_NOT_NULL_CREW/php/locations.php")
    {

    }
    //courses
    else if(window.location.pathname === "/COS221_NOT_NULL_CREW/php/viewCourses.php")
    {

    }
    //holes
    else if(window.location.pathname === "/COS221_NOT_NULL_CREW/php/viewHoles.php")
    {

    }
    //tournaments
    else if(window.location.pathname === "/COS221_NOT_NULL_CREW/php/viewTournaments.php")
    {
        document.querySelector(".sidenav a").classList.toggle("show");
        document.getElementById("sideMenu").style.width = "250px";
        document.querySelector(".top-content").style.backgroundColor = "rgba(0, 108, 32,0.7)";
        document.querySelector("#webTitle").style.backgroundColor = "transparent";
        document.querySelector("#webTitle").style.color = "rgba(255, 255, 255,0.7)";
        document.querySelector(".content").style.backgroundColor = "rgba(0,0,0,0.7)";
        document.querySelector(".content").style.color = "rgba(0,0,0,0.7)";
        document.querySelector(".loginRegister").style.backgroundColor = "rgba(0, 108, 32,0.7)";
        document.querySelector("#Login").style.color = "rgba(255, 255, 255,0.5)";
        document.querySelector("#Register").style.color = "rgba(255, 255, 255,0.5)";
        document.querySelector("#Login").style.pointerEvents = "none";
        document.querySelector("#Register").style.pointerEvents = "none";
        document.querySelector(".loginRegister").style.pointerEvents = "none";
        document.querySelector("#sideMenu").style.pointerEvents = "auto";
        document.querySelector(".buttonsGrid").style.backgroundColor = "rgba(140, 143, 141,0.9)";
        document.querySelector(".tableGrid").style.backgroundColor = "rgba(140, 143, 141,0.9)";
        document.querySelector("#createNewTournament").style.backgroundColor = "rgba(179, 179, 90,0.9)";
        document.querySelector("#createNewTournament").style.color = "rgba(0, 0, 0,0.7)";
        document.querySelector("#deleteTournament").style.backgroundColor = "rgba(130, 0, 0,0.9)";
        document.querySelector("#deleteTournament").style.color = "rgba(0, 0, 0,0.7)";
        document.querySelector("#filterTable").style.backgroundColor = "rgba(0, 130, 3,0.9)";
        document.querySelector("#filterTable").style.color = "rgba(0, 0, 0,0.7)";
        document.querySelector("#updateTournamentData").style.backgroundColor = "rgba(0, 130, 3,0.9)";
        document.querySelector("#updateTournamentData").style.color = "rgba(0, 0, 0,0.7)";
        document.querySelector("#createNewTournament").style.pointerEvents = "none";
        document.querySelector("#deleteTournament").style.pointerEvents = "none";
        document.querySelector("#filterTable").style.pointerEvents = "none";
        document.querySelector("#updateTournamentData").style.pointerEvents = "none";
        document.querySelector('.footer').style.color = "rgba(255, 255, 255,0.7)";
    }
    //schedule
    else if(window.location.pathname === "/COS221_NOT_NULL_CREW/php/schedule.php")
    {
        document.querySelector(".sidenav a").classList.toggle("show");
        document.getElementById("sideMenu").style.width = "250px";
        document.querySelector(".top-content").style.backgroundColor = "rgba(0, 108, 32,0.7)";
        document.querySelector("#webTitle").style.backgroundColor = "transparent";
        document.querySelector("#webTitle").style.color = "rgba(255, 255, 255,0.7)";
        document.querySelector(".content").style.backgroundColor = "rgba(0,0,0,0.7)";
        document.querySelector(".content").style.color = "rgba(0,0,0,0.7)";
        document.querySelector(".loginRegister").style.backgroundColor = "rgba(0, 108, 32,0.7)";
        document.querySelector("#Login").style.color = "rgba(255, 255, 255,0.5)";
        document.querySelector("#Register").style.color = "rgba(255, 255, 255,0.5)";
        document.querySelector("#Login").style.pointerEvents = "none";
        document.querySelector("#Register").style.pointerEvents = "none";
        document.querySelector(".loginRegister").style.pointerEvents = "none";
        document.querySelector("#sideMenu").style.pointerEvents = "auto";
        document.querySelector(".buttonsGrid").style.backgroundColor = "rgba(140, 143, 141,0.9)";
        document.querySelector(".tableGrid").style.backgroundColor = "rgba(140, 143, 141,0.9)";
        document.querySelector("#filterTable").style.backgroundColor = "rgba(0, 130, 3,0.9)";
        document.querySelector("#filterTable").style.color = "rgba(0, 0, 0,0.7)";
        document.querySelector("#filterTable").style.pointerEvents = "none";
        document.querySelector('.footer').style.color = "rgba(255, 255, 255,0.7)";
    }
    //registerPlayer
    else if(window.location.pathname === "/COS221_NOT_NULL_CREW/php/registerPlayer.php")
    {
        document.querySelector(".sidenav a").classList.toggle("show");
        document.getElementById("sideMenu").style.width = "250px";
        document.querySelector(".top-content").style.backgroundColor = "rgba(0, 108, 32,0.7)";
        document.querySelector("#webTitle").style.backgroundColor = "transparent";
        document.querySelector("#webTitle").style.color = "rgba(255, 255, 255,0.7)";
        document.querySelector(".content").style.backgroundColor = "rgba(0,0,0,0.7)";
        document.querySelector(".content").style.color = "rgba(0,0,0,0.7)";
        document.querySelector(".loginRegister").style.backgroundColor = "rgba(0, 108, 32,0.7)";
        document.querySelector("#Login").style.color = "rgba(255, 255, 255,0.5)";
        document.querySelector("#Register").style.color = "rgba(255, 255, 255,0.5)";
        document.querySelector("#Login").style.pointerEvents = "none";
        document.querySelector("#Register").style.pointerEvents = "none";
        document.querySelector(".loginRegister").style.pointerEvents = "none";
        document.querySelector("#sideMenu").style.pointerEvents = "auto";
        document.querySelector(".buttonsGrid").style.backgroundColor = "rgba(140, 143, 141,0.9)";
        document.querySelector(".tableGrid").style.backgroundColor = "rgba(140, 143, 141,0.9)";
        document.querySelector("#filterTable").style.backgroundColor = "rgba(0, 130, 3,0.9)";
        document.querySelector("#filterTable").style.color = "rgba(0, 0, 0,0.7)";
        document.querySelector("#filterTable").style.pointerEvents = "none";
        document.querySelector('.footer').style.color = "rgba(255, 255, 255,0.7)";
    }
    //tour
    else if(window.location.pathname === "/COS221_NOT_NULL_CREW/php/tour.php")
    {

    }
    //users
    else if(window.location.pathname === "/COS221_NOT_NULL_CREW/php/manageUsers.php")
    {
        
        document.querySelector(".sidenav a").classList.toggle("show");
        document.getElementById("sideMenu").style.width = "250px";
        document.querySelector(".top-content").style.backgroundColor = "rgba(0, 108, 32,0.7)";
        document.querySelector("#webTitle").style.backgroundColor = "transparent";
        document.querySelector("#webTitle").style.color = "rgba(255, 255, 255,0.7)";
        document.querySelector(".content").style.backgroundColor = "rgba(0,0,0,0.7)";
        document.querySelector(".content").style.color = "rgba(0,0,0,0.7)";
        document.querySelector(".loginRegister").style.backgroundColor = "rgba(0, 108, 32,0.7)";
        document.querySelector("#Login").style.color = "rgba(255, 255, 255,0.5)";
        document.querySelector("#Register").style.color = "rgba(255, 255, 255,0.5)";
        document.querySelector("#Login").style.pointerEvents = "none";
        document.querySelector("#Register").style.pointerEvents = "none";
        document.querySelector(".loginRegister").style.pointerEvents = "none";
        document.querySelector("#sideMenu").style.pointerEvents = "auto";
        document.querySelector(".buttonsGrid").style.backgroundColor = "rgba(140, 143, 141,0.9)";
        document.querySelector(".tableGrid").style.backgroundColor = "rgba(140, 143, 141,0.9)";
        document.querySelector("#createNewUser").style.backgroundColor = "rgba(179, 179, 90,0.9)";
        document.querySelector("#createNewUser").style.color = "rgba(0, 0, 0,0.7)";
        document.querySelector("#deleteUser").style.backgroundColor = "rgba(130, 0, 0,0.9)";
        document.querySelector("#deleteUser").style.color = "rgba(0, 0, 0,0.7)";
        document.querySelector("#filterTable").style.backgroundColor = "rgba(0, 130, 3,0.9)";
        document.querySelector("#filterTable").style.color = "rgba(0, 0, 0,0.7)";
        document.querySelector("#updateUserData").style.backgroundColor = "rgba(0, 130, 3,0.9)";
        document.querySelector("#updateUserData").style.color = "rgba(0, 0, 0,0.7)";
        document.querySelector("#createNewUser").style.pointerEvents = "none";
        document.querySelector("#deleteUser").style.pointerEvents = "none";
        document.querySelector("#filterTable").style.pointerEvents = "none";
        document.querySelector("#updateUserData").style.pointerEvents = "none";
        document.querySelector('.footer').style.color = "rgba(255, 255, 255,0.7)";
    }
    //players
    else if(window.location.pathname === "/COS221_NOT_NULL_CREW/php/managePlayers.php")
    {
        document.querySelector(".sidenav a").classList.toggle("show");
        document.getElementById("sideMenu").style.width = "250px";
        document.querySelector(".top-content").style.backgroundColor = "rgba(0, 108, 32,0.7)";
        document.querySelector("#webTitle").style.backgroundColor = "transparent";
        document.querySelector("#webTitle").style.color = "rgba(255, 255, 255,0.7)";
        document.querySelector(".content").style.backgroundColor = "rgba(0,0,0,0.7)";
        document.querySelector(".content").style.color = "rgba(0,0,0,0.7)";
        document.querySelector(".loginRegister").style.backgroundColor = "rgba(0, 108, 32,0.7)";
        document.querySelector("#Login").style.color = "rgba(255, 255, 255,0.5)";
        document.querySelector("#Register").style.color = "rgba(255, 255, 255,0.5)";
        document.querySelector("#Login").style.pointerEvents = "none";
        document.querySelector("#Register").style.pointerEvents = "none";
        document.querySelector(".loginRegister").style.pointerEvents = "none";
        document.querySelector("#sideMenu").style.pointerEvents = "auto";
        document.querySelector(".buttonsGrid").style.backgroundColor = "rgba(140, 143, 141,0.9)";
        document.querySelector(".tableGrid").style.backgroundColor = "rgba(140, 143, 141,0.9)";
        document.querySelector("#createNewPlayer").style.backgroundColor = "rgba(179, 179, 90,0.9)";
        document.querySelector("#createNewPlayer").style.color = "rgba(0, 0, 0,0.7)";
        document.querySelector("#deletePlayer").style.backgroundColor = "rgba(130, 0, 0,0.9)";
        document.querySelector("#deletePlayer").style.color = "rgba(0, 0, 0,0.7)";
        document.querySelector("#filterTable").style.backgroundColor = "rgba(0, 130, 3,0.9)";
        document.querySelector("#filterTable").style.color = "rgba(0, 0, 0,0.7)";
        document.querySelector("#updatePlayerData").style.backgroundColor = "rgba(0, 130, 3,0.9)";
        document.querySelector("#updatePlayerData").style.color = "rgba(0, 0, 0,0.7)";
        document.querySelector("#createNewPlayer").style.pointerEvents = "none";
        document.querySelector("#deletePlayer").style.pointerEvents = "none";
        document.querySelector("#filterTable").style.pointerEvents = "none";
        document.querySelector("#updatePlayerData").style.pointerEvents = "none";
        document.querySelector('.footer').style.color = "rgba(255, 255, 255,0.7)";
    }
    //scores
    else if(window.location.pathname === "/COS221_NOT_NULL_CREW/php/scores.php")
    {

    }
    //rounds
    else if(window.location.pathname === "/COS221_NOT_NULL_CREW/php/rounds.php")
    {

    }
    //media
    else if(window.location.pathname === "/COS221_NOT_NULL_CREW/php/media.php")
    {

    }
    //statistics
    else if(window.location.pathname === "/COS221_NOT_NULL_CREW/php/statistics.php")
    {

    }

    $(document).click(function(e) 
    { 
    var target = e.target; 
    if (!$(target).is('.sidenav') && !$(target).is('.active') && e.pageX > 250 ) 
    //{ $('.dropdown').hide(); }
      { closeMenu();
        // $('.courses-btn').css("color","#818181");
      }
    });
}

function closeMenu(){

    //home
    if (window.location.pathname === "/COS221_NOT_NULL_CREW/php/home.php")
    {
        document.querySelector(".sidenav a").classList.toggle("show");
        document.getElementById("sideMenu").style.width = "0";
        document.querySelector(".top-content").style.backgroundColor = "rgba(0, 108, 32,1)";
        document.querySelector("#webTitle").style.backgroundColor = "rgba(0, 108, 32,1)";
        document.querySelector("#webTitle").style.color = "rgba(255, 255, 255,1)";
        document.querySelector(".content").style.backgroundColor = "rgba(0,0,0,0)";
        document.querySelector(".content").style.color = "black";
        document.querySelector(".loginRegister").style.backgroundColor = "rgba(0, 108, 32,1)";
        document.querySelector(".loginRegister").style.color = "rgba(255, 255, 255,1)";
        document.querySelector("#Login").style.color = "rgba(255, 255, 255,1)";
        document.querySelector("#Register").style.color = "rgba(255, 255, 255,1)";
        document.querySelector("#Login").style.pointerEvents = "auto";
        document.querySelector("#Register").style.pointerEvents = "auto";
        document.querySelector("#sideMenu").style.pointerEvents = "auto";
        document.querySelector(".loginRegister").style.pointerEvents = "auto";
        document.querySelector("#grid-panel-1").style.backgroundColor = "rgba(255, 255, 255,0.9)";
        $("#courses-dark-img").hide();
        $("#courses-img").show();
        document.querySelector("#courses-btn").style.backgroundColor = "rgba(144, 238, 144,1)";
        document.querySelector("#courses-btn").style.pointerEvents = "auto";
        document.querySelector("#grid-panel-2").style.backgroundColor = "rgba(255, 255, 255,0.9)";
        $("#tournaments-dark-img").hide();
        $("#tournaments-img").show();
        document.querySelector("#tournaments-btn").style.backgroundColor = "rgba(144, 238, 144,1)";
        document.querySelector("#tournaments-btn").style.pointerEvents = "auto";
        document.querySelector("#grid-panel-3").style.backgroundColor = "rgba(255, 255, 255,0.9)";
        $("#tours-dark-img").hide();
        $("#tours-img").show();
        document.querySelector("#tours-btn").style.backgroundColor = "rgba(144, 238, 144,1)";
        document.querySelector("#tours-btn").style.pointerEvents = "auto";
        document.querySelector("#grid-panel-4").style.backgroundColor = "rgba(255, 255, 255,0.9)";
        $("#statistics-dark-img").hide();
        $("#statistics-img").show();
        document.querySelector("#statistics-btn").style.backgroundColor = "rgba(144, 238, 144,1)";
        document.querySelector("#statistics-btn").style.pointerEvents = "auto";
        document.querySelector('.footer').style.color = "rgba(255, 255, 255,1)";
    }
    //organization
    else if(window.location.pathname === "/COS221_NOT_NULL_CREW/php/organization.php")
    {

    }
    //addresses
    else if(window.location.pathname === "/COS221_NOT_NULL_CREW/php/addresses.php")
    {

    }
    //locations
    else if(window.location.pathname === "/COS221_NOT_NULL_CREW/php/locations.php")
    {

    }
    //courses
    else if(window.location.pathname === "/COS221_NOT_NULL_CREW/php/viewCourses.php")
    {

    }
    //holes
    else if(window.location.pathname === "/COS221_NOT_NULL_CREW/php/viewHoles.php")
    {

    }
    //tournaments
    else if(window.location.pathname === "/COS221_NOT_NULL_CREW/php/viewTournaments.php")
    {
        
        document.querySelector(".sidenav a").classList.toggle("show");
        document.getElementById("sideMenu").style.width = "0";
        document.querySelector(".top-content").style.backgroundColor = "rgba(0, 108, 32,1)";
        document.querySelector("#webTitle").style.backgroundColor = "rgba(0, 108, 32,1)";
        document.querySelector("#webTitle").style.color = "rgba(255, 255, 255,1)";
        document.querySelector(".content").style.backgroundColor = "rgba(0,0,0,0)";
        document.querySelector(".content").style.color = "black";
        document.querySelector(".loginRegister").style.backgroundColor = "rgba(0, 108, 32,1)";
        document.querySelector(".loginRegister").style.color = "rgba(255, 255, 255,1)";
        document.querySelector("#Login").style.color = "rgba(255, 255, 255,1)";
        document.querySelector("#Register").style.color = "rgba(255, 255, 255,1)";
        document.querySelector("#Login").style.pointerEvents = "auto";
        document.querySelector("#Register").style.pointerEvents = "auto";
        document.querySelector("#sideMenu").style.pointerEvents = "auto";
        document.querySelector(".loginRegister").style.pointerEvents = "auto";
        document.querySelector(".buttonsGrid").style.backgroundColor = "rgba(255, 255, 255,0.9)";
        document.querySelector(".tableGrid").style.backgroundColor = "rgba(255, 255, 255,0.9)";
        document.querySelector("#createNewTournament").style.backgroundColor = "rgba(179, 179, 3,1)";
        document.querySelector("#createNewTournament").style.color = "rgba(0, 0, 0,1)";
        document.querySelector("#deleteTournament").style.backgroundColor = "rgba(179, 0, 0,1)";
        document.querySelector("#deleteTournament").style.color = "rgba(0, 0, 0,1)";
        document.querySelector("#filterTable").style.backgroundColor = "rgba(0, 179, 3,1)";
        document.querySelector("#filterTable").style.color = "rgba(0, 0, 0,0.7)";
        document.querySelector("#updateTournamentData").style.backgroundColor = "rgba(0, 179, 3,1)";
        document.querySelector("#updateTournamentData").style.color = "rgba(0, 0, 0,1)";
        document.querySelector("#createNewTournament").style.pointerEvents = "auto";
        document.querySelector("#deleteTournament").style.pointerEvents = "auto";
        document.querySelector("#filterTable").style.pointerEvents = "auto";
        document.querySelector("#updateTournamentData").style.pointerEvents = "auto";
        document.querySelector('.footer').style.color = "rgba(255, 255, 255,1)";
    }
    //schedule
    else if(window.location.pathname === "/COS221_NOT_NULL_CREW/php/schedule.php")
    {
        document.querySelector(".sidenav a").classList.toggle("show");
        document.getElementById("sideMenu").style.width = "0";
        document.querySelector(".top-content").style.backgroundColor = "rgba(0, 108, 32,1)";
        document.querySelector("#webTitle").style.backgroundColor = "rgba(0, 108, 32,1)";
        document.querySelector("#webTitle").style.color = "rgba(255, 255, 255,1)";
        document.querySelector(".content").style.backgroundColor = "rgba(0,0,0,0)";
        document.querySelector(".content").style.color = "black";
        document.querySelector(".loginRegister").style.backgroundColor = "rgba(0, 108, 32,1)";
        document.querySelector(".loginRegister").style.color = "rgba(255, 255, 255,1)";
        document.querySelector("#Login").style.color = "rgba(255, 255, 255,1)";
        document.querySelector("#Register").style.color = "rgba(255, 255, 255,1)";
        document.querySelector("#Login").style.pointerEvents = "auto";
        document.querySelector("#Register").style.pointerEvents = "auto";
        document.querySelector("#sideMenu").style.pointerEvents = "auto";
        document.querySelector(".loginRegister").style.pointerEvents = "auto";
        document.querySelector(".buttonsGrid").style.backgroundColor = "rgba(255, 255, 255,1)";
        document.querySelector(".tableGrid").style.backgroundColor = "rgba(255, 255, 255,1)";
        document.querySelector("#filterTable").style.backgroundColor = "rgba(0, 179, 3,1)";
        document.querySelector("#filterTable").style.color = "rgba(0, 0, 0,1)";
        document.querySelector("#filterTable").style.pointerEvents = "auto";
        document.querySelector('.footer').style.color = "rgba(255, 255, 255,1)";
    }
    //registerPlayer
    else if(window.location.pathname === "/COS221_NOT_NULL_CREW/php/registerPlayer.php")
    {
        document.querySelector(".sidenav a").classList.toggle("show");
        document.getElementById("sideMenu").style.width = "0";
        document.querySelector(".top-content").style.backgroundColor = "rgba(0, 108, 32,1)";
        document.querySelector("#webTitle").style.backgroundColor = "rgba(0, 108, 32,1)";
        document.querySelector("#webTitle").style.color = "rgba(255, 255, 255,1)";
        document.querySelector(".content").style.backgroundColor = "rgba(0,0,0,0)";
        document.querySelector(".content").style.color = "black";
        document.querySelector(".loginRegister").style.backgroundColor = "rgba(0, 108, 32,1)";
        document.querySelector(".loginRegister").style.color = "rgba(255, 255, 255,1)";
        document.querySelector("#Login").style.color = "rgba(255, 255, 255,1)";
        document.querySelector("#Register").style.color = "rgba(255, 255, 255,1)";
        document.querySelector("#Login").style.pointerEvents = "auto";
        document.querySelector("#Register").style.pointerEvents = "auto";
        document.querySelector("#sideMenu").style.pointerEvents = "auto";
        document.querySelector(".loginRegister").style.pointerEvents = "auto";
        document.querySelector(".buttonsGrid").style.backgroundColor = "rgba(255, 255, 255,1)";
        document.querySelector(".tableGrid").style.backgroundColor = "rgba(255, 255, 255,1)";
        document.querySelector("#filterTable").style.backgroundColor = "rgba(0, 179, 3,1)";
        document.querySelector("#filterTable").style.color = "rgba(0, 0, 0,1)";
        document.querySelector("#filterTable").style.pointerEvents = "auto";
        document.querySelector('.footer').style.color = "rgba(255, 255, 255,1)";
    }
    //tour
    else if(window.location.pathname === "/COS221_NOT_NULL_CREW/php/tour.php")
    {

    }
    //users
    else if(window.location.pathname === "/COS221_NOT_NULL_CREW/php/manageUsers.php")
    {
        document.querySelector(".sidenav a").classList.toggle("show");
        document.getElementById("sideMenu").style.width = "0";
        document.querySelector(".top-content").style.backgroundColor = "rgba(0, 108, 32,1)";
        document.querySelector("#webTitle").style.backgroundColor = "rgba(0, 108, 32,1)";
        document.querySelector("#webTitle").style.color = "rgba(255, 255, 255,1)";
        document.querySelector(".content").style.backgroundColor = "rgba(0,0,0,0)";
        document.querySelector(".content").style.color = "black";
        document.querySelector(".loginRegister").style.backgroundColor = "rgba(0, 108, 32,1)";
        document.querySelector(".loginRegister").style.color = "rgba(255, 255, 255,1)";
        document.querySelector("#Login").style.color = "rgba(255, 255, 255,1)";
        document.querySelector("#Register").style.color = "rgba(255, 255, 255,1)";
        document.querySelector("#Login").style.pointerEvents = "auto";
        document.querySelector("#Register").style.pointerEvents = "auto";
        document.querySelector("#sideMenu").style.pointerEvents = "auto";
        document.querySelector(".loginRegister").style.pointerEvents = "auto";
        document.querySelector(".buttonsGrid").style.backgroundColor = "rgba(255, 255, 255,0.9)";
        document.querySelector(".tableGrid").style.backgroundColor = "rgba(255, 255, 255,0.9)";
        document.querySelector("#createNewUser").style.backgroundColor = "rgba(179, 179, 3,1)";
        document.querySelector("#createNewUser").style.color = "rgba(0, 0, 0,1)";
        document.querySelector("#deleteUser").style.backgroundColor = "rgba(179, 0, 0,1)";
        document.querySelector("#deleteUser").style.color = "rgba(0, 0, 0,1)";
        document.querySelector("#filterTable").style.backgroundColor = "rgba(0, 179, 3,1)";
        document.querySelector("#filterTable").style.color = "rgba(0, 0, 0,0.7)";
        document.querySelector("#updateUserData").style.backgroundColor = "rgba(0, 179, 3,1)";
        document.querySelector("#updateUserData").style.color = "rgba(0, 0, 0,1)";
        document.querySelector("#createNewUser").style.pointerEvents = "auto";
        document.querySelector("#deleteUser").style.pointerEvents = "auto";
        document.querySelector("#filterTable").style.pointerEvents = "auto";
        document.querySelector("#updateUserData").style.pointerEvents = "auto";
        document.querySelector('.footer').style.color = "rgba(255, 255, 255,1)";
    }
    //players
    else if(window.location.pathname === "/COS221_NOT_NULL_CREW/php/managePlayers.php")
    {
        document.querySelector(".sidenav a").classList.toggle("show");
        document.getElementById("sideMenu").style.width = "0";
        document.querySelector(".top-content").style.backgroundColor = "rgba(0, 108, 32,1)";
        document.querySelector("#webTitle").style.backgroundColor = "rgba(0, 108, 32,1)";
        document.querySelector("#webTitle").style.color = "rgba(255, 255, 255,1)";
        document.querySelector(".content").style.backgroundColor = "rgba(0,0,0,0)";
        document.querySelector(".content").style.color = "black";
        document.querySelector(".loginRegister").style.backgroundColor = "rgba(0, 108, 32,1)";
        document.querySelector(".loginRegister").style.color = "rgba(255, 255, 255,1)";
        document.querySelector("#Login").style.color = "rgba(255, 255, 255,1)";
        document.querySelector("#Register").style.color = "rgba(255, 255, 255,1)";
        document.querySelector("#Login").style.pointerEvents = "auto";
        document.querySelector("#Register").style.pointerEvents = "auto";
        document.querySelector("#sideMenu").style.pointerEvents = "auto";
        document.querySelector(".loginRegister").style.pointerEvents = "auto";
        document.querySelector(".buttonsGrid").style.backgroundColor = "rgba(255, 255, 255,0.9)";
        document.querySelector(".tableGrid").style.backgroundColor = "rgba(255, 255, 255,0.9)";
        document.querySelector("#createNewPlayer").style.backgroundColor = "rgba(179, 179, 3,1)";
        document.querySelector("#createNewPlayer").style.color = "rgba(0, 0, 0,1)";
        document.querySelector("#deletePlayer").style.backgroundColor = "rgba(179, 0, 0,1)";
        document.querySelector("#deletePlayer").style.color = "rgba(0, 0, 0,1)";
        document.querySelector("#filterTable").style.backgroundColor = "rgba(0, 179, 3,1)";
        document.querySelector("#filterTable").style.color = "rgba(0, 0, 0,0.7)";
        document.querySelector("#updatePlayerData").style.backgroundColor = "rgba(0, 179, 3,1)";
        document.querySelector("#updatePlayerData").style.color = "rgba(0, 0, 0,1)";
        document.querySelector("#createNewPlayer").style.pointerEvents = "auto";
        document.querySelector("#deletePlayer").style.pointerEvents = "auto";
        document.querySelector("#filterTable").style.pointerEvents = "auto";
        document.querySelector("#updatePlayerData").style.pointerEvents = "auto";
        document.querySelector('.footer').style.color = "rgba(255, 255, 255,1)";
    }
    //scores
    else if(window.location.pathname === "/COS221_NOT_NULL_CREW/php/scores.php")
    {

    }
    //rounds
    else if(window.location.pathname === "/COS221_NOT_NULL_CREW/php/rounds.php")
    {

    }
    //media
    else if(window.location.pathname === "/COS221_NOT_NULL_CREW/php/media.php")
    {

    }
    //statistics
    else if(window.location.pathname === "/COS221_NOT_NULL_CREW/php/statistics.php")
    {

    }
}

function displayCourses(){
    document.querySelector(".course-show").setAttribute("visibility","visible");
    document.querySelector(".tournaments-btn").setAttribute("display","none");
}

function displayTournaments(){
    document.querySelector(".courses-btn").setAttribute("display","none");
    document.querySelector(".tournaments-btn").setAttribute("display","inline-block");
}

$(function courses() { // Dropdown toggle
    $('.courses-btn').click(function() {
        $(this).next('.course-show').slideToggle();
    });
    
    $(document).click(function(e) 
    { 
    var target = e.target; 
    if (!$(target).is('.courses-btn') && !$(target).parents().is('.courses-btn')) 
    //{ $('.dropdown').hide(); }
      { $('.course-show').slideUp(); 
        // $('.courses-btn').css("color","#818181");
      }
    });
});

$(function tournaments() { // Dropdown toggle
    $('.tournaments-btn').click(function() {
        
        $(this).next('.tournament-show').slideToggle();
    });
    
    $(document).click(function(e) 
    { 
    var target = e.target; 
    if (!$(target).is('.tournaments-btn') && !$(target).parents().is('.tournaments-btn')) 
    //{ $('.dropdown').hide(); }
    { 
        $('.tournament-show').slideUp();
        // $('.tournaments-btn').css("color","#818181");
    }
    });
});

$('.courses-btn').mouseenter(function(){
$(this).css('color','rgb(0, 255, 119)');
});
$('.courses-btn').mouseleave(function(){
    $(this).css('color','#818181');
});

$('.tournaments-btn').mouseenter(function(){
    $(this).css('color','rgb(0, 255, 119)');
});
$('.tournaments-btn').mouseleave(function(){
    $(this).css('color','#818181');
});



