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
                    <td>${data[row]['location_id']}</td>
                    <td>${data[row]['language']}</td>
                    <td>${data[row]['street_number']}</td>
                    <td>${data[row]['street']}</td>
                    <td>${data[row]['country']}</td></tr>`;
                }
            }
        }
    }
    var data = {"table" : "addresses"};
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
function mod() //Enables row selection for modification
{
    var rows = document.querySelectorAll("tbody > tr");
    for (var x = 0; x < rows.length; x++)
    {
        rows[x].classList.add('mod');
        rows[x].classList.remove('del');
        var cells = rows[x].childNodes;
        rows[x].setAttribute("onclick",`modPop(${cells[0].innerHTML},${cells[2].innerHTML},'${cells[4].innerHTML}','${cells[6].innerHTML}','${cells[8].innerHTML}','${cells[10].innerHTML}')`);
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

function del() //Enables row selection for deletion
{
    var rows = document.querySelectorAll("tbody > tr");
    for (var x = 0; x < rows.length; x++)
    {
        rows[x].classList.add('del');
        rows[x].classList.remove('mod');
        var cells = rows[x].childNodes;
        console.log(cells);
        rows[x].setAttribute("onclick",`delPop(${cells[0].innerHTML},${cells[2].innerHTML},'${cells[4].innerHTML}','${cells[6].innerHTML}','${cells[8].innerHTML}','${cells[10].innerHTML}')`);
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

function modPop(a,b,c,d,e,f)//Makes modification popup visible
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
                alert("Something went wrong while trying to modify Address: " + input[3].value + " " + input[4].value + " " + input[5]);
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
        "table": "addresses", 
        "mod": {   
            "id": parseInt(input[0].value),
            "location_id": parseInt(input[1].value),
            "language": input[2].value,
            "street_number": input[3].value,
            "street": input[4].value,
            "country": input[5].value
        }
    };
    apiRequest.setRequestHeader("Content-type", "application/json; charset=utf-8");

    apiRequest.send(JSON.stringify(data));
}

function validateMod()
{
    var input = document.querySelectorAll("#modForm > input");
    isValidLoc(input[1].value, "#modForm");
}

function delPop(a,b,c,d,e,f)//Makes deletion popup visible
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
                alert("Something went wrong while trying to delete Address: " + input[3].value + " " + input[4].value + " " + input[5]);
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
        "table": "addresses", 
        "del": {   
            "id": parseInt(input[0].value),
            "location_id": parseInt(input[1].value),
            "language": input[2].value,
            "street_number": input[3].value,
            "street": input[4].value,
            "country": input[5].value
        }
    };
    apiRequest.setRequestHeader("Content-type", "application/json; charset=utf-8");

    apiRequest.send(JSON.stringify(data));
}
function add() //Makes add popup visible
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
    isValidLoc(input[0].value, "#addForm");
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
                alert("Something went wrong while trying to add Address: " + input[2].value + " " + input[3].value + " " + input[4]);
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
        "table": "addresses", 
        "add": {   
            "location_id": parseInt(input[0].value),
            "language": input[1].value,
            "street_number": input[2].value,
            "street": input[3].value,
            "country": input[4].value
        }
    };
    apiRequest.setRequestHeader("Content-type", "application/json; charset=utf-8");

    apiRequest.send(JSON.stringify(data));
}
function isValidLoc(a,b)
{
    var input = document.querySelectorAll(b + " > input");
    var idExp = /[^0-9]/g;
    if (a == "" || idExp.test(a)) 
    {
        if (b.includes('mod')) 
        {
            input[1].classList.add("invalid");
            input[1].classList.remove("valid");
        }
        else 
        {
            input[0].classList.add("invalid");
            input[0].classList.remove("valid");
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
                        input[1].classList.add("invalid");
                        input[1].classList.remove("valid");
                    }
                    else 
                    {
                        input[0].classList.add("invalid");
                        input[0].classList.remove("valid");
                    }
                    alert("Location ID does not exist");
                }
                else 
                {
                    console.log(response['location']);
                    if (b.includes('mod')) 
                    {
                        input[1].classList.add("valid");
                        input[1].classList.remove("invalid");
                        isValidLanguage(input[2].value, b);
                    }
                    else 
                    {
                        input[0].classList.add("valid");
                        input[0].classList.remove("invalid");
                        isValidLanguage(input[1].value, b);
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


function isValidLanguage(a, b) 
{
    var input = document.querySelectorAll(b + " > input");
    var languages = ["ar-SA","bn-BD","bn-IN","cs-CZ","da-DK","de-AT","de-CH","de-DE","el-GR",
    "en-AU","en-CA","en-GB","en-IE","en-IN","en-NZ","en-US","en-ZA","es-AR","es-CL","es-CO",
    "es-ES","es-MX","es-US","fi-FI","fr-BE","fr-CA","fr-CH","fr-FR","he-IL","hi-IN","hu-HU",
    "id-ID","it-CH","it-IT","jp-JP","ko-KR","nl-BE","nl-NL","no-NO","pl-PL","pt-BR","pt-PT",
    "ro-RO","ru-RU","sk-SK","sv-SE","ta-IN","ta-LK","th-TH","tr-TR","zh-CN","zh-HK","zh-TW"];

    if (languages.includes(a))
    {
        if (b.includes('mod')) 
        {
            input[2].classList.add("valid");
            input[2].classList.remove("invalid");
            isValidStreet(input[4].value, b);
        }
        else 
        {
            input[1].classList.add("valid");
            input[1].classList.remove("invalid");
            isValidStreet(input[3].value, b);
        }
    }
    else 
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
        alert(`Invalid language: ${a}`);
    }
}

function isValidStreet(a, b)
{
    var input = document.querySelectorAll(b + " > input");
    var suffixes = ["ALLEY","ANEX","ARCADE","AVENUE","BAYOU","BEACH","BEND","BLUFF","BLUFFS","BOTTOM",
    "BOULEVARD","BRANCH","BRIDGE","BROOK","BROOKS","BURG","BURGS","BYPASS","CAMP","CANYON","CAPE",
    "CAUSEWAY","CENTER","CENTERS","CIRCLE","CIRCLES","CLIFF","CLIFFS","CLUB","COMMON","COMMONS",
    "CORNER","CORNERS","COURSE","COURT","COURTS","COVE","COVES","CREEK","CRESCENT","CREST","CROSSING",
    "CROSSROAD","CROSSROADS","CURVE","DALE","DAM","DIVIDE","DRIVE","DRIVES","ESTATE","ESTATES",
    "EXPRESSWAY","EXTENSION","EXTENSIONS","FALL","FALLS","FERRY","FIELD","FIELDS","FLAT","FLATS",
    "FORD","FORDS","FOREST","FORGE","FORGES","FORK","FORKS","FORT","FREEWAY","GARDEN","GARDENS","GATEWAY",
    "GLEN","GLENS","GREEN","GREENS","GROVE","GROVES","HARBOR","HARBORS","HAVEN","HEIGHTS","HIGHWAY",
    "HILL","HILLS","HOLLOW","INLET","ISLAND","ISLANDS","ISLE","JUNCTION","JUNCTIONS","KEY","KEYS",
    "KNOLL","KNOLLS","LAKE","LAKES","LAND","LANDING","LANE","LIGHT","LIGHTS","LOAF","LOCK","LOCKS",
    "LODGE","LOOP","MALL","MANOR","MANORS","MEADOW","MEADOWS","MEWS","MILL","MILLS","MISSION",
    "MOTORWAY","MOUNT","MOUNTAIN","MOUNTAINS","NECK","ORCHARD","OVAL","OVERPASS","PARK","PARKS",
    "PARKWAY","PARKWAYS","PASS","PASSAGE","PATH","PIKE","PINE","PINES","PLACE","PLAIN","PLAINS",
    "PLAZA","POINT","POINTS","PORT","PORTS","PRAIRIE","RADIAL","RAMP","RANCH","RAPID","RAPIDS",
    "REST","RIDGE","RIDGES","RIVER","ROAD","ROADS","ROUTE","ROW","RUE","RUN","SHOAL","SHOALS",
    "SHORE","SHORES","SKYWAY","SPRING","SPRINGS","SPUR","SPURS","SQUARE","SQUARES","STATION",
    "STRAVENUE","STREAM","STREET","STREETS","SUMMIT","TERRACE","THROUGHWAY","TRACE","TRACK",
    "TRAFFICWAY","TRAIL","TRAILER","TUNNEL","TURNPIKE","UNDERPASS","UNION","UNIONS","VALLEY",
    "VALLEYS","VIADUCT","VIEW","VIEWS","VILLAGE","VILLAGES","VILLE","VISTA","WALK","WALKS","WALL",
    "WAY","WAYS","WELL","WELLS"];
    var str = a.toUpperCase();
    var arr = str.split(" ");
    var valid = false;
    for (var x in suffixes)
    {
        if (valid) break;
        for (var y in arr)
        {
            if(valid) break;
            if (arr[y] == suffixes[x]) 
            {
                console.log(arr[y] + "=="+ suffixes[x]);
                if (b.includes('mod')) 
                {
                    input[4].classList.add("valid");
                    input[4].classList.remove("invalid");
                    isValidCountry(input[5].value, b);
                }
                else 
                {
                    input[3].classList.add("valid");
                    input[3].classList.remove("invalid");
                    isValidCountry(input[4].value, b);
                }
                valid = true;
            }
        }
    }

    if (!valid) 
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
        alert(`Invalid Street: ${a}`);
    }
}

function isValidCountry(a, b)
{
    var input = document.querySelectorAll(b + " > input");
    var countries = [ "Afhanistan","Albania","Algeria","Andorro","Angola","Antigua and Barbuda",
    "Argentina","Armenia","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh",
    "Barbados","Belarus","Belgium","Belize","Benin","Bhutan","Bolivia","Bosnia and Herzegovina",
    "Botswana","Brazil","Brunei","Bulgaria","Burkina Faso","Burundi","Côte d'Ivoire","Cabo Verde",
    "Cambodia","Cameroon","Canada","Central African Republic","Chad","Chile","China","Colombia",
    "Congo","Costa Rica","Croatia","Cuba","Cyprus","Czech Republic","Democratic Republic of the Congo",
    "Denmark","Djibouti","Dominica","Dominican Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea",
    "Eritrea","Estonia","Swaziland","Ethiopia","Fiji","Finland","France","Gabon","Gambia","Georgia","Germany",
    "Ghana","Greece","Grenada","Guatemala","Guinea","Guinea-Bissau","Guyana","Haiti","Holy See","Honduras",
    "Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Israel","Italy","Jamaica","Japan",
    "Jordan","Kazakhstan","Kenya","Kiribati","Kuwait","Kyrgyzstan","Laos","Latvia","Lebanon",
    "Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Madagascar","Malawi",
    "Malaysia","Maldives","Mali","Malta","Marshall Islands","Mauritania","Mauritius","Mexico",
    "Micronesia","Moldova","Monaco","Mongolia","Montenegro","Morocco","Mozambique","Myanmar",
    "Namibia","Nauru","Nepal","Netherlands","New Zealand","Nicaragua","Niger","Nigeria","North Korea",
    "North Macedonia","Norway","Oman","Pakistan","Palau","Palestine State","Panama","Papua New Guinea",
    "Paraguay","Peru","Philippines","Poland","Portugal","Qatar","Romania","Russia","Rwanda",
    "Saint Kitts and Nevis","Saint Lucia","Saint Vincent and the Grenadines","Samoa","San Marino",
    "Sao Tome and Principe","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone",
    "Singapore","Slovakia","Slovenia","Solomon Islands","Somalia","South Africa","South Korea",
    "South Sudan","Spain","Sri Lanka","Sudan","Suriname","Sweden","Switzerland","Syria",
    "Tajikistan","Tanzania","Thailand","Timor-Leste","Togo","Tonga","Trinidad and Tobago","Tunisia",
    "Turkey","Turkmenistan","Tuvalu","Uganda","Ukraine","United Arab Emirates","United Kingdom",
    "United States of America","Uruguay","Uzbekistan","Vanuatu","Venezuela","Vietnam","Yemen","Zambia","Zimbabwe"];
    
    if (countries.includes(a))
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
    else
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