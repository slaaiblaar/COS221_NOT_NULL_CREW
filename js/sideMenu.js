function openMenu(){
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
    document.querySelector("#grid-panel-2").style.backgroundColor = "rgba(140, 143, 141,0.9)";
    document.querySelector("#grid-panel-3").style.backgroundColor = "rgba(140, 143, 141,0.9)";
    document.querySelector("#grid-panel-4").style.backgroundColor = "rgba(140, 143, 141,0.9)";
}

function closeMenu(){
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
    document.querySelector("#grid-panel-2").style.backgroundColor = "rgba(255, 255, 255,0.9)";
    document.querySelector("#grid-panel-3").style.backgroundColor = "rgba(255, 255, 255,0.9)";
    document.querySelector("#grid-panel-4").style.backgroundColor = "rgba(255, 255, 255,0.9)";
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
        $('.courses-btn').css("color","#818181");
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
        $('.tournaments-btn').css("color","#818181");
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



