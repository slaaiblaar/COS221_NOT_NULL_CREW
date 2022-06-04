var showAddNewUserPopup = document.getElementById("createNewUser");
//add event listeners
showAddNewUserPopup.addEventListener("click", function showPopup(){ //this will hide/remove the popup  
    if (document.getElementById("errorSignup")!=null)document.getElementById("errorSignup").innerHTML="";
    document.querySelector(".fullScreenPopupAdd").style.visibility = "visible";
    $(".fullScreenPopupAdd").fadeIn();
});

var dismissAddPopup = document.querySelector(".cancelbtn");
//add event listeners
dismissAddPopup.addEventListener("click", function hidePopup(){ //this will hide/remove the popup
    document.getElementById("errorSignup").innerHTML="";
    var nodeList = document.querySelectorAll(".inputTextBox .error");
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
    document.querySelector("#newUserPopupForm").scrollTop = 0;    
    document.querySelector(".fullScreenPopupAdd").style.visibility = "hidden";
    $(".fullScreenPopupAdd").fadeOut();
});

var showDeleteUserPopup = document.getElementById("deleteUser");
//add event listeners
showDeleteUserPopup.addEventListener("click", function showPopup(){ //this will hide/remove the popup
    document.querySelector(".fullScreenPopupDelete").style.visibility = "visible";
    $(".fullScreenPopupDelete").fadeIn();
});

var dismissDeletePopup = document.querySelector(".cancelbtnDel");
//add event listeners
dismissDeletePopup.addEventListener("click", function hidePopup(){ //this will hide/remove the popup
    document.getElementById("errorDelete").innerHTML="";
    document.querySelector(".fullScreenPopupDelete").style.visibility = "hidden";
    $(".fullScreenPopupDelete").fadeOut();
    
    document.querySelector(".error").innerHTML = "";
    document.querySelector("#deleteUserPopup  .inputTextBox > div").textContent="";
    document.querySelector("#deleteUserPopup  .inputTextBox > input[type='text']").value="";
    document.querySelector("#deleteUserPopup  .inputTextBox").classList.remove("error");
    document.querySelector("#deleteUserPopup  .inputTextBox").classList.remove("success");
    sessionStorage.removeItem("pkEmail");
});

var showFilterOptions = document.getElementById("filterTable");
showFilterOptions.addEventListener("click", function showOptions(){
    if(document.getElementById("filterForm").style.visibility == "visible"){
        document.getElementById("filterForm").style.visibility = "hidden";
        document.querySelector(".filter-option1").checked=false;
        document.querySelector(".filter-option2").checked=false;
        document.querySelector(".filter-option3").checked=false;
        document.querySelector(".filter-option4").checked=false;
        document.querySelector('.submitFilter').style.opacity="0.3";
        document.querySelector('.filterFormContainer > button').style.visibility="hidden";
    }
    else{
        document.getElementById("filterForm").style.visibility = "visible";
    }
})
var showUpdateOptions = document.getElementById("updateUserData");
showUpdateOptions.addEventListener("click", function showOptions(){
    if(document.getElementById("updateOptions").style.visibility == "visible"){
        document.getElementById("updateOptions").style.visibility = "hidden";
        document.querySelector(".update-option1").checked=false;
        document.querySelector(".update-option2").checked=false;
        document.querySelector(".update-option3").checked=false;
        document.querySelector(".update-option4").checked=false;
    }
    else{
        document.getElementById("updateOptions").style.visibility = "visible";
    }
})

