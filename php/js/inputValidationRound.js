const roundNo = document.querySelector('#RoundNo');
const eventId = document.querySelector('#eventId');
const leaderId = document.querySelector('#leaderId');
const state = document.querySelector('#state');

function validateNumbers(data) 
{
    const pattern = /^\d+$/;
    return pattern.test(data);
}

function isEmpty(data)
{
    if (data == "") {
        return true;
    } else {
        return false;
    }
}

function validateAddInput() 
{
    if ((isEmpty(roundNo.value)) || (!validateNumbers(roundNo.value))) {
        alert("Please fill in the field or only numbers allowed between (1-99)");
        roundNo.focus();
        return false;
    }

    if ((isEmpty(eventId.value)) || (!validateNumbers(eventId.value))) {
        alert("Please fill in the field or only numbers allowed");
        eventId.focus();
        return false;
    }

    if ((isEmpty(leaderId.value)) || (!validateNumbers(leaderId.value))) {
        alert("Please fill in the field or only numbers allowed");
        leaderId.focus();
        return false; 
    }

    if ((isEmpty(state.value)) || (validateNumbers(state.value)) || (!/^[a-zA-Z\s]*$/.test(state.value))) {
        alert("Please fill in the field or only letters allowed");
        state.focus();
        return false;
    }
    return true;
}