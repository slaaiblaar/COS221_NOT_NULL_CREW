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

        public function addPublisher(array $data)
        {
            $addSQL = "INSERT INTO publishers (publisher_key, publisher_name) VALUES ('".$data['publisher_key']."','".$data['publisher_name']."')";

            $conn = $this->dbConnection;
            if ($conn->query($addSQL) === true)
            {
                return [ "success" => true, "message" => "Successfully added publisher: ". $data['publisher_key']." ".$data['publisher_name']];
            }
            else
            {
                return [ "success" => false, "error" => $conn->error];
            }
        }
        
        public function modPublisher(array $data)
        {

        }

        public function delPublisher(array $data)
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

        public function addLocation(array $data)
        {
            $addSQL = "INSERT INTO locations (city, country, timezone, latitude, longitude) VALUES ('".$data['city']."','".$data['country']."','"
            .$data['timezone']."','".$data['latitude']."','".$data['longitude']."')";

            $conn = $this->dbConnection;
            if ($conn->query($addSQL) === true)
            {
                return [ "success" => true, "message" => "Successfully added location: ". $data['timezone']." ".$data['latitude']." ".$data['longitude']];
            }
            else
            {
                return [ "success" => false, "error" => $conn->error];
            }
        }
        
        public function modLocation(array $data)
        {
            $modSQL = "UPDATE locations SET city='".$data['city']."', country='".$data['country']."', timezone='".$data['timezone']."',"
            ." latitude='".$data['latitude']."', longitude='".$data['longitude']."' WHERE id=".$data['id'];

            $conn = $this->dbConnection;
            if ($conn->query($modSQL) === true)
            {
                return [ "success" => true, "message" => "Successfully modified location: ". $data['timezone']." ".$data['latitude']." ".$data['longitude']];
            }
            else
            {
                return [ "success" => false, "error" => $conn->error];
            }
        }
        
        public function delLocation(array $data)
        {
            $delSQL = "DELETE FROM locations WHERE id=". $data['id'];

            $conn = $this->dbConnection;
            if ($conn->query($delSQL) === true)
            {
                return [ "success" => true, "message" => "Successfully deleted location: ". $data['timezone']." ".$data['latitude']." ".$data['longitude']];
            }
            else
            {
                return [ "success" => false, "error" => "Some error occurred, could not delete location: ". $data['timezone']." ".$data['latitude']." ".$data['longitude']];
            }
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

        public function addAddress(array $data)
        {
            $addSQL = "INSERT INTO addresses (location_id, language, street_number, street, country) VALUES (".$data['location_id'].",'".$data['language']."','"
            .$data['street_number']."','".$data['street']."','".$data['country']."')";

            $conn = $this->dbConnection;
            if ($conn->query($addSQL) === true)
            {
                return [ "success" => true, "message" => "Successfully added address: ". $data['street_number']." ".$data['street']." ".$data['country']];
            }
            else
            {
                return [ "success" => false, "error" => "Some error occurred, could not add address: ". $data['street_number']." ".$data['street']." ".$data['country']];
            }
        }
        
        public function modAddress(array $data)
        {
            $modSQL = "UPDATE addresses SET location_id=".$data['location_id'].", language='".$data['language']."', street_number='".$data['street_number']."',"
            ." street='".$data['street']."', country='".$data['country']."' WHERE id=".$data['id'];

            $conn = $this->dbConnection;
            if ($conn->query($modSQL) === true)
            {
                return [ "success" => true, "message" => "Successfully modified address: ". $data['street_number']." ".$data['street']." ".$data['country']];
            }
            else
            {
                return [ "success" => false, "error" => "Some error occurred, could not add address: ". $data['street_number']." ".$data['street']." ".$data['country']];
            }
        }
        
        public function delAddress(array $data)
        {
            $delSQL = "DELETE FROM addresses WHERE id=". $data['id'];

            $conn = $this->dbConnection;
            if ($conn->query($delSQL) === true)
            {
                return [ "success" => true, "message" => "Successfully deleted address: ". $data['street_number']." ".$data['street']." ".$data['country']];
            }
            else
            {
                return [ "success" => false, "error" => "Some error occurred, could not delete address: ". $data['street_number']." ".$data['street']." ".$data['country']];
            }
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

        public function addCourse(array $data)
        {
            $addSQL = "INSERT INTO sites (site_key, publisher_id, location_id, address_id) VALUES ('".$data['site_key']."',".$data['publisher_id'].","
            .$data['location_id'].",".$data['address_id'].")";

            $conn = $this->dbConnection;
            if ($conn->query($addSQL) === true)
            {
                return [ "success" => true, "message" => "Successfully added course: ". $data['site_key']];
            }
            else
            {
                return [ "success" => false, "error" => $conn->error];
            }
        }
        
        public function modCourse(array $data)
        {
            $modSQL = "UPDATE sites SET site_key='".$data['site_key']."', publisher_id=".$data['publisher_id'].", location_id=".$data['location_id'].", "
            ."address_id=".$data['address_id']." WHERE id=".$data['id'];

            $conn = $this->dbConnection;
            if ($conn->query($modSQL) === true)
            {
                return [ "success" => true, "message" => "Successfully modified course: ". $data['site_key']];
            }
            else
            {
                return [ "success" => false, "error" => $conn->error];
            }
        }

        public function delCourse(array $data)
        {
            $delSQL = "DELETE FROM sites WHERE id=".$data['id'];

            $conn = $this->dbConnection;
            if ($conn->query($delSQL) === true)
            {
                return [ "success" => true, "message" => "Successfully deleted course: ". $data['site_key']];
            }
            else
            {
                return [ "success" => false, "error" => $conn->error];
            }
        }

        public function populateSamples(array $post)
        {
            $conn = $this->dbConnection;
            $sqlSuccess = array();
            foreach($post['data'] as $row)
            {
                $debugFile = fopen("../debug.txt","a+");
                fwrite($debugFile,print_r($post['table'],true));
                fclose($debugFile);
                $data = array();
                $validKeys = array();
                $allKeys = array_keys($row);
                foreach($allKeys as $key)
                {
                    if ($row[$key] !== null)
                    {
                        if (gettype($row[$key]) == "string")
                        {
                            array_push($data, "\"".$row[$key]."\"");
                        }
                        else array_push($data, $row[$key]);
                        array_push($validKeys, $key);
                    }
                }
                $query = "INSERT INTO ". $post['table'] . "(" . join(", ",$validKeys) . ") VALUES (" . join(", ", $data).")";
                if ($conn->query($query) === true)
                {
                    $newRow = $conn->query("SELECT " . join(", ",$validKeys) . " FROM " . $post['table'] . " WHERE id = LAST_INSERT_ID()");

                    $debugFile = fopen("../debug.txt","a+");
                    fwrite($debugFile,print_r($newRow,true));
                    fwrite($debugFile,"\nQuery: " . "SELECT " . join(", ",$validKeys) . " FROM " . $post['table'] . " WHERE id = LAST_INSERT_ID()");
                    fwrite($debugFile,"\n======================================\n");
                    fclose($debugFile);
                    if (gettype($newRow) == "boolean")
                    {
                        $debugFile = fopen("../criticalError.txt","a+");
                        fwrite($debugFile,print_r($newRow,true));
                        fwrite($debugFile,"\nQuery: " . "SELECT " . join(", ",$validKeys) . " FROM " . $post['table'] . " WHERE id = LAST_INSERT_ID()");
                        fwrite($debugFile,"\n======================================\n");
                        fclose($debugFile);
                        $result = ["success" => false, "query" =>$query, "message" => $conn];
                    }
                    else
                    {
                        $temp = $newRow->fetch_assoc();
                        $result = ["success" => true, "query" =>$query, "Row" => $temp];
                    }
                    
                }
                else
                {
                    $result = ["success" => false, "query" =>$query, "message" => $conn->error];
                }
                array_push($sqlSuccess, $result);
            }
            return $sqlSuccess;
        }
    }
    $dbConn = Database::getInstance();
    if (isset($_POST['table']))
    {
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
    }
    else 
    {
        $post = json_decode(file_get_contents('php://input'), true);
        // $debugFile = fopen("../debug.txt","a+");
        // fwrite($debugFile,"======================================\n");
        // fwrite($debugFile,print_r($post['add'],true));
        // fwrite($debugFile,"\n======================================\n");
        // fclose($debugFile);
        $current = array();
        if (!isset($post['sample']))
        {
            if ($post['table'] === 'addresses')
            {
                if (isset($post['add'])) echo json_encode($dbConn->addAddress($post['add']));
                else if (isset($post['mod'])) echo json_encode($dbConn->modAddress($post['mod']));
                else if (isset($post['del'])) echo json_encode($dbConn->delAddress($post['del']));
            }
            if ($post['table'] === 'locations')
            {
                if (isset($post['add'])) echo json_encode($dbConn->addLocation($post['add']));
                else if (isset($post['mod'])) echo json_encode($dbConn->modLocation($post['mod']));
                else if (isset($post['del'])) echo json_encode($dbConn->delLocation($post['del']));
            }
            if ($post['table'] === 'courses')
            {
                if (isset($post['add'])) echo json_encode($dbConn->addCourse($post['add']));
                else if (isset($post['mod'])) echo json_encode($dbConn->modCourse($post['mod']));
                else if (isset($post['del'])) echo json_encode($dbConn->delCourse($post['del']));
            }
            if ($post['table'] === 'publishers')
            {
                
            }
        }
        else
        {
            // $debugFile = fopen("../debug.txt","a+");
            // fwrite($debugFile,"======================================\n");
            // fwrite($debugFile,print_r($post,true));
            // fwrite($debugFile,"\n======================================\n");
            // fclose($debugFile);
            //echo json_encode($post['data']);
            echo json_encode($dbConn->populateSamples($post));
        }

    }
?>