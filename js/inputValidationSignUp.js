var form = document.querySelector("#newUserFormPopup");
if (form==null){
    form = document.querySelector("#deleteUserForm");
}
if (form==null){
    form = document.querySelector("#updateUserForm");
}
if (form==null){
    form = document.querySelector("#signupForm");
}
const Name = document.querySelector(".name");
const surname = document.querySelector('.surname');
const password = document.querySelector('.password');
const passwordUpdate = document.querySelector('updateInput input.password');
const email = document.querySelector('.email');
const initials = document.querySelector('.initials');
const dateOfBirth = document.querySelector('.dateOfBirth');
const telNo = document.querySelector('.telNo');
// const genderMale = document.querySelector('.genderMale');
// const genderFemale = document.querySelector('.genderFemale');
// const genderOther = document.querySelector('.genderOther');
// const country = document.querySelector('.country');
// const handicap = document.querySelector('.handicap');
const adminType = document.querySelector('.adminType');
const playerType = document.querySelector('.playerType');
const pkEmail = document.querySelector('.pkEmail');
const pkEmailID = document.querySelector('.updateInputID input.pkEmail');
const updatePopupInput = document.querySelector(".updatePopupInput");
const viewAdmins = document.querySelector(".filter-option1");
const viewNormUser = document.querySelector(".filter-option2");
const viewGoogle_iCloud = document.querySelector(".filter-option3");
const viewResetTable = document.querySelector(".filter-option4");
const updateEmail = document.querySelector(".update-option1");
const updatePsw = document.querySelector(".update-option2");
const updateTelNo = document.querySelector(".update-option3");
const updateType = document.querySelector(".update-option4");
const updateFirstName = document.querySelector(".update-option5");
const updateLastName = document.querySelector(".update-option6");
const updateInitials = document.querySelector(".update-option7");

if(Name!=null){
    Name.addEventListener('keyup',function validateName() {
        const nameRequirement = /^[A-Z][a-z]+$/;
        const nameVal = Name.value.trim();
        if (!nameRequirement.test(nameVal)){
            setInputError(Name,"Please enter a valid name. (Only characters allowed and it must start with a capital)");
        }
        else{
            setInputSuccess(Name);
        }
    });
}

if(surname!=null){
    surname.addEventListener('keyup',function validateSurname() {
        const surnameRequirement = /^[A-Z][a-z]+$/;
        const surnameVal = surname.value.trim();
        if (!surnameRequirement.test(surnameVal)){
            setInputError(surname,"Please enter a valid surname. (Only characters allowed and it must start with a capital)");
        }
        else{
            setInputSuccess(surname);
        }
    });
}

if(email!=null){
    email.addEventListener('keyup',function validateEmail() {
        const emailRequirement = /^\w*@\w+([\.-]?\w+)*(\.[A-Za-z]{2,4})+$/;
        const emailVal = email.value.trim();
        if (!emailRequirement.test(emailVal)){
            setInputError(email,"Email address did not match the format- something@example.com");
        }
        else{
            setInputSuccess(email);
        }
    });
}

if(password!=null){
    password.addEventListener('keyup',function validatePassword() {
        const passwordRequirement = /^(?=.{8,}$)(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W).*$/;
        const passwordVal = password.value.trim();
        if (!passwordRequirement.test(passwordVal)){
            setInputError(password,"Invalid password. \nIt needs to contain: at least 8 characters, uppercase and lowercase characters, numeric digits and at least one symbol [&,%,$,etc.]");
        }
        else{
            setInputSuccess(password);
        }
    });
}
if(passwordUpdate!=null){
    passwordUpdate.addEventListener('keyup',function validatePasswordUpdate() {
        const passwordUpdateRequirement = /^(?=.{8,}$)(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W).*$/;
        const passwordUpdateVal = passwordUpdate.value.trim();
        if (!passwordUpdateRequirement.test(passwordUpdateVal)){
            setInputError(passwordUpdate,"Invalid password. \nIt needs to contain: at least 8 characters, uppercase and lowercase characters, numeric digits and at least one symbol [&,%,$,etc.]");
        }
        else{
            setInputSuccess(passwordUpdate);
        }
    });
}

