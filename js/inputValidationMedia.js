var form = document.querySelector("#newMediaFormPopup");
if (form==null){
    form = document.querySelector("#deleteMediaForm");
}
if (form==null){
    form = document.querySelector("#updateMediaForm");
}
var object_id = document.querySelector('.object_id');
const source_id = document.querySelector('.source_id');
const revision_id = document.querySelector('.revision_id');
const photoType = document.querySelector('.photoType');
const videoType = document.querySelector('.videoType');
const dateTime = document.querySelector('.dateTime');
const publisher_id = document.querySelector('.publisher_id');
const credit_id = document.querySelector('.credit_id');
const create_location_id = document.querySelector('.create_location_id');
const id = document.querySelector('.id');
const updateID = document.querySelector('.updateInputID input.id');
const updatePopupInput = document.querySelector(".updatePopupInput");
const viewPhotos = document.querySelector(".filter-option1");
const viewVideos = document.querySelector(".filter-option2");
const viewResetTable = document.querySelector(".filter-option3");
const updateMediaType = document.querySelector(".update-option1");

if(object_id!=null){
    object_id.addEventListener('keyup',function validatePassword() {
        var idRequirement = /^\d+$/;
        if (!idRequirement.test(object_id.value.trim())){
            setInputError(object_id,"Invalid object_id. \nobject_id can only be between a digit");
        }
        else{
            setInputSuccess(object_id);
        }
    });
}
if(source_id!=null){
    source_id.addEventListener('keyup',function validatePassword() {
        var idRequirement = /^\d+$/;
        if (!idRequirement.test(source_id.value.trim())){
            setInputError(source_id,"Invalid source_id. \nsource_id can only be between a digit");
        }
        else{
            setInputSuccess(source_id);
        }
    });
}
if(revision_id!=null){
    revision_id.addEventListener('keyup',function validatePassword() {
        var idRequirement = /^\d+$/;
        if (!idRequirement.test(revision_id.value.trim())){
            setInputError(revision_id,"Invalid revision_id. \nrevision_id can only be between a digit");
        }
        else{
            setInputSuccess(revision_id);
        }
    });
}
if(publisher_id!=null){
    publisher_id.addEventListener('keyup',function validatePassword() {
        var idRequirement = /^\d+$/;
        if (!idRequirement.test(publisher_id.value.trim())){
            setInputError(publisher_id,"Invalid publisher_id. \npublisher_id can only be between a digit");
        }
        else{
            setInputSuccess(publisher_id);
        }
    });
}
if(credit_id!=null){
    credit_id.addEventListener('keyup',function validatePassword() {
        var idRequirement = /^\d+$/;
        if (!idRequirement.test(credit_id.value.trim())){
            setInputError(credit_id,"Invalid credit_id. \ncredit_id can only be between a digit");
        }
        else{
            setInputSuccess(credit_id);
        }
    });
}
if(create_location_id!=null){
    create_location_id.addEventListener('keyup',function validatePassword() {
        var idRequirement = /^\d+$/;
        if (!idRequirement.test(create_location_id.value.trim())){
            setInputError(create_location_id,"Invalid create_location_id. \ncreate_location_id can only be between a digit");
        }
        else{
            setInputSuccess(create_location_id);
        }
    });
}

