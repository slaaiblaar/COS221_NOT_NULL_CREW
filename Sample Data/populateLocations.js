var locations = [
    {
        "table": "locations", 
        "add": {
        "id": 3,
        "city": "Bogota",
        "country": "Colombia",
        "timezone": "-5UTC",
        "latitude": "4.6243",
        "longitude": "-74.0636"
    }
    },{
        "table": "locations", 
        "add": {
            "id": 4,
            "city": "Thun",
            "country": "Switzerland",
            "timezone": "+2UTC",
            "latitude": "46.7484",
            "longitude": "7.6263"
        }
    },{
        "table": "locations", 
        "add": {
            "id": 5,
            "city": "Addis Abbaba",
            "country": "Ethiopia",
            "timezone": "+3UTC",
            "latitude": "9.0054",
            "longitude": "38.7636"
        }
    },{
        "table": "locations", 
        "add": {
            "id": 6,
            "city": "Split",
            "country": "Croatia",
            "timezone": "+2UTC",
            "latitude": "43.5081",
            "longitude": "16.4402"
        }
    },{
        "table": "locations", 
        "add": {
            "id": 7,
            "city": "Auckland",
            "country": "New Zealand",
            "timezone": "+13UTC",
            "latitude": "",
            "longitude": ""
        }
    },{
        "table": "locations", 
        "add": {
            "id": 8,
            "city": "Glasgow",
            "country": "United Kingdom",
            "timezone": "+0UTC",
            "latitude": "-36.8485",
            "longitude": "174.7633"
        }
    },
    {
        "table": "locations", 
        "add": {
            "id": 9,
            "city": "Moscow",
            "country": "Russia",
            "timezone": "+3UTC",
            "latitude": "55.7512",
            "longitude": "37.6184"
        }
    },
    {
        "table": "locations", 
        "add": {
            "id": 10,
            "city": "Ho Chi Minh City",
            "country": "Vietnam",
            "timezone": "+7UTC",
            "latitude": "10.7626",
            "longitude": "106.6602"
        }
    },
    {
        "table": "locations", 
        "add": {
            "id": 11,
            "city": "Riga",
            "country": "Latvia",
            "timezone": "+3UTC",
            "latitude": "56.9463",
            "longitude": "24.1051"
        }
    },
    {
        "table": "locations", 
        "add": {
            "id": 12,
            "city": "Tel Aviv",
            "country": "Israel",
            "timezone": "+3UTC",
            "latitude": "34.8555",
            "longitude": "32.1093"
        }
    },
    {
        "table": "locations", 
        "add": {
            "id": 13,
            "city": "Thessaloniki",
            "country": "Greece",
            "timezone": "+3UTC",
            "latitude": "40.6293",
            "longitude": "22.9474"
        }
    },
    {
        "table": "locations", 
        "add": {
            "id": 14,
            "city": "Minneapolis",
            "country": "United States",
            "timezone": "-5UTC",
            "latitude": "44.9867",
            "longitude": "-93.2581"
        }
    },
    {
        "table": "locations", 
        "add": {
            "id": 15,
            "city": "Valletta",
            "country": "Malta",
            "timezone": "+2UTC",
            "latitude": "35.8963",
            "longitude": "14.5130"
        }
    },
    {
        "table": "locations", 
        "add": {
            "id": 16,
            "city": "Manama",
            "country": "Bahrain",
            "timezone": "+3UTC",
            "latitude": "26.2010",
            "longitude": "50.6070"
        }
    },
    {
        "table": "locations", 
        "add": {
            "id": 17,
            "city": "Algiers",
            "country": "Algeria",
            "timezone": "+1UTC",
            "latitude": "36.7372",
            "longitude": "3.0865"
        }
    },
    {
        "table": "locations", 
        "add": {
            "id": 18,
            "city": "Valencia",
            "country": "Spain",
            "timezone": "+2UTC",
            "latitude": "39.4667",
            "longitude": "-0.3750"
        }
    },
    {
        "table": "locations", 
        "add": {
            "id": 19,
            "city": "Santo Domingo",
            "country": "Dominican Republic",
            "timezone": "-4UTC",
            "latitude": "18.4834",
            "longitude": "-69.9296"
        }
    },
    {
        "table": "locations", 
        "add": {
            "id": 20,
            "city": "Dublin",
            "country": "Ireland",
            "timezone": "+1UTC",
            "latitude": "53.3501",
            "longitude": "-6.2665"
        }
    },
    {
        "table": "locations", 
        "add": {
            "id": 21,
            "city": "Abu Dabi",
            "country": "United Arab Emirates",
            "timezone": "+4UTC",
            "latitude": "24.4667",
            "longitude": "54.3667"
        }
    },
    {
        "table": "locations", 
        "add": {
            "id": 22,
            "city": "Kyoto",
            "country": "Japan",
            "timezone": "+9UTC",
            "latitude": "35.0117",
            "longitude": "135.7683"
        }
    },
    {
        "table": "locations", 
        "add": {
            "id": 23,
            "city": "Ulaanbaatar",
            "country": "Mongolia",
            "timezone": "+8UTC",
            "latitude": "47.9212",
            "longitude": "106.9186"
        }
    },
];
function popLocations()//Populating locations relation
        {
            var locApiRequest = new XMLHttpRequest();
            locApiRequest.open('POST','../php/addr_loc_course_api.php',true);
            locApiRequest.onreadystatechange = function()
            {
                if (locApiRequest.readyState == 4 && locApiRequest.status == 200)
                {
                    var response = (JSON.parse(locApiRequest.responseText));
                    console.log("Locations Population API Call Response:");
                    console.log(response);
                    popAddresses();
                }
            }
            var data = {
                "sample": true,
                "table": "locations",
                "data": locations
            };
            locApiRequest.setRequestHeader("Content-type", "application/json; charset=utf-8");

            locApiRequest.send(JSON.stringify(data));
        }
