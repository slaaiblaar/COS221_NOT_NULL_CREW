var scores = {}

// function createScores() {

//   var startingScore = 0;
//   var scoreAfterHole = [ -1, -2, -1, 0, 1, 2, 3, 4, 2, -1, 0, 0, 0, 1, 0, -1, -2, -3 ];
//   var strokeCount = [ 2, 4, 8, 13, 17, 21, 24, 27, 28, 32, 35, 38, 42, 47, 50, 53, 58 ];

//   for (let i = 0; i < 4; i++) { // for each round in a tournament
//     for (let k = 0; k < 5; k++) { // for each tournament
//       for (let j = 1; j < 11; j++) { // for each player
//         var birdie = false;
//         var eagle = false;
//         var bogey = false;
//         var double_bogey = false;
//         for (let hole = 0; hole < 18; hole++) { // for each hole on a course
//           startingScore += scoreAfterHole[hole];
//           if (hole = 1) birdie = true;
//           if (hole = 4) eagle = true;
//           if (hole = 5) bogey = true;
//           if (hole = 9) double_bogey = true; 
//           scores.push({
//               "person_id": j,
//               "round_id": (i + 1),
//               "hole_id": (hole + 1),
//               "net_score": startingScore,
//               "stroke_count": strokeCount[hole],
//               "birdie": birdie,
//               "eagle": eagle,
//               "bogey": bogey,
//               "double_bogey": double_bogey
//           });
//         }
//       }
//     }
//   }
// }


function popScores(a)//Populating scores relation
{

  var scoreIdCombinations = [];
  for (var eventIndex in events) //iterate through events
  {      
    var personIndexBase = 0
    if (events[eventIndex]['gender'] !== "Women") // Female events
    {
      personBase = 10; //The index where the first male person appears
    }
    
    for (var roundIndex = 0; roundIndex < 4; roundIndex++) //iterate through rounds
    {
      for (var holeIndex = 0; holeIndex < 18; holeIndex++) //iterate through holes
      {
        for (var personIndex = personIndexBase; personIndex < 10+personIndexBase; personIndex++)//iterate through persons
        {
          scoreIdCombinations.push(
          {
            "round_id": (eventIndex*4+roundIndex+1),
            "hole_id": (eventIndex*18+holeIndex+1),
            "person_id": (personIndex+1)
          });
            
        }
      }
    }
  }
    var scoresEventsApiRequest = new XMLHttpRequest();
    scoresEventsApiRequest.open('POST','../php/addr_loc_course_api.php',true);
    scoresEventsApiRequest.onreadystatechange = function()
    {
      if (scoresEventsApiRequest.readyState == 4 && scoresEventsApiRequest.status == 200)
      {
        var response = (JSON.parse(scoresEventsApiRequest.responseText));
        console.log("Scores Population API Call Response:");
        console.log(response);
        if (a) popStats(a);
      }
    }
    var data = {
      "sample": true,
      "table": "scores",
      "data": scoreIdCombinations
    };
    scoresEventsApiRequest.setRequestHeader("Content-type", "application/json; charset=utf-8");
    console.log(scoreIdCombinations);
    scoresEventsApiRequest.send(JSON.stringify(data));

}