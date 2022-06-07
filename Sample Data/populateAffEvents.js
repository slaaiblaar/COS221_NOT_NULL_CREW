//Wian Koekemoer u19043512
var affiliationsEvents = [
    {
        "affiliation_id": 1,
        "event_id": 1
    },
    {
        "affiliation_id": 2,
        "event_id": 2
    },
    {
        "affiliation_id": 3,
        "event_id": 5
    },
    {
        "affiliation_id": 4,
        "event_id": 4
    },
    {
        "affiliation_id": 5,
        "event_id": 3
    }
];

function popAffiliationsEvents(a)//Populating affiliations_events relation
{
    var affEventsApiRequest = new XMLHttpRequest();
    affEventsApiRequest.open('POST','../php/addr_loc_course_api.php',true);
    affEventsApiRequest.onreadystatechange = function()
    {
        if (affEventsApiRequest.readyState == 4 && affEventsApiRequest.status == 200)
        {
            var response = (JSON.parse(affEventsApiRequest.responseText));
            console.log("Affiliations Events Population API Call Response:");
            console.log(response);
            if (a) popRounds(a);
        }
    }
    var data = {
        "sample": true,
        "table": "affiliations_events",
        "data": affiliationsEvents
    };
    affEventsApiRequest.setRequestHeader("Content-type", "application/json; charset=utf-8");

    affEventsApiRequest.send(JSON.stringify(data));
}