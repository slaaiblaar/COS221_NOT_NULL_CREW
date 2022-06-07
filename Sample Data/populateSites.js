//Wian Kokemeoer u19043512
var sites = [ //Courses
    {
        "site_key": "Pretoria Country club",
        "publisher_id": 1,
        "location_id": 1,
        "address_id": 1
    },
    {
        "site_key": "Tokyo Yokahama",
        "publisher_id": 2,
        "location_id": 2,
        "address_id": 2
    },
    {
        "site_key": "Ridgeview Country Club",
        "publisher_id": 1,
        "location_id": 3,
        "address_id": 2
    },
    {
        "site_key": "Willowmoore Views",
        "publisher_id": 2,
        "location_id": 2,
        "address_id": 1
    },
    {
        "site_key": "Greencrest Golf Course",
        "publisher_id": 3,
        "location_id": 1,
        "address_id": 4
    }
];
function popSites(a)//Populating sites relation
{
    var sitesApiRequest = new XMLHttpRequest();
    sitesApiRequest.open('POST','../php/addr_loc_course_api.php',true);
    sitesApiRequest.onreadystatechange = function()
    {
        if (sitesApiRequest.readyState == 4 && sitesApiRequest.status == 200)
        {
            var response = (JSON.parse(sitesApiRequest.responseText));
            console.log("Sites Population API Call Response:");
            console.log(response);
            if (a) popHoles(a);
        }
    }
    var data = {
        "sample": true,
        "table": "sites",
        "data": sites
    };
    sitesApiRequest.setRequestHeader("Content-type", "application/json; charset=utf-8");

    sitesApiRequest.send(JSON.stringify(data));
}
