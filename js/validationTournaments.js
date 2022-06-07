var form = document.querySelector("#newTournamentFormPopup");
if (form==null){
    form = document.querySelector("#deleteTournamentForm");
}
if (form==null){
    form = document.querySelector("#updateTournamentForm");
}
const EventName = document.querySelector(".eventName");
const startDate = document.querySelector('.startDate');
const endDate = document.querySelector('.endDate');
const durationDays = document.querySelector('.duration');
const statusScheduled = document.querySelector('.statusScheduled');
const statusCanceled = document.querySelector('.statusCanceled');
const genderMen = document.querySelector('.genderMen');
const genderWomen = document.querySelector('.genderWomen');
const year = document.querySelector('.year');
const id = document.querySelector('.id');
const updateID = document.querySelector('.updateInputID input.id');
const updatePopupInput = document.querySelector(".updatePopupInput");
const viewMens = document.querySelector(".filter-option1");
const viewWomens = document.querySelector(".filter-option2");
const viewDuration = document.querySelector(".filter-option3");
const viewSchedule = document.querySelector(".filter-option4");
const viewCanceled = document.querySelector(".filter-option5");
const viewResetTable= document.querySelector(".filter-option6");
const updateEvent = document.querySelector(".update-option1");
const updateGenderClass = document.querySelector(".update-option2");
const updateStatus = document.querySelector(".update-option3");


if(EventName != null)
{
    EventName.addEventListener('keyup',function validateName() {
        const eventRequirement = /^[A-Z][a-z]+\s([a-z]+|[A-Z][a-z]+)$/;
        const eventVal = EventName.value.trim();
        if (!eventRequirement.test(eventVal)){
            setInputError(EventName,"Please enter a valid event name. (Only characters allowed and it must start with a capital)");
        }
        else{
            setInputSuccess(EventName);
        }
    });
}

if (genderMen != null)
{
    genderMen.addEventListener("click", function (){
        genderWomen.checked = false;
    });
}

if (genderWomen != null)
{
    genderWomen.addEventListener("click", function (){
        genderMen.checked = false;
    });
}

if (statusScheduled != null)
{
    statusScheduled.addEventListener("click", function (){
        statusCanceled.checked = false;
    });
}

if (statusCanceled != null)
{
    statusCanceled.addEventListener("click", function (){
        statusScheduled.checked = false;
    });
}

// if (year != null)
// {
//     year = new Date().getFullYear();
// }

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
function clearInputSuccessError(element){
    const userInput = element.parentElement;
    console.log(element);
    const errorMsg = userInput.querySelector('.error');

    errorMsg.innerText = "";
    userInput.classList.remove('error');
    userInput.classList.remove('success');
}

form.addEventListener('submit', f => {
    // f.preventDefault();
    ValidateInput();
});

