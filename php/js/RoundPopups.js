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
showDeleteRoundPopup.addEventListener("click", function showPopup() {
    document.querySelector(".fullScreenPopupDelete").style.visibility = "visible";
    $(".fullScreenPopupDelete").fadeIn();
});

var dismissDeletePopup = document.querySelector(".cancelbtnDel");
dismissDeletePopup.addEventListener("click", function hidePopup() { 
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
});

var popupUpdateSiteId = document.querySelector(".update-option2");
popupUpdateSiteId.addEventListener("click", function() {
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update Event ID";
    document.querySelector(".updateInput > input").placeholder = "Enter event Id";
});

var popupUpdatePar = document.querySelector(".update-option3");
popupUpdatePar.addEventListener("click", function() {
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update Leader ID";
    document.querySelector(".updateInput > input").placeholder ="Enter leader Id";
});

var popupUpdateLength = document.querySelector(".update-option4");
popupUpdateLength.addEventListener("click", function() {
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update State";
    document.querySelector(".updateInput > input").placeholder ="Enter state (Scheduled','In progress','Finished','Cancelled','Postponed)";
});

var dismissUpdatePopup = document.querySelector(".cancelbtnUpdate");
dismissUpdatePopup.addEventListener("click", function hidePopup() {
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "hidden";
    $(".fullScreenPopupUpdate").fadeOut();
});