if(initials!=null){
    initials.addEventListener('keyup',function validateInitials() {
        const initialsRequirement = /^[A-Z]+$/;
        const initialsVal = initials.value.trim();
        if (!initialsRequirement.test(initialsVal)){
            setInputError(initials,"Please enter valid initials. (Only characters allowed and it must be in capitals [A-Z])");
        }
        else{
            setInputSuccess(initials);
        }
    });
}

// handicap.addEventListener('keyup',function validatePassword() {
//     if (!(parseInt(handicap.value) <= 54 && parseInt(handicap.value) >= 0)){
//         setInputError(handicap,"Invalid handicap. \nHandicaps can only be between 0 (zero) and 54");
//     }
//     else{
//         setInputSuccess(handicap);
//     }
// });
// function validateAge(DoB){
//     var today = new Date().toLocaleDateString().split("/");
//     var todayDay = today[1];
//     var todayMonth = today[0];
//     var todayYear = today[2];
//     var inputDate = DoB.split("/");
//     var day = inputDate[1];
//     var month = inputDate[0];
//     var year = inputDate[2];

//     if (parseInt(todayYear) - parseInt(year) >= 18 && parseInt(todayMonth) <= parseInt(month) && parseInt(todayDay) <= parseInt(day)){
//         return true;
//     }
//     else{
//         return false;
//     }
// }
// dateOfBirth.addEventListener('keyup',function validatePassword() {
//     if (!(dateOfBirth.value <= new Date().toLocaleDateString() && validateAge(dateOfBirth.value) == true )){
//         setInputError(dateOfBirth,"Invalid Date of birth \nDate of birth cannot be a date in the future and only players 18 years and older are allowed to register.");
//     }
//     else{
//         setInputSuccess(dateOfBirth);
//     }
// });
// var countries = CountriesList();
// country.addEventListener('keyup',function validateCountry() {
//     const countryRequirement = /^[A-Z]+|[a-z]+$/;
//     const countryVal = country.value.trim();
//     if (!countryRequirement.test(countryVal) && !countries.includes(country)){
//         var link = document.createElement("a").setAttribute("href","https://www.worldometers.info/geography/alphabetical-list-of-countries/");
//         setInputError(country,"Please enter valid country. List of countries can be found at \n "+ document.querySelector(".countryLinks").appendChild(link));
//     }
//     else{
//         setInputSuccess(country);
//     }
// });

if(telNo!=null){
    telNo.addEventListener('keyup',function validatetelNo() {
        const telNoRequirement = /^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$/;
        const telNoVal = telNo.value.trim();
        if (!telNoRequirement.test(telNoVal)){
            setInputError(telNo,"Please enter valid telephone number (Only digits allowed)");
        }
        else{
            setInputSuccess(telNo);
        }
    });
}

// genderMale.addEventListener("click", function (){
//     genderFemale.checked = false;
//     genderOther.checked = false;
// });

// genderFemale.addEventListener("click", function (){
//     genderMale.checked = false;
//     genderOther.checked = false;
// });

// genderOther.addEventListener("click", function (){
//     genderFemale.checked = false;
//     genderMale.checked = false;
// });

if(adminType!=null){
    adminType.addEventListener("click", function (){
        playerType.checked = false;
    });
}

if(playerType!=null){
    playerType.addEventListener("click", function (){
        adminType.checked = false;
    });
}

function setInputError(element, msg){
    const userInput = element.parentElement;
    console.log(element);
    const errorMsg = userInput.querySelector('.error');

    errorMsg.innerText = msg;
    userInput.classList.add('error');
    userInput.classList.remove('success');
}
function clearInputSuccessError(element){
    const userInput = element.parentElement;
    console.log(element);
    const errorMsg = userInput.querySelector('.error');

    errorMsg.innerText = "";
    userInput.classList.remove('error');
    userInput.classList.remove('success');
}
function setInputSuccess(element){
    const userInput = element.parentElement;
    const errorMsg = userInput.querySelector('.error');

    errorMsg.innerText = "";
    userInput.classList.add('success');
    userInput.classList.remove('error');
}

