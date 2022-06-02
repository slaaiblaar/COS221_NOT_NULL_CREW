var dismissPopup = document.querySelector(".dismissPopup");
var undoReg = document.querySelector(".undoReg");

//add event listeners
dismissPopup.addEventListener("click", function hidePopup(){ //this will hide/remove the popup
    document.getElementById("SuccessfulRegPopup").style.visibility = "hidden";
    $("#SuccessfulRegPopup").fadeOut();
});

undoReg.addEventListener("click", function removeUser(){ //this function will undo the registration
    $.ajax({
        url: "../php/database.php",
        type: 'POST',
        contentType: "application/json", 
        data: JSON.stringify({ email : "<?php echo $_SESSION['email']; ?>"}),
        success: function(xhr, status, error)  //used for debugging purposes
        {
            console.log('Undoing registration was successful, server says '+error);
        }, error: function(xhr, status, error) //used for debugging purposes
        {
            console.log('something went wrong with undoing the registration.'+ error);
        }
    });
    document.getElementById("SuccessfulRegPopup").style.visibility = "hidden";
    $("#SuccessfulRegPopup").fadeOut();
});