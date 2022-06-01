$(window).on("load",function(){
    $(".loaderFlag").fadeOut(1200);
    setTimeout(function(){ $(".content").fadeIn(1200)},1200);
})