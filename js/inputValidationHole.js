const holeNo = document.querySelector('#holeNo');
const siteId = document.querySelector('#siteId');
const par = document.querySelector('#par');
const len = document.querySelector('#len');

const updatePopupInput = document.querySelector('.updatePopupInput');
const parLT3 = document.querySelector(".filter-option1");
const parGT3 = document.querySelector(".filter-option2");
const filterSiteId = document.querySelector(".filter-option3");
const viewResetTable = document.querySelector(".filter-option4");
const updateHoleNo = document.querySelector(".update-option1");
const updateSiteId = document.querySelector(".update-option2");
const updateParNo = document.querySelector(".update-option3");
const updateLength = document.querySelector(".update-option4");

function validateNumbers(data) 
{
    const pattern = /^\d+$/;
    return pattern.test(data);
}

function validateDecimalNum(data)
{
    const pattern = /^\d+\.\d{2}$/;
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
    if ((isEmpty(holeNo.value)) || (!validateNumbers(holeNo.value))) {
        alert("Please fill in the field or only numbers allowed between (1-99)");
        holeNo.focus();
        return false;
    }

    if ((isEmpty(siteId.value)) || (!validateNumbers(siteId.value))) {
        alert("Please fill in the field or only numbers allowed");
        siteId.focus();
        return false;
    }

    if ((isEmpty(par.value)) || (!validateNumbers(par.value))) {
        alert("Please fill in the field or only numbers allowed between (1-99)");
        par.focus();
        return false; 
    }

    len.value = parseFloat(len.value);
    if ((isEmpty(len.value)) || (!validateDecimalNum(len.value))) {
        alert("Please fill in the field or only decimal numbers allowed (132.23)");
        len.focus();
        return false;
    }

    return true;
}

function validateDelInput() 
{
    if ((isEmpty(siteId.value)) || (!validateNumbers(siteId.value))) {
        alert("Please fill in the field or only numbers allowed");
        siteId.focus();
        return false;
    }
    return true;
}