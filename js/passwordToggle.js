const passwordInput = document.getElementById('togglePsw');

passwordInput.addEventListener('click', function toggleVisibility() {
    var userInput = document.querySelector('.password');
    var userInputUpdate = document.querySelector('.updateInput input.password');
    const icon = document.getElementById('icon');
    const icon2 = document.getElementById('icon2');
    if(icon != null){
        if (userInput.type === "password"){
            userInput.type = "text";
            icon.innerText = "visibility_off";
        }
        else{
            userInput.type = "password";
            icon.innerText = "visibility";
        }
    }
    if (icon2!=null){
        if (userInput.type === "password"){
            userInput.type = "text";
            icon2.innerText = "visibility_off";
        }
        else{
            userInput.type = "password";
            icon2.innerText = "visibility";
        }
    }
})