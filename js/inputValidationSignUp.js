var form = document.querySelector(".loginForm");
if (form == null) form = document.querySelector(".signupForm");
const Name = document.querySelector(".name");
const surname = document.querySelector('.surname');
const password = document.querySelector('.password');
const email = document.querySelector('.email');
const initials = document.querySelector('.initials');
const dateOfBirth = document.querySelector('.dateOfBirth');
const telNo = document.querySelector('.telNo');
const genderMale = document.querySelector('.genderMale');
const genderFemale = document.querySelector('.genderFemale');
const genderOther = document.querySelector('.genderOther');
const country = document.querySelector('.country');
const handicap = document.querySelector('.handicap');
const adminType = document.querySelector('.adminType');
const playerType = document.querySelector('.playerType');

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

handicap.addEventListener('keyup',function validatePassword() {
    if (!(parseInt(handicap.value) <= 54 && parseInt(handicap.value) >= 0)){
        setInputError(handicap,"Invalid handicap. \nHandicaps can only be between 0 (zero) and 54");
    }
    else{
        setInputSuccess(handicap);
    }
});
function validateAge(DoB){
    var today = new Date().toLocaleDateString().split("/");
    var todayDay = today[1];
    var todayMonth = today[0];
    var todayYear = today[2];
    var inputDate = DoB.split("/");
    var day = inputDate[1];
    var month = inputDate[0];
    var year = inputDate[2];

    if (parseInt(todayYear) - parseInt(year) >= 18 && parseInt(todayMonth) <= parseInt(month) && parseInt(todayDay) <= parseInt(day)){
        return true;
    }
    else{
        return false;
    }
}
dateOfBirth.addEventListener('keyup',function validatePassword() {
    if (!(dateOfBirth.value <= new Date().toLocaleDateString() && validateAge(dateOfBirth.value) == true )){
        setInputError(dateOfBirth,"Invalid Date of birth \nDate of birth cannot be a date in the future and only players 18 years and older are allowed to register.");
    }
    else{
        setInputSuccess(dateOfBirth);
    }
});
var countries = CountriesList();
country.addEventListener('keyup',function validateCountry() {
    const countryRequirement = /^[A-Z]+|[a-z]+$/;
    const countryVal = country.value.trim();
    if (!countryRequirement.test(countryVal) && !countries.includes(country)){
        var link = document.createElement("a").setAttribute("href","https://www.worldometers.info/geography/alphabetical-list-of-countries/");
        setInputError(country,"Please enter valid country. List of countries can be found at \n "+ document.querySelector(".countryLinks").appendChild(link));
    }
    else{
        setInputSuccess(country);
    }
});

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

genderMale.addEventListener("click", function (){
    genderFemale.checked = false;
    genderOther.checked = false;
});

genderFemale.addEventListener("click", function (){
    genderMale.checked = false;
    genderOther.checked = false;
});

genderOther.addEventListener("click", function (){
    genderFemale.checked = false;
    genderMale.checked = false;
});

adminType.addEventListener("click", function (){
    playerType.checked = false;
});

