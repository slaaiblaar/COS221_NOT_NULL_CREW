window.onload = popTable();

function popTable(){

    var tBody = document.querySelector("#table > tbody");
    var rows = tBody.childNodes; //document.querySelectorAll("tbody > tr");
    for (var x = rows.length-1; x >= 0 ; x--)
    {
        tBody.removeChild(rows[x]);
    }
    var table = document.querySelector("#table");

    var apiRequest = new XMLHttpRequest();
    apiRequest.open('POST','../php/addr_loc_course_api.php',true);
    apiRequest.onreadystatechange = function()
    {
        if (apiRequest.readyState == 4 && apiRequest.status == 200)
        {
            var response = (JSON.parse(apiRequest.responseText));
            console.log(response);
            if (response["success"])
            {
                var data = response['result'];
                for (var row in data)
                {
                    tBody.innerHTML+= `<tr><td>${data[row]['id']}</td>
                    <td>${data[row]['city']}</td>
                    <td>${data[row]['country']}</td>
                    <td>${data[row]['timezone']}</td>
                    <td>${data[row]['latitude']}</td>
                    <td>${data[row]['longitude']}</td></tr>`;
                }
            }
        }
    }
    var data = {"table" : "locations"};
    var reqConf = [];

    for (var item in data)
    {
        reqConf.push(encodeURIComponent(item) + "=" + encodeURIComponent(data[item]));
    }
    apiRequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    apiRequest.send(reqConf.join("&"));
}

function mod()
{
    var rows = document.querySelectorAll("tbody > tr");
    for (var x = 0; x < rows.length; x++)
    {
        rows[x].classList.add('mod');
        rows[x].classList.remove('del');
        var cells = rows[x].childNodes;
        rows[x].setAttribute("onclick",`modPop(${cells[0].innerHTML},'${cells[2].innerHTML}','${cells[4].innerHTML}','${cells[6].innerHTML}','${cells[8].innerHTML}','${cells[10].innerHTML}')`);
    }
    var label = document.querySelector('#label');
    var delButton = document.querySelector("#delete");
    if (label == null)
    {
        label = document.createElement("p");
        label.setAttribute('id','label');
        label.style = "color: red";
        label.innerHTML = "*Select a row";
    } 
    else
    {
        delButton.parentNode.removeChild(label);
    }
    delButton.parentNode.insertBefore(label, delButton);
    delButton.style.margin = "0 0 20px 0";
}

function del()
{
    var rows = document.querySelectorAll("tbody > tr");
    for (var x = 0; x < rows.length; x++)
    {
        rows[x].classList.add('del');
        rows[x].classList.remove('mod');
        var cells = rows[x].childNodes;
        rows[x].setAttribute("onclick",`delPop(${cells[0].innerHTML},'${cells[2].innerHTML}','${cells[4].innerHTML}','${cells[6].innerHTML}','${cells[8].innerHTML}','${cells[10].innerHTML}')`);
    }
    var label = document.querySelector('#label');
    var delButton = document.querySelector("#delete");
    if (label == null)
    {
        label = document.createElement("p");
        label.style = "color: red";
        label.innerHTML = "*Select a row";
        label.setAttribute('id','label');
    }
    else
    {
        delButton.parentNode.removeChild(label);
    }
    
    delButton.parentNode.appendChild(label);
    delButton.style.margin = "20px 0";
}

function modPop(a,b,c,d,e,f)
{
    var input = document.querySelectorAll("#modForm > input");
    input[0].value = a;
    input[1].value = b;
    input[2].value = c;
    input[3].value = d;
    input[4].value = e;
    input[5].value = f;
    document.querySelector('#modPopup').style.visibility = "visible";
}
function cancelMod()
{
    var rows = document.querySelectorAll("tbody > tr");
    for (var x = 0; x < rows.length; x++)
    {
        rows[x].classList.remove('mod');
        rows[x].setAttribute("onclick",'');
    }
    var label = document.querySelector("#label");
    label.parentNode.removeChild(label);
    document.querySelector("#modPopup").style.visibility = "hidden";
}
function delPop(a,b,c,d,e,f)
{
    var input = document.querySelectorAll("#delForm > input");
    input[0].value = a;
    input[1].value = b;
    input[2].value = c;
    input[3].value = d;
    input[4].value = e;
    input[5].value = f;
    document.querySelector('#delPopup').style.visibility = "visible";
}
function cancelDel()
{
    var rows = document.querySelectorAll("tbody > tr");
    for (var x = 0; x < rows.length; x++)
    {
        rows[x].classList.remove('del');
        rows[x].setAttribute("onclick",'');
    }
    var label = document.querySelector("#label");
    label.parentNode.removeChild(label);
    document.querySelector("#delPopup").style.visibility = "hidden";
}

