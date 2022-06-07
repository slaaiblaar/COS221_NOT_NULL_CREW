var form = document.querySelector("#newStatisticsFormPopup");
if (form==null){
    form = document.querySelector("#deleteStatisticsForm");
}
if (form==null){
    form = document.querySelector("#updateStatisticsForm");
}
const tour_type = document.querySelector('.tour_type');
const event_type = document.querySelector('.event_type');
const round_type = document.querySelector('.round_type');
const entity_id = document.querySelector('.entity_id');
const person_id = document.querySelector('.person_id');
const tour_ind = document.querySelector('.tour_ind');
const event_ind = document.querySelector('.event_ind');
const round_ind = document.querySelector('.round_ind');
const player_ind = document.querySelector('.player_ind');
const no_of_eagles = document.querySelector('.no_of_eagles');
const no_of_birdies = document.querySelector('.no_of_birdies');
const no_of_bogeys = document.querySelector('.no_of_bogeys');
const no_of_double_bogeys = document.querySelector('.no_of_double_bogeys');
const winner_id = document.querySelector('.winner_id');
const leader_id = document.querySelector('.leader_id');
const avg_net_score = document.querySelector('.avg_net_score');
const top10_cnt = document.querySelector('.top10_cnt');
const max_drive = document.querySelector('.max_drive');
const win_cnt = document.querySelector('.win_cnt');
const position = document.querySelector('.position');
const id = document.querySelector('.id');
const updateID = document.querySelector('.updateInputID input.id');
const updatePopupInput = document.querySelector(".updatePopupInput");
const viewTours = document.querySelector(".filter-option1");
const viewEvents = document.querySelector(".filter-option2");
const viewRounds = document.querySelector(".filter-option3");
const viewEagles = document.querySelector(".filter-option4");
const viewBirdies = document.querySelector(".filter-option5");
const viewBogeys = document.querySelector(".filter-option6");
const viewDoubleBogeys = document.querySelector(".filter-option7");
const viewMaxDrive = document.querySelector(".filter-option8");
const viewAvgNetScore = document.querySelector(".filter-option9");
const viewResetTable = document.querySelector(".filter-option10");
const updateEntityType = document.querySelector(".update-option1");
const updateWinnerID = document.querySelector(".update-option2");
const updateNoEagles = document.querySelector(".update-option3");
const updateNoBirdies = document.querySelector(".update-option4");
const updateNoBogeys = document.querySelector(".update-option5");
const updateNoDoubleBogeys = document.querySelector(".update-option6");
const updateMaxDrive = document.querySelector(".update-option7");
const updateAvgNetScore = document.querySelector(".update-option8");
const updateWinCount = document.querySelector(".update-option9");
const updatePosition = document.querySelector(".update-option10");

