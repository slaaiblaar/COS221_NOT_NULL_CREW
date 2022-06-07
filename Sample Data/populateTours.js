//Wian Kokemeoer u19043512
var tours = [
    {
        "tour_name": "Sunshine Tour",
        "affiliation_id": 2
    },
    {
        "tour_name": "PGA",
        "affiliation_id": 1
    },
    {
        "tour_name": "ZA Tour",
        "affiliation_id": 1
    },
    {
        "tour_name": "Green Tour",
        "affiliation_id": 2
    },
    {
        "tour_name": "A Golf Tour",
        "affiliation_id": 3
    }
];

function popTours(a)//Populating tours relation
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
            if (a) popEvents(a);
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
