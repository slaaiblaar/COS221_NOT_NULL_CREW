//Wian Koekemoer u19043512
var tournScheds = [
    {
        "event_id": 1,
        "date": "2022/06/01",
        "start_time": "13:00",
        "end_time": "17:00"
    },
    {
        "event_id": 1,
        "date": "2022/06/02",
        "start_time": "13:00",
        "end_time": "17:00"
    },
    {
        "event_id": 1,
        "date": "2022/06/03",
        "start_time": "13:00",
        "end_time": "17:00"
    },
    {
        "event_id": 1,
        "date": "2022/06/04",
        "start_time": "13:00",
        "end_time": "17:00"
    },
    {
        "event_id": 2,
        "date": "2022/06/01",
        "start_time": "13:00",
        "end_time": "17:00"
    },
    {
        "event_id": 2,
        "date": "2022/06/02",
        "start_time": "13:00",
        "end_time": "17:00"
    },
    {
        "event_id": 2,
        "date": "2022/06/03",
        "start_time": "13:00",
        "end_time": "17:00"
    },
    {
        "event_id": 2,
        "date": "2022/06/04",
        "start_time": "13:00",
        "end_time": "17:00"
    },
    {
        "event_id": 3,
        "date": "2022/01/01",
        "start_time": "13:00",
        "end_time": "17:00"
    },
    {
        "event_id": 3,
        "date": "2022/01/02",
        "start_time": "13:00",
        "end_time": "17:00"
    },
    {
        "event_id": 3,
        "date": "2022/01/03",
        "start_time": "13:00",
        "end_time": "17:00"
    },
    {
        "event_id": 3,
        "date": "2022/01/04",
        "start_time": "13:00",
        "end_time": "17:00"
    },
    {
        "event_id": 4,
        "date": "2022/05/01",
        "start_time": "13:00",
        "end_time": "17:00"
    },
    {
        "event_id": 4,
        "date": "2022/05/02",
        "start_time": "13:00",
        "end_time": "17:00"
    },
    {
        "event_id": 4,
        "date": "2022/05/03",
        "start_time": "13:00",
        "end_time": "17:00"
    },
    {
        "event_id": 4,
        "date": "2022/05/04",
        "start_time": "13:00",
        "end_time": "17:00"
    },
    {
        "event_id": 5,
        "date": "2020/04/01",
        "start_time": "13:00",
        "end_time": "17:00"
    },
    {
        "event_id": 5,
        "date": "2020/04/02",
        "start_time": "13:00",
        "end_time": "17:00"
    },
    {
        "event_id": 5,
        "date": "2020/04/03",
        "start_time": "13:00",
        "end_time": "17:00"
    },
    {
        "event_id": 5,
        "date": "2020/04/04",
        "start_time": "13:00",
        "end_time": "17:00"
    }
];

function popTournamentSchedule(a)//Populating tournament_schedules relation
{
    var tournSchedApiRequest = new XMLHttpRequest();
    tournSchedApiRequest.open('POST','../php/addr_loc_course_api.php',true);
    tournSchedApiRequest.onreadystatechange = function()
    {
        if (tournSchedApiRequest.readyState == 4 && tournSchedApiRequest.status == 200)
        {
            var response = (JSON.parse(tournSchedApiRequest.responseText));
            console.log("Tournament Shedules Population API Call Response:");
            console.log(response);
        }
    }
    var data = {
        "sample": true,
        "table": "tournament_schedules",
        "data": tournScheds
    };
    tournSchedApiRequest.setRequestHeader("Content-type", "application/json; charset=utf-8");

    tournSchedApiRequest.send(JSON.stringify(data));
}