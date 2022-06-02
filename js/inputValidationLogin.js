var form = document.querySelector(".loginForm");
const Name = document.querySelector(".name");
const surname = document.querySelector('.surname');
const password = document.querySelector('.password');
const email = document.querySelector('.email');

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

function setInputError(element, msg){
    const userInput = element.parentElement;
    console.log(element);
    const errorMsg = userInput.querySelector('.error');

    errorMsg.innerText = msg;
    userInput.classList.add('error');
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
})

function ValidateInput(){
    const nameRequirement = /^[A-Z][a-z]+$/;
    const surnameRequirement = /^[A-Z][a-z]+$/;
    const passwordRequirement = /^(?=.{8,}$)(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W).*$/;
    const emailRequirement = /^\w*@\w+([\.-]?\w+)*(\.[A-Za-z]{2,4})+$/;

    const nameVal = Name.value.trim();
    const surnameVal = surname.value.trim();
    const passwordVal = password.value.trim();
    const emailVal = email.value.trim();

    // var submitReq = false;

    if (!nameRequirement.test(nameVal)){
        setInputError(Name,"Please enter a valid name. (Only characters allowed and it must start with a capital)");
    }
    else{
        setInputSuccess(Name);
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