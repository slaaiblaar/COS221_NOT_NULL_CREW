var dismissPopup = document.querySelector(".dismissPopup");
var undoReg = document.querySelector(".undoReg");

//add event listeners
dismissPopup.addEventListener("click", function hidePopup(){ //this will hide/remove the popup
    document.getElementById("fullScreenPopupReg").style.visibility = "hidden";
    $("#fullScreenPopupReg").fadeOut();
});

undoReg.addEventListener("click", function removeUser(){ //this function will undo the registration
    $.ajax({
        url: "../php/database.php",
        type: 'POST',
        contentType: "application/json", 
        data: JSON.stringify({person_key : "<?php echo '$_SESSION['idNumber']'; ?>",
                              handicap : "<?php echo '$_SESSION['handicap']'; ?>",
                              gender : "<?php echo '$_SESSION['idNumber']'; ?>"}),
        success: function(xhr, status, error)  //used for debugging purposes
        {
            console.log('Undoing registration was successful, server says '+error);
        }, error: function(xhr, status, error) //used for debugging purposes
        {
            console.log('something went wrong with undoing the registration.'+ error);
        }
    });
    document.getElementById("fullScreenPopupReg").style.visibility = "hidden";
    $("#fullScreenPopupReg").fadeOut();
    alert("Successful undo of registration");
});