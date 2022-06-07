var showAddNewStrokePopup = document.getElementById("createNewStroke");
//add event listeners
showAddNewStrokePopup.addEventListener("click", function showPopup(){ //this will hide/remove the popup
    document.querySelector(".fullScreenPopupAdd").style.visibility = "visible";
    $(".fullScreenPopupAdd").fadeIn();
});

var dismissAddPopup = document.querySelector(".cancelbtn");
//add event listeners
dismissAddPopup.addEventListener("click", function hidePopup(){ //this will hide/remove the popup
    document.querySelector(".fullScreenPopupAdd").style.visibility = "hidden";
    $(".fullScreenPopupAdd").fadeOut();
});

var showDeleteStrokePopup = document.getElementById("deleteStroke");
//add event listeners
showDeleteStrokePopup.addEventListener("click", function showPopup(){ //this will hide/remove the popup
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
var showUpdateOptions = document.getElementById("updateStrokeData");
showUpdateOptions.addEventListener("click", function showOptions(){
    if(document.getElementById("updateOptions").style.visibility == "visible"){
        document.getElementById("updateOptions").style.visibility = "hidden";
        document.querySelector(".update-option1").checked=false;
        document.querySelector(".update-option2").checked=false;
        document.querySelector(".update-option3").checked=false;
        document.querySelector(".update-option4").checked=false;
        document.querySelector(".update-option5").checked=false;
    }
    else{
        document.getElementById("updateOptions").style.visibility = "visible";
    }
})

var popupUpdatePersonKey = document.querySelector(".update-option1");
popupUpdatePersonKey.addEventListener("click", function(){
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update Club Used: ";
    document.querySelector(".updateInput > label").innerHTML ="New club used: ";
    document.querySelector(".updateInput > input").placeholder ="Enter new club used";
    document.querySelector(".updateInput > input").setAttribute("type","text");
});
var popupUpdateDoB = document.querySelector(".update-option2");
popupUpdateDoB.addEventListener("click", function(){
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update landing area";
    document.querySelector(".updateInput > label").innerHTML ="New landing area of the ball";
    document.querySelector(".updateInput > input").placeholder = "Enter landing area (e.g. fairway)";
    document.querySelector(".updateInput > input").setAttribute("type","text");
});
var popupUpdateAge = document.querySelector(".update-option3");
popupUpdateAge.addEventListener("click", function(){
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update Shot Distance";
    document.querySelector(".updateInput > label").innerHTML ="New shot distance";
    document.querySelector(".updateInput > input").placeholder ="Enter distance: ";
    document.querySelector(".updateInput > input").setAttribute("type","number");
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
    $('#updateStrokeData').click(function() {
        
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
