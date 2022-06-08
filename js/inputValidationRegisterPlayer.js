var form = document.querySelector("#newRegisterPlayerFormPopup");
if (form==null){
    form = document.querySelector("#deleteRegisterPlayerPopup");
}
if (form==null){
    form = document.querySelector("#updateRegisterPlayerPopup");
}
var person_id = document.querySelector('.person_id');
const round_id = document.querySelector('.round_id');
const hole_id = document.querySelector('.hole_id');
const stroke_count = document.querySelector('.stroke_count');
const net_score = document.querySelector('.net_score');
const birdie = document.querySelector('.birdie');
const eagle = document.querySelector('.eagle');
const bogey = document.querySelector('.bogey');
const double_bogey = document.querySelector('.double_bogey');
const person_idDelete = document.querySelector('.person_idDelete');
const round_idDelete = document.querySelector('.round_idDelete');
const hole_idDelete = document.querySelector('.hole_idDelete');
const person_idUpdate = document.querySelector('.person_idUpdate');
const round_idUpdate = document.querySelector('.round_idUpdate');
const hole_idUpdate = document.querySelector('.hole_idDelete');
const viewNetScore = document.querySelector(".filter-option1");
const viewPlayersWithBirdies = document.querySelector(".filter-option2");
const viewPlayersWithEagles = document.querySelector(".filter-option3");
const viewPlayersWithBogeys = document.querySelector(".filter-option4");
const viewPlayersWithDoubleBogeys = document.querySelector(".filter-option5");
const viewResetTable = document.querySelector(".filter-option6");
const updateStrokeCount = document.querySelector(".update-option1");
const updateNetScore = document.querySelector(".update-option2");
const updatePopupInput = document.querySelector(".updatePopupInput");

if(person_id!=null){
    person_id.addEventListener('keyup',function validateID() {
        var idRequirement = /^\d+$/;
        if (!idRequirement.test(person_id.value.trim())){
            setInputError(person_id,"Invalid id. \nid can only be a digit");
        }
        else{
            setInputSuccess(person_id);
        }
    });
}
if(round_id!=null){
    round_id.addEventListener('keyup',function validateID() {
        var idRequirement = /^\d+$/;
        if (!idRequirement.test(round_id.value.trim())){
            setInputError(round_id,"Invalid id. \nid can only be a digit");
        }
        else{
            setInputSuccess(round_id);
        }
    });
}
if(hole_id!=null){
    hole_id.addEventListener('keyup',function validateID() {
        var idRequirement = /^\d+$/;
        if (!idRequirement.test(hole_id.value.trim())){
            setInputError(hole_id,"Invalid id. \nid can only be a digit");
        }
        else{
            setInputSuccess(hole_id);
        }
    });
}
if(stroke_count!=null){
    stroke_count.addEventListener('keyup',function validateID() {
        var idRequirement = /^-?(\d+)$/;
        if (!idRequirement.test(stroke_count.value.trim())){
            setInputError(stroke_count,"Invalid id. \nid can only be a digit");
        }
        else{
            setInputSuccess(stroke_count);
        }
    });
}
if(net_score!=null){
    net_score.addEventListener('keyup',function validateID() {
        var idRequirement = /^-?(\d+)$/;
        if (!idRequirement.test(net_score.value.trim())){
            setInputError(net_score,"Invalid id. \nid can only be a digit");
        }
        else{
            setInputSuccess(net_score);
        }
    });
}