playerType.addEventListener("click", function (){
    adminType.checked = false;
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
    const telNoRequirement = /^[A-Z]+|[a-z]+$/;
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
    if (!genderMale.checked && !genderFemale.checked && !genderOther.checked){
        setInputError(genderMale, "Please select a gender.")
    }
    else{
        setInputSuccess(genderMale);
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
    if (!(handicap.value <= 54 && handicap.value >= 0)){
        setInputError(handicap,"Invalid handicap. \nHandicaps can only be between 0 (zero) and 54");
    }
    else{
        setInputSuccess(handicap);
    }
    if (!(dateOfBirth.value <= new Date().toLocaleDateString() && validateAge(dateOfBirth.value) == true )){
        setInputError(dateOfBirth,"Invalid Date of birth \nDate of birth cannot be a date in the future and only players 18 years and older are allowed to register.");
    }
    else{
        setInputSuccess(dateOfBirth);
    }
}

var dismissPopup = document.querySelector(".cancelbtn");

//add event listeners
dismissPopup.addEventListener("click", function hidePopup(){ //this will hide/remove the popup
    document.querySelector(".fullScreenPopup").style.visibility = "hidden";
    $(".fullScreenPopup").fadeOut();
});

function CountriesList(){
    return [ "Afhanistan",
    "Albania",
    "Algeria",
    "Andorro",
    "Angola",
    "Antigua and Barbuda",
    "Argentina",
    "Armenia",
    "Australia",
    "Austria",
    "Azerbaijan",
    "Bahamas",
    "Bahrain",
    "Bangladesh",
    "Barbados",
    "Belarus",
    "Belgium",
    "Belize",
    "Benin",
    "Bhutan",
    "Bolivia",
    "Bosnia and Herzegovina",
    "Botswana",
    "Brazil",
    "Brunei",
    "Bulgaria",
    "Burkina Faso",
    "Burundi",
    "Côte d'Ivoire",
    "Cabo Verde",
    "Cambodia",
    "Cameroon",
    "Canada",
    "Central African Republic",
    "Chad",
    "Chile",
    "China",
    "Colombia",
    "Congo",
    "Costa Rica",
    "Croatia",
    "Cuba",
    "Cyprus",
    "Czech Republic",
    "Democratic Republic of the Congo",
    "Denmark",
    "Djibouti",
    "Dominica",
    "Dominican Republic",
    "Ecuador",
    "Egypt",
    "El Salvador",
    "Equatorial Guinea",
    "Eritrea",
    "Estonia",
    "Swaziland",
    "Ethiopia",
    "Fiji",
    "Finland",
    "France",
    "Gabon",
    "Gambia",
    "Georgia",
    "Germany",
    "Ghana",
    "Greece",
    "Grenada",
    "Guatemala",
    "Guinea",
    "Guinea-Bissau",
    "Guyana",
    "Haiti",
    "Holy See",
    "Honduras",
    "Hungary",
    "Iceland",
    "India",
    "Indonesia",
    "Iran",
    "Iraq",
    "Ireland",
    "Israel",
    "Italy",
    "Jamaica",
    "Japan",
    "Jordan",
    "Kazakhstan",
    "Kenya",
    "Kiribati",
    "Kuwait",
    "Kyrgyzstan",
    "Laos",
    "Latvia",
    "Lebanon",
    "Lesotho",
    "Liberia",
    "Libya",
    "Liechtenstein",
    "Lithuania",
    "Luxembourg",
    "Madagascar",
    "Malawi",
    "Malaysia",
    "Maldives",
    "Mali",
    "Malta",
    "Marshall Islands",
    "Mauritania",
    "Mauritius",
    "Mexico",
    "Micronesia",
    "Moldova",
    "Monaco",
    "Mongolia",
    "Montenegro",
    "Morocco",
    "Mozambique",
    "Myanmar",
    "Namibia",
    "Nauru",
    "Nepal",
    "Netherlands",
    "New Zealand",
    "Nicaragua",
    "Niger",
    "Nigeria",
    "North Korea",
    "North Macedonia",
    "Norway",
    "Oman",
    "Pakistan",
    "Palau",
    "Palestine State",
    "Panama",
    "Papua New Guinea",
    "Paraguay",
    "Peru",
    "Philippines",
    "Poland",
    "Portugal",
    "Qatar",
    "Romania",
    "Russia",
    "Rwanda",
    "Saint Kitts and Nevis",
    "Saint Lucia",
    "Saint Vincent and the Grenadines",
    "Samoa",
    "San Marino",
    "Sao Tome and Principe",
    "Saudi Arabia",
    "Senegal",
    "Serbia",
    "Seychelles",
    "Sierra Leone",
    "Singapore",
    "Slovakia",
    "Slovenia",
    "Solomon Islands",
    "Somalia",
   " South Africa",
    "South Korea",
    "South Sudan",
    "Spain",
    "Sri Lanka",
    "Sudan",
    "Suriname",
    "Sweden",
    "Switzerland",
    "Syria",
    "Tajikistan",
    "Tanzania",
    "Thailand",
    "Timor-Leste",
    "Togo",
    "Tonga",
    "Trinidad and Tobago",
    "Tunisia",
    "Turkey",
    "Turkmenistan",
    "Tuvalu",
    "Uganda",
    "Ukraine",
    "United Arab Emirates",
    "United Kingdom",
    "United States of America",
    "Uruguay",
    "Uzbekistan",
    "Vanuatu",
    "Venezuela",
    "Vietnam",
    "Yemen",
    "Zambia",
    "Zimbabwe"]
}