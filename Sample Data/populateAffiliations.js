//Wian Kokemeoer u19043512
var affiliations = [
    {
        "affiliation_key": "International Golf Federation",
        "affiliation_type": "International",
        "publisher_id": 1,
        "manager_id": null
    },
    {
        "affiliation_key": "GOLFRSA",
        "affiliation_type": "South African",
        "publisher_id": 1,
        "manager_id": 1
    },
    {
        "affiliation_key": "Tannie Sannie's Friends",
        "affiliation_type": "South African",
        "publisher_id": 2,
        "manager_id": null
    },
    {
        "affiliation_key": "AA Golf Group",
        "affiliation_type": "South African",
        "publisher_id": 2,
        "manager_id": null
    },
    {
        "affiliation_key": "One Shot Per Hole",
        "affiliation_type": "South African",
        "publisher_id": 1,
        "manager_id": null
    }
];

function popAffs(a)//Populating affiliations relation
{
    var affsApiRequest = new XMLHttpRequest();
    affsApiRequest.open('POST','../php/addr_loc_course_api.php',true);
    affsApiRequest.onreadystatechange = function()
    {
        if (affsApiRequest.readyState == 4 && affsApiRequest.status == 200)
        {
            var response = (JSON.parse(affsApiRequest.responseText));
            console.log("Affiliations Population API Call Response:");
            console.log(response);
            if (a) popTours(a);
        }
    }
    var data = {
        "sample": true,
        "table": "affiliations",
        "data": affiliations
    };
    affsApiRequest.setRequestHeader("Content-type", "application/json; charset=utf-8");

    affsApiRequest.send(JSON.stringify(data));
}
