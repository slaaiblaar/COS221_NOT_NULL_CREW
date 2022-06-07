//Wian Kokemeoer u19043512
var locations = [
    {
        "city": "Pretoria",
        "country": "South Africa",
        "timezone": "UTC+2",
        "latitude": "-25.7313",
        "longitude": "28.2184"
    },
    {
        "city": "Tokyo",
        "country": "Japan",
        "timezone": "UTC+9",
        "latitude": "35.6528",
        "longitude": "139.8395"
    },
    {
        "city": "Bogota",
        "country": "Colombia",
        "timezone": "UTC-5",
        "latitude": "4.6243",
        "longitude": "-74.0636"
    },
    {
        "city": "Thun",
        "country": "Switzerland",
        "timezone": "UTC+2",
        "latitude": "46.7484",
        "longitude": "7.6263"
    },
    {
        "city": "Addis Abbaba",
        "country": "Ethiopia",
        "timezone": "UTC+3",
        "latitude": "9.0054",
        "longitude": "38.7636"
    },
    {
        "city": "Split",
        "country": "Croatia",
        "timezone": "UTC+2",
        "latitude": "43.5081",
        "longitude": "16.4402"
    },
    {
        "city": "Auckland",
        "country": "New Zealand",
        "timezone": "UTC+13",
        "latitude": "",
        "longitude": ""
    },
    {
        "city": "Glasgow",
        "country": "United Kingdom",
        "timezone": "UTC+0",
        "latitude": "-36.8485",
        "longitude": "174.7633"
    },
    {
        "city": "Moscow",
        "country": "Russia",
        "timezone": "UTC+3",
        "latitude": "55.7512",
        "longitude": "37.6184"
    },
    {
        "city": "Ho Chi Minh City",
        "country": "Vietnam",
        "timezone": "UTC+7",
        "latitude": "10.7626",
        "longitude": "106.6602"
    },
    {
        "city": "Riga",
        "country": "Latvia",
        "timezone": "UTC+3",
        "latitude": "56.9463",
        "longitude": "24.1051"
    },
    {
        "city": "Tel Aviv",
        "country": "Israel",
        "timezone": "UTC+3",
        "latitude": "34.8555",
        "longitude": "32.1093"
    },
    {
        "city": "Thessaloniki",
        "country": "Greece",
        "timezone": "UTC+3",
        "latitude": "40.6293",
        "longitude": "22.9474"
    },
    {
        "city": "Minneapolis",
        "country": "United States",
        "timezone": "UTC-5",
        "latitude": "44.9867",
        "longitude": "-93.2581"
    },
    {
        "city": "Valletta",
        "country": "Malta",
        "timezone": "UTC+2",
        "latitude": "35.8963",
        "longitude": "14.5130"
    },
    {
        "city": "Manama",
        "country": "Bahrain",
        "timezone": "UTC+3",
        "latitude": "26.2010",
        "longitude": "50.6070"
    },
    {
        "city": "Algiers",
        "country": "Algeria",
        "timezone": "UTC+1",
        "latitude": "36.7372",
        "longitude": "3.0865"
    },
    {
        "city": "Valencia",
        "country": "Spain",
        "timezone": "UTC+2",
        "latitude": "39.4667",
        "longitude": "-0.3750"
    },
    {
        "city": "Santo Domingo",
        "country": "Dominican Republic",
        "timezone": "UTC-4",
        "latitude": "18.4834",
        "longitude": "-69.9296"
    },
    {
        "city": "Dublin",
        "country": "Ireland",
        "timezone": "UTC+1",
        "latitude": "53.3501",
        "longitude": "-6.2665"
    },
    {
        "city": "Abu Dabi",
        "country": "United Arab Emirates",
        "timezone": "UTC+4",
        "latitude": "24.4667",
        "longitude": "54.3667"
    },
    {
        "city": "Kyoto",
        "country": "Japan",
        "timezone": "UTC+9",
        "latitude": "35.0117",
        "longitude": "135.7683"
    },
    {
        "city": "Ulaanbaatar",
        "country": "Mongolia",
        "timezone": "UTC+8",
        "latitude": "47.9212",
        "longitude": "106.9186"
    }
];
function popLocations(a)//Populating locations relation
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
            if (a) popAddresses(a);
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