var popupUpdateEmail = document.querySelector(".update-option1");
popupUpdateEmail.addEventListener("click", function(){
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Change User Email";
    document.querySelector(".updateInput > label").innerHTML ="User new email";
    document.querySelector(".updateInput > input").placeholder ="Enter email (e.g. some@example.com)";
    document.querySelector(".updateInput > input").setAttribute("type","text");
});
var popupUpdatePsw = document.querySelector(".update-option2");
popupUpdatePsw.addEventListener("click", function(){
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Change password";
    document.querySelector(".updateInput > label").innerHTML ="New Password";
    document.querySelector(".updateInput > input").placeholder = "Enter password";
    document.querySelector(".updateInput > input").setAttribute("type","password");
    var i= document.createElement("i")
    i.setAttribute("id","togglePsw");
    i.innerHTML = '<span id="icon2" class="material-icons">visibility</span>';
    document.querySelector(".updateInput > input").parentElement.insertBefore(i,document.querySelector(".updateInput > input").nextSibling );
});
var popupUpdateTelNo = document.querySelector(".update-option3");
popupUpdateTelNo.addEventListener("click", function(){
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Change Tel No.";
    document.querySelector(".updateInput > label").innerHTML ="User new Tel No.";
    document.querySelector(".updateInput > input").placeholder ="Enter User Tel No.";
    document.querySelector(".updateInput > input").setAttribute("type","text");
});
var popupUpdateType = document.querySelector(".update-option4");
popupUpdateType.addEventListener("click", function(){
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Change User Type";
    document.querySelector(".updateInput > label").innerHTML ="User new type";
    document.querySelector(".updateInput > input").placeholder ="Enter User type (e.g. Male / Female / Other)";
    document.querySelector(".updateInput > input").setAttribute("type","text");
});
var popupUpdateFirstName = document.querySelector(".update-option5");
popupUpdateFirstName.addEventListener("click", function(){
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Change First Name";
    document.querySelector(".updateInput > label").innerHTML ="User new first name";
    document.querySelector(".updateInput > input").placeholder ="Enter User first name";
    document.querySelector(".updateInput > input").setAttribute("type","text");
});
var popupUpdateLastName = document.querySelector(".update-option6");
popupUpdateLastName.addEventListener("click", function(){
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Change User Last Name";
    document.querySelector(".updateInput > label").innerHTML ="User new last name";
    document.querySelector(".updateInput > input").placeholder ="Enter User last name";
    document.querySelector(".updateInput > input").setAttribute("type","text");
});
var popupUpdateInitials = document.querySelector(".update-option7");
popupUpdateInitials.addEventListener("click", function(){
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Change User Initials";
    document.querySelector(".updateInput > label").innerHTML ="User new initials";
    document.querySelector(".updateInput > input").placeholder ="Enter User initials";
    document.querySelector(".updateInput > input").setAttribute("type","text");
});

var dismissUpdatePopup = document.querySelector(".cancelbtnUpdate");
//add event listeners
dismissUpdatePopup.addEventListener("click", function hidePopup(){ //this will hide/remove the popup

    var nodeList = document.querySelectorAll(".inputTextBox .error");
    for (let i = 0; i < nodeList.length; i++) {
        nodeList[i].innerHTML = "";
    }
    nodeList = document.querySelectorAll(".inputTextBox > div");
    for (let i = 0; i < nodeList.length; i++) {
        nodeList[i].textContent = "";
    }
    nodeList = document.querySelectorAll(".inputTextBox > input[type='text']");
    if (nodeList!=null){
        for (let i = 0; i < nodeList.length; i++) {
            nodeList[i].value = "";
        }
    }
    nodeList = document.querySelectorAll(".inputTextBox > input[type='password']");
    if (nodeList!=null){
        for (let i = 0; i < nodeList.length; i++) {
            nodeList[i].value = "";
        }
    }
    nodeList = document.querySelectorAll(".inputTextBox > input[type='radio']");
    if (nodeList!=null){
        for (let i = 0; i < nodeList.length; i++) {
            nodeList[i].checked = false;
        }
    }
    nodeList = document.querySelectorAll(".inputTextBox");
    for (let i = 0; i < nodeList.length; i++) {
        nodeList[i].classList.remove("error");
        nodeList[i].classList.remove("success");
    }
    if(document.querySelector(".updateInput #togglePsw")!=null){
        document.querySelector(".updateInput #togglePsw").remove();
    }
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "hidden";
    $(".fullScreenPopupUpdate").fadeOut();
});
