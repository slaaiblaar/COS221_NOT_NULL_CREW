//Wian Kokemeoer u19043512
var events = [
    {
    "event_key": "U.S. Open Championship",
    "publisher_id": 2,
    "start_date_time": "2022/05/01 13:00:00",
    "end_date_time": "2022/05/04 17:00",
    "site_id": 3,
    "duration": null,
    "event_status": "Completed",
    "gender": "Women",
    "tour_id": 2,
    "year": "2022"
    },
    {
    "event_key": "Yokahama Open",
    "publisher_id": 2,
    "start_date_time": "2022/06/01 13:00:00",
    "end_date_time": "2022/06/04 17:00",
    "site_id": 2,
    "duration": 4,
    "event_status": "Cancelled",
    "gender": "Women",
    "tour_id": null,
    "year": "2022"
    },
    {
    "event_key": "Master's tournament",
    "publisher_id": 1,
    "start_date_time": "2022/01/01 13:00:00",
    "end_date_time": "2022/01/04 17:00",
    "site_id": 5,
    "duration": null,
    "event_status": "Completed",
    "gender": "Women",
    "tour_id": null,
    "year": "2022"
    },
    {
    "event_key": "The Open Championship",
    "publisher_id": 1,
    "start_date_time": "2020/04/01 13:00:00",
    "end_date_time": "2020/04/04 17:00",
    "site_id": 4,
    "duration": null,
    "event_status": "Completed",
    "gender": "Men",
    "tour_id": 3,
    "year": "2020"
    },
    {
    "event_key": "Pretoria Classic",
    "publisher_id": 1,
    "start_date_time": "2022/06/01 13:00:00",
    "end_date_time": "2022/06/01 17:00",
    "site_id": 1,
    "duration": 4,
    "event_status": "Scheduled",
    "gender": "Men",
    "tour_id": 1,
    "year": "2022"
    }
];

function popEvents(a)//Populating events relation
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
            if (a) popPersons(a);
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

