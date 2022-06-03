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
    apiRequest.open('POST','../php/address_config.php',true);
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
    var idExp = /[^0-9]+/g;
    var input = document.querySelectorAll("#addForm > input");
    
    if (idExp.test(input[0].value)) alert(`Invalid Location ID: ${input[0].value}`);
    if (!isValidLanguage(input[1].value)) alert(`Invalid Language: ${input[1].value}`);
    if (!isValidStreet(input[3].value)) alert(`Invalid Street: ${input[3].value}`);
    if (!isValidCountry(input[4].value)) alert(`Invalid Country: ${input[4].value}`);
}

function confirmMod()
{
    var idExp = /[^0-9]+/g;
    var input = document.querySelectorAll("#modForm > input");
    console.log(input[4]);
    if (idExp.test(input[1].value)) alert(`Invalid Location ID: ${input[1].value}`);
    if (!isValidLanguage(input[2].value)) alert(`Invalid Language: ${input[2].value}`);
    if (!isValidStreet(input[4].value)) alert(`Invalid Street: ${input[4].value}`);
    if (!isValidCountry(input[5].value)) alert(`Invalid Country: ${input[5].value}`);
}

function isValidCountry(a)
{
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
        return true;
    }
    return false;
}
function isValidLanguage(a) 
{
    var languages = ["ar-SA","bn-BD","bn-IN","cs-CZ","da-DK","de-AT","de-CH","de-DE","el-GR",
    "en-AU","en-CA","en-GB","en-IE","en-IN","en-NZ","en-US","en-ZA","es-AR","es-CL","es-CO",
    "es-ES","es-MX","es-US","fi-FI","fr-BE","fr-CA","fr-CH","fr-FR","he-IL","hi-IN","hu-HU",
    "id-ID","it-CH","it-IT","jp-JP","ko-KR","nl-BE","nl-NL","no-NO","pl-PL","pt-BR","pt-PT",
    "ro-RO","ru-RU","sk-SK","sv-SE","ta-IN","ta-LK","th-TH","tr-TR","zh-CN","zh-HK","zh-TW"];

    if (languages.includes(a))
    {
        return true;
    }
    return false;
}

function isValidStreet(a)
{
    
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
    for (var x in suffixes)
    {
        for (var y in arr)
        {
            if (arr[y] == suffixes[x]) 
            {
                console.log(arr[y] + "=="+ suffixes[x]);
                return true;
            }
        }
    }
    return false;
}