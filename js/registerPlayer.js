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