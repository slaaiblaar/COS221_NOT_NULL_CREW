var showAddNewTournamentPopup = document.getElementById("createNewTournament");
//add event listeners
showAddNewTournamentPopup.addEventListener("click", function showPopup(){ //this will hide/remove the popup
    document.querySelector(".fullScreenPopupAdd").style.visibility = "visible";
    $(".fullScreenPopupAdd").fadeIn();
});

var dismissAddPopup = document.querySelector(".cancelbtn");
//add event listeners
dismissAddPopup.addEventListener("click", function hidePopup(){ //this will hide/remove the popup
    document.querySelector(".fullScreenPopupAdd").style.visibility = "hidden";
    $(".fullScreenPopupAdd").fadeOut();
});

var showDeleteTournamentPopup = document.getElementById("deleteTournament");
//add event listeners
showDeleteTournamentPopup.addEventListener("click", function showPopup(){ //this will hide/remove the popup
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
    document.querySelector("#deleteTournamentPopup  .inputTextBox > div").textContent="";
    document.querySelector("#deleteTournamentPopup  .inputTextBox > input[type='text']").value="";
    document.querySelector("#deleteTournamentPopup  .inputTextBox").classList.remove("error");
    document.querySelector("#deleteTournamentPopup  .inputTextBox").classList.remove("success");
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
var showUpdateOptions = document.getElementById("updateTournamentData");
showUpdateOptions.addEventListener("click", function showOptions(){
    if(document.getElementById("updateOptions").style.visibility == "visible"){
        document.getElementById("updateOptions").style.visibility = "hidden";
        document.querySelector(".update-option1").checked=false;
        document.querySelector(".update-option2").checked=false;
        document.querySelector(".update-option3").checked=false;
    }
    else{
        document.getElementById("updateOptions").style.visibility = "visible";
    }
})

var popupUpdateTournamentType = document.querySelector(".update-option1");
popupUpdateTournamentType.addEventListener("click", function(){
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update Tournament Name";
    document.querySelector(".updateInput > label").innerHTML ="New Tournament Name";
    document.querySelector(".updateInput > input").placeholder ="Enter Tournament Name";
    document.querySelector(".updateInput > input").setAttribute("type","text");
    document.querySelector(".updateInput > input").setAttribute("name","option1");
});

var popupUpdateTournamentType = document.querySelector(".update-option2");
popupUpdateTournamentType.addEventListener("click", function(){
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update Gender Class";
    document.querySelector(".updateInput > label").innerHTML ="New Gender Class (Men/Women)";
    document.querySelector(".updateInput > input").placeholder ="Enter Gender Class";
    document.querySelector(".updateInput > input").setAttribute("type","text");
    document.querySelector(".updateInput > input").setAttribute("name","option2");
});

var popupUpdateTournamentType = document.querySelector(".update-option3");
popupUpdateTournamentType.addEventListener("click", function(){
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update Event Status";
    document.querySelector(".updateInput > label").innerHTML ="New Event Status (Scheduled or Canceled)";
    document.querySelector(".updateInput > input").placeholder ="Enter Event Status";
    document.querySelector(".updateInput > input").setAttribute("type","text");
    document.querySelector(".updateInput > input").setAttribute("name","option3");
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

$(function filters(){
    $('#filterTable').click(function() {
        
        $('#filterOptions').slideToggle();
    });
    
    // $(document).click(function(e) 
    // { 
    // var target = e.target; 
    // if (!$(target).is('#filterOptions') && !$(target).parents().is('.buttonsGrid')) 
    // //{ $('.dropdown').hide(); }
    // { 
    //     $('#filterOptions').slideUp();
    // }
    // });
});

$(function updates(){
    $('#updateTournamentData').click(function() {
        
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
