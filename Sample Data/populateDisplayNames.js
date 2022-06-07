//Wian Kokemeoer u19043512
var displayNames = [
    {
        "language": "en-US",
        "entity_type": "persons",
        "entity_id": 1,
        "first_name": "Gary",
        "middle_name": "Lee",
        "last_name": "Player"
    },
    {
        "language": "en-US",
        "entity_type": "persons",
        "entity_id": 2,
        "first_name": "Jonelle",
        "middle_name": "",
        "last_name": "Coertzee"
    },
    {
        "language": "en-US",
        "entity_type": "persons",
        "entity_id": 3,
        "first_name": "Charlene",
        "middle_name": "",
        "last_name": "Willems"
    },
    {
        "language": "en-US",
        "entity_type": "persons",
        "entity_id": 4,
        "first_name": "Sierra",
        "middle_name": "",
        "last_name": "Dietrich"
    },
    {
        "language": "en-US",
        "entity_type": "persons",
        "entity_id": 5,
        "first_name": "Daniela",
        "middle_name": "",
        "last_name": "Auer"
    },
    {
        "language": "en-US",
        "entity_type": "persons",
        "entity_id": 6,
        "first_name": "Sandra",
        "middle_name": "",
        "last_name": "Hills"
    },
    {
        "language": "en-US",
        "entity_type": "persons",
        "entity_id": 7,
        "first_name": "Leila",
        "middle_name": "",
        "last_name": "Bergnaum"
    },
    {
        "language": "en-US",
        "entity_type": "persons",
        "entity_id": 8,
        "first_name": "Naomie",
        "middle_name": "",
        "last_name": "McKenzie"
    },
    {
        "language": "en-US",
        "entity_type": "persons",
        "entity_id": 9,
        "first_name": "Nicolene",
        "middle_name": "",
        "last_name": "Samuels"
    },
    {
        "language": "en-US",
        "entity_type": "persons",
        "entity_id": 10,
        "first_name": "Madeline",
        "middle_name": "",
        "last_name": "Robel"
    },
    {
        "language": "en-US",
        "entity_type": "persons",
        "entity_id": 11,
        "first_name": "Tannie",
        "middle_name": "",
        "last_name": "Sannie"
    },
    {
        "language": "en-US",
        "entity_type": "persons",
        "entity_id": 12,
        "first_name": "Liam",
        "middle_name": "",
        "last_name": "Olson"
    },
    {
        "language": "en-US",
        "entity_type": "persons",
        "entity_id": 13,
        "first_name": "Lemuel",
        "middle_name": "",
        "last_name": "Quigley"
    },
    {
        "language": "en-US",
        "entity_type": "persons",
        "entity_id": 14,
        "first_name": "Blaise",
        "middle_name": "",
        "last_name": "Stamm"
    },
    {
        "language": "en-US",
        "entity_type": "persons",
        "entity_id": 15,
        "first_name": "Kurtis",
        "middle_name": "",
        "last_name": "Stiedemann"
    },
    {
        "language": "en-US",
        "entity_type": "persons",
        "entity_id": 16,
        "first_name": "Brendon",
        "middle_name": "",
        "last_name": "Stoltenberg"
    },
    {
        "language": "en-US",
        "entity_type": "persons",
        "entity_id": 17,
        "first_name": "Jaylan",
        "middle_name": "",
        "last_name": "Wolff"
    },
    {
        "language": "en-US",
        "entity_type": "persons",
        "entity_id": 18,
        "first_name": "Floy",
        "middle_name": "",
        "last_name": "Fadel"
    },
    {
        "language": "en-US",
        "entity_type": "persons",
        "entity_id": 19,
        "first_name": "Wilfred",
        "middle_name": "",
        "last_name": "Pfannerstill"
    },
    {
        "language": "en-US",
        "entity_type": "persons",
        "entity_id": 20,
        "first_name": "Freddy",
        "middle_name": "",
        "last_name": "Larson"
    }
];

function popDispNames(a)//Populating display_names relation
{
    var dispNamesApiRequest = new XMLHttpRequest();
    dispNamesApiRequest.open('POST','../php/addr_loc_course_api.php',true);
    dispNamesApiRequest.onreadystatechange = function()
    {
        if (dispNamesApiRequest.readyState == 4 && dispNamesApiRequest.status == 200)
        {
            var response = (JSON.parse(dispNamesApiRequest.responseText));
            console.log("Display Names Population API Call Response:");
            console.log(response);
            if (a) popAffiliationsEvents(a);
        }
    }
    var data = {
        "sample": true,
        "table": "display_names",
        "data": displayNames
    };
    dispNamesApiRequest.setRequestHeader("Content-type", "application/json; charset=utf-8");

    dispNamesApiRequest.send(JSON.stringify(data));
}