if(birdie !=null){
    birdie.addEventListener("click", function (){
        eagle.checked = false;
        bogey.checked = false;
        double_bogey.checked = false;
    });
}
if(eagle !=null){
    eagle.addEventListener("click", function (){
        birdie.checked = false;
        bogey.checked = false;
        double_bogey.checked = false;
    });
}
if(bogey !=null){
    bogey.addEventListener("click", function (){
        eagle.checked = false;
        birdie.checked = false;
        double_bogey.checked = false;
    });
}
if(double_bogey !=null){
    double_bogey.addEventListener("click", function (){
        eagle.checked = false;
        birdie.checked = false;
        bogey.checked = false;
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

if(person_idDelete !=null){
    person_idDelete.addEventListener("keyup", function(){
        var idRequirement = /^\d+$/;
        if (!idRequirement.test(person_idDelete.value)){
            setInputError(person_idDelete,"Invalid id. Please enter digits");
        }
        else{
            setInputSuccess(person_idDelete);
        }
    });
}
if(round_idDelete !=null){
    round_idDelete.addEventListener("keyup", function(){
        var idRequirement = /^\d+$/;
        if (!idRequirement.test(round_idDelete.value)){
            setInputError(round_idDelete,"Invalid id. Please enter digits");
        }
        else{
            setInputSuccess(round_idDelete);
        }
    });
}
if(hole_idDelete !=null){
    hole_idDelete.addEventListener("keyup", function(){
        var idRequirement = /^\d+$/;
        if (!idRequirement.test(hole_idDelete.value)){
            setInputError(hole_idDelete,"Invalid id. Please enter digits");
        }
        else{
            setInputSuccess(hole_idDelete);
        }
    });
}
if(person_idUpdate !=null){
    person_idUpdate.addEventListener("keyup", function(){
        var updateIDRequirement = /^\d+$/;
        if (!updateIDRequirement.test(person_idUpdate.value)){
            setInputError(person_idUpdate,"Invalid id. Please enter digits");
        }
        else{
            setInputSuccess(person_idUpdate);
        }
    });
}
if(round_idUpdate !=null){
    round_idUpdate.addEventListener("keyup", function(){
        var updateIDRequirement = /^\d+$/;
        if (!updateIDRequirement.test(round_idUpdate.value)){
            setInputError(round_idUpdate,"Invalid id. Please enter digits");
        }
        else{
            setInputSuccess(round_idUpdate);
        }
    });
}
if(hole_idUpdate !=null){
    hole_idUpdate.addEventListener("keyup", function(){
        var updateIDRequirement = /^\d+$/;
        if (!updateIDRequirement.test(hole_idUpdate.value)){
            setInputError(hole_idUpdate,"Invalid id. Please enter digits");
        }
        else{
            setInputSuccess(hole_idUpdate);
        }
    });
}

if(viewNetScore){
    viewNetScore.addEventListener("click", function(){
        viewPlayersWithBirdies.checked=false;
        viewPlayersWithEagles.checked=false;
        viewPlayersWithBogeys.checked=false;
        viewPlayersWithDoubleBogeys.checked=false;
        viewResetTable.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
        
    })
}
if(viewPlayersWithBirdies){
    viewPlayersWithBirdies.addEventListener("click", function(){
        viewNetScore.checked=false;
        viewPlayersWithEagles.checked=false;
        viewPlayersWithBogeys.checked=false;
        viewPlayersWithDoubleBogeys.checked=false;
        viewResetTable.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
    })
}
if(viewPlayersWithEagles){
    viewPlayersWithEagles.addEventListener("click", function(){
        viewPlayersWithBirdies.checked=false;
        viewNetScore.checked=false;
        viewPlayersWithBogeys.checked=false;
        viewPlayersWithDoubleBogeys.checked=false;
        viewResetTable.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
    })
}
if(viewPlayersWithBogeys){
    viewPlayersWithBogeys.addEventListener("click", function(){
        viewPlayersWithBirdies.checked=false;
        viewPlayersWithEagles.checked=false;
        viewNetScore.checked=false;
        viewPlayersWithDoubleBogeys.checked=false;
        viewResetTable.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
    })
}
if(viewPlayersWithDoubleBogeys){
    viewPlayersWithDoubleBogeys.addEventListener("click", function(){
        viewPlayersWithBirdies.checked=false;
        viewPlayersWithEagles.checked=false;
        viewPlayersWithBogeys.checked=false;
        viewNetScore.checked=false;
        viewResetTable.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
    })
}
if(viewResetTable){
    viewResetTable.addEventListener("click", function(){
        viewNetScore.checked=false;
        viewPlayersWithBirdies.checked=false;
        viewPlayersWithEagles.checked=false;
        viewPlayersWithBogeys.checked=false;
        viewPlayersWithDoubleBogeys.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
    })
}
//////////update radios//////////////
if(updateStrokeCount != null){
    updateStrokeCount.addEventListener("click", function(){
        updateNetScore.checked=false;
        document.querySelector(".updateInput > input").className=""; //empty class list
        document.querySelector(".updateInput > input").classList.add("updatePopupInput");
        document.querySelector(".updateInput > input").classList.add("option1");
        document.querySelector(".updateInput > input").setAttribute("placeholder","Enter net score");
        document.querySelector(".updateInput > input").setAttribute("type","number");
        document.querySelector(".updateInput > input").setAttribute("name","option1");
    })
}
if(updateNetScore != null){
    updateNetScore.addEventListener("click", function(){
        updateStrokeCount.checked=false;
        document.querySelector(".updateInput > input").className=""; //empty class list
        document.querySelector(".updateInput > input").classList.add("updatePopupInput");
        document.querySelector(".updateInput > input").classList.add("option2");
        document.querySelector(".updateInput > input").setAttribute("placeholder","Enter stroke count");
        document.querySelector(".updateInput > input").setAttribute("type","number");
        document.querySelector(".updateInput > input").setAttribute("name","option1");
    })
}

//validation on update fields
if (updatePopupInput != null){
    updatePopupInput.addEventListener("keyup", function (){
        if (updateStrokeCount.checked){
            //do validation for ID number
            clearInputSuccessError(updatePopupInput);
            var idRequirement = /^\d+$/;
            if(!idRequirement.test(updatePopupInput.value.trim())){
                setInputError(updatePopupInput,"Invalid Count. Please ensure it contains digits");
            }
            else{
                setInputSuccess(updatePopupInput);
            }
        }
        else if (updateNetScore.checked){
            //do validation for ID number
            clearInputSuccessError(updatePopupInput);
            var idRequirement = /^\d+$/;
            if(!idRequirement.test(updatePopupInput.value.trim())){
                setInputError(updatePopupInput,"Invalid score. Please ensure it contains digits");
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

    if (birdie!=null && !birdie.checked && eagle!=null && !eagle.checked && bogey!=null && !bogey.checked && double_bogey!=null && !double_bogey.checked){
        setInputError(birdie, "Please select a stroke type.");
    }
    else{
        setInputSuccess(birdie);
    }
    if(person_id!=null){
        var idRequirement = /^\d+$/;
        if (!idRequirement.test(person_id.value.trim())){
            setInputError(person_id,"Invalid id. \nid can only be a digit");
        }
        else{
            setInputSuccess(person_id);
        }
    }
    if(round_id!=null){
        var idRequirement = /^\d+$/;
        if (!idRequirement.test(round_id.value.trim())){
            setInputError(round_id,"Invalid id. \nid can only be a digit");
        }
        else{
            setInputSuccess(round_id);
        }
    }
    if(hole_id!=null){
        var idRequirement = /^\d+$/;
        if (!idRequirement.test(hole_id.value.trim())){
            setInputError(hole_id,"Invalid id. \nid can only be a digit");
        }
        else{
            setInputSuccess(hole_id);
        }
    }
    if(stroke_count!=null){
        var idRequirement = /^-?(\d+)$/;
        if (!idRequirement.test(stroke_count.value.trim())){
            setInputError(stroke_count,"Invalid id. \nid can only be a digit");
        }
        else{
            setInputSuccess(stroke_count);
        }
    }
    if(net_score!=null){
        var idRequirement = /^-?(\d+)$/;
        if (!idRequirement.test(net_score.value.trim())){
            setInputError(net_score,"Invalid id. \nid can only be a digit");
        }
        else{
            setInputSuccess(net_score);
        }
    }
    
    //validation on update fields
    if (updatePopupInput != null){
        updatePopupInput.addEventListener("keyup", function (){
            if (updateStrokeCount.checked){
                //do validation for ID number
                clearInputSuccessError(updatePopupInput);
                var idRequirement = /^\d+$/;
                if(!idRequirement.test(updatePopupInput.value.trim())){
                    setInputError(updatePopupInput,"Invalid Count. Please ensure it contains digits");
                }
                else{
                    setInputSuccess(updatePopupInput);
                }
            }
            else if (updateNetScore.checked){
                //do validation for ID number
                clearInputSuccessError(updatePopupInput);
                var idRequirement = /^\d+$/;
                if(!idRequirement.test(updatePopupInput.value.trim())){
                    setInputError(updatePopupInput,"Invalid score. Please ensure it contains digits");
                }
                else{
                    setInputSuccess(updatePopupInput);
                }
            }
        });
    }
}