function add()
{
    var input = document.querySelectorAll("#addForm > input");
    input[0].value = '';
    input[1].value = '';
    input[2].value = '';
    input[3].value = '';
    input[4].value = '';
    document.querySelector('#addPopup').style.visibility = "visible";
}
function cancelAdd()
{
    document.querySelector('#addPopup').style.visibility = "hidden";
}

function confirmAdd()
{
    var input = document.querySelectorAll("#modForm > input");
    console.log(input[4]);
    isValidCountryCity(input[2].value,input[1].value);
    if (!isValidTZone(input[3].value)) alert(`Invalid Time Zone: ${input[3].value}`);
    if (!isValidLat(input[4].value)) alert(`Invalid Latitude: ${input[4].value}`);
    if (!isValidLon(input[5].value)) alert(`Invalid Longitude: ${input[5].value}`);
}

function confirmMod()
{
    var input = document.querySelectorAll("#modForm > input");
    console.log(input[4]);
    isValidCountryCity(input[2].value,input[1].value);
    if (!isValidTZone(input[3].value)) alert(`Invalid Time Zone: ${input[3].value}`);
    if (!isValidLat(input[4].value)) alert(`Invalid Latitude: ${input[4].value}`);
    if (!isValidLon(input[5].value)) alert(`Invalid Longitude: ${input[5].value}`);
}

function isValidCountryCity(a,b)
{// Uses an open source API, CountriesNow, to test if country exists, and if the city is part of it
 // GitHub page of API: https://github.com/MartinsOnuoha/countriesNowAPI
    var apiRequest = new XMLHttpRequest(); 
    apiRequest.open('POST','https://countriesnow.space/api/v0.1/countries/cities',false);
    apiRequest.setRequestHeader("Content-Type", "application/json");
    var data = {"country" : a};

    apiRequest.onreadystatechange = function()
    {
        if (apiRequest.readyState == 4 && apiRequest.status == 200)
        {
            var response = JSON.parse(apiRequest.responseText);
            if (response['error']) alert("Something went wrong while checking City/Country Validity");
            var cities = [];
            for (var x in response['data'])
            {
                cities.push(response['data'][x].toUpperCase());
            }
            console.log(cities);
            if(!cities.includes(b.toUpperCase())) alert("Invalid City");
        }
        else alert("Invalid Country");
    }
    apiRequest.send(JSON.stringify(data));
}
function isValidTZone(a)
{
    var value = parseInt(a.replace(/hrs/i,""));
    if (value == NaN) return false;
    if (value < -24 || value > 24) return false;
    console.log("Valid Time Zone");
    return true;
}
function isValidLat(a)
{//     Latitude and Longitude formatting:
 //     https://docs.mapbox.com/help/glossary/lat-lon/

    var decCountReg = /\.[0-9]{5}$/g;
    var symReg = /[^\.\-\+0-9]/g;
    if (decCountReg.test(a)) return false; //More than 4 decimals
    if (symReg.test(a)) return false; //Has Special Characters
    var latNum = parseFloat(a);
    console.log("latitude: " + latNum);
    if (latNum == NaN) return false; //Not a number
    if (latNum > 90 || latNum < -90) return false;//outside of -90 <= x <= 90 range for latitude
    console.log(a + " is a valid lat");
    return true;
}

function isValidLon(a)
{//     Latitude and Longitude formatting:
 //     https://docs.mapbox.com/help/glossary/lat-lon/

    var decCountReg = /\.[0-9]{5}$/g;
    var symReg = /[^\.\-\+0-9]/g;
    if (decCountReg.test(a)) return false; //More than 4 decimals
    if (symReg.test(a)) return false; //Has Special Characters
    var lonNum = parseFloat(a);
    console.log("longitude: " + lonNum);
    if (lonNum == NaN) return false; //Not a number
    if (lonNum > 180 || lonNum < -180) return false; //outside of -180 <= x <= 180 range for latitude
    console.log(a + " is a valid lon");
    return true;
}