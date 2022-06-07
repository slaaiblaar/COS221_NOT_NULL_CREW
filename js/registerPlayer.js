var showAddNewPlayerScorePopup = document.getElementById("createNewPlayerScore");
//add event listeners
showAddNewPlayerScorePopup.addEventListener("click", function showPopup(){ //this will hide/remove the popup   
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
    nodeList = document.querySelectorAll(".inputTextBox > input[type='text']");
    for (let i = 0; i < nodeList.length; i++) {
        nodeList[i].value = "";
    }
    nodeList = document.querySelectorAll(".inputTextBox > input[type='number']");
    for (let i = 0; i < nodeList.length; i++) {
        nodeList[i].value = "";
    }
    nodeList = document.querySelectorAll(".inputTextBox > input[type='date']");
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
    document.querySelector("#newRegisterPlayerPopupForm").scrollTop = 0;   

    document.querySelector(".fullScreenPopupAdd").style.visibility = "hidden";
    $(".fullScreenPopupAdd").fadeOut();
});

var showDeleteRegisterPlayerPopup = document.getElementById("deletePlayerScore");
//add event listeners
showDeleteRegisterPlayerPopup.addEventListener("click", function showPopup(){ //this will hide/remove the popup
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
    document.querySelector("#deleteScorePopup  .inputTextBox > div").textContent="";
    document.querySelector("#deleteScorePopup  .inputTextBox > input[type='text']").value="";
    document.querySelector("#deleteScorePopup  .inputTextBox").classList.remove("error");
    document.querySelector("#deleteScorePopup  .inputTextBox").classList.remove("success");
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
        document.querySelector('.filterFormContainer > button').style.visibility="hidden";
    }
    else{
        document.getElementById("filterForm").style.visibility = "visible";
    }
})
var showUpdateOptions = document.getElementById("updatePlayerScoreData");
showUpdateOptions.addEventListener("click", function showOptions(){
    if(document.getElementById("updateOptions").style.visibility == "visible"){
        document.getElementById("updateOptions").style.visibility = "hidden";
        document.querySelector(".update-option1").checked=false;
        document.querySelector(".update-option2").checked=false;
    }
    else{
        document.getElementById("updateOptions").style.visibility = "visible";
    }
})

var popupUpdateNetScore = document.querySelector(".update-option1");
popupUpdateNetScore.addEventListener("click", function(){
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update Net Score";
    document.querySelector(".updateInput > label").innerHTML ="New Net Score: ";
    document.querySelector(".updateInput > input").placeholder ="Enter Net Score";
    document.querySelector(".updateInput > input").setAttribute("type","text");
    document.querySelector(".updateInput > input").setAttribute("name","netScore");
});
var popupUpdateStrokeCount = document.querySelector(".update-option2");
popupUpdateStrokeCount.addEventListener("click", function(){
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update Stroke Count";
    document.querySelector(".updateInput > label").innerHTML ="Player new stroke count";
    document.querySelector(".updateInput > input").placeholder = "Enter stroke count: ";
    document.querySelector(".updateInput > input").setAttribute("type","number");
    document.querySelector(".updateInput > input").setAttribute("name","strokeCount");
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
    nodeList = document.querySelectorAll(".inputTextBox > input[type='password']");
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
    nodeList = document.querySelectorAll(".inputTextBox > input[type='date']");
    if (nodeList!=null){
        for (let i = 0; i < nodeList.length; i++) {
            nodeList[i].value = "";
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
    $('#updatePlayerData').click(function() {
        
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
$(function updates(){
    $('#updatePlayerScoreData').click(function() {
        
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