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