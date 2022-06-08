const viewDate = document.querySelector(".filter-option1");
const viewStartTime = document.querySelector(".filter-option2");
const viewStartTime_LT1500 = document.querySelector(".filter-option3");
const viewEndTime = document.querySelector(".filter-option4");
const viewEndTime_LT1400 = document.querySelector(".filter-option5");
const viewResetTable = document.querySelector(".filter-option6");

if(viewDate){
    viewDate.addEventListener("click", function(){
        viewStartTime.checked=false;
        viewStartTime_LT1500.checked=false;
        viewEndTime.checked=false;
        viewEndTime_LT1400.checked=false;
        viewResetTable.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
        
    })
}
if(viewStartTime){
    viewStartTime.addEventListener("click", function(){
        viewDate.checked=false;
        viewStartTime_LT1500.checked=false;
        viewEndTime.checked=false;
        viewEndTime_LT1400.checked=false;
        viewResetTable.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
    })
}
if(viewStartTime_LT1500){
    viewStartTime_LT1500.addEventListener("click", function(){
        viewStartTime.checked=false;
        viewDate.checked=false;
        viewEndTime.checked=false;
        viewEndTime_LT1400.checked=false;
        viewResetTable.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
    })
}
if(viewEndTime){
    viewEndTime.addEventListener("click", function(){
        viewStartTime.checked=false;
        viewStartTime_LT1500.checked=false;
        viewDate.checked=false;
        viewEndTime_LT1400.checked=false;
        viewResetTable.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
    })
}
if(viewEndTime_LT1400){
    viewEndTime_LT1400.addEventListener("click", function(){
        viewStartTime.checked=false;
        viewStartTime_LT1500.checked=false;
        viewEndTime.checked=false;
        viewDate.checked=false;
        viewResetTable.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
    })
}
if(viewResetTable){
    viewResetTable.addEventListener("click", function(){
        viewDate.checked=false;
        viewStartTime.checked=false;
        viewStartTime_LT1500.checked=false;
        viewEndTime.checked=false;
        viewEndTime_LT1400.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
    })
}