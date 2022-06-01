$(window).on("load",function(){
    $(".loader").fadeOut(1200);
    setTimeout(function(){ $(".content").fadeIn(1200)},1200);
})