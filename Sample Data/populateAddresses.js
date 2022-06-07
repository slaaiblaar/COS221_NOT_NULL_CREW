var addresses = [
    {
        "location_id": 3,
        "language": "en-US",
        "street_number": "123",
        "street": "Westing",
        "country": "Colombia"
    },
    {
        "location_id": 4,
        "language": "en-US",
        "street_number": "1224",
        "street": "Midbrake",
        "country": "Switzerland"
    },
    {
        "location_id": 5,
        "language": "en-US",
        "street_number": "235",
        "street": "Gunnister",
        "country": "Ethiopia"
    },
    {
        "location_id": 6,
        "language": "en-US",
        "street_number": "6435",
        "street": "Wick",
        "country": "Croatia"
    },
    {
        "location_id": 7,
        "language": "en-US",
        "street_number": "72",
        "street": "Gloup",
        "country": "New Zealand"
    },
    {
        "location_id": 8,
        "language": "en-US",
        "street_number": "916",
        "street": "Little Ness",
        "country": "United Kingdom"
    },
    {
        "location_id": 9,
        "language": "en-US",
        "street_number": "192",
        "street": "North Holms",
        "country": "Russia"
    },
    {
        "location_id": 10,
        "language": "en-US",
        "street_number": "721",
        "street": "Sivatsta",
        "country": "Vietnam"
    },
    {
        "location_id": 11,
        "language":"en-US",
        "street_number": "1023",
        "street": "Sluggins",
        "country": "Latvia"
    },
    {
        "location_id": 12,
        "language": "en-US",
        "street_number": "301",
        "street": "Longa Water",
        "country": "Israel"
    },
    {
        "location_id": 13,
        "language": "en-US",
        "street_number": "9174",
        "street": "Tonga",
        "country": "Greece"
    },
    {
        "location_id": 14,
        "language": "en-US",
        "street_number": "9612",
        "street": "Blue Mull",
        "country": "United States"
    },
    {
        "location_id": 15,
        "language": "en-US",
        "street_number": "572",
        "street": "Norby",
        "country": "Malta"
    },
    {
        "location_id": 16,
        "language": "en-US",
        "street_number": "214",
        "street": "Sadness",
        "country": "Bahrain"
    },
    {
        "location_id": 17,
        "language": "en-US",
        "street_number": "9",
        "street": "Navins",
        "country": "Algeria"
    },
    {
        "location_id": 18,
        "language": "en-US",
        "street_number": "4",
        "street": "Boddam",
        "country": "Spain"
    },
    {
        "location_id": 19,
        "language": "en-US",
        "street_number": "9828",
        "street": "Hillwell",
        "country": "Dominican Republic"
    },
    {
        "location_id": 20,
        "language": "en-US",
        "street_number": "1002",
        "street": "Toab",
        "country": "Ireland"
    },
    {
        "location_id": 21,
        "language": "en-US",
        "street_number": "18",
        "street": "Scousburgh",
        "country": "United Arab Emirates"
    },
    {
        "location_id": 22,
        "language": "en-US",
        "street_number": "2122",
        "street": "Gord",
        "country": "Japan"
    },
    {
        "location_id": 23,
        "language": "en-US",
        "street_number": "991",
        "street": "Skelberry",
        "country": "Mongolia"
    }
];
function popAddresses()//Populating addresses relation
        {
            var addrApiRequest = new XMLHttpRequest();
            addrApiRequest.open('POST','../php/addr_loc_course_api.php',true);
            addrApiRequest.onreadystatechange = function()
            {
                if (addrApiRequest.readyState == 4 && addrApiRequest.status == 200)
                {
                    var response = (JSON.parse(addrApiRequest.responseText));
                    console.log("Addresses Population API Call Response:");
                    console.log(response);
                    popSites();
                }
            }
            var data = {
                "sample": true,
                "table": "addresses",
                "data": addresses
            };
            addrApiRequest.setRequestHeader("Content-type", "application/json; charset=utf-8");

            addrApiRequest.send(JSON.stringify(data));
        }
        