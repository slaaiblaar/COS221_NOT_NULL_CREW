let grid1 = document.getElementById("grid-panel-1");
let grid2 = document.getElementById("grid-panel-2");
let grid3 = document.getElementById("grid-panel-3");
let grid4 = document.getElementById("grid-panel-4");


grid1.addEventListener("hover",function() {
    grid1.setAttribute("style","transform: scale(1.2,1.2)");
    grid2.setAttribute("style","transform: scale(-0.2,-0.2)");
    grid3.setAttribute("style","transform: scale(-0.2,-0.2)");
    grid4.setAttribute("style","transform: scale(-0.2,-0.2)");

});

grid2.addEventListener("hover",function() {
    grid2.setAttribute("style","transform: scale(1.2,1.2)");
    grid1.setAttribute("style","transform: scale(-0.2,-0.2)");
    grid3.setAttribute("style","transform: scale(-0.2,-0.2)");
    grid4.setAttribute("style","transform: scale(-0.2,-0.2)");

});

grid3.addEventListener("hover",function() {
    grid3.setAttribute("style","transform: scale(1.2,1.2)");
    grid2.setAttribute("style","transform: scale(-0.2,-0.2)");
    grid1.setAttribute("style","transform: scale(-0.2,-0.2)");
    grid4.setAttribute("style","transform: scale(-0.2,-0.2)");

});

grid4.addEventListener("hover",function() {
    grid4.setAttribute("style","transform: scale(1.2,1.2)");
    grid2.setAttribute("style","transform: scale(-0.2,-0.2)");
    grid3.setAttribute("style","transform: scale(-0.2,-0.2)");
    grid1.setAttribute("style","transform: scale(-0.2,-0.2)");

});