form.addEventListener('submit', f => {
    // f.preventDefault();
    ValidateInput();
});
if(pkEmail !=null){
    pkEmail.addEventListener("keyup", function(){
        var emailRequirement = /^\w*@\w+([\.-]?\w+)*(\.[A-Za-z]{2,4})+$/;
        if (!emailRequirement.test(pkEmail.value)){
            setInputError(pkEmail,"Invalid Email. The email must be in the format: something@example.com");
        }
        else{
            setInputSuccess(pkEmail);
        }
    });
}
if(pkEmailID !=null){
    pkEmailID.addEventListener("keyup", function(){
        var emailRequirement = /^\w*@\w+([\.-]?\w+)*(\.[A-Za-z]{2,4})+$/;
        if (!emailRequirement.test(pkEmailID.value)){
            setInputError(pkEmailID,"Invalid Email. The email must be in the format: something@example.com");
        }
        else{
            setInputSuccess(pkEmailID);
        }
    });
}

if(viewAdmins){
    viewAdmins.addEventListener("click", function(){
        viewNormUser.checked=false;
        viewGoogle_iCloud.checked=false;
        viewResetTable.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
        
    })
}
if(viewNormUser){
    viewNormUser.addEventListener("click", function(){
        viewAdmins.checked=false;
        viewGoogle_iCloud.checked=false;
        viewResetTable.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
    })
}
if(viewGoogle_iCloud){
    viewGoogle_iCloud.addEventListener("click", function(){
        viewNormUser.checked=false;
        viewAdmins.checked=false;
        viewResetTable.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
    })
}
if(viewResetTable){
    viewResetTable.addEventListener("click", function(){
        viewAdmins.checked=false;
        viewNormUser.checked=false;
        viewGoogle_iCloud.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
    })
}
//////////update radios//////////////
if(updateEmail != null){
    updateEmail.addEventListener("click", function(){
        updatePsw.checked=false;
        updateTelNo.checked=false;
        updateType.checked=false;
        updateFirstName.checked=false;
        updateInitials.checked=false;
        document.querySelector(".updateInput > input").className=""; //empty class list
        document.querySelector(".updateInput > input").classList.add("updatePopupInput");
        document.querySelector(".updateInput > input").classList.add("option1");
        document.querySelector(".updateInput > input").classList.add("email");
        document.querySelector(".updateInput > input").placeholder ="Enter User email (e.g. some@example.com)";
        document.querySelector(".updateInput > input").setAttribute("type","text");
        document.querySelector(".updateInput > input").setAttribute("name","option1");
    })
}
if(updatePsw != null){
    updatePsw.addEventListener("click", function(){
        updateEmail.checked=false;
        updateTelNo.checked=false;
        updateType.checked=false;
        updateFirstName.checked=false;
        updateInitials.checked=false;
        updateLastName.checked=false;
        document.querySelector(".updateInput > input").className=""; //empty class list
        document.querySelector(".updateInput > input").classList.add("updatePopupInput");
        document.querySelector(".updateInput > input").classList.add("option2");
        document.querySelector(".updateInput > input").classList.add("password");   
        document.querySelector(".updateInput > input").placeholder ="Enter User password";
        document.querySelector(".updateInput > input").setAttribute("type","password");
        document.querySelector(".updateInput > input").setAttribute("name","option2");
    })
}
if(updateTelNo != null){
    updateTelNo.addEventListener("click", function(){
        updatePsw.checked=false;
        updateEmail.checked=false;
        updateType.checked=false;
        updateFirstName.checked=false;
        updateInitials.checked=false;
        updateLastName.checked=false;
        document.querySelector(".updateInput > input").className=""; //empty class list
        document.querySelector(".updateInput > input").classList.add("updatePopupInput");
        document.querySelector(".updateInput > input").classList.add("option3");
        document.querySelector(".updateInput > input").classList.add("telNo");
        document.querySelector(".updateInput > input").placeholder ="Enter User Tel No.";
        document.querySelector(".updateInput > input").setAttribute("type","text");
        document.querySelector(".updateInput > input").setAttribute("name","option3");
    })
}
if(updateType != null){
    updateType.addEventListener("click", function(){
        updatePsw.checked=false;
        updateTelNo.checked=false;
        updateEmail.checked=false;
        updateFirstName.checked=false;
        updateInitials.checked=false;
        updateLastName.checked=false;
        document.querySelector(".updateInput > input").className=""; //empty class list
        document.querySelector(".updateInput > input").classList.add("updatePopupInput");
        document.querySelector(".updateInput > input").classList.add("option4");
        document.querySelector(".updateInput > input").classList.add("userType");
        document.querySelector(".updateInput > input").placeholder ="Enter User Type (e.g. Admin/Normal)";
        document.querySelector(".updateInput > input").setAttribute("type","text");
        document.querySelector(".updateInput > input").setAttribute("name","option4");
    })
}
if(updateFirstName != null){
    updateFirstName.addEventListener("click", function(){
        updatePsw.checked=false;
        updateTelNo.checked=false;
        updateType.checked=false;
        updateEmail.checked=false;
        updateLastName.checked=false;
        document.querySelector(".updateInput > input").className=""; //empty class list
        document.querySelector(".updateInput > input").classList.add("updatePopupInput");
        document.querySelector(".updateInput > input").classList.add("option5");
        document.querySelector(".updateInput > input").classList.add("name");
        document.querySelector(".updateInput > input").placeholder ="Enter First Name";
        document.querySelector(".updateInput > input").setAttribute("type","text");
        document.querySelector(".updateInput > input").setAttribute("name","option5");
    })
}
if(updateLastName != null){
    updateLastName.addEventListener("click", function(){
        updateEmail.checked=false;
        updatePsw.checked=false;
        updateTelNo.checked=false;
        updateType.checked=false;
        updateFirstName.checked=false;
        updateInitials.checked=false;
        document.querySelector(".updateInput > input").className=""; //empty class list
        document.querySelector(".updateInput > input").classList.add("updatePopupInput");
        document.querySelector(".updateInput > input").classList.add("option6");
        document.querySelector(".updateInput > input").classList.add("surname");
        document.querySelector(".updateInput > input").placeholder ="Enter Last Name";
        document.querySelector(".updateInput > input").setAttribute("type","text");
        document.querySelector(".updateInput > input").setAttribute("name","option6");
    })
}
if(updateInitials != null){
    updateInitials.addEventListener("click", function(){
        updateEmail.checked=false;
        updatePsw.checked=false;
        updateTelNo.checked=false;
        updateType.checked=false;
        updateFirstName.checked=false;
        document.querySelector(".updateInput > input").className=""; //empty class list
        document.querySelector(".updateInput > input").classList.add("updatePopupInput");
        document.querySelector(".updateInput > input").classList.add("option7");
        document.querySelector(".updateInput > input").classList.add("initials");
        document.querySelector(".updateInput > input").placeholder ="Enter User initials";
        document.querySelector(".updateInput > input").setAttribute("type","text");
        document.querySelector(".updateInput > input").setAttribute("name","option7");
    })
}
//validation on update fields
if (updatePopupInput != null){
    updatePopupInput.addEventListener("keyup", function (){
        if (updateEmail.checked){
            //do validation for ID number
            clearInputSuccessError(updatePopupInput);
            var emailRequirement = /^\w*@\w+([\.-]?\w+)*(\.[A-Za-z]{2,4})+$/;
            if(!emailRequirement.test(updatePopupInput.value.trim())){
                setInputError(updatePopupInput,"Email address did not match the format- something@example.com");
            }
            else{
                setInputSuccess(updatePopupInput);
            }
        }
        else if (updatePsw.checked){
            //do validation for ID number
            clearInputSuccessError(updatePopupInput);
            const passwordRequirement = /^(?=.{8,}$)(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W).*$/;
            var passwordVal = password.value.trim();
            if (!passwordRequirement.test(updatePopupInput.value.trim())){
                setInputError(updatePopupInput,"Invalid password. \nIt needs to contain: at least 8 characters, uppercase and lowercase characters, numeric digits and at least one symbol [&,%,$,etc.]");
            }
            else{
                setInputSuccess(updatePopupInput);
            }
        }
        else if(updateTelNo.checked){
            clearInputSuccessError(updatePopupInput);
            const telNoRequirement = /^\d{10}$/;
            if (!telNoRequirement.test(updatePopupInput.value.trim())){
                setInputError(updatePopupInput, "Please enter valid telephone number (Must contain 10 digits)");
            }
            else{
                setInputSuccess(updatePopupInput);
            }
        }
        else if(updateType.checked){
            clearInputSuccessError(updatePopupInput);
            const updateTypeRequirement = /^(Admin)|(Normal)$/;
            if (!updateTypeRequirement.test(updatePopupInput.value.trim())){
                setInputError(updatePopupInput, "Invalid user type. Please ensure that iy matches one of the following: Admin, Normal");
            }
            else{
                setInputSuccess(updatePopupInput);
            }
        }
        else if (updateFirstName.checked){
            //do validation for ID number
            clearInputSuccessError(updatePopupInput);
            const nameRequirement = /^[A-Z][a-z]+$/;
            if (!nameRequirement.test(updatePopupInput.value.trim())){
                setInputError(updatePopupInput,"Please enter a valid name. (Only characters allowed and it must start with a capital)");
            }
            else{
                setInputSuccess(updatePopupInput);
            }
        }
        else if (updateLastName.checked){
            //do validation for ID number
            clearInputSuccessError(updatePopupInput);
            const nameRequirement = /^[A-Z][a-z]+$/;
            if (!nameRequirement.test(updatePopupInput.value.trim())){
                setInputError(updatePopupInput,"Please enter a valid surname. (Only characters allowed and it must start with a capital)");
            }
            else{
                setInputSuccess(updatePopupInput);
            }
        }
        else if (updateInitials.checked){
            //do validation for ID number
            clearInputSuccessError(updatePopupInput);
            const initialsRequirement = /^[A-Z]+$/;
            if (!initialsRequirement.test(updatePopupInput.value.trim())){
                setInputError(updatePopupInput,"Please enter valid initials. (Only characters allowed and it must be in capitals)");
            }
            else{
                setInputSuccess(updatePopupInput);
            }
        }
    });
}

