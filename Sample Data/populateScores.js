var scores = {}

function createScores() {

  var startingScore = 0;
  var scoreAfterHole = [ -1, -2, -1, 0, 1, 2, 3, 4, 2, -1, 0, 0, 0, 1, 0, -1, -2, -3 ];
  var strokeCount = [ 2, 4, 8, 13, 17, 21, 24, 27, 28, 32, 35, 38, 42, 47, 50, 53, 58 ];

  for (let i = 0; i < 4; i++) { // for each round in a tournament
    for (let j = 0; j < 5; j++) { // for each tournament
      for (let k = 0; k < 10; k++) { // for each player
        var birdie = false;
        var eagle = false;
        var bogey = false;
        var double_bogey = false;
        for (let b = 0; b < 18; b++) { // for each hole on a course
          startingScore += scoreAfterHole[b];
          if (b = 1) birdie = true;
          if (b = 4) eagle = true;
          if (b = 5) bogey = true;
          if (b = 9) double_bogey = true; 
          scores.push({
              "person_id": k,
              "round_id": i,
              "hole_id": l,
              "net_score": startingScore,
              "stroke_count": strokeCount[b],
              "birdie": birdie,
              "eagle": eagle,
              "bogey": bogey,
              "double_bogey": double_bogey
          });
        }
      }
    }
  }
}


function popScores(a)//Populating persons relation
{
    var scoresEventsApiRequest = new XMLHttpRequest();
    scoresEventsApiRequest.open('POST','../php/addr_loc_course_api.php',true);
    scoresEventsApiRequest.onreadystatechange = function()
    {
        if (scoresEventsApiRequest.readyState == 4 && scoresEventsApiRequest.status == 200)
        {
            var response = (JSON.parse(scoresEventsApiRequest.responseText));
            console.log("Scores Population API Call Response:");
            console.log(response);
            if (a) popDispNames(a);
        }
    }
    var data = {
        "sample": true,
        "table": "scores",
        "data": scores
    };
    scoresEventsApiRequest.setRequestHeader("Content-type", "application/json; charset=utf-8");
    scoresEventsApiRequest.send(JSON.stringify(data));
}