var affiliations = [
    {
        "affiliation_key": "Tannie Sannie's Friends",
        "affiliatoin_type": "South African",
        "publisher_id": 2,
        "manager_id": null
    },
    {
        "affiliation_key": "AA Golf Group",
        "affiliatoin_type": "South African",
        "publisher_id": 2,
        "manager_id": null
    },
    {
        "affiliation_key": "One Shot Per Hole",
        "affiliatoin_type": "South African",
        "publisher_id": 1,
        "manager_id": null
    }
];

function popAffs()//Populating affiliations relation
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
            popTours();
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