if(photoType !=null){
    photoType.addEventListener("click", function (){
        videoType.checked = false;
    });
}
if(videoType !=null){
    videoType.addEventListener("click", function (){
        photoType.checked = false;
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
        if (!idRequirement.test(id.value.trim())){
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
        if (!updateIDRequirement.test(updateID.value.trim())){
            setInputError(updateID,"Invalid id. Please enter digits");
        }
        else{
            setInputSuccess(updateID);
        }
    });
}

if(viewPhotos){
    viewPhotos.addEventListener("click", function(){
        viewVideos.checked = false;
        viewResetTable.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
        
    })
}
if(viewVideos){
    viewVideos.addEventListener("click", function(){
        viewPhotos.checked = false;
        viewResetTable.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
        
    })
}
if(viewResetTable){
    viewResetTable.addEventListener("click", function(){
        viewPhotos.checked = false;
        viewVideos.checked=false;
        document.querySelector('.submitFilter').style.visibility="visible";
    })
}
//////////update radios//////////////
if(updateMediaType != null){
    updateMediaType.addEventListener("click", function(){
        document.querySelector(".updateInput > input").className=""; //empty class list
        document.querySelector(".updateInput > input").classList.add("updatePopupInput");
        document.querySelector(".updateInput > input").classList.add("option1");
        document.querySelector(".updateInput > input").setAttribute("placeholder","Enter media type (Photo or Video)");
        document.querySelector(".updateInput > input").setAttribute("type","number");
        document.querySelector(".updateInput > input").setAttribute("name","option1");
    })
}
//validation on update fields
if (updatePopupInput != null){
    updatePopupInput.addEventListener("keyup", function (){
        if (updateMediaType.checked){
            //do validation for ID number
            clearInputSuccessError(updatePopupInput);
            var idRequirement = /^(photo)|(video)$/;
            if(!idRequirement.test(updatePopupInput.value.trim())){
                setInputError(updatePopupInput,"Invalid media type. Please ensure it is one of the following: photo, video");
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

    if (photoType!=null && !photoType.checked && videoType!=null && !videoType.checked){
        setInputError(photoType, "Please select a media type.");
    }
    else{
        setInputSuccess(photoType);
    }
    if(object_id!=null){
        object_id.addEventListener('keyup',function validatePassword() {
            var idRequirement = /^\d+$/;
            if (!idRequirement.test(object_id.value.trim())){
                setInputError(object_id,"Invalid object_id. \nobject_id can only be between a digit");
            }
            else{
                setInputSuccess(object_id);
            }
        });
    }
    if(source_id!=null){
        source_id.addEventListener('keyup',function validatePassword() {
            var idRequirement = /^\d+$/;
            if (!idRequirement.test(source_id.value.trim())){
                setInputError(source_id,"Invalid source_id. \nsource_id can only be between a digit");
            }
            else{
                setInputSuccess(source_id);
            }
        });
    }
    if(revision_id!=null){
        revision_id.addEventListener('keyup',function validatePassword() {
            var idRequirement = /^\d+$/;
            if (!idRequirement.test(revision_id.value.trim())){
                setInputError(revision_id,"Invalid revision_id. \nrevision_id can only be between a digit");
            }
            else{
                setInputSuccess(revision_id);
            }
        });
    }
    if(publisher_id!=null){
        publisher_id.addEventListener('keyup',function validatePassword() {
            var idRequirement = /^\d+$/;
            if (!idRequirement.test(publisher_id.value.trim())){
                setInputError(publisher_id,"Invalid publisher_id. \npublisher_id can only be between a digit");
            }
            else{
                setInputSuccess(publisher_id);
            }
        });
    }
    if(credit_id!=null){
        credit_id.addEventListener('keyup',function validatePassword() {
            var idRequirement = /^\d+$/;
            if (!idRequirement.test(credit_id.value.trim())){
                setInputError(credit_id,"Invalid credit_id. \ncredit_id can only be between a digit");
            }
            else{
                setInputSuccess(credit_id);
            }
        });
    }
    if(create_location_id!=null){
        create_location_id.addEventListener('keyup',function validatePassword() {
            var idRequirement = /^\d+$/;
            if (!idRequirement.test(create_location_id.value.trim())){
                setInputError(create_location_id,"Invalid create_location_id. \ncreate_location_id can only be between a digit");
            }
            else{
                setInputSuccess(create_location_id);
            }
        });
    }
    if(id !=null){
        id.addEventListener("keyup", function(){
            var idRequirement = /^\d+$/;
            if (!idRequirement.test(id.value.trim())){
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
            if (!updateIDRequirement.test(updateID.value.trim())){
                setInputError(updateID,"Invalid id. Please enter digits");
            }
            else{
                setInputSuccess(updateID);
            }
        });
    }

    if (updatePopupInput != null){
        updatePopupInput.addEventListener("keyup", function (){
            if (updatePopupInput != null){
                updatePopupInput.addEventListener("keyup", function (){
                    if (updateMediaType.checked){
                        //do validation for ID number
                        clearInputSuccessError(updatePopupInput);
                        var idRequirement = /^(photo)|(video)$/;
                        if(!idRequirement.test(updatePopupInput.value.trim())){
                            setInputError(updatePopupInput,"Invalid media type. Please ensure it is one of the following: photo, video");
                        }
                        else{
                            setInputSuccess(updatePopupInput);
                        }
                    }
                });
            }
            // else if (updateDoB.checked){
            //     //do validation for ID number
            //     clearInputSuccessError(updatePopupInput);
            //     if (!(ageCalc(updatePopupInput.value) >= 18 && ageCalc(updatePopupInput.value) <= 65)){
            //         setInputError(updatePopupInput,"Invalid Date of birth \nOnly players between the ages 18 and 65 are allowed to register.");
            //     }
            //     else{
            //         setInputSuccess(updatePopupInput);
            //     }
            // }
            // else if(updateAge.checked){
            //     clearInputSuccessError(updatePopupInput);
            //     if (!(parse_int(updatePopupInput.value) >= 18 && parse_int(updatePopupInput.value) <= 65)){
            //         setInputError(updatePopupInput);
            //     }
            // }
            // else if(updateHandicap.checked){
            //     clearInputSuccessError(updatePopupInput);
            //     if (!(parse_int(updatePopupInput.value) >= 0 && parse_int(updatePopupInput.value) <= 54)){
            //         setInputError(updatePopupInput);
            //     }
            // }
            // else if (updateDeathDate.checked){
            //     //do validation for ID number
            //     clearInputSuccessError(updatePopupInput);
            //     if (!(ageCalc(updatePopupInput.value) > 0)){
            //         setInputError(updatePopupInput,"Invalid Death Date \nCannot use a future date.");
            //     }
            //     else{
            //         setInputSuccess(updatePopupInput);
            //     }
            // }
            // else if (updateGender.checked){
            //     //do validation for ID number
            //     clearInputSuccessError(updatePopupInput);
            //     if (!(updatePopupInput.value == "Male" || updatePopupInput.value == "Female" || updatePopupInput.value == "Other")){
            //         setInputError(updatePopupInput,"Invalid Gender \nChoose one of the following: Male , Female or Other");
            //     }
            //     else{
            //         setInputSuccess(updatePopupInput);
            //     }
            // }
        });
    }
}