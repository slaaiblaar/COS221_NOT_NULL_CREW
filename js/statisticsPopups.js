var showAddNewStatisticsPopup = document.getElementById("createNewStatistics");
//add event listeners
showAddNewStatisticsPopup.addEventListener("click", function showPopup(){ //this will hide/remove the popup   
    if(document.getElementById("errorSignup")!=null)document.getElementById("errorSignup").innerHTML="";
    document.querySelector(".fullScreenPopupAdd").style.visibility = "visible";
    $(".fullScreenPopupAdd").fadeIn();
});

var dismissAddPopup = document.querySelector(".cancelbtn");
//add event listeners
dismissAddPopup.addEventListener("click", function hidePopup(){ //this will hide/remove the popup    
    if(document.getElementById("errorSignup")!=null) document.getElementById("errorSignup").innerHTML="";
    var nodeList = document.querySelectorAll(".inputTextBox .error");
    for (let i = 0; i < nodeList.length; i++) {
        nodeList[i].innerHTML = "";
    }
    nodeList = document.querySelectorAll(".inputTextBox > div");
    for (let i = 0; i < nodeList.length; i++) {
        nodeList[i].textContent = "";
    }
    nodeList = document.querySelectorAll(".inputTextBox > input[type='number']");
    for (let i = 0; i < nodeList.length; i++) {
        nodeList[i].value = "";
    }
    nodeList = document.querySelectorAll(".inputTextBox > input[type='radio']");
    for (let i = 0; i < nodeList.length; i++) {
        nodeList[i].checked = false;
    }
    nodeList = document.querySelectorAll(".inputTextBox");
    for (let i = 0; i < nodeList.length; i++) {
        nodeList[i].classList.remove("error");
        nodeList[i].classList.remove("success");
    }
    document.querySelector("#newStatisticsPopupForm").scrollTop = 0;   

    document.querySelector(".fullScreenPopupAdd").style.visibility = "hidden";
    $(".fullScreenPopupAdd").fadeOut();
});

var showDeleteStatisticsPopup = document.getElementById("deleteStatistics");
//add event listeners
showDeleteStatisticsPopup.addEventListener("click", function showPopup(){ //this will hide/remove the popup
    document.querySelector(".fullScreenPopupDelete").style.visibility = "visible";
    $(".fullScreenPopupDelete").fadeIn();
});

var dismissDeletePopup = document.querySelector(".cancelbtnDel");
//add event listeners
dismissDeletePopup.addEventListener("click", function hidePopup(){ //this will hide/remove the popup
    if(document.getElementById("errorDelete")!=null) document.getElementById("errorDelete").innerHTML="";
    document.querySelector(".fullScreenPopupDelete").style.visibility = "hidden";
    $(".fullScreenPopupDelete").fadeOut();

    document.querySelector(".error").innerHTML = "";
    document.querySelector("#deleteStatisticsPopup  .inputTextBox > div").textContent="";
    document.querySelector("#deleteStatisticsPopup  .inputTextBox > input[type='text']").value="";
    document.querySelector("#deleteStatisticsPopup  .inputTextBox").classList.remove("error");
    document.querySelector("#deleteStatisticsPopup  .inputTextBox").classList.remove("success");
    sessionStorage.removeItem("pkEmail");
});

var showFilterOptions = document.getElementById("filterTable");
showFilterOptions.addEventListener("click", function showOptions(){
    if(document.getElementById("filterForm").style.visibility == "visible"){
        document.getElementById("filterForm").style.visibility = "hidden";
        document.querySelector(".filter-option1").checked=false;
        document.querySelector(".filter-option2").checked=false;
        document.querySelector(".filter-option3").checked=false;
        document.querySelector(".filter-option4").checked=false;
        document.querySelector(".filter-option5").checked=false;
        document.querySelector(".filter-option6").checked=false;
        document.querySelector(".filter-option7").checked=false;
        document.querySelector(".filter-option8").checked=false;
        document.querySelector(".filter-option9").checked=false;
        document.querySelector(".filter-option10").checked=false;
        document.querySelector('.filterFormContainer > button').style.visibility="hidden";
    }
    else{
        document.getElementById("filterForm").style.visibility = "visible";
    }
})
var showUpdateOptions = document.getElementById("updateStatisticsData");
showUpdateOptions.addEventListener("click", function showOptions(){
    if(document.getElementById("updateOptions").style.visibility == "visible"){
        document.getElementById("updateOptions").style.visibility = "hidden";
        document.querySelector(".update-option1").checked=false;
        document.querySelector(".update-option2").checked=false;
        document.querySelector(".update-option3").checked=false;
        document.querySelector(".update-option4").checked=false;
        document.querySelector(".update-option5").checked=false;
        document.querySelector(".update-option6").checked=false;
        document.querySelector(".update-option7").checked=false;
        document.querySelector(".update-option8").checked=false;
        document.querySelector(".update-option9").checked=false;
        document.querySelector(".update-option10").checked=false;
    }
    else{
        document.getElementById("updateOptions").style.visibility = "visible";
    }
})

