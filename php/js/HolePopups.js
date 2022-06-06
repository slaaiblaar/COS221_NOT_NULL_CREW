$(document).ready(function() {
    $.ajax({
        url: "../php/holeTableDisplay.php",
        method: "post",
        dataType: "json",
        success:function(data) {
            let string = "";
            $.each(data, function(key, value) {
                string += `<tr>
                <td>${value['id']}</td>
                <td>${value['hole_no']}</td>
                <td>${value['site_id']}</td>
                <td>${value['par']}</td>
                <td>${value['length']}</td>
            </tr>`
            });
            $("#tableBody").append(string);
        },
        error:{

        }
    });
});

var showAddNewHolePopup = document.getElementById('createNewHole');
showAddNewHolePopup.addEventListener('click', function showPopup() {
    document.querySelector('.fullScreenPopupAdd').style.visibility = 'visible';
    $('.fullScreenPopupAdd').fadeIn();
});


var dismissAddPopup = document.querySelector('.cancelbtn');
dismissAddPopup.addEventListener('click', function hidePopup() {
    document.querySelector('.fullScreenPopupAdd').style.visibility = 'hidden';
    $('.fullScreenPopupAdd').fadeOut();
});

var showDeleteHolePopup = document.getElementById("deleteHole");
showDeleteHolePopup.addEventListener("click", function showPopup() {
    document.querySelector(".fullScreenPopupDelete").style.visibility = "visible";
    $(".fullScreenPopupDelete").fadeIn();
});

var dismissDeletePopup = document.querySelector(".cancelbtnDel");
dismissDeletePopup.addEventListener("click", function hidePopup() { 
    document.querySelector(".fullScreenPopupDelete").style.visibility = "hidden";
    $(".fullScreenPopupDelete").fadeOut();
});

/* filters options */
// var showFilterOptions = document.getElementById("filterTable");
// showFilterOptions.addEventListener("click", function showOptions() {
//     if (document.getElementById("filterOptions").style.visibility == "visible") {
//         document.getElementById("filterOptions").style.visibility = "hidden";
//     }
//     else {
//         document.getElementById("filterOptions").style.visibility = "visible";
//     }
// });

// var popupFilterSiteId = document.querySelector('.filter-option3');
// popupFilterSiteId.addEventListener("click", function() {
//     document.querySelector(".fullScreenPopupFilter").style.visibility = "visible";
//     $(".fullScreenPopupFilter").fadeIn();
//     document.querySelector(".filterPopupHeader > span").innerHTML = "Filter By Site ID";
//     document.querySelector(".filterInput > input").placeholder = "Enter site Id";
//     document.querySelector(".filterInput > small").innerHTML = "<?php if(isset($_SESSION['siteIdError'])) echo $_SESSION['siteIdError'];" +
//                                                                "else echo '';?>";
// });

// var dismissFilterPopup = document.querySelector(".cancelbtnFilter");
// dismissFilterPopup.addEventListener("click", function hidePopup() {
//     document.querySelector(".fullScreenPopupFilter").style.visibility = "hidden";
//     $(".fullScreenPopupFilter").fadeOut();
// });

var showUpdateOptions = document.getElementById("updateHole");
showUpdateOptions.addEventListener("click", function showOptions(){
    if (document.getElementById("updateOptions").style.visibility == "visible") {
        document.getElementById("updateOptions").style.visibility = "hidden";
    }
    else {
        document.getElementById("updateOptions").style.visibility = "visible";
    }
});

var popupUpdateHoleNumber = document.querySelector(".update-option1");
popupUpdateHoleNumber.addEventListener("click", function(){
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update Hole Number";
    document.querySelector(".updateInput > input").placeholder ="Enter hole number (range [1-99])";
    document.querySelector(".updateInput > small").innerHTML = "<?php if(isset($_SESSION['holeNoError'])) echo $_SESSION['holeNoError'];" +
                                                                "else echo '';?><br>";
});

var popupUpdateSiteId = document.querySelector(".update-option2");
popupUpdateSiteId.addEventListener("click", function() {
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update Site ID";
    document.querySelector(".updateInput > input").placeholder = "Enter site Id";
    document.querySelector(".updateInput > small").innerHTML = "<?php if(isset($_SESSION['siteIdError'])) echo $_SESSION['siteIdError'];" +
                                                               "else echo '';?>";
});

var popupUpdatePar = document.querySelector(".update-option3");
popupUpdatePar.addEventListener("click", function() {
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update Par";
    document.querySelector(".updateInput > input").placeholder ="Enter hole par (range [1-99])";
    document.querySelector(".updateInput > small").innerHTML = "<?php if(isset($_SESSION['par'])) echo $_SESSION['par'];" +
                                                               "else echo '';?>";
});

var popupUpdateLength = document.querySelector(".update-option4");
popupUpdateLength.addEventListener("click", function() {
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "visible";
    $(".fullScreenPopupUpdate").fadeIn();    
    document.querySelector(".updatePopupHeader > span").innerHTML = "Update Length";
    document.querySelector(".updateInput > input").placeholder ="Enter length";
    document.querySelector().innerHTML = "<?php if(isset($_SESSION['lenError'])) echo $_SESSION['lenError'];" +
                                         "else echo '';?>";
});

var dismissUpdatePopup = document.querySelector(".cancelbtnUpdate");
dismissUpdatePopup.addEventListener("click", function hidePopup() {
    document.querySelector(".fullScreenPopupUpdate").style.visibility = "hidden";
    $(".fullScreenPopupUpdate").fadeOut();
});
