var form = document.querySelector("#newStrokeFormPopup");
if (form==null){
    form = document.querySelector("#deleteStrokeForm");
}
if (form==null){
    form = document.querySelector("#updateStrokeForm");
}
const clubUsed = document.querySelector('.clubUsed');
const distance = document.querySelector('.distance');
const landing = document.querySelector('.landing');
const green = document.querySelector(".green");
const fairway = document.querySelector(".fairway");
const rough = document.querySelector(".rough");
const hazard = document.querySelector(".hazard");
const bunker = document.querySelector(".bunker");
const id = document.querySelector('.id');
const updateID = document.querySelector('.updateInputID input.id');
const updatePopupInput = document.querySelector(".updatePopupInput");
const viewDist1 = document.querySelector(".filter-option1");
const viewClubs_Dist = document.querySelector(".filter-option2");
const viewDist2 = document.querySelector(".filter-option3");
const viewDist_Landing = document.querySelector(".filter-option4");
const viewResetTable = document.querySelector(".filter-option5");
const updateClub = document.querySelector(".update-option1");
const updateLanding = document.querySelector(".update-option2");
const updateDist = document.querySelector(".update-option3");

if (clubUsed != null)
{
    clubUsed.addEventListener('keyup',function validateName() {
        const eventRequirement = /^[A-Z][a-z]+\s([a-z]+|[A-Z][a-z]+)$/;
        const eventVal = clubUsed.value.trim();
        if (!eventRequirement.test(eventVal)){
            setInputError(clubUsed,"Please enter a valid club name. (Only characters allowed and it must start with a capital)");
        }
        else{
            setInputSuccess(clubUsed);
        }
    });
}

if (clubUsed != null)
{
    clubUsed.addEventListener("click", function (){
        distance.checked = false;
        landing.checked = false;
    });
}

if (distance != null)
{
    distance.addEventListener("click", function (){
        clubUsed.checked = false;
        landing.checked = false;
    });
}

