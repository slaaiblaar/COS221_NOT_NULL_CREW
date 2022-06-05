var showAddNewPlayerPopup = document.getElementById("createNewPlayer");
//add event listeners
showAddNewPlayerPopup.addEventListener("click", function showPopup(){ //this will hide/remove the popup   
    if(document.getElementById("errorSignup")!=null)document.getElementById("errorSignup").innerHTML="";
    document.querySelector(".fullScreenPopupAdd").style.visibility = "visible";
    $(".fullScreenPopupAdd").fadeIn();
});

var dismissAddPopup = document.querySelector(".cancelbtn");
//add event listeners
dismissAddPopup.addEventListener("click", function hidePopup(){ //this will hide/remove the popup    
    document.getElementById("errorSignup").innerHTML="";
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
    document.querySelector("#newPlayerFormPopup").scrollTop = 0;   

    document.querySelector(".fullScreenPopupAdd").style.visibility = "hidden";
    $(".fullScreenPopupAdd").fadeOut();
});

var showDeletePlayerPopup = document.getElementById("deletePlayer");
//add event listeners
showDeletePlayerPopup.addEventListener("click", function showPopup(){ //this will hide/remove the popup
    document.getElementById("errorDelete").innerHTML="";
    document.querySelector(".fullScreenPopupDelete").style.visibility = "visible";
    $(".fullScreenPopupDelete").fadeIn();
});

var dismissDeletePopup = document.querySelector(".cancelbtnDel");
//add event listeners
dismissDeletePopup.addEventListener("click", function hidePopup(){ //this will hide/remove the popup
    document.getElementById("errorDelete").innerHTML="";
    document.querySelector(".fullScreenPopupDelete").style.visibility = "hidden";
    $(".fullScreenPopupDelete").fadeOut();

    document.querySelector(".error").innerHTML = "";
    document.querySelector("#deletePlayerPopup  .inputTextBox > div").textContent="";
    document.querySelector("#deletePlayerPopup  .inputTextBox > input[type='text']").value="";
    document.querySelector("#deletePlayerPopup  .inputTextBox").classList.remove("error");
    document.querySelector("#deletePlayerPopup  .inputTextBox").classList.remove("success");
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
var showUpdateOptions = document.getElementById("updatePlayerData");
showUpdateOptions.addEventListener("click", function showOptions(){
    if(document.getElementById("updateOptions").style.visibility == "visible"){
        document.getElementById("updateOptions").style.visibility = "hidden";
        document.querySelector(".update-option1").checked=false;
        document.querySelector(".update-option2").checked=false;
        document.querySelector(".update-option3").checked=false;
        document.querySelector(".update-option4").checked=false;
        document.querySelector(".update-option5").checked=false;
        document.querySelector(".update-option6").checked=false;
    }
    else{
        document.getElementById("updateOptions").style.visibility = "visible";
    }
})

var popupUpdatePersonKey = document.querySelector(".update-option1");
popupUpdatePersonKey.addEventListener("click", function(){
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update Person Key";
    document.querySelector(".updateInput > label").innerHTML ="Player new person key";
    document.querySelector(".updateInput > input").placeholder ="Enter person key";
    document.querySelector(".updateInput > input").setAttribute("type","text");
});
var popupUpdateDoB = document.querySelector(".update-option2");
popupUpdateDoB.addEventListener("click", function(){
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update Date of Birth";
    document.querySelector(".updateInput > label").innerHTML ="Player new date of birth";
    document.querySelector(".updateInput > input").placeholder = "Enter date (e.g. 2022/02/22)";
    document.querySelector(".updateInput > input").setAttribute("type","date");
});
var popupUpdateAge = document.querySelector(".update-option3");
popupUpdateAge.addEventListener("click", function(){
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update Age";
    document.querySelector(".updateInput > label").innerHTML ="Player new age";
    document.querySelector(".updateInput > input").placeholder ="Enter player Age (range [18-65])";
    document.querySelector(".updateInput > input").setAttribute("type","number");
});
var popupUpdateHandicap = document.querySelector(".update-option4");
popupUpdateHandicap.addEventListener("click", function(){
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update Handicap";
    document.querySelector(".updateInput > label").innerHTML ="Player new handicap";
    document.querySelector(".updateInput > input").placeholder ="Enter player handicap (range [0-54])";
    document.querySelector(".updateInput > input").setAttribute("type","number");
});
var popupUpdateDeathDate = document.querySelector(".update-option5");
popupUpdateDeathDate.addEventListener("click", function(){
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update Death Date";
    document.querySelector(".updateInput > label").innerHTML ="Player new death date";
    document.querySelector(".updateInput > input").placeholder ="Enter player death date (e.g. 2020/02/13)";
    document.querySelector(".updateInput > input").setAttribute("type","date");
});
var popupUpdateGender = document.querySelector(".update-option6");
popupUpdateGender.addEventListener("click", function(){
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update Gender";
    document.querySelector(".updateInput > label").innerHTML ="Player new gender";
    document.querySelector(".updateInput > input").placeholder ="Enter player Gender (Male/Female/Other)";
    document.querySelector(".updateInput > input").setAttribute("type","text");
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
    
    $(document).click(function(e) 
    { 
    var target = e.target; 
    if (!$(target).is('#updateOptions') && !$(target).parents().is('.buttonsGrid')) 
    //{ $('.dropdown').hide(); }
    { 
        $('#updateOptions').slideUp();
    }
    });
});

$(function updates(){
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