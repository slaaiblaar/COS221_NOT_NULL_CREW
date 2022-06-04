<?php //Wian Koekemoer u19043512
    
    include_once("setDBEnvVar.php");
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
            $hostname = getenv("GOLF_DB_HOST");
            $uName = getenv("GOLF_DB_USERNAME");
            $pw = getenv("GOLF_DB_PASSWORD");
            $dbName = getenv("GOLF_DB_NAME");
            
            $this->dbConnection = new mysqli($hostname, $uName, $pw, $dbName);
        }
        public function getPublishers() //All Publishers
        {
            $getQuery = "SELECT id, publisher_key, publisher_name FROM publishers";

            $conn = $this->dbConnection;
            $result = $conn->query($getQuery);

            if ($result->num_rows > 0)
            {
                $responseObject = array();
                while ($row = $result->fetch_assoc())
                {
                    $temp = array("id"=>$row["id"], "publisher_key"=>$row["publisher_key"], "publisher_name"=>$row["publisher_name"]);
                    array_push($responseObject, $row);
                }
                return ["success"=>true, "result"=>$responseObject];
            }
            else
            {
                return ["success"=>false, "message"=>"No publishers found"];
            }
        }

        public function getPublisher($id) //A single Publisher
        {
            $getQuery = "SELECT id, publisher_key, publisher_name FROM publishers where id=".$id;

            $conn = $this->dbConnection;
            $result = $conn->query($getQuery);

            if ($result->num_rows > 0) 
            {
                $publisher = $result->fetch_assoc();
                return ["success"=>true, "publisher" => $publisher];
            }
            else return ["success"=>false, "message" => "A publisher with ID(". $id .") does not exist"];
        }

        public function addPublisher($publisher_key, $publisher_name)
        {
            $addSQL = "INSERT INTO publishers (publisher_key, publisher_name) VALUES ('".$publisher_key."','".$publisher_name."')";

            $conn = $this->dbConnection;
            if ($conn->query($addSQL) === true)
            {
                return [ "success" => true, "message" => "Successfully added publisher: ". $publisher_key." ".$publisher_name];
            }
            else
            {
                return [ "success" => false, "error" => $conn->error];
            }
        }
        
        public function modPublisher($id, $publisher_key, $publisher_name)
        {

        }

        public function delPublisher($id)
        {

        }

        public function getLocations() //All Locations
        {
            $getQuery = "SELECT id, city, country, timezone, latitude, longitude FROM locations";

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
                return ["success"=>false, "message"=>"No locations found"];
            }
        }

        public function getLocation($id) //A single Location
        {
            $getQuery = "SELECT id, city, country, timezone, latitude, longitude FROM locations where id=".$id;

            $conn = $this->dbConnection;
            $result = $conn->query($getQuery);

            if ($result->num_rows > 0) 
            {
                $location = $result->fetch_assoc();
                return ["success"=>true, "location" => $location];
            }
            else return ["success"=>false, "message" => "A location with ID(". $id .") does not exist"];
        }

        public function addLocation($city, $country, $timezone, $latitude, $longitude)
        {
            $addSQL = "INSERT INTO locations (city, country, timezone, latitude, longitude) VALUES ('".$city."','".$country."','"
            .$timezone."','".$latitude."','".$longitude."')";

            $conn = $this->dbConnection;
            if ($conn->query($addSQL) === true)
            {
                return [ "success" => true, "message" => "Successfully added location: ". $timezone." ".$latitude." ".$longitude];
            }
            else
            {
                return [ "success" => false, "error" => $conn->error];
            }
        }
        
        public function modLocation($id, $city, $country, $timezone, $latitude, $longitude)
        {

        }
        
        public function delLocation($id)
        {

        }
        
        public function getAddresses() //All Addresses
        {
            $getQuery = "SELECT id, location_id, language, street_number, street, country FROM addresses";

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

        public function getAddress($id) //A single Addresses
        {
            $getQuery = "SELECT id, location_id, language, street_number, street, country FROM addresses where id=".$id;

            $conn = $this->dbConnection;
            $result = $conn->query($getQuery);

            if ($result->num_rows > 0) 
            {
                $address = $result->fetch_assoc();
                return ["success"=>true, "address" => $address];
            }
            else return ["success"=>false, "message" => "An address with ID(". $id .") does not exist"];
        }

        public function addAddress($location_id, $language, $street_number, $street, $country)
        {
            $addSQL = "INSERT INTO addresses (location_id, language, street_number, street, country) VALUES (".$location_id.",'".$language."','"
            .$street_number."','".$street."','".$country."')";

            $conn = $this->dbConnection;
            if ($conn->query($addSQL) === true)
            {
                return [ "success" => true, "message" => "Successfully added address: ". $street_number." ".$street." ".$country];
            }
            else
            {
                return [ "success" => false, "error" => "Some error occurred, could not add address: ". $street_number." ".$street." ".$country];
            }
        }
        
        public function modAddress($id, $location_id, $language, $street_number, $street, $country)
        {

        }
        
        public function delAddress($id)
        {

        }
        
        public function getCourses() //All Courses
        {
            $getQuery = "SELECT id, site_key, publisher_id, location_id, address_id FROM sites";

            $conn = $this->dbConnection;
            $result = $conn->query($getQuery);

            if ($result->num_rows > 0)
            {
                $responseObject = array();
                while ($row = $result->fetch_assoc())
                {
                    $temp = array("id"=>$row["id"], "site_key"=>$row["site_key"], "publisher_id"=>$row["publisher_id"], "location_id"=>$row["location_id"], 
                    "address_id"=>$row["address_id"]);
                    array_push($responseObject, $row);
                }
                return ["success"=>true, "result"=>$responseObject];
            }
            else
            {
                return ["success"=>false, "message"=>"No courses found"];
            }
        }

        public function getCourse($id) //A single Course
        {
            $getQuery = "SELECT id, site_key, publisher_id, location_id, address_id FROM sites where id=".$id;

            $conn = $this->dbConnection;
            $result = $conn->query($getQuery);

            if ($result->num_rows > 0) 
            {
                $course = $result->fetch_assoc();
                return ["success"=>true, "course" => $course];
            }
            else return ["success"=>false, "message" => "A site with ID(". $id .") does not exist"];
        }

        public function addCourse($site_key, $publisher_id, $location_id, $address_id)
        {
            $addSQL = "INSERT INTO sites (site_key, publisher_id, location_id, address_id) VALUES ('".$site_key."',".$publisher_id.","
            .$location_id.",".$address_id.")";

            $conn = $this->dbConnection;
            if ($conn->query($addSQL) === true)
            {
                return [ "success" => true, "message" => "Successfully added course: ". $site_key];
            }
            else
            {
                return [ "success" => false, "error" => $conn->error];
            }
        }
        
        public function modCourse($id, $site_key, $publisher_id, $location_id, $address_id)
        {

        }

        public function deCourse($id)
        {

        }
    }
    $dbConn = Database::getInstance();
    if ($_POST['table'] === 'addresses')
    {
        if (isset($_POST['target'])) echo json_encode($dbConn->getAddress($_POST['target']));
        else echo json_encode($dbConn->getAddresses());
    }
    else if ($_POST['table'] === 'locations')
    {
        if (isset($_POST['target'])) echo json_encode($dbConn->getLocation($_POST['target']));
        else echo json_encode($dbConn->getLocations());
    }
    else if ($_POST['table'] === 'courses')
    {
        if (isset($_POST['target'])) echo json_encode($dbConn->getCourse($_POST['target']));
        else echo json_encode($dbConn->getCourses());        
    }
    else if ($_POST['table'] === 'publishers')
    {
        if (isset($_POST['target'])) echo json_encode($dbConn->getPublisher($_POST['target']));
        else echo json_encode($dbConn->getCourses());        
    }
    else 
    {
        $debugFile = fopen("../debug.txt","r+");
        fwrite($debugFile,"======================================\n");
        fwrite($debugFile,print_r($_POST,true));
        fwrite($debugFile,"\n======================================\n");
        fclose($debugFile);
    }
?>