var popupUpdateEntityType = document.querySelector(".update-option1");
popupUpdateEntityType.addEventListener("click", function(){
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update Entity type";
    document.querySelector(".updateInput > label").innerHTML ="Statistics new Entity type";
    document.querySelector(".updateInput > input").placeholder ="Enter Entity type";
    document.querySelector(".updateInput > input").setAttribute("type","text");
});
var popupUpdateWinner = document.querySelector(".update-option2");
popupUpdateWinner.addEventListener("click", function(){
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update Winner id";
    document.querySelector(".updateInput > label").innerHTML ="Statistics new Winner";
    document.querySelector(".updateInput > input").placeholder = "Enter winner id";
    document.querySelector(".updateInput > input").setAttribute("type","number");
});
var popupUpdateNoEagles = document.querySelector(".update-option3");
popupUpdateNoEagles.addEventListener("click", function(){
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update No. of eagles";
    document.querySelector(".updateInput > label").innerHTML ="Statistics new No. of eagles";
    document.querySelector(".updateInput > input").placeholder ="Enter Statistics No. of eagles";
    document.querySelector(".updateInput > input").setAttribute("type","number");
});
var popupUpdateNoBirdies = document.querySelector(".update-option4");
popupUpdateNoBirdies.addEventListener("click", function(){
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update No of Birdies";
    document.querySelector(".updateInput > label").innerHTML ="Statistics new No of Birdies";
    document.querySelector(".updateInput > input").placeholder ="Enter Statistics No of Birdies";
    document.querySelector(".updateInput > input").setAttribute("type","number");
});
var popupUpdateNoBogeys = document.querySelector(".update-option5");
popupUpdateNoBogeys.addEventListener("click", function(){
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update No of Bogeys";
    document.querySelector(".updateInput > label").innerHTML ="Statistics new No of Bogeys";
    document.querySelector(".updateInput > input").placeholder ="Enter Statistics No of Bogeys";
    document.querySelector(".updateInput > input").setAttribute("type","number");
});
var popupUpdateNoDoubleBogeys = document.querySelector(".update-option6");
popupUpdateNoDoubleBogeys.addEventListener("click", function(){
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update No of Double Bogeys";
    document.querySelector(".updateInput > label").innerHTML ="Statistics new No of Double Bogeys";
    document.querySelector(".updateInput > input").placeholder ="Enter Statistics No of Double Bogeys";
    document.querySelector(".updateInput > input").setAttribute("type","number");
});
var popupUpdateMaxDrive = document.querySelector(".update-option7");
popupUpdateMaxDrive.addEventListener("click", function(){
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update Max Drive";
    document.querySelector(".updateInput > label").innerHTML ="Statistics new Max Drive";
    document.querySelector(".updateInput > input").placeholder ="Enter Statistics Max Drive";
    document.querySelector(".updateInput > input").setAttribute("type","number");
});
var popupUpdateAvgNetScore = document.querySelector(".update-option8");
popupUpdateAvgNetScore.addEventListener("click", function(){
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update Avg Net Score";
    document.querySelector(".updateInput > label").innerHTML ="Statistics new Avg Net Score";
    document.querySelector(".updateInput > input").placeholder ="Enter Statistics Avg Net Score";
    document.querySelector(".updateInput > input").setAttribute("type","number");
});
var popupUpdateWinCount = document.querySelector(".update-option9");
popupUpdateWinCount.addEventListener("click", function(){
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update Win Count";
    document.querySelector(".updateInput > label").innerHTML ="Statistics new Win Count";
    document.querySelector(".updateInput > input").placeholder ="Enter Statistics Win Count";
    document.querySelector(".updateInput > input").setAttribute("type","number");
});
var popupUpdatePosition = document.querySelector(".update-option10");
popupUpdatePosition.addEventListener("click", function(){
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update Position";
    document.querySelector(".updateInput > label").innerHTML ="Statistics new Position";
    document.querySelector(".updateInput > input").placeholder ="Enter Statistics Position";
    document.querySelector(".updateInput > input").setAttribute("type","number");
});

var dismissUpdatePopup = document.querySelector(".cancelbtnUpdate");
//add event listeners
dismissUpdatePopup.addEventListener("click", function hidePopup(){ //this will hide/remove the popup
    var nodeList = document.querySelectorAll(".inputTextBox .error");
    for (let i = 0; i < nodeList.length; i++) {
        nodeList[i].innerHTML = "";
    }
    nodeList = document.querySelectorAll(".inputTextBox > div");
    for (let i = 0; i < nodeList.length; i++) {
        nodeList[i].textContent = "";
    }
    nodeList = document.querySelectorAll(".inputTextBox > input[type='text']");
    if (nodeList!=null){
        for (let i = 0; i < nodeList.length; i++) {
            nodeList[i].value = "";
        }
    }
    nodeList = document.querySelectorAll(".inputTextBox > input[type='radio']");
    if (nodeList!=null){
        for (let i = 0; i < nodeList.length; i++) {
            nodeList[i].checked = false;
        }
    }
    nodeList = document.querySelectorAll(".inputTextBox");
    for (let i = 0; i < nodeList.length; i++) {
        nodeList[i].classList.remove("error");
        nodeList[i].classList.remove("success");
    }

    document.querySelector(".fullScreenPopupUpdate").style.visibility = "hidden";
    $(".fullScreenPopupUpdate").fadeOut();
});

$(function updates(){
    $('#updateStatisticsData').click(function() {
        
        $('#updateOptions').slideToggle();
    });
    
    // $(document).click(function(e) 
    // { 
    // var target = e.target; 
    // if (!$(target).is('#updateOptions') && !$(target).parents().is('.buttonsGrid')) 
    // //{ $('.dropdown').hide(); }
    // { 
    //     $('#updateOptions').slideUp();
    // }
    // });
});

$(function filters(){
    $('#filterTable').click(function() {
        
        $('#filterOptions').slideToggle();
    });
    
    $(document).click(function(e) 
    { 
    var target = e.target; 
    if (!$(target).is('#filterOptions') && !$(target).parents().is('.buttonsGrid')) 
    //{ $('.dropdown').hide(); }
    { 
        $('#filterOptions').slideUp();
    }
    });
});