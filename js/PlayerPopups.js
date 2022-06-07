var showAddNewPlayerPopup = document.getElementById("createNewPlayer");
//add event listeners
showAddNewPlayerPopup.addEventListener("click", function showPopup(){ //this will hide/remove the popup
    document.querySelector(".fullScreenPopupAdd").style.visibility = "visible";
    $(".fullScreenPopupAdd").fadeIn();
});

var dismissAddPopup = document.querySelector(".cancelbtn");
//add event listeners
dismissAddPopup.addEventListener("click", function hidePopup(){ //this will hide/remove the popup
    document.querySelector(".fullScreenPopupAdd").style.visibility = "hidden";
    $(".fullScreenPopupAdd").fadeOut();
});

var showDeletePlayerPopup = document.getElementById("deletePlayer");
//add event listeners
showDeletePlayerPopup.addEventListener("click", function showPopup(){ //this will hide/remove the popup
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
var showUpdateOptions = document.getElementById("updatePlayerData");
showUpdateOptions.addEventListener("click", function showOptions(){
    if(document.getElementById("updateOptions").style.visibility == "visible"){
        document.getElementById("updateOptions").style.visibility = "hidden";
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
    document.querySelector(".updateInput > input").placeholder ="Enter person key";
});
var popupUpdateDoB = document.querySelector(".update-option2");
popupUpdateDoB.addEventListener("click", function(){
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update Date of Birth";
    document.querySelector(".updateInput > input").placeholder = "Enter date (e.g. 2022/02/22)";
});
var popupUpdateAge = document.querySelector(".update-option3");
popupUpdateAge.addEventListener("click", function(){
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update Age";
    document.querySelector(".updateInput > input").placeholder ="Enter player Age (range [18-65])";
});
var popupUpdateHandicap = document.querySelector(".update-option4");
popupUpdateHandicap.addEventListener("click", function(){
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update Handicap";
    document.querySelector(".updateInput > input").placeholder ="Enter player handicap (range [0-54])";
});
var popupUpdateDeathDate = document.querySelector(".update-option5");
popupUpdateDeathDate.addEventListener("click", function(){
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update Death Date";
    document.querySelector(".updateInput > input").placeholder ="Enter player death date (e.g. 2020/02/13)";
});
var popupUpdateGender = document.querySelector(".update-option6");
popupUpdateGender.addEventListener("click", function(){
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update Gender";
    document.querySelector(".updateInput > input").placeholder ="Enter player Gender (Male/Female/Other)";
});

var dismissUpdatePopup = document.querySelector(".cancelbtnUpdate");
//add event listeners
dismissUpdatePopup.addEventListener("click", function hidePopup(){ //this will hide/remove the popup
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