function ValidateInput(){
    if (genderMen!=null && !genderMen.checked && genderWomen!=null && !genderWomen.checked){
        setInputError(genderMen, "Please select a gender class.")
    }
    else{
        setInputSuccess(genderMen);
    }
    if (EventName != null)
    {
        const eventRequirement = /^[A-Z][a-z]+\s([a-z]+|[A-Z][a-z]+)$/;

        const eventVal = EventName.value.trim();

        // var submitReq = false;

        if (!eventRequirement.test(eventVal)){
            setInputError(EventName,"Please enter a valid event name. (Only characters allowed and it must start with a capital)");
        }
        else setInputSuccess(EventName);
    }
    if(durationDays != null)
    {
        if (durationDays == (endDate-startDate))
        {
            setInputError(durationDays,"Please ensure that the duration of days agrees with the difference between the start and end dates.");
        }
        else setInputSuccess(durationDays);
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

if(viewMens){
    viewMens.addEventListener("click", function(){
        viewWomens.checked = false;
        viewDuration.checked = false;
        viewSchedule.checked = false;
        viewCanceled.checked = false;
        viewResetTable.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
        
    });
}
if(viewWomens){
    viewWomens.addEventListener("click", function(){
        viewMens.checked = false;
        viewDuration.checked = false;
        viewSchedule.checked = false;
        viewCanceled.checked = false;
        viewResetTable.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
        
    });
}
if(viewDuration){
    viewDuration.addEventListener("click", function(){
        viewWomens.checked = false;
        viewMens.checked = false;
        viewSchedule.checked = false;
        viewCanceled.checked = false;
        viewResetTable.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
        
    });
}
if(viewSchedule){
    viewSchedule.addEventListener("click", function(){
        viewWomens.checked = false;
        viewDuration.checked = false;
        viewMens.checked = false;
        viewCanceled.checked = false;
        viewResetTable.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
        
    });
}
if(viewCanceled){
    viewCanceled.addEventListener("click", function(){
        viewWomens.checked = false;
        viewDuration.checked = false;
        viewSchedule.checked = false;
        viewMens.checked = false;
        viewResetTable.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
        
    });
}
if(viewResetTable){
    viewResetTable.addEventListener("click", function(){
        viewWomens.checked = false;
        viewDuration.checked = false;
        viewSchedule.checked = false;
        viewCanceled.checked = false;
        viewMens.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
        
    });
}

//////////update radios//////////////
if(updateEvent != null){
    updateEvent.addEventListener("click", function(){
        document.querySelector(".updateInput > input").className=""; //empty class list
        document.querySelector(".updateInput > input").classList.add("updatePopupInput");
        document.querySelector(".updateInput > input").classList.add("option1");
        document.querySelector(".updateInput > input").setAttribute("placeholder","Enter event name: ");
    })
}
if(updateGenderClass != null){
    updateGenderClass.addEventListener("click", function(){
        document.querySelector(".updateInput > input").className=""; //empty class list
        document.querySelector(".updateInput > input").classList.add("updatePopupInput");
        document.querySelector(".updateInput > input").classList.add("option2");
        document.querySelector(".updateInput > input").setAttribute("placeholder","Enter gender class (Men/Women): ");
    })
}
if(updateStatus != null){
    updateStatus.addEventListener("click", function(){
        document.querySelector(".updateInput > input").className=""; //empty class list
        document.querySelector(".updateInput > input").classList.add("updatePopupInput");
        document.querySelector(".updateInput > input").classList.add("option3");
        document.querySelector(".updateInput > input").setAttribute("placeholder","Enter event status (Scheduled/Canceled): ");
    })
}
//validation on update fields
if (updatePopupInput != null){
    updatePopupInput.addEventListener("keyup", function (){
        if (updateEvent.checked){
                //do validation for event
                clearInputSuccessError(updatePopupInput);
                var eventRequirement = /^([A-Z][a-z]+)|([A-Z][a-z]+\s[A-Z][a-z]+)$/;
                if(!eventRequirement.test(updatePopupInput.value.trim())){
                    setInputError(updatePopupInput,"Invalid event name. Please ensure each word starts with a capital letter");
                }
                else{
                    setInputSuccess(updatePopupInput);
                }
            }
            else if (updateGenderClass.checked){
                //do validation for event
                clearInputSuccessError(updatePopupInput);
                var classRequirement = /^(Men)$|^(Women)$/;
                if(!classRequirement.test(updatePopupInput.value.trim())){
                    setInputError(updatePopupInput,"Invalid gender class. Please ensure it is one of the following: Men, Women. (ensure that it starts with a capital letter) ");
                }
                else{
                    setInputSuccess(updatePopupInput);
                }
            }
            else if (updateStatus.checked){
                //do validation for event
                clearInputSuccessError(updatePopupInput);
                var statusRequirement = /^(Scheduled)$|^(Canceled)$/;
                if(!statusRequirement.test(updatePopupInput.value.trim())){
                    setInputError(updatePopupInput,"Invalid event status. Please ensure it is one of the following: Scheduled, Canceled. (ensure that it starts with a capital letter) ");
                }
                else{
                    setInputSuccess(updatePopupInput);
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

