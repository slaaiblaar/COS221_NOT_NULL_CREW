function openMenu(){
    document.getElementById("sideMenu").style.width = "250px";
    document.querySelector(".top-content").style.backgroundColor = "rgba(0, 108, 32,0.7)";
    document.querySelector("#webTitle").style.backgroundColor = "transparent";
    document.querySelector("#webTitle").style.color = "rgba(255, 255, 255,0.7)";
    document.querySelector(".content").style.backgroundColor = "rgba(0,0,0,0.7)";
    document.querySelector(".content").style.color = "rgba(0,0,0,0.7)";
    document.querySelector(".loginRegister").style.backgroundColor = "rgba(0, 108, 32,0.7)";
    document.querySelector(".loginregister").style.color = "rgba(255, 255, 255,0.7)";
    document.querySelector("#Login").style.pointerEvents = "none";
    document.querySelector("#Register").style.pointerEvents = "none";
}

function closeMenu(){
    document.getElementById("sideMenu").style.width = "0";
    document.querySelector(".top-content").style.backgroundColor = "rgba(0, 108, 32,1)";
    document.querySelector("#webTitle").style.backgroundColor = "rgba(0, 108, 32,1)";
    document.querySelector("#webTitle").style.color = "rgba(255, 255, 255,1)";
    document.querySelector(".content").style.backgroundColor = "rgba(0,0,0,0)";
    document.querySelector(".content").style.color = "black";
    document.querySelector(".loginRegister").style.backgroundColor = "rgba(0, 108, 32,1)";
    document.querySelector(".loginRegister").style.color = "rgba(255, 255, 255,1)";
    document.querySelector("#Login").style.pointerEvents = "auto";
    document.querySelector("#Register").style.pointerEvents = "auto";
    document.querySelector("#sideMenu").style.pointerEvents = "auto";
}

$('.courses-btn').click(function(){
    $('nav ul .course-show').toggleClass("show");
    $('nav ull .first').toggleClass("rotate");
});
$('.tournament-btn').click(function(){
    $('nav ul .tournament-show').toggleClass("show1");
    $('nav ull .second').toggleClass("rotate");
});
$('nav ul li').click(function(){
    $(this).addClass("active").siblings().removeClass("active");
});


