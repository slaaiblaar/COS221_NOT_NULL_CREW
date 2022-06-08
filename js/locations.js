//Wian Kokemeoer u19043512
window.onload = popTable();

function popTable(){

    var tBody = document.querySelector("#table > tbody");
    var rows = tBody.childNodes;
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

function disableButtons()
{
    document.querySelector("#addButton").disabled = true;
    document.querySelector("#modButton").disabled = true;
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
    disableButtons();
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

function confirmMod()
{
    var apiRequest = new XMLHttpRequest();
    apiRequest.open('POST','../php/addr_loc_course_api.php',true);
    apiRequest.onreadystatechange = function()
    {
        if (apiRequest.readyState == 4 && apiRequest.status == 200)
        {
            var response = (JSON.parse(apiRequest.responseText));
            console.log(response);
            if (!response["success"]) 
            {
                alert("Something went wrong while trying to modify Location: " + input[3].value + " " + input[4].value + " " + input[5]);
            }
            else
            {
                popTable();
                cancelMod();
            }
        }
    }
    var input = document.querySelectorAll("#modForm > input");
    var data = {
        "table": "locations", 
        "mod": {   
            "id": parseInt(input[0].value),
            "city": input[1].value,
            "country": input[2].value,
            "timezone": input[3].value,
            "latitude": input[4].value,
            "longitude": input[5].value
        }
    };
    apiRequest.setRequestHeader("Content-type", "application/json; charset=utf-8");

    apiRequest.send(JSON.stringify(data));
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

function confirmDel()
{
    var apiRequest = new XMLHttpRequest();
    apiRequest.open('POST','../php/addr_loc_course_api.php',true);
    apiRequest.onreadystatechange = function()
    {
        if (apiRequest.readyState == 4 && apiRequest.status == 200)
        {
            var response = (JSON.parse(apiRequest.responseText));
            console.log(response);
            if (!response["success"]) 
            {
                alert("Something went wrong while trying to delete Location: " + input[3].value + " " + input[4].value + " " + input[5]);
            }
            else
            {
                popTable();
                cancelDel();
            }
        }
    }
    var input = document.querySelectorAll("#delForm > input");
    var data = {
        "table": "locations", 
        "del": {   
            "id": parseInt(input[0].value),
            "city": input[1].value,
            "country": input[2].value,
            "timezone": input[3].value,
            "latitude": input[4].value,
            "longitude": input[5].value
        }
    };
    apiRequest.setRequestHeader("Content-type", "application/json; charset=utf-8");

    apiRequest.send(JSON.stringify(data));
}

function add()
{
    disableButtons();
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

function validateAdd()
{
    var input = document.querySelectorAll("#addForm > input");
    isValidCountryCity(input[1].value,input[0].value, "#addForm");
}

function confirmAdd()
{
    var apiRequest = new XMLHttpRequest();
    apiRequest.open('POST','../php/addr_loc_course_api.php',true);
    apiRequest.onreadystatechange = function()
    {
        if (apiRequest.readyState == 4 && apiRequest.status == 200)
        {
            var response = (JSON.parse(apiRequest.responseText));
            console.log(response);
            if (!response["success"]) 
            {
                alert("Something went wrong while trying to add Location: " + input[3].value + " " + input[4].value + " " + input[5]);
            }
            else
            {
                popTable();
                cancelAdd();
            }
        }
    }
    var input = document.querySelectorAll("#addForm > input");
    var data = {
        "table": "locations", 
        "add": {
            "city": input[0].value,
            "country": input[1].value,
            "timezone": input[2].value,
            "latitude": input[3].value,
            "longitude": input[4].value
        }
    };
    apiRequest.setRequestHeader("Content-type", "application/json; charset=utf-8");

    apiRequest.send(JSON.stringify(data));
}

function validateMod()
{
    var input = document.querySelectorAll("#modForm > input");
    isValidCountryCity(input[2].value,input[1].value, "#modForm");
}

function isValidCountryCity(a,b,c)
{// Uses an open source API, CountriesNow, to test if country exists, and if the city is part of it
 // GitHub page of API: https://github.com/MartinsOnuoha/countriesNowAPI
    var input = document.querySelectorAll(c + " > input");
    var apiRequest = new XMLHttpRequest(); 
    apiRequest.open('POST','https://countriesnow.space/api/v0.1/countries/cities',false);
    apiRequest.setRequestHeader("Content-Type", "application/json");
    var data = {"country" : a};

    apiRequest.onreadystatechange = function()
    {
        if (apiRequest.readyState == 4 && apiRequest.status == 200)
        {
            if (c.includes('mod')) 
            {
                input[2].classList.add("valid");
                input[2].classList.remove("invalid");
            }
            else  
            {
               input[1].classList.add("valid");
               input[1].classList.remove("invalid");
           }
            var response = JSON.parse(apiRequest.responseText);
            if (response['error']) 
            {
                alert("Something went wrong while checking City/Country Validity");
            }
            else
            {
                var cities = [];
                for (var x in response['data'])
                {
                    cities.push(response['data'][x].toUpperCase());
                }
                console.log(cities);
                if(!cities.includes(b.toUpperCase())) 
                {
                    alert("Invalid City");
                    if (c.includes('mod')) 
                    {
                        input[1].classList.add("invalid");
                        input[1].classList.remove("valid");
                    }
                    else 
                    {
                        input[0].classList.add("invalid");
                        input[0].classList.remove("valid");
                    }
                }
                else
                {
                    if (c.includes('mod')) 
                    {
                        isValidTZone(input[3].value, c);
                        input[1].classList.add("valid");
                        input[1].classList.remove("invalid");
                    }
                    else  
                    {
                        isValidTZone(input[2].value, c);
                        input[0].classList.add("valid");
                        input[0].classList.remove("invalid");
                    }
                }
            }
        }
        else 
        {
            if (c.includes('mod')) 
            {
                input[2].classList.add("invalid");
                input[2].classList.remove("valid");
            }
            else 
            {
                input[1].classList.add("invalid");
                input[1].classList.remove("valid");
            }
            alert("Invalid Country");
        }
    }
    apiRequest.send(JSON.stringify(data));
}
function isValidTZone(a,b)
{
    var regexp = /^UTC[\+\-][0-9]{1,2}$/g;
    var valid = true;
    if (!regexp.test(a)) valid = false;
    var input = document.querySelectorAll(b + " > input");
    var value = parseInt(a.replace(/utc/i,""));
    if (value == NaN) valid = false;
    else if (value < -12 || value > 14) valid = false;
    else if(valid)
    {
        var input = document.querySelectorAll(b + " > input");
        if (b.includes('mod')) 
        {
            input[3].classList.add("valid");
            input[3].classList.remove("invalid");
            isValidLat(input[4].value, b);
        }
        else  
        {
            input[2].classList.add("valid");
            input[2].classList.remove("invalid");
            isValidLat(input[3].value, b);
        }
    }
    else
    {
        if (b.includes('mod')) 
        {
            input[3].classList.add("invalid");
            input[3].classList.remove("valid");
        }
        else 
        {
            input[2].classList.add("invalid");
            input[2].classList.remove("valid");
        }
    }
}
function isValidLat(a,b)
{//     Latitude and Longitude formatting:
 //     https://docs.mapbox.com/help/glossary/lat-lon/

    var input = document.querySelectorAll(b + " > input");
    var valid = true;
    var decCountReg = /\.[0-9]{5,}$/g;
    var symReg = /[^\.\-\+[0-9]/g;
    if (decCountReg.test(a))  
    {
        valid = false;
        alert("Latitude may not have more than 4 decimal places"); //More than 4 decimals
    }
    if (valid && symReg.test(a)) 
    {
        valid = false;
        alert("Latitude may not contain special characters"); //Has Special Characters
    }
    var latNum = parseFloat(a);
    console.log("latitude: " + latNum);
    if (valid && latNum == NaN) 
    {
        alert("Latitude must be a number"); //Not a number
    }
    else if (valid &&  (latNum > 90 || latNum < -90)) //outside of -90 <= x <= 90 range for latitudeif (b.includes('mod')) 
    {
        alert("Latitude is outside of acceptable range");
    }
    else if (valid)
    {
        if (b.includes('mod')) 
        {
            input[4].classList.add("valid");
            input[4].classList.remove("invalid");
            isValidLon(input[5].value, b);
        }
        else  
        {
            input[3].classList.add("valid");
            input[3].classList.remove("invalid");
            isValidLon(input[4].value, b);
        }
    }
    if(!valid)
    {
        if (b.includes('mod')) 
        {
            input[4].classList.add("invalid");
            input[4].classList.remove("valid");
        }
        else 
        {
            input[3].classList.add("invalid");
            input[3].classList.remove("valid");
        }
    }

}

function isValidLon(a,b)
{//     Latitude and Longitude formatting:
 //     https://docs.mapbox.com/help/glossary/lat-lon/
    var input = document.querySelectorAll(b + " > input");
    var valid = true;
    var decCountReg = /\.[0-9]{5}$/g;
    var symReg = /[^\.\-\+0-9]/g;
    if (decCountReg.test(a))  
    {
        valid = false;
        alert("Longitude may not have more than 4 decimal places"); //More than 4 decimals
    }
    if (valid && symReg.test(a))  
    {
        valid = false;
        alert("Longitude may not contain special characters"); //Has Special Characters
    }
    var lonNum = parseFloat(a);
    console.log("longitude: " + lonNum);
    if (valid && lonNum == NaN) alert("Longitude must be a number"); //Not a number
    else if (valid && (lonNum > 180 || lonNum < -180)) //outside of -180 <= x <= 180 range for latitude
    {
        alert("Longitude is outside of acceptable range");
    }
    else if (valid)
    {
        if (b.includes('mod')) 
        {
            input[5].classList.add("valid");
            input[5].classList.remove("invalid");
            document.querySelector("#modButton").disabled = false;
        }
        else
        {
            input[4].classList.add("valid");
            input[4].classList.remove("invalid");
            document.querySelector("#addButton").disabled = false;
        }
    }
    if(!valid)
    {
        if (b.includes('mod')) 
        {
            input[5].classList.add("invalid");
            input[5].classList.remove("valid");
        }
        else 
        {
           input[4].classList.add("invalid");
           input[4].classList.remove("valid");
       }
    }
}