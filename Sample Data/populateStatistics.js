//Wian Koekemoer u19043512
function popStats(a)
{
    var statsApiRequest = new XMLHttpRequest();
    statsApiRequest.open('POST','../php/addr_loc_course_api.php',true);
    statsApiRequest.onreadystatechange = function()
    {
        if (statsApiRequest.readyState == 4 && statsApiRequest.status == 200)
        {
            var response = (JSON.parse(statsApiRequest.responseText));
            console.log("Statistics Population API Call Response:");
            console.log(response);
            alert("Table Population Finished");
        }
    }
    var data = {
        "sample": true,
        "table": "golf_statistics"
    };
    statsApiRequest.setRequestHeader("Content-type", "application/json; charset=utf-8");

    statsApiRequest.send(JSON.stringify(data));
}