if(entity_id!=null){
    entity_id.addEventListener('keyup',function validateEntityID() {
        var idRequirement = /^\d+$/;
        if (!idRequirement.test(entity_id.value.trim())){
            setInputError(entity_id,"Invalid entity_id. \nEntity_id can only be a digit");
        }
        else{
            setInputSuccess(entity_id);
        }
    });
}
if(person_id!=null){
    person_id.addEventListener('keyup',function validatePersonID() {
        var idRequirement = /^\d+$/;
        if (!idRequirement.test(person_id.value.trim())){
            setInputError(person_id,"Invalid person_id. \nperson_id can only be a digit");
        }
        else{
            setInputSuccess(person_id);
        }
    });
}
if(tour_ind!=null){
    tour_ind.addEventListener('keyup',function validateTourInd() {
        var idRequirement = /^\d+$/;
        if (!idRequirement.test(tour_ind.value.trim())){
            setInputError(tour_ind,"Invalid tour_ind. \ntour_ind can only be a digit");
        }
        else{
            setInputSuccess(tour_ind);
        }
    });
}
if(event_ind!=null){
    event_ind.addEventListener('keyup',function validateEventInd() {
        var idRequirement = /^\d+$/;
        if (!idRequirement.test(event_ind.value.trim())){
            setInputError(event_ind,"Invalid event_ind. \nevent_ind can only be a digit");
        }
        else{
            setInputSuccess(event_ind);
        }
    });
}
if(round_ind!=null){
    round_ind.addEventListener('keyup',function validateRoundInd() {
        var idRequirement = /^\d+$/;
        if (!idRequirement.test(round_ind.value.trim())){
            setInputError(round_ind,"Invalid round_ind. \nround_ind can only be a digit");
        }
        else{
            setInputSuccess(round_ind);
        }
    });
}
if(player_ind!=null){
    player_ind.addEventListener('keyup',function validatePlayerInd() {
        var idRequirement = /^\d+$/;
        if (!idRequirement.test(player_ind.value.trim())){
            setInputError(player_ind,"Invalid player_ind. \nplayer_ind can only be a digit");
        }
        else{
            setInputSuccess(player_ind);
        }
    });
}
if(no_of_eagles!=null){
    no_of_eagles.addEventListener('keyup',function validateNoEagles() {
        var idRequirement = /^\d+$/;
        if (!idRequirement.test(no_of_eagles.value.trim())){
            setInputError(no_of_eagles,"Invalid no_of_eagles. \nno_of_eagles can only be a digit");
        }
        else{
            setInputSuccess(no_of_eagles);
        }
    });
}
if(no_of_birdies!=null){
    no_of_birdies.addEventListener('keyup',function validateNoBirdies() {
        var idRequirement = /^\d+$/;
        if (!idRequirement.test(no_of_birdies.value.trim())){
            setInputError(no_of_birdies,"Invalid no_of_birdies. \nno_of_birdies can only be a digit");
        }
        else{
            setInputSuccess(no_of_birdies);
        }
    });
}
if(no_of_bogeys!=null){
    no_of_bogeys.addEventListener('keyup',function validateNoBogeys() {
        var idRequirement = /^\d+$/;
        if (!idRequirement.test(no_of_bogeys.value.trim())){
            setInputError(no_of_bogeys,"Invalid no_of_bogeys. \nno_of_bogeys can only be a digit");
        }
        else{
            setInputSuccess(no_of_bogeys);
        }
    });
}
if(no_of_double_bogeys!=null){
    no_of_double_bogeys.addEventListener('keyup',function validateNoDoubleBogeys() {
        var idRequirement = /^\d+$/;
        if (!idRequirement.test(no_of_double_bogeys.value.trim())){
            setInputError(no_of_double_bogeys,"Invalid no_of_double_bogeys. \nno_of_double_bogeys can only be a digit");
        }
        else{
            setInputSuccess(no_of_double_bogeys);
        }
    });
}
if(winner_id!=null){
    winner_id.addEventListener('keyup',function validateWinnerID() {
        var idRequirement = /^\d+$/;
        if (!idRequirement.test(winner_id.value.trim())){
            setInputError(winner_id,"Invalid winner_id. \nwinner_id can only be a digit");
        }
        else{
            setInputSuccess(winner_id);
        }
    });
}
if(leader_id!=null){
    leader_id.addEventListener('keyup',function validateLeaderID() {
        var idRequirement = /^\d+$/;
        if (!idRequirement.test(leader_id.value.trim())){
            setInputError(leader_id,"Invalid leader_id. \nleader_id can only be a digit");
        }
        else{
            setInputSuccess(leader_id);
        }
    });
}
if(max_drive!=null){
    max_drive.addEventListener('keyup',function validateMaxDrive() {
        var idRequirement = /^\d+$/;
        if (!idRequirement.test(max_drive.value.trim)){
            setInputError(max_drive,"Invalid max_drive. \nmax_drive can only be a digit");
        }
        else{
            setInputSuccess(max_drive);
        }
    });
}
if(avg_net_score!=null){
    avg_net_score.addEventListener('keyup',function validateAvgNetScore() {
        var idRequirement = /^\d+$/;
        if (!idRequirement.test(avg_net_score.value.trim())){
            setInputError(avg_net_score,"Invalid avg_net_score. \navg_net_score can only be a digit");
        }
        else{
            setInputSuccess(avg_net_score);
        }
    });
}
if(top10_cnt!=null){
    top10_cnt.addEventListener('keyup',function validateTop10Count() {
        var idRequirement = /^\d+$/;
        if (!idRequirement.test(top10_cnt.value.trim())){
            setInputError(top10_cnt,"Invalid top10_cnt. \ntop10_cnt can only be a digit");
        }
        else{
            setInputSuccess(top10_cnt);
        }
    });
}
if(win_cnt!=null){
    win_cnt.addEventListener('keyup',function validateWinCount() {
        var idRequirement = /^\d+$/;
        if (!idRequirement.test(win_cnt.value.trim())){
            setInputError(win_cnt,"Invalid win_cnt. \nwin_cnt can only be a digit");
        }
        else{
            setInputSuccess(win_cnt);
        }
    });
}
if(position!=null){
    position.addEventListener('keyup',function validatePosition() {
        var idRequirement = /^\d+$/;
        if (!idRequirement.test(position.value.trim())){
            setInputError(position,"Invalid position. \nposition can only be a digit");
        }
        else{
            setInputSuccess(position);
        }
    });
}
if(id!=null){
    id.addEventListener('keyup',function validateID() {
        var idRequirement = /^\d+$/;
        if (!idRequirement.test(id.value.trim())){
            setInputError(id,"Invalid id. \nid can only be a digit");
        }
        else{
            setInputSuccess(id);
        }
    });
}
if(updateID!=null){
    updateID.addEventListener('keyup',function validateUpdateID() {
        var idRequirement = /^\d+$/;
        if (!idRequirement.test(updateID.value.trim())){
            setInputError(updateID,"Invalid updateID. \nupdateID can only be a digit");
        }
        else{
            setInputSuccess(updateID);
        }
    });
}
if(tour_type !=null){
    tour_type.addEventListener("click", function (){
        event_type.checked = false;
        round_type.checked = false;
    });
}
if(event_type !=null){
    event_type.addEventListener("click", function (){
        tour_type.checked = false;
        round_type.checked = false;
    });
}
if(round_type !=null){
    round_type.addEventListener("click", function (){
        event_type.checked = false;
        tour_type.checked = false;
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

if(viewTours){
    viewTours.addEventListener("click", function(){
        viewEvents.checked=false;
        viewRounds.checked=false;
        viewEagles.checked=false;
        viewBirdies.checked=false;
        viewBogeys.checked=false;
        viewDoubleBogeys.checked=false;
        viewMaxDrive.checked=false;
        viewAvgNetScore.checked=false;
        viewResetTable.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
        
    })
}
if(viewEvents){
    viewEvents.addEventListener("click", function(){
        viewTours.checked=false;
        viewRounds.checked=false;
        viewEagles.checked=false;
        viewBirdies.checked=false;
        viewBogeys.checked=false;
        viewDoubleBogeys.checked=false;
        viewMaxDrive.checked=false;
        viewAvgNetScore.checked=false;
        viewResetTable.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
    })
}
if(viewRounds){
    viewRounds.addEventListener("click", function(){
        viewEvents.checked=false;
        viewTours.checked=false;
        viewEagles.checked=false;
        viewBirdies.checked=false;
        viewBogeys.checked=false;
        viewDoubleBogeys.checked=false;
        viewMaxDrive.checked=false;
        viewAvgNetScore.checked=false;
        viewResetTable.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
    })
}
if(viewEagles){
    viewEagles.addEventListener("click", function(){
        viewEvents.checked=false;
        viewRounds.checked=false;
        viewTours.checked=false;
        viewBirdies.checked=false;
        viewBogeys.checked=false;
        viewDoubleBogeys.checked=false;
        viewMaxDrive.checked=false;
        viewAvgNetScore.checked=false;
        viewResetTable.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
    })
}
if(viewBirdies){
    viewBirdies.addEventListener("click", function(){
        viewEvents.checked=false;
        viewRounds.checked=false;
        viewEagles.checked=false;
        viewTours.checked=false;
        viewBogeys.checked=false;
        viewDoubleBogeys.checked=false;
        viewMaxDrive.checked=false;
        viewAvgNetScore.checked=false;
        viewResetTable.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
    })
}
if(viewBogeys){
    viewBogeys.addEventListener("click", function(){
        viewEvents.checked=false;
        viewRounds.checked=false;
        viewEagles.checked=false;
        viewTours.checked=false;
        viewBirdies.checked=false;
        viewDoubleBogeys.checked=false;
        viewMaxDrive.checked=false;
        viewAvgNetScore.checked=false;
        viewResetTable.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
    })
}
if(viewDoubleBogeys){
    viewDoubleBogeys.addEventListener("click", function(){
        viewEvents.checked=false;
        viewRounds.checked=false;
        viewEagles.checked=false;
        viewTours.checked=false;
        viewBogeys.checked=false;
        viewBirdies.checked=false;
        viewMaxDrive.checked=false;
        viewAvgNetScore.checked=false;
        viewResetTable.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
    })
}
if(viewMaxDrive){
    viewMaxDrive.addEventListener("click", function(){
        viewEvents.checked=false;
        viewRounds.checked=false;
        viewEagles.checked=false;
        viewTours.checked=false;
        viewBogeys.checked=false;
        viewDoubleBogeys.checked=false;
        viewBirdies.checked=false;
        viewAvgNetScore.checked=false;
        viewResetTable.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
    })
}
if(viewAvgNetScore){
    viewAvgNetScore.addEventListener("click", function(){
        viewEvents.checked=false;
        viewRounds.checked=false;
        viewEagles.checked=false;
        viewTours.checked=false;
        viewBogeys.checked=false;
        viewDoubleBogeys.checked=false;
        viewMaxDrive.checked=false;
        viewBirdies.checked=false;
        viewResetTable.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
    })
}
if(viewResetTable){
    viewResetTable.addEventListener("click", function(){
        viewTours.checked=false;
        viewEvents.checked=false;
        viewRounds.checked=false;
        viewEagles.checked=false;
        viewBirdies.checked=false;
        viewBogeys.checked=false;
        viewDoubleBogeys.checked=false;
        viewMaxDrive.checked=false;
        viewAvgNetScore.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
    })
}
//////////update radios//////////////
if(updateEntityType != null){
    updateEntityType.addEventListener("click", function(){
        updateWinnerID.checked=false;
        updateNoEagles.checked=false;
        updateNoBirdies.checked=false;
        updateNoBogeys.checked=false;
        updateNoDoubleBogeys.checked=false;
        updateMaxDrive.checked=false;
        updateAvgNetScore.checked=false;
        updateWinCount.checked=false;
        updatePosition.checked=false;
        viewResetTable.checked=false;
        document.querySelector(".updateInput > input").className=""; //empty class list
        document.querySelector(".updateInput > input").classList.add("updatePopupInput");
        document.querySelector(".updateInput > input").classList.add("option1");
        document.querySelector(".updateInput > input").setAttribute("placeholder","Enter entity type");
        document.querySelector(".updateInput > input").setAttribute("type","text");
        document.querySelector(".updateInput > input").setAttribute("name","option1");
    })
}
if(updateWinnerID != null){
    updateWinnerID.addEventListener("click", function(){
        updateEntityType.checked=false;
        updateNoEagles.checked=false;
        updateNoBirdies.checked=false;
        updateNoBogeys.checked=false;
        updateNoDoubleBogeys.checked=false;
        updateMaxDrive.checked=false;
        updateAvgNetScore.checked=false;
        updateWinCount.checked=false;
        updatePosition.checked=false;
        viewResetTable.checked=false;
        document.querySelector(".updateInput > input").className=""; //empty class list
        document.querySelector(".updateInput > input").classList.add("updatePopupInput");
        document.querySelector(".updateInput > input").classList.add("option2");
        document.querySelector(".updateInput > input").setAttribute("placeholder","Enter new Winner ID");
        document.querySelector(".updateInput > input").setAttribute("type","number");
        document.querySelector(".updateInput > input").setAttribute("name","option2");
    })
}
if(updateNoEagles != null){
    updateNoEagles.addEventListener("click", function(){
        updateWinnerID.checked=false;
        updateEntityType.checked=false;
        updateNoBirdies.checked=false;
        updateNoBogeys.checked=false;
        updateNoDoubleBogeys.checked=false;
        updateMaxDrive.checked=false;
        updateAvgNetScore.checked=false;
        updateWinCount.checked=false;
        updatePosition.checked=false;
        viewResetTable.checked=false;
        document.querySelector(".updateInput > input").className=""; //empty class list
        document.querySelector(".updateInput > input").classList.add("updatePopupInput");
        document.querySelector(".updateInput > input").classList.add("option3");
        document.querySelector(".updateInput > input").setAttribute("placeholder","Enter No of eagles");
        document.querySelector(".updateInput > input").setAttribute("type","number");
        document.querySelector(".updateInput > input").setAttribute("name","option3");
    })
}
if(updateNoBirdies != null){
    updateNoBirdies.addEventListener("click", function(){
        updateWinnerID.checked=false;
        updateNoEagles.checked=false;
        updateEntityType.checked=false;
        updateNoBogeys.checked=false;
        updateNoDoubleBogeys.checked=false;
        updateMaxDrive.checked=false;
        updateAvgNetScore.checked=false;
        updateWinCount.checked=false;
        updatePosition.checked=false;
        viewResetTable.checked=false;
        document.querySelector(".updateInput > input").className=""; //empty class list
        document.querySelector(".updateInput > input").classList.add("updatePopupInput");
        document.querySelector(".updateInput > input").classList.add("option4");
        document.querySelector(".updateInput > input").setAttribute("placeholder","Enter No of birdies");
        document.querySelector(".updateInput > input").setAttribute("type","number");
        document.querySelector(".updateInput > input").setAttribute("name","option4");
    })
}
if(updateNoBogeys != null){
    updateNoBogeys.addEventListener("click", function(){
        updateWinnerID.checked=false;
        updateNoEagles.checked=false;
        updateNoBirdies.checked=false;
        updateEntityType.checked=false;
        updateNoDoubleBogeys.checked=false;
        updateMaxDrive.checked=false;
        updateAvgNetScore.checked=false;
        updateWinCount.checked=false;
        updatePosition.checked=false;
        viewResetTable.checked=false;
        document.querySelector(".updateInput > input").className=""; //empty class list
        document.querySelector(".updateInput > input").classList.add("updatePopupInput");
        document.querySelector(".updateInput > input").classList.add("option5");
        document.querySelector(".updateInput > input").setAttribute("placeholder","Enter No of bogeys");
        document.querySelector(".updateInput > input").setAttribute("type","number");
        document.querySelector(".updateInput > input").setAttribute("name","option5");
    })
}
if(updateNoDoubleBogeys != null){
    updateNoDoubleBogeys.addEventListener("click", function(){
        updateWinnerID.checked=false;
        updateNoEagles.checked=false;
        updateNoBirdies.checked=false;
        updateEntityType.checked=false;
        updateNoBogeys.checked=false;
        updateMaxDrive.checked=false;
        updateAvgNetScore.checked=false;
        updateWinCount.checked=false;
        updatePosition.checked=false;
        viewResetTable.checked=false;
        document.querySelector(".updateInput > input").className=""; //empty class list
        document.querySelector(".updateInput > input").classList.add("updatePopupInput");
        document.querySelector(".updateInput > input").classList.add("option6");
        document.querySelector(".updateInput > input").setAttribute("placeholder","Enter No of double bogeys");
        document.querySelector(".updateInput > input").setAttribute("type","number");
        document.querySelector(".updateInput > input").setAttribute("name","option6");
    })
}
if(updateMaxDrive != null){
    updateMaxDrive.addEventListener("click", function(){
        updateWinnerID.checked=false;
        updateNoEagles.checked=false;
        updateNoBirdies.checked=false;
        updateEntityType.checked=false;
        updateNoDoubleBogeys.checked=false;
        updateNoBogeys.checked=false;
        updateAvgNetScore.checked=false;
        updateWinCount.checked=false;
        updatePosition.checked=false;
        viewResetTable.checked=false;
        document.querySelector(".updateInput > input").className=""; //empty class list
        document.querySelector(".updateInput > input").classList.add("updatePopupInput");
        document.querySelector(".updateInput > input").classList.add("option7");
        document.querySelector(".updateInput > input").setAttribute("placeholder","Enter Max drive");
        document.querySelector(".updateInput > input").setAttribute("type","number");
        document.querySelector(".updateInput > input").setAttribute("name","option7");
    })
}
if(updateAvgNetScore != null){
    updateAvgNetScore.addEventListener("click", function(){
        updateWinnerID.checked=false;
        updateNoEagles.checked=false;
        updateNoBirdies.checked=false;
        updateEntityType.checked=false;
        updateNoDoubleBogeys.checked=false;
        updateMaxDrive.checked=false;
        updateNoBogeys.checked=false;
        updateWinCount.checked=false;
        updatePosition.checked=false;
        viewResetTable.checked=false;
        document.querySelector(".updateInput > input").className=""; //empty class list
        document.querySelector(".updateInput > input").classList.add("updatePopupInput");
        document.querySelector(".updateInput > input").classList.add("option8");
        document.querySelector(".updateInput > input").setAttribute("placeholder","Enter Avg net score");
        document.querySelector(".updateInput > input").setAttribute("type","number");
        document.querySelector(".updateInput > input").setAttribute("name","option8");
    })
}
if(updateWinCount != null){
    updateWinCount.addEventListener("click", function(){
        updateWinnerID.checked=false;
        updateNoEagles.checked=false;
        updateNoBirdies.checked=false;
        updateEntityType.checked=false;
        updateNoDoubleBogeys.checked=false;
        updateMaxDrive.checked=false;
        updateAvgNetScore.checked=false;
        updateNoBogeys.checked=false;
        updatePosition.checked=false;
        viewResetTable.checked=false;
        document.querySelector(".updateInput > input").className=""; //empty class list
        document.querySelector(".updateInput > input").classList.add("updatePopupInput");
        document.querySelector(".updateInput > input").classList.add("option9");
        document.querySelector(".updateInput > input").setAttribute("placeholder","Enter win count");
        document.querySelector(".updateInput > input").setAttribute("type","number");
        document.querySelector(".updateInput > input").setAttribute("name","option9");
    })
}
if(updatePosition != null){
    updatePosition.addEventListener("click", function(){
        updateWinnerID.checked=false;
        updateNoEagles.checked=false;
        updateNoBirdies.checked=false;
        updateEntityType.checked=false;
        updateNoDoubleBogeys.checked=false;
        updateMaxDrive.checked=false;
        updateAvgNetScore.checked=false;
        updateWinCount.checked=false;
        updateNoBogeys.checked=false;
        viewResetTable.checked=false;
        document.querySelector(".updateInput > input").className=""; //empty class list
        document.querySelector(".updateInput > input").classList.add("updatePopupInput");
        document.querySelector(".updateInput > input").classList.add("option10");
        document.querySelector(".updateInput > input").setAttribute("placeholder","Enter position");
        document.querySelector(".updateInput > input").setAttribute("type","number");
        document.querySelector(".updateInput > input").setAttribute("name","option10");
    })
}
//validation on update fields
if (updatePopupInput != null){
    updatePopupInput.addEventListener("keyup", function (){
        if (updateEntityType.checked){
            //do validation for ID number
            clearInputSuccessError(updatePopupInput);
            if(!("/^(tours)|(events)|(rounds)$/").test(updatePopupInput.value.trim())){
                setInputError(updatePopupInput,"Invalid Entity type. Please ensure it contains one of the following: tours, rounds, events");
            }
            else{
                setInputSuccess(updatePopupInput);
            }
        }
        else if (updateWinnerID.checked){
            //do validation for ID number
            clearInputSuccessError(updatePopupInput);
            var idRequirement = /^\d+$/;
            if (!idRequirement.test(updatePopupInput.value.trim())){
                setInputError(updatePopupInput,"Invalid Winner ID. \nWinner ID can only be a digit");
            }
            else{
                setInputSuccess(updatePopupInput);
            }
        }
        else if(updateNoEagles.checked){
            clearInputSuccessError(updatePopupInput);
            var idRequirement = /^\d+$/;
            if (!idRequirement.test(updatePopupInput.value.trim())){
                setInputError(updatePopupInput,"Invalid No of Eagles. \nNo of Eagles can only be a digit");
            }
            else{
                setInputSuccess(updatePopupInput);
            }
        }
        else if(updateNoBirdies.checked){
            clearInputSuccessError(updatePopupInput);
            var idRequirement = /^\d+$/;
            if (!idRequirement.test(updatePopupInput.value.trim())){
                setInputError(updatePopupInput,"Invalid No of Birdies. \nNo of Birdies can only be a digit");
            }
            else{
                setInputSuccess(updatePopupInput);
            }
        }
        else if (updateNoBogeys.checked){
            //do validation for ID number
            clearInputSuccessError(updatePopupInput);
            var idRequirement = /^\d+$/;
            if (!idRequirement.test(updatePopupInput.value.trim())){
                setInputError(updatePopupInput,"Invalid No of Bogeys. \nNo of Bogeys can only be a digit");
            }
            else{
                setInputSuccess(updatePopupInput);
            }
        }
        else if (updateNoDoubleBogeys.checked){
            //do validation for ID number
            clearInputSuccessError(updatePopupInput);
            var idRequirement = /^\d+$/;
            if (!idRequirement.test(updatePopupInput.value.trim())){
                setInputError(updatePopupInput,"Invalid No of Double Bogeys. \nNo of Double Bogeys can only be a digit");
            }
            else{
                setInputSuccess(updatePopupInput);
            }
        }
        else if (updateMaxDrive.checked){
            //do validation for ID number
            clearInputSuccessError(updatePopupInput);
            var idRequirement = /^\d+$/;
            if (!idRequirement.test(updatePopupInput.value.trim())){
                setInputError(updatePopupInput,"Invalid Max Drive. \nMax Drive can only be a digit");
            }
            else{
                setInputSuccess(updatePopupInput);
            }
        }
        else if (updateAvgNetScore.checked){
            //do validation for ID number
            clearInputSuccessError(updatePopupInput);
            var idRequirement = /^\d+$/;
            if (!idRequirement.test(updatePopupInput.value.trim())){
                setInputError(updatePopupInput,"Invalid Avg Net Score. \nAvg Net Score can only be a digit");
            }
            else{
                setInputSuccess(updatePopupInput);
            }
        }
        else if (updateWinCount.checked){
            //do validation for ID number
            clearInputSuccessError(updatePopupInput);
            var idRequirement = /^\d+$/;
            if (!idRequirement.test(updatePopupInput.value.trim())){
                setInputError(updatePopupInput,"Invalid Win count. \nWin count can only be a digit");
            }
            else{
                setInputSuccess(updatePopupInput);
            }
        }
        else if (updatePosition.checked){
            //do validation for ID number
            clearInputSuccessError(updatePopupInput);
            var idRequirement = /^\d{1,}$/;
            if (!idRequirement.test(updatePopupInput.value.trim())){
                setInputError(updatePopupInput,"Invalid Position. \nPosition can only be a digit");
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

    if (tour_type!=null && !tour_type.checked && event_type!=null && !event_type.checked && round_type!=null && !round_type.checked){
        setInputError(tour_type, "Please select a gender.");
    }
    else{
        setInputSuccess(tour_type);
    }
    if(entity_id!=null){
        entity_id.addEventListener('keyup',function validateEntityID() {
            var idRequirement = /^\d+$/;
            if (!idRequirement.test(entity_id.value.trim())){
                setInputError(entity_id,"Invalid entity_id. \nEntity_id can only be a digit");
            }
            else{
                setInputSuccess(entity_id);
            }
        });
    }
    if(person_id!=null){
        person_id.addEventListener('keyup',function validatePersonID() {
            var idRequirement = /^\d+$/;
            if (!idRequirement.test(person_id.value.trim())){
                setInputError(person_id,"Invalid person_id. \nperson_id can only be a digit");
            }
            else{
                setInputSuccess(person_id);
            }
        });
    }
    if(tour_ind!=null){
        tour_ind.addEventListener('keyup',function validateTourInd() {
            var idRequirement = /^\d+$/;
            if (!idRequirement.test(tour_ind.value.trim())){
                setInputError(tour_ind,"Invalid tour_ind. \ntour_ind can only be a digit");
            }
            else{
                setInputSuccess(tour_ind);
            }
        });
    }
    if(event_ind!=null){
        event_ind.addEventListener('keyup',function validateEventInd() {
            var idRequirement = /^\d+$/;
            if (!idRequirement.test(event_ind.value.trim())){
                setInputError(event_ind,"Invalid event_ind. \nevent_ind can only be a digit");
            }
            else{
                setInputSuccess(event_ind);
            }
        });
    }
    if(round_ind!=null){
        round_ind.addEventListener('keyup',function validateRoundInd() {
            var idRequirement = /^\d+$/;
            if (!idRequirement.test(round_ind.value.trim())){
                setInputError(round_ind,"Invalid round_ind. \nround_ind can only be a digit");
            }
            else{
                setInputSuccess(round_ind);
            }
        });
    }
    if(player_ind!=null){
        player_ind.addEventListener('keyup',function validatePlayerInd() {
            var idRequirement = /^\d+$/;
            if (!idRequirement.test(player_ind.value.trim())){
                setInputError(player_ind,"Invalid player_ind. \nplayer_ind can only be a digit");
            }
            else{
                setInputSuccess(player_ind);
            }
        });
    }
    if(no_of_eagles!=null){
        no_of_eagles.addEventListener('keyup',function validateNoEagles() {
            var idRequirement = /^\d+$/;
            if (!idRequirement.test(no_of_eagles.value.trim())){
                setInputError(no_of_eagles,"Invalid no_of_eagles. \nno_of_eagles can only be a digit");
            }
            else{
                setInputSuccess(no_of_eagles);
            }
        });
    }
    if(no_of_birdies!=null){
        no_of_birdies.addEventListener('keyup',function validateNoBirdies() {
            var idRequirement = /^\d+$/;
            if (!idRequirement.test(no_of_birdies.value.trim())){
                setInputError(no_of_birdies,"Invalid no_of_birdies. \nno_of_birdies can only be a digit");
            }
            else{
                setInputSuccess(no_of_birdies);
            }
        });
    }
    if(no_of_bogeys!=null){
        no_of_bogeys.addEventListener('keyup',function validateNoBogeys() {
            var idRequirement = /^\d+$/;
            if (!idRequirement.test(no_of_bogeys.value.trim())){
                setInputError(no_of_bogeys,"Invalid no_of_bogeys. \nno_of_bogeys can only be a digit");
            }
            else{
                setInputSuccess(no_of_bogeys);
            }
        });
    }
    if(no_of_double_bogeys!=null){
        no_of_double_bogeys.addEventListener('keyup',function validateNoDoubleBogeys() {
            var idRequirement = /^\d+$/;
            if (!idRequirement.test(no_of_double_bogeys.value.trim())){
                setInputError(no_of_double_bogeys,"Invalid no_of_double_bogeys. \nno_of_double_bogeys can only be a digit");
            }
            else{
                setInputSuccess(no_of_double_bogeys);
            }
        });
    }
    if(winner_id!=null){
        winner_id.addEventListener('keyup',function validateWinnerID() {
            var idRequirement = /^\d+$/;
            if (!idRequirement.test(winner_id.value.trim())){
                setInputError(winner_id,"Invalid winner_id. \nwinner_id can only be a digit");
            }
            else{
                setInputSuccess(winner_id);
            }
        });
    }
    if(leader_id!=null){
        leader_id.addEventListener('keyup',function validateLeaderID() {
            var idRequirement = /^\d+$/;
            if (!idRequirement.test(leader_id.value.trim())){
                setInputError(leader_id,"Invalid leader_id. \nleader_id can only be a digit");
            }
            else{
                setInputSuccess(leader_id);
            }
        });
    }
    if(max_drive!=null){
        max_drive.addEventListener('keyup',function validateMaxDrive() {
            var idRequirement = /^\d+$/;
            if (!idRequirement.test(max_drive.value.trim)){
                setInputError(max_drive,"Invalid max_drive. \nmax_drive can only be a digit");
            }
            else{
                setInputSuccess(max_drive);
            }
        });
    }
    if(avg_net_score!=null){
        avg_net_score.addEventListener('keyup',function validateAvgNetScore() {
            var idRequirement = /^\d+$/;
            if (!idRequirement.test(avg_net_score.value.trim())){
                setInputError(avg_net_score,"Invalid avg_net_score. \navg_net_score can only be a digit");
            }
            else{
                setInputSuccess(avg_net_score);
            }
        });
    }
    if(top10_cnt!=null){
        top10_cnt.addEventListener('keyup',function validateTop10Count() {
            var idRequirement = /^\d+$/;
            if (!idRequirement.test(top10_cnt.value.trim())){
                setInputError(top10_cnt,"Invalid top10_cnt. \ntop10_cnt can only be a digit");
            }
            else{
                setInputSuccess(top10_cnt);
            }
        });
    }
    if(win_cnt!=null){
        win_cnt.addEventListener('keyup',function validateWinCount() {
            var idRequirement = /^\d+$/;
            if (!idRequirement.test(win_cnt.value.trim())){
                setInputError(win_cnt,"Invalid win_cnt. \nwin_cnt can only be a digit");
            }
            else{
                setInputSuccess(win_cnt);
            }
        });
    }
    if(position!=null){
        position.addEventListener('keyup',function validatePosition() {
            var idRequirement = /^\d+$/;
            if (!idRequirement.test(position.value.trim())){
                setInputError(position,"Invalid position. \nposition can only be a digit");
            }
            else{
                setInputSuccess(position);
            }
        });
    }
    if(id!=null){
        id.addEventListener('keyup',function validateID() {
            var idRequirement = /^\d+$/;
            if (!idRequirement.test(id.value.trim())){
                setInputError(id,"Invalid id. \nid can only be a digit");
            }
            else{
                setInputSuccess(id);
            }
        });
    }
    if(updateID!=null){
        updateID.addEventListener('keyup',function validateUpdateID() {
            var idRequirement = /^\d+$/;
            if (!idRequirement.test(updateID.value.trim())){
                setInputError(updateID,"Invalid updateID. \nupdateID can only be a digit");
            }
            else{
                setInputSuccess(updateID);
            }
        });
    }

    if (updatePopupInput != null){
        updatePopupInput.addEventListener("keyup", function (){
            if (updateEntityType.checked){
                //do validation for ID number
                clearInputSuccessError(updatePopupInput);
                if(!("/^(tours)|(events)|(rounds)$/").test(updatePopupInput.value.trim())){
                    setInputError(updatePopupInput,"Invalid Entity type. Please ensure it contains one of the following: tours, rounds, events");
                }
                else{
                    setInputSuccess(updatePopupInput);
                }
            }
            else if (updateWinnerID.checked){
                //do validation for ID number
                clearInputSuccessError(updatePopupInput);
                var idRequirement = /^\d+$/;
                if (!idRequirement.test(updatePopupInput.value.trim())){
                    setInputError(updatePopupInput,"Invalid Winner ID. \nWinner ID can only be a digit");
                }
                else{
                    setInputSuccess(updatePopupInput);
                }
            }
            else if(updateNoEagles.checked){
                clearInputSuccessError(updatePopupInput);
                var idRequirement = /^\d+$/;
                if (!idRequirement.test(updatePopupInput.value.trim())){
                    setInputError(updatePopupInput,"Invalid No of Eagles. \nNo of Eagles can only be a digit");
                }
                else{
                    setInputSuccess(updatePopupInput);
                }
            }
            else if(updateNoBirdies.checked){
                clearInputSuccessError(updatePopupInput);
                var idRequirement = /^\d+$/;
                if (!idRequirement.test(updatePopupInput.value.trim())){
                    setInputError(updatePopupInput,"Invalid No of Birdies. \nNo of Birdies can only be a digit");
                }
                else{
                    setInputSuccess(updatePopupInput);
                }
            }
            else if (updateNoBogeys.checked){
                //do validation for ID number
                clearInputSuccessError(updatePopupInput);
                var idRequirement = /^\d+$/;
                if (!idRequirement.test(updatePopupInput.value.trim())){
                    setInputError(updatePopupInput,"Invalid No of Bogeys. \nNo of Bogeys can only be a digit");
                }
                else{
                    setInputSuccess(updatePopupInput);
                }
            }
            else if (updateNoDoubleBogeys.checked){
                //do validation for ID number
                clearInputSuccessError(updatePopupInput);
                var idRequirement = /^\d+$/;
                if (!idRequirement.test(updatePopupInput.value.trim())){
                    setInputError(updatePopupInput,"Invalid No of Double Bogeys. \nNo of Double Bogeys can only be a digit");
                }
                else{
                    setInputSuccess(updatePopupInput);
                }
            }
            else if (updateMaxDrive.checked){
                //do validation for ID number
                clearInputSuccessError(updatePopupInput);
                var idRequirement = /^\d+$/;
                if (!idRequirement.test(updatePopupInput.value.trim())){
                    setInputError(updatePopupInput,"Invalid Max Drive. \nMax Drive can only be a digit");
                }
                else{
                    setInputSuccess(updatePopupInput);
                }
            }
            else if (updateAvgNetScore.checked){
                //do validation for ID number
                clearInputSuccessError(updatePopupInput);
                var idRequirement = /^\d+$/;
                if (!idRequirement.test(updatePopupInput.value.trim())){
                    setInputError(updatePopupInput,"Invalid Avg Net Score. \nAvg Net Score can only be a digit");
                }
                else{
                    setInputSuccess(updatePopupInput);
                }
            }
            else if (updateWinCount.checked){
                //do validation for ID number
                clearInputSuccessError(updatePopupInput);
                var idRequirement = /^\d+$/;
                if (!idRequirement.test(updatePopupInput.value.trim())){
                    setInputError(updatePopupInput,"Invalid Win count. \nWin count can only be a digit");
                }
                else{
                    setInputSuccess(updatePopupInput);
                }
            }
            else if (updatePosition.checked){
                //do validation for ID number
                clearInputSuccessError(updatePopupInput);
                var idRequirement = /^\d+$/;
                if (!idRequirement.test(updatePopupInput.value.trim())){
                    setInputError(updatePopupInput,"Invalid Position. \nPosition can only be a digit");
                }
                else{
                    setInputSuccess(updatePopupInput);
                }
            }
        });
    }
}

