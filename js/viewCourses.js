//Wian Kokemeoer u19043512
window.onload = popTable();

function popTable(){

    var tBody = document.querySelector("#table > tbody");
    var rows = tBody.childNodes;
    for (var x = rows.length-1; x >= 0 ; x--)
    {
        tBody.removeChild(rows[x]);
    }

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
                    <td>${data[row]['site_key']}</td>
                    <td>${data[row]['publisher_id']}</td>
                    <td>${data[row]['location_id']}</td>
                    <td>${data[row]['address_id']}</td></tr>`;
                }
            }
        }
    }
    var data = {"table" : "courses"};
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
        rows[x].setAttribute("onclick",`modPop(${cells[0].innerHTML},'${cells[2].innerHTML}',${cells[4].innerHTML},${cells[6].innerHTML},${cells[8].innerHTML})`);
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
        rows[x].setAttribute("onclick",`delPop(${cells[0].innerHTML},'${cells[2].innerHTML}',${cells[4].innerHTML},${cells[6].innerHTML},${cells[8].innerHTML})`);
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
                alert("Something went wrong while trying to modify Course: " + input[0].value);
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
        "table": "courses", 
        "del": {
            "id": parseInt(input[0].value),
            "site_key": input[1].value,
            "publisher_id": parseInt(input[2].value),
            "location_id": parseInt(input[3].value),
            "address_id": parseInt(input[4].value)
        }
    };
    apiRequest.setRequestHeader("Content-type", "application/json; charset=utf-8");

    apiRequest.send(JSON.stringify(data));
}

function modPop(a,b,c,d,e)
{
    disableButtons()
    var input = document.querySelectorAll("#modForm > input");
    input[0].value = a;
    input[1].value = b;
    input[2].value = c;
    input[3].value = d;
    input[4].value = e;
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
function delPop(a,b,c,d,e)
{
    var input = document.querySelectorAll("#delForm > input");
    input[0].value = a;
    input[1].value = b;
    input[2].value = c;
    input[3].value = d;
    input[4].value = e;
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
    disableButtons()
    var input = document.querySelectorAll("#addForm > input");
    input[0].value = '';
    input[1].value = '';
    input[2].value = '';
    input[3].value = '';
    document.querySelector('#addPopup').style.visibility = "visible";
}

function cancelAdd()
{
    document.querySelector('#addPopup').style.visibility = "hidden";
}

function validateAdd()
{
    var input = document.querySelectorAll("#addForm > input");
    isValidPub(input[1].value, "#addForm");
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
                alert("Something went wrong while trying to add Course: " + input[0].value);
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
        "table": "courses", 
        "add": {
            "site_key": input[0].value,
            "publisher_id": parseInt(input[1].value),
            "location_id": parseInt(input[2].value),
            "address_id": parseInt(input[3].value)
        }
    };
    apiRequest.setRequestHeader("Content-type", "application/json; charset=utf-8");

    apiRequest.send(JSON.stringify(data));
}

function validateMod()
{
    var input = document.querySelectorAll("#modForm > input");
    isValidPub(input[2].value, "#modForm");
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
                alert("Something went wrong while trying to modify Course: " + input[0].value);
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
        "table": "courses", 
        "mod": {
            "id": parseInt(input[0].value),
            "site_key": input[1].value,
            "publisher_id": parseInt(input[2].value),
            "location_id": parseInt(input[3].value),
            "address_id": parseInt(input[4].value)
        }
    };
    apiRequest.setRequestHeader("Content-type", "application/json; charset=utf-8");

    apiRequest.send(JSON.stringify(data));
}

function isValidPub(a,b)
{
    var input = document.querySelectorAll(b + " > input");
    var idExp = /[^0-9]/g;
    if (a == "" || idExp.test(a)) 
    {
        if (b.includes('mod')) 
        {
            input[2].classList.add("invalid");
            input[2].classList.remove("valid");
        }
        else 
        {
            input[1].classList.add("invalid");
            input[1].classList.remove("valid");
        }
        alert(`Invalid Publisher ID: ${a}`);
    }
    else 
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
                    if (b.includes('mod')) 
                    {
                        input[2].classList.add("invalid");
                        input[2].classList.remove("valid");
                    }
                    else 
                    {
                        input[1].classList.add("invalid");
                        input[1].classList.remove("valid");
                    }
                    alert(`Publisher ID does not exist: ${a}`);
                }
                else 
                {
                    console.log(response['location']);
                    if (b.includes('mod')) 
                    {
                        input[2].classList.add("valid");
                        input[2].classList.remove("invalid");
                        isValidLoc(input[3].value, b);
                    }
                    else 
                    {
                        input[1].classList.add("valid");
                        input[1].classList.remove("invalid");
                        isValidLoc(input[2].value, b);
                    }
                }
            }
        }
        var data = {"table" : "publishers", "target" : parseInt(a)};
        var reqConf = [];

        for (var item in data)
        {
            reqConf.push(encodeURIComponent(item) + "=" + encodeURIComponent(data[item]));
        }
        apiRequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

        apiRequest.send(reqConf.join("&"));
    }
}

function isValidLoc(a,b)
{
    var input = document.querySelectorAll(b + " > input");
    var idExp = /[^0-9]/g;
    if (a == "" || idExp.test(a)) 
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
        alert(`Invalid Location ID: ${a}`);
    }
    else 
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
                    alert(`Location ID does not exist: ${a}`);
                }
                else 
                {
                    console.log(response['location']);
                    if (b.includes('mod')) 
                    {
                        input[3].classList.add("valid");
                        input[3].classList.remove("invalid");
                        isValidAddr(input[4].value, b);
                    }
                    else 
                    {
                        input[2].classList.add("valid");
                        input[2].classList.remove("invalid");
                        isValidAddr(input[3].value, b);
                    }
                }
            }
        }
        var data = {"table" : "locations", "target" : parseInt(a)};
        var reqConf = [];

        for (var item in data)
        {
            reqConf.push(encodeURIComponent(item) + "=" + encodeURIComponent(data[item]));
        }
        apiRequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

        apiRequest.send(reqConf.join("&"));
    }
}

function isValidAddr(a,b)
{
    var input = document.querySelectorAll(b + " > input");
    var idExp = /[^0-9]/g;
    if (a == "" || idExp.test(a)) 
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
        alert(`Invalid Address ID: ${a}`);
    }
    else 
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
                    alert(`Address ID does not exist: ${a}`);
                }
                else 
                {
                    console.log(response['location']);
                    if (b.includes('mod')) 
                    {
                        input[4].classList.add("valid");
                        input[4].classList.remove("invalid");
                        document.querySelector("#modButton").disabled = false;
                    }
                    else 
                    {
                        input[3].classList.add("valid");
                        input[3].classList.remove("invalid");
                        document.querySelector("#addButton").disabled = false;
                    }
                }
            }
        }
        var data = {"table" : "addresses", "target" : parseInt(a)};
        var reqConf = [];

        for (var item in data)
        {
            reqConf.push(encodeURIComponent(item) + "=" + encodeURIComponent(data[item]));
        }
        apiRequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

        apiRequest.send(reqConf.join("&"));
    }
}