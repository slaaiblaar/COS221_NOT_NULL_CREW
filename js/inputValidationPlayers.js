var form = document.querySelector("#newPlayerFormPopup");
if (form==null){
    form = document.querySelector("#deletePlayerForm");
}
if (form==null){
    form = document.querySelector("#updatePlayerForm");
}
var dateOfBirth = document.querySelector('.dateOfBirth');
const genderMale = document.querySelector('.genderMale');
const genderFemale = document.querySelector('.genderFemale');
const genderOther = document.querySelector('.genderOther');
const country = document.querySelector('.country');
const handicap = document.querySelector('.handicap');
const age = document.querySelector('.age');
const idNumber = document.querySelector('.idNumber');
const id = document.querySelector('.id');
const updateID = document.querySelector('.updateInputID input.id');
const updatePopupInput = document.querySelector(".updatePopupInput");
const viewMales = document.querySelector(".filter-option1");
const viewFemales = document.querySelector(".filter-option2");
const viewAgeGT45 = document.querySelector(".filter-option3");
const viewAgeLT45 = document.querySelector(".filter-option4");
const viewHandicapGT30 = document.querySelector(".filter-option5");
const viewResetTable = document.querySelector(".filter-option6");
const updatePersonKey = document.querySelector(".update-option1");
const updateDoB = document.querySelector(".update-option2");
const updateAge = document.querySelector(".update-option3");
const updateHandicap = document.querySelector(".update-option4");
const updateDeathDate = document.querySelector(".update-option5");
const updateGender = document.querySelector(".update-option6");

if(handicap!=null){
    handicap.addEventListener('keyup',function validatePassword() {
        if (!(parseInt(handicap.value) <= 54 && parseInt(handicap.value) >= 0)){
            setInputError(handicap,"Invalid handicap. \nHandicaps can only be between 0 (zero) and 54");
        }
        else{
            setInputSuccess(handicap);
        }
    });
}
if(age!=null){
    age.addEventListener('keyup',function validatePassword() {
        if (!(parseInt(age.value) <= 65 && parseInt(age.value) >= 18)){
            setInputError(age,"Invalid age. \nAge can only be between 18 (zero) and 65");
        }
        else{
            setInputSuccess(age);
        }
    });
}

if(idNumber!=null){
    idNumber.addEventListener('keyup',function validateIDnumber(){
        var idRequirement = /^\d{13}$/;
        var day = idNumber.value.substring(4,6);
        var month = idNumber.value.substring(2,4);
        var thisYear = new Date().getFullYear().toString();
        var year = thisYear.substring(0,2)+idNumber.value.substring(0,2);
        var date = year+"-"+month+"-"+day;

        if(!idRequirement.test(idNumber.value.trim())){
            setInputError(idNumber,"Invalid ID. Please ensure it contains 13 digits");
        }
        else if(!(date==dateOfBirth.value.toString())){
            setInputError(idNumber, "Invalid ID Number. Please ensure the first 6 digits matches the date of birth below.");
        }
        else{
            setInputSuccess(idNumber);
        }
    });
}
if(dateOfBirth!=null){
    dateOfBirth.addEventListener('keyup',function validateDoB() {
        var inputDoBAge = ageCalc(dateOfBirth);
        if (!(inputDoBAge >= 18 && inputDoBAge <=65)){
            setInputError(dateOfBirth,"Invalid Date of birth \nOnly players between the ages 18 and 65 are allowed to register.");
        }
        else{
            setInputSuccess(dateOfBirth);
        }
    });
}
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

