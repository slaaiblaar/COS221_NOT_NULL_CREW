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
