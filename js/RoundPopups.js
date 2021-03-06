$(document).ready(function() {
    $.ajax({
        url: "../php/roundTableDisplay.php",
        method: "post",
        dataType: "json",
        success:function(data) {
            let string = "";
            $.each(data, function(key, value) {
                string += `<tr>
                <td>${value['id']}</td>
                <td>${value['round_no']}</td>
                <td>${value['event_id']}</td>
                <td>${value['leader_id']}</td>
                <td>${value['state']}</td>
            </tr>`
            });
            $("#tableBody").append(string);
        },
        error:{
        }
    });
});

var showAddNewRoundPopup = document.getElementById('createNewRound');
showAddNewRoundPopup.addEventListener('click', function showPopup() {
    document.querySelector('.fullScreenPopupAdd').style.visibility = 'visible';
    $('.fullScreenPopupAdd').fadeIn();
});


var dismissAddPopup = document.querySelector('.cancelbtn');
dismissAddPopup.addEventListener('click', function hidePopup() {
    document.querySelector('.fullScreenPopupAdd').style.visibility = 'hidden';
    $('.fullScreenPopupAdd').fadeOut();
});

var showDeleteRoundPopup = document.getElementById("deleteRound");
var showAddNewRoundPopup = document.getElementById("createNewRound");
//add event listeners
showAddNewRoundPopup.addEventListener("click", function showPopup(){ //this will hide/remove the popup
    document.querySelector(".fullScreenPopupAdd").style.visibility = "visible";
    $(".fullScreenPopupAdd").fadeIn();
});

var dismissAddPopup = document.querySelector(".cancelbtn");
//add event listeners
dismissAddPopup.addEventListener("click", function hidePopup(){ //this will hide/remove the popup
    document.querySelector(".fullScreenPopupAdd").style.visibility = "hidden";
    $(".fullScreenPopupAdd").fadeOut();
});

var showDeleteRoundPopup = document.getElementById("deleteRound");
//add event listeners
showDeleteRoundPopup.addEventListener("click", function showPopup(){ //this will hide/remove the popup
    document.querySelector(".fullScreenPopupDelete").style.visibility = "visible";
    $(".fullScreenPopupDelete").fadeIn();
});

var dismissDeletePopup = document.querySelector(".cancelbtnDel");
//add event listeners
dismissDeletePopup.addEventListener("click", function hidePopup(){ //this will hide/remove the popup
    document.querySelector(".fullScreenPopupDelete").style.visibility = "hidden";
    $(".fullScreenPopupDelete").fadeOut();
});


// var showFilterOptions = document.getElementById("filterTable");
// showFilterOptions.addEventListener("click", function showOptions() {
//     if (document.getElementById("filterOptions").style.visibility == "visible") {
//         document.getElementById("filterOptions").style.visibility = "hidden";
//     }
//     else {
//         document.getElementById("filterOptions").style.visibility = "visible";
//     }
// });

var showUpdateOptions = document.getElementById("updateRound");
showUpdateOptions.addEventListener("click", function showOptions(){
    if (document.getElementById("updateOptions").style.visibility == "visible") {
        document.getElementById("updateOptions").style.visibility = "hidden";
    }
    else {
        document.getElementById("updateOptions").style.visibility = "visible";
    }
});

var popupUpdateRoundNumber = document.querySelector(".update-option1");
popupUpdateRoundNumber.addEventListener("click", function(){
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update Round Number";
    document.querySelector(".updateInput > input").placeholder ="Enter Round number (range [1-99])";
    document.querySelector(".updateInput > small").innerHTML = "<?php if(isset($_SESSION['RoundNoError']))" 
    + "echo $_SESSION['RoundNoError'];else echo '';?>"
});

var popupUpdateSiteId = document.querySelector(".update-option2");
popupUpdateSiteId.addEventListener("click", function() {
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update Event ID";
    document.querySelector(".updateInput > input").placeholder = "Enter event Id";
    document.querySelector(".updateInput > small").innerHTML = "<?php if(isset($_SESSION['eventIdError']))" 
    + "echo $_SESSION['eventIdError'];else echo '';?>"
});

var popupUpdatePar = document.querySelector(".update-option3");
popupUpdatePar.addEventListener("click", function() {
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update Leader ID";
    document.querySelector(".updateInput > input").placeholder ="Enter leader Id";
    document.querySelector(".updateInput > small").innerHTML = "<?php if(isset($_SESSION['leaderIdError']))" 
    +"echo $_SESSION['leaderIdError'];else echo '';?>"
});

var popupUpdateLength = document.querySelector(".update-option4");
popupUpdateLength.addEventListener("click", function() {
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update State";
    document.querySelector(".updateInput > input").placeholder ="Enter state (Scheduled','In progress','Finished','Cancelled','Postponed)";
    document.querySelector(".updateInput > small").innerHTML = "<?php if(isset($_SESSION['stateError']))" 
    +"echo $_SESSION['stateError'];else echo '';?>"
});

var dismissUpdatePopup = document.querySelector(".cancelbtnUpdate");
var showFilterOptions = document.getElementById("filterTable");
showFilterOptions.addEventListener("click", function showOptions(){
    if(document.getElementById("filterOptions").style.visibility == "visible"){
        document.getElementById("filterOptions").style.visibility = "hidden";
    }
    else{
        document.getElementById("filterOptions").style.visibility = "visible";
    }
});

var showUpdateRoundPopup = document.getElementById("updateRoundData");
//add event listeners
showUpdateRoundPopup.addEventListener("click", function showPopup(){ //this will hide/remove the popup
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();
});

var dismissAddPopup = document.querySelector(".cancelbtnUpdate");
//add event listeners
dismissAddPopup.addEventListener("click", function hidePopup(){ //this will hide/remove the popup
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "hidden";
    $(".fullScreenPopupUpdate").fadeOut();
});