function ValidateInput(){
    const nameRequirement = /^[A-Z][a-z]+$/;
    const surnameRequirement = /^[A-Z][a-z]+$/;
    const passwordRequirement = /^(?=.{8,}$)(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W).*$/;
    const emailRequirement = /^\w*@\w+([\.-]?\w+)*(\.[A-Za-z]{2,4})+$/;
    const telNoRequirement = /^\d{10}$/;
    const initialsRequirement = /^[A-Z]+$/;

    const nameVal = Name.value.trim();
    const surnameVal = surname.value.trim();
    const passwordVal = password.value.trim();
    const emailVal = email.value.trim();
    const telNoVal = telNo.value.trim();
    const initialsVal = initials.value.trim();

    // var submitReq = false;

    if (!nameRequirement.test(nameVal)){
        setInputError(Name,"Please enter a valid name. (Only characters allowed and it must start with a capital)");
    }
    else{
        setInputSuccess(Name);
    }
    if (!initialsRequirement.test(initialsVal)){
        setInputError(initials,"Please enter valid Initials. (Only characters allowed and it has to be in capitals)");
    }
    else{
        setInputSuccess(initials);
    }
    if (!surnameRequirement.test(surnameVal)){
        setInputError(surname,"Please enter a valid surname. (Only characters allowed and it must start with a capital)");
    }
    else{
        setInputSuccess(surname);
    }
    if (!emailRequirement.test(emailVal)){
        setInputError(email,"Email address did not match the format- something@example.com");
    }
    else{
        setInputSuccess(email);
    }
    if (!passwordRequirement.test(passwordVal)){
        setInputError(password,"Invalid password. \nIt needs to contain: at least 8 characters, uppercase and lowercase characters, numeric digits and at least one symbol [&,%,$,etc.]");
    }
    else{
        setInputSuccess(password);
    }
    if (!adminType.checked && !playerType.checked){
        setInputError(adminType, "Please select a user type.")
    }
    else{
        setInputSuccess(adminType);
    }
    if (!telNoRequirement.test(telNoVal)){
        setInputError(telNo, "Please enter valid telephone number (Must contain 10 digits)");
    }
    else{
        setInputSuccess(telNo);
    }
}