if(genderMale !=null){
    genderMale.addEventListener("click", function (){
        genderFemale.checked = false;
        genderOther.checked = false;
    });
}
if(genderFemale !=null){
    genderFemale.addEventListener("click", function (){
        genderMale.checked = false;
        genderOther.checked = false;
    });
}
if(genderOther !=null){
    genderOther.addEventListener("click", function (){
        genderFemale.checked = false;
        genderMale.checked = false;
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

if(id !=null){
    id.addEventListener("keyup", function(){
        var idRequirement = /^\d+$/;
        if (!idRequirement.test(id.value)){
            setInputError(id,"Invalid id. Please enter digits");
        }
        else{
            setInputSuccess(id);
        }
    });
}
if(updateID !=null){
    updateID.addEventListener("keyup", function(){
        var updateIDRequirement = /^\d+$/;
        if (!updateIDRequirement.test(updateID.value)){
            setInputError(updateID,"Invalid id. Please enter digits");
        }
        else{
            setInputSuccess(updateID);
        }
    });
}

if(viewMales){
    viewMales.addEventListener("click", function(){
        viewFemales.checked=false;
        viewAgeGT45.checked=false;
        viewAgeLT45.checked=false;
        viewHandicapGT30.checked=false;
        viewResetTable.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
        
    })
}
if(viewFemales){
    viewFemales.addEventListener("click", function(){
        viewMales.checked=false;
        viewAgeGT45.checked=false;
        viewAgeLT45.checked=false;
        viewHandicapGT30.checked=false;
        viewResetTable.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
    })
}
if(viewAgeGT45){
    viewAgeGT45.addEventListener("click", function(){
        viewFemales.checked=false;
        viewMales.checked=false;
        viewAgeLT45.checked=false;
        viewHandicapGT30.checked=false;
        viewResetTable.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
    })
}
if(viewAgeLT45){
    viewAgeLT45.addEventListener("click", function(){
        viewFemales.checked=false;
        viewAgeGT45.checked=false;
        viewMales.checked=false;
        viewHandicapGT30.checked=false;
        viewResetTable.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
    })
}
if(viewHandicapGT30){
    viewHandicapGT30.addEventListener("click", function(){
        viewFemales.checked=false;
        viewAgeGT45.checked=false;
        viewAgeLT45.checked=false;
        viewMales.checked=false;
        viewResetTable.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
    })
}
if(viewResetTable){
    viewResetTable.addEventListener("click", function(){
        viewMales.checked=false;
        viewFemales.checked=false;
        viewAgeGT45.checked=false;
        viewAgeLT45.checked=false;
        viewHandicapGT30.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
    })
}
//////////update radios//////////////
if(updatePersonKey != null){
    updatePersonKey.addEventListener("click", function(){
        updateDoB.checked=false;
        updateAge.checked=false;
        updateHandicap.checked=false;
        updateDeathDate.checked=false;
        viewResetTable.checked=false;
        document.querySelector(".updateInput > input").className=""; //empty class list
        document.querySelector(".updateInput > input").classList.add("updatePopupInput");
        document.querySelector(".updateInput > input").classList.add("option1");
        document.querySelector(".updateInput > input").setAttribute("placeholder","Enter Id number");
        document.querySelector(".updateInput > input").setAttribute("type","number");
        document.querySelector(".updateInput > input").setAttribute("name","option1");
    })
}
if(updateDoB != null){
    updateDoB.addEventListener("click", function(){
        updatePersonKey.checked=false;
        updateAge.checked=false;
        updateHandicap.checked=false;
        updateDeathDate.checked=false;
        updateGender.checked=false;
        document.querySelector(".updateInput > input").className=""; //empty class list
        document.querySelector(".updateInput > input").classList.add("updatePopupInput");
        document.querySelector(".updateInput > input").classList.add("option2");
        document.querySelector(".updateInput > input").setAttribute("placeholder","Enter birth date");
        document.querySelector(".updateInput > input").setAttribute("type","date");
        document.querySelector(".updateInput > input").setAttribute("name","option2");
    })
}
if(updateAge != null){
    updateAge.addEventListener("click", function(){
        updateDoB.checked=false;
        updatePersonKey.checked=false;
        updateHandicap.checked=false;
        updateDeathDate.checked=false;
        updateGender.checked=false;
        document.querySelector(".updateInput > input").className=""; //empty class list
        document.querySelector(".updateInput > input").classList.add("updatePopupInput");
        document.querySelector(".updateInput > input").classList.add("option3");
        document.querySelector(".updateInput > input").setAttribute("placeholder","Enter age (range[18-65]");
        document.querySelector(".updateInput > input").setAttribute("type","number");
        document.querySelector(".updateInput > input").setAttribute("name","option3");
    })
}
if(updateHandicap != null){
    updateHandicap.addEventListener("click", function(){
        updateDoB.checked=false;
        updateAge.checked=false;
        updatePersonKey.checked=false;
        updateDeathDate.checked=false;
        updateGender.checked=false;
        document.querySelector(".updateInput > input").className=""; //empty class list
        document.querySelector(".updateInput > input").classList.add("updatePopupInput");
        document.querySelector(".updateInput > input").classList.add("option4");
        document.querySelector(".updateInput > input").setAttribute("placeholder","Enter handicap (range[0-54])");
        document.querySelector(".updateInput > input").setAttribute("type","number");
        document.querySelector(".updateInput > input").setAttribute("name","option4");
    })
}
if(updateDeathDate != null){
    updateDeathDate.addEventListener("click", function(){
        updateDoB.checked=false;
        updateAge.checked=false;
        updateHandicap.checked=false;
        updatePersonKey.checked=false;
        updateGender.checked=false;
        document.querySelector(".updateInput > input").className=""; //empty class list
        document.querySelector(".updateInput > input").classList.add("updatePopupInput");
        document.querySelector(".updateInput > input").classList.add("option5");
        document.querySelector(".updateInput > input").setAttribute("placeholder","Enter death date");
        document.querySelector(".updateInput > input").setAttribute("type","date");
        document.querySelector(".updateInput > input").setAttribute("name","option5");
    })
}
if(updateGender != null){
    updateGender.addEventListener("click", function(){
        updatePersonKey.checked=false;
        updateDoB.checked=false;
        updateAge.checked=false;
        updateHandicap.checked=false;
        updateDeathDate.checked=false;
        document.querySelector(".updateInput > input").className=""; //empty class list
        document.querySelector(".updateInput > input").classList.add("updatePopupInput");
        document.querySelector(".updateInput > input").classList.add("option6");
        document.querySelector(".updateInput > input").setAttribute("placeholder","Enter gender (choose from Male/Female/Other)");
        document.querySelector(".updateInput > input").setAttribute("type","text");
        document.querySelector(".updateInput > input").setAttribute("name","option6");
    })
}
//validation on update fields
if (updatePopupInput != null){
    updatePopupInput.addEventListener("keyup", function (){
        if (updatePersonKey.checked){
            //do validation for ID number
            clearInputSuccessError(updatePopupInput);
            var idRequirement = /^\d{13}$/;
            var day = updatePopupInput.value.substring(4,6);
            var month = updatePopupInput.value.substring(2,4);
            var thisYear = new Date().getFullYear().toString();
            var year = thisYear.substring(0,2)+updatePopupInput.value.substring(0,2);
            var date = year+"-"+month+"-"+day;
            if(!idRequirement.test(updatePopupInput.value.trim())){
                setInputError(updatePopupInput,"Invalid ID. Please ensure it contains 13 digits");
            }
            else if (!(ageCalc(date) >= 18 && ageCalc(date) <= 65)){
                setInputError(updatePopupInput,"Invalid Date of birth \nOnly players between the ages 18 and 65 are allowed to register.");
            } 
            else{
                setInputSuccess(updatePopupInput);
            }
        }
        else if (updateDoB.checked){
            //do validation for ID number
            clearInputSuccessError(updatePopupInput);
            if (!(ageCalc(updatePopupInput) >= 18 && ageCalc(updatePopupInput) <= 65)){
                setInputError(updatePopupInput,"Invalid Date of birth \nOnly players between the ages 18 and 65 are allowed to register.");
            }
            else{
                setInputSuccess(updatePopupInput);
            }
        }
        else if(updateAge.checked){
            clearInputSuccessError(updatePopupInput);
            if (!(parse_int(updatePopupInput.value) >= 18 && parse_int(updatePopupInput.value) <= 65)){
                setInputError(updatePopupInput);
            }
        }
        else if(updateHandicap.checked){
            clearInputSuccessError(updatePopupInput);
            if (!(parse_int(updatePopupInput.value) >= 0 && parse_int(updatePopupInput.value) <= 54)){
                setInputError(updatePopupInput);
            }
        }
        else if (updateDeathDate.checked){
            //do validation for ID number
            clearInputSuccessError(updatePopupInput);
            if (!(ageCalc(updatePopupInput.value) > 0)){
                setInputError(updatePopupInput,"Invalid Death Date \nCannot use a future date.");
            }
            else{
                setInputSuccess(updatePopupInput);
            }
        }
        else if (updateGender.checked){
            //do validation for ID number
            clearInputSuccessError(updatePopupInput);
            if (!(updatePopupInput.value == "Male" || updatePopupInput.value == "Female" || updatePopupInput.value == "Other")){
                setInputError(updatePopupInput,"Invalid Gender \nChoose one of the following: Male , Female or Other");
            }
            else{
                setInputSuccess(updatePopupInput);
            }
        }
    });
}


//validate input on submit
function ValidateInput(){

    // var submitReq = false;

    if (genderMale!=null && !genderMale.checked && !genderFemale.checked && !genderOther.checked){
        setInputError(genderMale, "Please select a gender.");
    }
    else{
        setInputSuccess(genderMale);
    }
    if (!(handicap!=null && handicap.value <= 54 && handicap.value >= 0)){
        setInputError(handicap,"Invalid handicap. \nHandicaps can only be between 0 (zero) and 54");
    }
    else{
        setInputSuccess(handicap);
    }
    if(dateOfBirth!=null){
        var idRequirement = /^\d{13}$/;
        var day = idNumber.value.substring(4,6);
        var month = idNumber.value.substring(2,4);
        var thisYear = new Date().getFullYear().toString();
        var year = thisYear.substring(0,2)+idNumber.value.substring(0,2);
        var date = year+"-"+month+"-"+day;

        if(!idRequirement.test(idNumber.value.trim())){
            setInputError(idNumber,"Invalid ID. Please ensure it contains 13 digits");
        }
        else if(date!=dateOfBirth.value.toString()){
            setInputError(idNumber, "Invalid ID Number. Please ensure the first 6 digits matches the date of birth below.");
        }
        else{
            setInputSuccess(idNumber);
        }
        if (!(ageCalc(dateOfBirth) >= 18 && ageCalc(dateOfBirth) <= 65)){
            setInputError(dateOfBirth,"Invalid Date of birth \nOnly players between the ages 18 and 65 are allowed to register.");
        }
        else{
            setInputSuccess(dateOfBirth);
        }
    }

    if(id != null){
        var idRequirement = /^\d+$/;
        if (!idRequirement.test(id.value)){
            setInputError(id,"Invalid id. Please enter digits");
        }
        else{
            setInputSuccess(id);
        }
    }

    if (updatePopupInput != null){
        updatePopupInput.addEventListener("keyup", function (){
            if (updatePersonKey.checked){
                //do validation for ID number
                clearInputSuccessError(updatePopupInput);
                var idRequirement = /^\d{13}$/;
                var day = updatePopupInput.value.substring(4,6);
                var month = updatePopupInput.value.substring(2,4);
                var thisYear = new Date().getFullYear().toString();
                var year = thisYear.substring(0,2)+updatePopupInput.value.substring(0,2);
                var date = year+"-"+month+"-"+day;
                if(!idRequirement.test(updatePopupInput.value.trim())){
                    setInputError(updatePopupInput,"Invalid ID. Please ensure it contains 13 digits");
                }
                else if (!(ageCalc(date) >= 18 && ageCalc(date) <= 65)){
                    setInputError(updatePopupInput,"Invalid Date of birth \nOnly players between the ages 18 and 65 are allowed to register.");
                } 
                else{
                    setInputSuccess(updatePopupInput);
                }
            }
            else if (updateDoB.checked){
                //do validation for ID number
                clearInputSuccessError(updatePopupInput);
                if (!(ageCalc(updatePopupInput.value) >= 18 && ageCalc(updatePopupInput.value) <= 65)){
                    setInputError(updatePopupInput,"Invalid Date of birth \nOnly players between the ages 18 and 65 are allowed to register.");
                }
                else{
                    setInputSuccess(updatePopupInput);
                }
            }
            else if(updateAge.checked){
                clearInputSuccessError(updatePopupInput);
                if (!(parse_int(updatePopupInput.value) >= 18 && parse_int(updatePopupInput.value) <= 65)){
                    setInputError(updatePopupInput);
                }
            }
            else if(updateHandicap.checked){
                clearInputSuccessError(updatePopupInput);
                if (!(parse_int(updatePopupInput.value) >= 0 && parse_int(updatePopupInput.value) <= 54)){
                    setInputError(updatePopupInput);
                }
            }
            else if (updateDeathDate.checked){
                //do validation for ID number
                clearInputSuccessError(updatePopupInput);
                if (!(ageCalc(updatePopupInput.value) > 0)){
                    setInputError(updatePopupInput,"Invalid Death Date \nCannot use a future date.");
                }
                else{
                    setInputSuccess(updatePopupInput);
                }
            }
            else if (updateGender.checked){
                //do validation for ID number
                clearInputSuccessError(updatePopupInput);
                if (!(updatePopupInput.value == "Male" || updatePopupInput.value == "Female" || updatePopupInput.value == "Other")){
                    setInputError(updatePopupInput,"Invalid Gender \nChoose one of the following: Male , Female or Other");
                }
                else{
                    setInputSuccess(updatePopupInput);
                }
            }
        });
    }
}

function ageCalc(input) {
    var userinput = input.value;
    var dob = new Date(userinput);
    if(userinput==null || userinput=='') {
      return 0; 
    } else {
    
    //calculate month difference from current date in time
    var month_diff = Date.now() - dob.getTime();
    
    //convert the calculated difference in date format
    var age_dt = new Date(month_diff); 
    
    //extract year from date    
    var year = age_dt.getUTCFullYear();
    
    //now calculate the age of the user
    var age = Math.abs(year - 1970); //1970 is used to determine your age (not sure why but this works)
    
    //display the calculated age
    return age;
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