//Wian Koekemoer u19043512
var rounds = [
    {
        "round_no": 1,
        "event_id": 1,
        "leader_id": 1,
        "state": "Scheduled"
    },
    {
        "round_no": 2,
        "event_id": 1,
        "leader_id": 12,
        "state": "Scheduled"
    },
    {
        "round_no": 3,
        "event_id": 1,
        "leader_id": 1,
        "state": "Scheduled"
    },
    {
        "round_no": 4,
        "event_id": 1,
        "leader_id": 1,
        "state": "Scheduled"
    },
    {
        "round_no": 1,
        "event_id": 2,
        "state": "Cancelled"
    },
    {
        "round_no": 2,
        "event_id": 2,
        "state": "Cancelled"
    },
    {
        "round_no": 3,
        "event_id": 2,
        "state": "Cancelled"
    },
    {
        "round_no": 4,
        "event_id": 2,
        "state": "Cancelled"
    },
    {
        "round_no": 1,
        "event_id": 3,
        "leader_id": 11,
        "state": "Finished"
    },
    {
        "round_no": 2,
        "event_id": 3,
        "leader_id": 11,
        "state": "Finished"
    },
    {
        "round_no": 3,
        "event_id": 3,
        "leader_id": 11,
        "state": "Finished"
    },
    {
        "round_no": 4,
        "event_id": 3,
        "leader_id": 11,
        "state": "Finished"
    },
    {
        "round_no": 1,
        "event_id": 4,
        "leader_id": 11,
        "state": "Finished"
    },
    {
        "round_no": 2,
        "event_id": 4,
        "leader_id": 11,
        "state": "Finished"
    },
    {
        "round_no": 3,
        "event_id": 4,
        "leader_id": 11,
        "state": "Finished"
    },
    {
        "round_no": 4,
        "event_id": 4,
        "leader_id": 11,
        "state": "Finished"
    },
    {
        "round_no": 1,
        "event_id": 5,
        "leader_id": 12,
        "state": "Finished"
    },
    {
        "round_no": 2,
        "event_id": 5,
        "leader_id": 1,
        "state": "Finished"
    },
    {
        "round_no": 3,
        "event_id": 5,
        "leader_id": 14,
        "state": "Finished"
    },
    {
        "round_no": 4,
        "event_id": 5,
        "leader_id": 20,
        "state": "Finished"
    },
];

function popRounds(a)//Populating rounds relation
{
    var roundsApiRequest = new XMLHttpRequest();
    roundsApiRequest.open('POST','../php/addr_loc_course_api.php',true);
    roundsApiRequest.onreadystatechange = function()
    {
        if (roundsApiRequest.readyState == 4 && roundsApiRequest.status == 200)
        {
            var response = (JSON.parse(roundsApiRequest.responseText));
            console.log("Rounds Population API Call Response:");
            console.log(response);
            if (a) popTournamentSchedule(a);
        }
    }
    var data = {
        "sample": true,
        "table": "rounds",
        "data": rounds
    };
    roundsApiRequest.setRequestHeader("Content-type", "application/json; charset=utf-8");

    roundsApiRequest.send(JSON.stringify(data));
}