var dismissPopup = document.querySelector(".dismissPopup");
var undoReg = document.querySelector(".undoReg");

//add event listeners
dismissPopup.addEventListener("click", function hidePopup(){ //this will hide/remove the popup
    document.getElementById("fullScreenPopupReg").style.visibility = "hidden";
    $("#fullScreenPopupReg").fadeOut();
});

undoReg.addEventListener("click", function removeUser(){ //this function will undo the registration
    $.ajax({
        url: "php/database.php",
        type: 'POST',
        contentType: "application/json", 
        data: JSON.stringify({event_key : "<?php echo '$_SESSION['strokeNo']'; ?>",
                              start_date_time : "<?php echo '$_SESSION['clubUsed']'; ?>",
                              end_date_time : "<?php echo '$_SESSION['distance']'; ?>",
                              duration : "<?php echo '$_SESSION['landing']'; ?>"}),
        success: function(xhr, status, error)  //used for debugging purposes
        {
            console.log('Undoing registration of scores was successful, server says '+error);
        }, error: function(xhr, status, error) //used for debugging purposes
        {
            console.log('something went wrong with undoing the registration.'+ error);
        }
    });
    document.getElementById("fullScreenPopupReg").style.visibility = "hidden";
    $("#fullScreenPopupReg").fadeOut();
    alert("Successful undo of registration");
});