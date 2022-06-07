//Wian Koekemoer u19043512
function popStrokes(a)
{
    
    var clubs = ["Driver", "3-Wood", "5-Wood", "3-Hybrid", "4-Hybrid", "5-Hybrid", "1-Iron", 
    "2-Iron", "3-Iron", "4-Iron", "5-Iron", "6-Iron", "7-Iron", "8-Iron", "9-Iron", "Wedge", "Putter"];
    var landings = ["Fairway", "Bunker", "Penalty", "Hole"];
    var finalObject = [];
    var eventObject = [];
    var strokes = [];
    for (var eventIndex in events) //iterate through events
    {
        console.log("Event " + (eventIndex+1));
        
        var personIndexBase = 0
        if (events[eventIndex]['gender'] !== "Women") // Female events
        {
            personBase = 10;
        }
        //var roundObject = [];
        for (var roundIndex = 0; roundIndex < 4; roundIndex++) //iterate through rounds
        {
            //var holeObject = [];
            for (var holeIndex = 0; holeIndex < 18; holeIndex++) //iterate through holes
            {
                
                //var personObject = [];
                for (var personIndex = personIndexBase; personIndex < 10+personIndexBase; personIndex++)//iterate through persons
                {
                    
                    var numStrokes = Math.round(Math.log((Math.round(Math.random() * 50)) + 1.4) / Math.log(1.4));
                    var siteIndex = events[eventIndex]['site_id']-1;
                    var length = holes[siteIndex*18+holeIndex]['length'];
                    //console.log("Length of hole " + (holeIndex+1) + "-" + (siteIndex+1) + ": " + length);
                    var averageLength = length/numStrokes;
                    
                    for (var i = 1; i <= numStrokes; i++)
                    {
                        
                        var landingChance = Math.round(Math.random()*100);
                        var clubIndex = Math.round(Math.random()*17);
                        if (landingChance > 35) landingChance = 0;
                        else if (landingChance > 5) landingChance = 1;
                        else landingChance = 2;
                        if (i == numStrokes) landingChance = 3;
                        strokes.push(
                        {
                            "stroke_no": i,
                            "round_id": (eventIndex*4+roundIndex+1),
                            "hole_id": (eventIndex*18+holeIndex+1),
                            "person_id": (personIndex+1),
                            "club_used": clubs[clubIndex],
                            "distance": averageLength,
                            "landing": landings[landingChance]
                        });

                        if (landingChance == 2)
                        {
                            i++;
                            numStrokes++;
                            strokes.push(
                            {
                                "stroke_no": i,
                                "round_id": (eventIndex*4+roundIndex+1),
                                "hole_id": (eventIndex*18+holeIndex+1),
                                "person_id": (personIndex+1),
                                "club_used": clubs[clubIndex],
                                "distance": 0,
                                "landing": landings[landingChance]
                            });
                        }
                    }
                }
            }
        }
    }
    console.log(strokes);
    

    var strokeApiRequest = new XMLHttpRequest();
    strokeApiRequest.open('POST','../php/addr_loc_course_api.php',true);
    strokeApiRequest.onreadystatechange = function()
    {
        if (strokeApiRequest.readyState == 4 && strokeApiRequest.status == 200)
        {
            var response = (JSON.parse(strokeApiRequest.responseText));
            console.log("Strokes Population API Call Response:");
            console.log(response);
            if (a) popScores(a);
        }
    }
    var data = {
        "sample": true,
        "table": "strokes",
        "data": strokes
    };
    strokeApiRequest.setRequestHeader("Content-type", "application/json; charset=utf-8");

    strokeApiRequest.send(JSON.stringify(data));
}