// function CountriesList(){
//     return [ "Afhanistan",
//     "Albania",
//     "Algeria",
//     "Andorro",
//     "Angola",
//     "Antigua and Barbuda",
//     "Argentina",
//     "Armenia",
//     "Australia",
//     "Austria",
//     "Azerbaijan",
//     "Bahamas",
//     "Bahrain",
//     "Bangladesh",
//     "Barbados",
//     "Belarus",
//     "Belgium",
//     "Belize",
//     "Benin",
//     "Bhutan",
//     "Bolivia",
//     "Bosnia and Herzegovina",
//     "Botswana",
//     "Brazil",
//     "Brunei",
//     "Bulgaria",
//     "Burkina Faso",
//     "Burundi",
//     "Côte d'Ivoire",
//     "Cabo Verde",
//     "Cambodia",
//     "Cameroon",
//     "Canada",
//     "Central African Republic",
//     "Chad",
//     "Chile",
//     "China",
//     "Colombia",
//     "Congo",
//     "Costa Rica",
//     "Croatia",
//     "Cuba",
//     "Cyprus",
//     "Czech Republic",
//     "Democratic Republic of the Congo",
//     "Denmark",
//     "Djibouti",
//     "Dominica",
//     "Dominican Republic",
//     "Ecuador",
//     "Egypt",
//     "El Salvador",
//     "Equatorial Guinea",
//     "Eritrea",
//     "Estonia",
//     "Swaziland",
//     "Ethiopia",
//     "Fiji",
//     "Finland",
//     "France",
//     "Gabon",
//     "Gambia",
//     "Georgia",
//     "Germany",
//     "Ghana",
//     "Greece",
//     "Grenada",
//     "Guatemala",
//     "Guinea",
//     "Guinea-Bissau",
//     "Guyana",
//     "Haiti",
//     "Holy See",
//     "Honduras",
//     "Hungary",
//     "Iceland",
//     "India",
//     "Indonesia",
//     "Iran",
//     "Iraq",
//     "Ireland",
//     "Israel",
//     "Italy",
//     "Jamaica",
//     "Japan",
//     "Jordan",
//     "Kazakhstan",
//     "Kenya",
//     "Kiribati",
//     "Kuwait",
//     "Kyrgyzstan",
//     "Laos",
//     "Latvia",
//     "Lebanon",
//     "Lesotho",
//     "Liberia",
//     "Libya",
//     "Liechtenstein",
//     "Lithuania",
//     "Luxembourg",
//     "Madagascar",
//     "Malawi",
//     "Malaysia",
//     "Maldives",
//     "Mali",
//     "Malta",
//     "Marshall Islands",
//     "Mauritania",
//     "Mauritius",
//     "Mexico",
//     "Micronesia",
//     "Moldova",
//     "Monaco",
//     "Mongolia",
//     "Montenegro",
//     "Morocco",
//     "Mozambique",
//     "Myanmar",
//     "Namibia",
//     "Nauru",
//     "Nepal",
//     "Netherlands",
//     "New Zealand",
//     "Nicaragua",
//     "Niger",
//     "Nigeria",
//     "North Korea",
//     "North Macedonia",
//     "Norway",
//     "Oman",
//     "Pakistan",
//     "Palau",
//     "Palestine State",
//     "Panama",
//     "Papua New Guinea",
//     "Paraguay",
//     "Peru",
//     "Philippines",
//     "Poland",
//     "Portugal",
//     "Qatar",
//     "Romania",
//     "Russia",
//     "Rwanda",
//     "Saint Kitts and Nevis",
//     "Saint Lucia",
//     "Saint Vincent and the Grenadines",
//     "Samoa",
//     "San Marino",
//     "Sao Tome and Principe",
//     "Saudi Arabia",
//     "Senegal",
//     "Serbia",
//     "Seychelles",
//     "Sierra Leone",
//     "Singapore",
//     "Slovakia",
//     "Slovenia",
//     "Solomon Islands",
//     "Somalia",
//    " South Africa",
//     "South Korea",
//     "South Sudan",
//     "Spain",
//     "Sri Lanka",
//     "Sudan",
//     "Suriname",
//     "Sweden",
//     "Switzerland",
//     "Syria",
//     "Tajikistan",
//     "Tanzania",
//     "Thailand",
//     "Timor-Leste",
//     "Togo",
//     "Tonga",
//     "Trinidad and Tobago",
//     "Tunisia",
//     "Turkey",
//     "Turkmenistan",
//     "Tuvalu",
//     "Uganda",
//     "Ukraine",
//     "United Arab Emirates",
//     "United Kingdom",
//     "United States of America",
//     "Uruguay",
//     "Uzbekistan",
//     "Vanuatu",
//     "Venezuela",
//     "Vietnam",
//     "Yemen",
//     "Zambia",
//     "Zimbabwe"]
// }