var tours = [
    {
        "name:": "PGA Tour",
        "affiliation_id": 1
    },
    {
        "name:": "Green Tour",
        "affiliation_id": 2
    },
    {
        "name:": "A Golf Tour",
        "affiliation_id": 3
    }
];

function popTours()//Populating tours relation
{
    var toursApiRequest = new XMLHttpRequest();
    toursApiRequest.open('POST','../php/addr_loc_course_api.php',true);
    toursApiRequest.onreadystatechange = function()
    {
        if (toursApiRequest.readyState == 4 && toursApiRequest.status == 200)
        {
            var response = (JSON.parse(toursApiRequest.responseText));
            console.log("Tours Population API Call Response:");
            console.log(response);
            popEvents()
        }
    }
    var data = {
        "sample": true,
        "table": "tours",
        "data": tours
    };
    toursApiRequest.setRequestHeader("Content-type", "application/json; charset=utf-8");

    toursApiRequest.send(JSON.stringify(data));
}
