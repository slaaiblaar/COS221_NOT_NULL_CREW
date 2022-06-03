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
                    tBody.innerHTML+= "<tr><td>" + data[row]['id'] + "</td>"
                    +"<td>" + data[row]['location_id'] + "</td>"
                    +"<td>" + data[row]['language'] + "</td>"
                    +"<td>" + data[row]['street_number'] + "</td>"
                    +"<td>" + data[row]['street'] + "</td>"
                    +"<td>" + data[row]['country'] + "</td></tr>";
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