if (landing != null)
{
    landing.addEventListener("click", function (){
        distance.checked = false;
        clubUsed.checked = false;
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

function ValidateInput(){
    if (green!=null && !green.checked && fairway!=null && !fairway.checked && rough!=null && !rough.checked && hazard!=null && !hazard.checked && bunker!=null && !bunker.checked){
        setInputError(green, "Please select a landing area.")
    }
    else{
        setInputSuccess(green);
    }
    
    if (clubUsed!=null)
    {
        const clubRequirement = /^[A-Z][a-z]+\s([A-Z][a-z]+|[A-Z][a-z]+)$/;

        const clubVal = clubUsed.value.trim();

        // var submitReq = false;

        if (!clubRequirement.test(clubVal)){
            setInputError(clubUsed,"Please enter a valid club name. (Only characters allowed and it must start with a capital)");
        }
        else setInputSuccess(clubUsed);
    }
}

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
if(updateClub!=null){
    updateClub.addEventListener("keyup", function(){
        var updateClubRequirement =  /^[A-Z][a-z]+\s([A-Z][a-z]+|[A-Z][a-z]+)$/;
        if (!updateClubRequirement.test(updateClub.value)){
            setInputError(updateClub,"Invalid club. Please use only letters and start with a capital letter.");
        }
        else{
            setInputSuccess(updateClub);
        }
    });
}

if(viewDist1){
    viewDist1.addEventListener("click", function(){
        viewDist2.checked = false;
        viewClubs_Dist.checked = false;
        viewDist_Landing.checked = false;
        viewResetTable.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
        
    });
}
if(viewDist2){
    viewDist2.addEventListener("click", function(){
        viewDist1.checked = false;
        viewClubs_Dist.checked = false;
        viewDist_Landing.checked = false;
        viewResetTable.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
        
    });
}
if(viewClubs_Dist){
    viewClubs_Dist.addEventListener("click", function(){
        viewDist2.checked = false;
        viewDist1.checked = false;
        viewDist_Landing.checked = false;
        viewResetTable.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
        
    });
}
if(viewDist_Landing){
    viewDist_Landing.addEventListener("click", function(){
        viewDist2.checked = false;
        viewClubs_Dist.checked = false;
        viewDist1.checked = false;
        viewResetTable.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
        
    });
}
if(viewResetTable){
    viewResetTable.addEventListener("click", function(){
        viewDist2.checked = false;
        viewClubs_Dist.checked = false;
        viewDist_Landing.checked = false;
        viewDist1.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
        
    });
}

//////////update radios//////////////
if(updateClub != null){
    updateClub.addEventListener("click", function(){
        updateLanding.checked=false;
        updateDist.checked=false;
        document.querySelector(".updateInput > input").className=""; //empty class list
        document.querySelector(".updateInput > input").classList.add("updatePopupInput");
        document.querySelector(".updateInput > input").classList.add("option1");
        document.querySelector(".updateInput > input").classList.add("Club");
        document.querySelector(".updateInput > input").placeholder ="Enter Club used: (e.g. driver)";
        document.querySelector(".updateInput > input").setAttribute("type","text");
    })
}
if(updateLanding != null){
    updateLanding.addEventListener("click", function(){
        updateClub.checked=false;
        updateDist.checked=false;
        document.querySelector(".updateInput > input").className=""; //empty class list
        document.querySelector(".updateInput > input").classList.add("updatePopupInput");
        document.querySelector(".updateInput > input").classList.add("option2");
        document.querySelector(".updateInput > input").classList.add("landing");   
        document.querySelector(".updateInput > input").placeholder ="Enter where the ball landed: (e.g. fairway)";
        document.querySelector(".updateInput > input").setAttribute("type","text");
    })
}
if(updateDist != null){
    updateDist.addEventListener("click", function(){
        updateClub.checked=false;
        updateLanding.checked=false;
        document.querySelector(".updateInput > input").className=""; //empty class list
        document.querySelector(".updateInput > input").classList.add("updatePopupInput");
        document.querySelector(".updateInput > input").classList.add("option3");
        document.querySelector(".updateInput > input").classList.add("distance");
        document.querySelector(".updateInput > input").placeholder ="Enter shot distance:";
        document.querySelector(".updateInput > input").setAttribute("type","number");
    })
}
//validation on update fields
if (updatePopupInput != null){
    updatePopupInput.addEventListener("keyup", function (){
        if (updateClub.checked){
            //do validation for club
            clearInputSuccessError(updatePopupInput);
            var ClubRequirement = /^([A-Z][a-z]+\s[A-Z][a-z])|([A-Z][a-z])$/;
            if(!ClubRequirement.test(updatePopupInput.value.trim())){
                setInputError(updatePopupInput,"Club name did not match the format- it needs to only contain letters");
            }
            else{
                setInputSuccess(updatePopupInput);
            }
        }
        else if (updateLanding.checked){
            //do validation for landing
            clearInputSuccessError(updatePopupInput);
            const landingRequirement = /^([A-Z][a-z]+\s[A-Z][a-z])|([A-Z][a-z])$/;
            var landingVal = landing.value.trim();
            
            if (!landingRequirement.test(landingVal)){
                setInputError(landing,"Invalid landing. \nIt needs to contain only characters");
            }
            else{
                if (landingRequirement != "green" || landingRequirement != "fairway" || landingRequirement != "rough" || landingRequirement != "water hazard" || landingRequirement != "bunker")
                {
                    setInputError(landing,"Invalid landing: \n It needs to be one of the following: 'green' , 'fairway' , 'rough' , 'water hazard' , 'bunker'")
                }
                else
                    setInputSuccess(landing);
            }
        }
        else if(updateDist.checked){
            clearInputSuccessError(updatePopupInput);
            const distanceRequirement = /^\d$/;
            if (!distanceRequirement.test(distanceVal)){
                setInputError(distance, "Please enter valid distance number. It must contain only digits");
            }
            else{
                setInputSuccess(distance);
            }
        }
    });
}

var dismissPopup = document.querySelector(".cancelbtn");

//add event listeners
dismissPopup.addEventListener("click", function hidePopup(){ //this will hide/remove the popup
    document.querySelector(".fullScreenPopup").style.visibility = "hidden";
    $(".fullScreenPopup").fadeOut();
});
