
var events = [
    {
    "event_key": "Master's tournament",
    "publisher_id": 1,
    "start_date_time": "2022/01/01",
    "end_date_time": "2022/01/05",
    "site_id": 5,
    "duration": null,
    "event_status": "Completed",
    "gender": "Men",
    "tour_id": null,
    "year": "2022"
    },
    {
    "event_key": "U.S. Open Championship",
    "publisher_id": 2,
    "start_date_time": "2022/05/01",
    "end_date_time": "2022/05/05",
    "site_id": 3,
    "duration": null,
    "event_status": "Completed",
    "gender": "Women",
    "tour_id": 2,
    "year": "2022"
    },
    {
    "event_key": "The Open Championship",
    "publisher_id": 1,
    "start_date_time": "2020/04/01",
    "end_date_time": "2020/04/05",
    "site_id": 4,
    "duration": null,
    "event_status": "Completed",
    "gender": "Men",
    "tour_id": 3,
    "year": "2020"
    }
];

function popEvents()//Populating events relation
{
    var eventsApiRequest = new XMLHttpRequest();
    eventsApiRequest.open('POST','../php/addr_loc_course_api.php',true);
    eventsApiRequest.onreadystatechange = function()
    {
        if (eventsApiRequest.readyState == 4 && eventsApiRequest.status == 200)
        {
            var response = (JSON.parse(eventsApiRequest.responseText));
            console.log("Events Population API Call Response:");
            console.log(response);
            popPersons();
        }
    }
    var data = {
        "sample": true,
        "table": "events",
        "data": events
    };
    eventsApiRequest.setRequestHeader("Content-type", "application/json; charset=utf-8");

    eventsApiRequest.send(JSON.stringify(data));
}

