var dismissPopup = document.querySelector(".dismissPopup");
var undoReg = document.querySelector(".undoReg");

//add event listeners
dismissPopup.addEventListener("click", function hidePopup(){ //this will hide/remove the popup
    for (let i = 0; i < nodeList.length; i++) {
        nodeList[i].innerHTML = "";
    }
    nodeList = document.querySelectorAll(".inputTextBox > div");
    for (let i = 0; i < nodeList.length; i++) {
        nodeList[i].textContent = "";
    }
    nodeList = document.querySelectorAll(".inputTextBox > input[type='text']");
    for (let i = 0; i < nodeList.length; i++) {
        nodeList[i].value = "";
    }
    nodeList = document.querySelectorAll(".inputTextBox > input[type='password']");
    for (let i = 0; i < nodeList.length; i++) {
        nodeList[i].value = "";
    }
    nodeList = document.querySelectorAll(".inputTextBox > input[type='radio']");
    for (let i = 0; i < nodeList.length; i++) {
        nodeList[i].checked = false;
    }
    nodeList = document.querySelectorAll(".inputTextBox");
    for (let i = 0; i < nodeList.length; i++) {
        nodeList[i].classList.remove("error");
        nodeList[i].classList.remove("success");
    }
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