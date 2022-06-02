<?php //Wian Koekemoer u19043512

    function console_log($output, $with_script_tags = true) 
    {
        $js_code = 'console.log(' . json_encode($output, JSON_HEX_TAG) . ');';
        if ($with_script_tags) {
            $js_code = '<script>' . $js_code . '</script>';
        }
        echo $js_code;
    }
    class Database
    {
        private static $dbInstance = null;
        private $dbConnection;

        public static function getInstance()
        {
            if (!self::$dbInstance)
            {
                self::$dbInstance = new Database();
            }
            return self::$dbInstance;
        }

        private function __construct()
        {
            $hostname = "localhost";
            $uName = "root";
            $pw = "";
            $dbName = "pa5_task_4";
            
            $this->dbConnection = new mysqli($hostname, $uName, $pw, $dbName);
        }

        public function addAddress($location_id, $language, $street_number, $street, $country)
        {
            $addSQL = "INSERT INTO addresses (location_id, language, street_number, street, country) VALUES (".$location_id.",'".$language."','"
            .$street_number."','".$street."','".$country."')";

            $conn = $this->dbConnection;
            if ($conn->query($addSQL) === true)
            {
                return [ "success" => true, "Message" => "Successfully added address: ". $street_number." ".$street." ".$country];
            }
            else
            {
                return [ "success" => false, "Error" => "Some error occurred, could not add address: ". $street_number." ".$street." ".$country];
            }
        }

        public function getAddresses()
        {
            $getQuery = "SELECT * FROM addresses";

            $conn = $this->dbConnection;
            $result = $conn->query($getQuery);

            if ($result->num_rows > 0)
            {
                $responseObject = array();
                while ($row = $result->fetch_assoc())
                {
                    $temp = array("id"=>$row["id"], "location_id"=>$row["location_id"], "language"=>$row["language"], "street_number"=>$row["street_number"], 
                    "street"=>$row["street"], "country"=>$row["country"]);
                    array_push($responseObject, $row);
                }
                return ["success"=>true, "result"=>$responseObject];
            }
            else
            {
                return ["success"=>true, "message"=>"No addresses found"];
            }
        }

        public function getLocations()
        {
            $getQuery = "SELECT * FROM locations";

            $conn = $this->dbConnection;
            $result = $conn->query($getQuery);

            if ($result->num_rows > 0)
            {
                $responseObject = array();
                while ($row = $result->fetch_assoc())
                {
                    $temp = array("id"=>$row["id"], "city"=>$row["city"], "country"=>$row["country"], "timezone"=>$row["timezone"], 
                    "latitude"=>$row["latitude"], "longitude"=>$row["longitude"]);
                    array_push($responseObject, $row);
                }
                return ["success"=>true, "result"=>$responseObject];
            }
            else
            {
                return ["success"=>true, "message"=>"No locations found"];
            }
        }
        public function addLocation($city, $country, $timezone, $latitude, $longitude)
        {
            $addSQL = "INSERT INTO locations (city, country, timezone, latitude, longitude) VALUES ('".$city."','".$country."','"
            .$timezone."','".$latitude."','".$longitude."')";

            $conn = $this->dbConnection;
            if ($conn->query($addSQL) === true)
            {
                return [ "success" => true, "Message" => "Successfully added location: ". $timezone." ".$latitude." ".$longitude];
            }
            else
            {
                return [ "success" => false, "Error" => $conn->error];
            }
        }
        public function delAddress($email, $pw)
        {

        }
    }
?>