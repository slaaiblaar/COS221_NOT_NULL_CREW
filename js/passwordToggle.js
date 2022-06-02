const passwordInput = document.getElementById('togglePsw');

passwordInput.addEventListener('click', function toggleVisibility() {
    const userInput = document.querySelector('.password');
    const icon = document.getElementById('icon');

    if (userInput.type === "password"){
        userInput.type = "text";
        icon.innerText = "visibility_off";
    }
    else{
        userInput.type = "password";
        icon.innerText = "visibility";
    }
})