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
})
var showUpdateOptions = document.getElementById("updateTournamentData");
showUpdateOptions.addEventListener("click", function showOptions(){
    if(document.getElementById("updateOptions").style.visibility == "visible"){
        document.getElementById("updateOptions").style.visibility = "hidden";
    }
    else{
        document.getElementById("updateOptions").style.visibility = "visible";
    }
})

var popupUpdateEventKey = document.querySelector(".update-option1");
popupUpdateEventKey.addEventListener("click", function(){
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update Event Key";
    document.querySelector(".updateInput > input").placeholder ="Enter event key";
});

var dismissUpdatePopup = document.querySelector(".cancelbtnUpdate");
//add event listeners
dismissUpdatePopup.addEventListener("click", function hidePopup(){ //this will hide/remove the popup
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "hidden";
    $(".fullScreenPopupUpdate").fadeOut();
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
    $('#updateTournamentData').click(function() {
        
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
