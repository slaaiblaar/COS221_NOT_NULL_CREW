const EventName = document.querySelector(".eventName");
const startDate = document.querySelector('.startDate');
const endDate = document.querySelector('.endDate');
const durationDays = document.querySelector('.duration');
const statusScheduled = document.querySelector('.statusScheduled');
const statusCanceled = document.querySelector('.statusCanceled');
const genderMen = document.querySelector('.genderMen');
const genderWomen = document.querySelector('.genderWomen');
const year = document.querySelector('.year');

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

// $(".startDate").datetimepicker({
//     minDate: new Date(),
//     maxDate: '+5d',
//     changeMonth: false,
//     onSelect: function(date){

//         var selectedDate = new Date(date);
//         var msecsInADay = 86400000;
//         var endDate = new Date(selectedDate.getTime() + msecsInADay);

//        //Set Minimum Date of EndDatePicker After Selected Date of StartDatePicker
//         $(".endDate").datepicker( "option", "minDate", endDate );
//         $(".endDate").datepicker( "option", "maxDate", '+2y' );
//     }
// });

// $(".startDate").onChangeDateTime(function(){
//     $(this).close();
// })

// $(".endDate").datetimepicker({
//     defaultDate: new Date()+1,
//     minDate: $(".startDate").val(),
//     maxDate: $(".startDate").val() + 5
// });


if (genderMen != null)
{
    genderMen.addEventListener("click", function (){
        gendeWomen.checked = false;
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

function ValidateInput(){
    const eventRequirement = /^[A-Z][a-z]+\s([a-z]+|[A-Z][a-z]+)$/;

    const eventVal = EventName.value.trim();

    // var submitReq = false;

    if (!eventRequirement.test(eventVal)){
        setInputError(EventName,"Please enter a valid event name. (Only characters allowed and it must start with a capital)");
    }
}

var dismissPopup = document.querySelector(".cancelbtn");

//add event listeners
dismissPopup.addEventListener("click", function hidePopup(){ //this will hide/remove the popup
    document.querySelector(".fullScreenPopup").style.visibility = "hidden";
    $(".fullScreenPopup").fadeOut();
});

