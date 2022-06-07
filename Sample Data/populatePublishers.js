//Wian Koekemoer
var publishers = [
    {
        "publisher_key": "admin@google.com"
    },
    {
        "publisher_key": "pietie@icloud.com"
    },
    {
        "publisher_key": "address@wordpress.com"
    }
];


function popPubs(a)//Populating publishers relation
{
    var pubsApiRequest = new XMLHttpRequest();
    pubsApiRequest.open('POST','../php/addr_loc_course_api.php',true);
    pubsApiRequest.onreadystatechange = function()
    {
        if (pubsApiRequest.readyState == 4 && pubsApiRequest.status == 200)
        {
            var response = (JSON.parse(pubsApiRequest.responseText));
            console.log("Publishers Population API Call Response:");
            console.log(response);
            if (a) popLocations(a);
        }
    }
    var data = {
        "sample": true,
        "table": "publishers",
        "data": publishers
    };
    pubsApiRequest.setRequestHeader("Content-type", "application/json; charset=utf-8");

    pubsApiRequest.send(JSON.stringify(data));
}