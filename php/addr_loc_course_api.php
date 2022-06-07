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
                    $last_ID = $conn->insert_id;
                    $newRow = $conn->query("SELECT " . join(", ",$validKeys) . " FROM " . $post['table'] . " WHERE id = ". $last_ID);

                    if (gettype($newRow) == "boolean")
                    {
                        $result = ["success" => false, "query" =>"SELECT " . join(", ",$validKeys) . " FROM " . $post['table'] . " WHERE id = ". $last_ID, "message" => $conn];
                    }
                    else
                    {
                        $temp = $newRow->fetch_assoc();
                        $result = ["success" => true, "query" =>"SELECT " . join(", ",$validKeys) . " FROM " . $post['table'] . " WHERE id = ". $last_ID, "Row" => $temp];
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

        public function sampleScores(array $data)
        {
            $responseObject = [];
            $conn = $this->dbConnection;
            $debugFile = fopen("../debug.txt","a+");
            foreach ($data as $row)
            {
                $rid = $row['round_id'];
                $pid = $row['person_id'];
                $hid = $row['hole_id'];
                fwrite($debugFile,print_r($row,true));
                $result = $conn->query("SELECT MAX(stroke_no) as stroke_num FROM strokes WHERE person_id=".$pid." and hole_id=".$hid." and round_id=".$rid);
                $numStrokes = $result->fetch_assoc();
                $result = $conn->query("SELECT par FROM holes WHERE id=".$row['hole_id']);
                $par = $result->fetch_assoc();
                fwrite($debugFile,"Par(".gettype($par['par'])."): ". $par['par'].", strokes(".gettype($numStrokes['stroke_num'])."): ".$numStrokes['stroke_num']."\n");
                $netscore = ($numStrokes['stroke_num'] - $par['par']);
                $arr = ["person_id" => $pid, "round_id" => $rid, "hole_id" => $hid, "net_score" => $netscore, "stroke_count"=> intval($numStrokes['stroke_num']),
                "birdie" =>(($netscore === -1)?1:0), "eagle" =>(($netscore === -2)?1:0), "bogey" =>(($netscore === 1)?1:0), "double_bogey" =>(($netscore === 2)?1:0)];
                array_push($responseObject, $this->addScore($arr));
            }
            fclose($debugFile);
            return $responseObject;
        }
        public function addScore(array $data)
        {
            $conn = $this->dbConnection;
            $validKeys = array();
            $allKeys = array_keys($data);
            $attributes = [];
            foreach($allKeys as $key)
            {
                if ($data[$key] !== null)
                {
                    if (gettype($data[$key]) == "string")
                    {
                        array_push($attributes, "\"".$data[$key]."\"");
                    }
                    else array_push($attributes, $data[$key]);
                    array_push($validKeys, $key);
                }
            }

            $query = "INSERT INTO scores (" . join(", ",$validKeys) . ") VALUES (" . join(", ", $attributes).")";
            if ($conn->query($query) === true)
            {
                return ["success" => true, "query" =>$query, "Row" => $data];  
            }
            else
            {
                return ["success" => false, "query" =>$query, "message" => $conn->error];
            }
        }
        public function popSampleStats()
        {
            $conn = $this->dbConnection;
            $statsArr = [];

            $roundQuery = "SELECT * FROM rounds";
            $roundResult = $conn->query($roundQuery);
            while ($tempRound = $roundResult->fetch_assoc())
            {
                $personStatsQuery = "SELECT person_id, round_id, SUM(net_score) AS net, SUM(birdie) AS s_bird, SUM(eagle) AS s_eag, SUM(bogey) AS s_bog, SUM(double_bogey) AS s_d_bog"
                ." FROM scores WHERE round_id = ".$tempRound['id']." GROUP BY person_id ORDER BY net ASC";
                $tourQuery = "SELECT tour_id FROM events WHERE id = ".$tempRound['event_id'];
                $tourResult = $conn->query($tourQuery);
                $tourID = null;
                if ($tourResult->num_rows > 0)
                {
                    $tempTour = $tourResult->fetch_Assoc();
                    $tourID = $tempTour['tour_id'];
                }
                $personsResult = $conn->query($personStatsQuery);

                if ($personsResult->num_rows > 0)
                {   
                    $counter = 1;
                    while ($tempPerson = $personsResult->fetch_Assoc())
                    {
                        $maxDriveQuery = "SELECT MAX(distance) AS maxDrive FROM strokes WHERE person_id = ".$tempPerson['person_id']. " and round_id = ".$tempRound['id'];
                        $maxDriveResult = $conn->query($maxDriveQuery);
                        $maxDrive = $maxDriveResult->fetch_Assoc();
                        array_push($statsArr, ["entity_type"=>"rounds", "entity_id" => $tempRound['id'], "person_id"=> $tempPerson['person_id'],
                        "round_ind"=> true, "player_ind"=> true, "no_of_eagles" => $tempPerson['s_eag'], "no_of_birdies" => $tempPerson['s_bird'], "no_of_bogeys" => $tempPerson['s_bog'],
                        "no_of_double_bogeys" => $tempPerson['s_d_bog'], "max_drive" => $maxDrive['maxDrive'], "position" => $counter, "avg_net_score"=>(intval($tempPerson['net'])/18)]);
                        $counter++;
                    }
                }                
            }
            return $this->populateSamples(["table" =>"golf_statistics", "data" => $statsArr]);
            // fwrite($debugFile,"======================================\n");
            // fwrite($debugFile,print_r($statsArr,true));
            // fwrite($debugFile,"\n======================================\n");
            // fclose($debugFile);
            // return $statsArr;
            // $tourListQuery = "SELECT * FROM tours";
            // $result = $conn->query($tourListQuery);
            // while ($temp = $result->fetch_assoc()) // iterate through tours
            // {
            //     $tourStats = [];
            //     $eventList = [];
            //     $tourEventsQuery = "SELECT * FROM events where tour_id = ".$temp['id'];
            //     $eventResult = $conn->query($tourEventsQuery);
            //     while ($tempEvent = $eventResult->fetch_assoc()) // iterate through events that fall within those tours
            //     {
            //         $roundList = [];
            //         $roundsQuery = "SELECT * FROM rounds where event_id = ".$tempEvent['id'];
            //         $roundResult = $conn->query($roundsQuery);
            //         while ($tempRound = $roundResult->fetch_assoc()) // iterate through rounds within those events
            //         {
            //             $tourRoundStatsQuery = 
            //             push_array($tourRounds, $tempRound)
            //         }
            //         push_array($eventList, ["event" => $tempEvent, "rounds" => $roundList]);
            //     }
            //     push_array($tourListArr, ["tour" => $temp, "events" => $eventList]);
            // }

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
            $debugFile = fopen("../debug.txt","a+");
            fwrite($debugFile,"======================================\n");
            fwrite($debugFile,print_r($post,true));
            fwrite($debugFile,"\n======================================\n");
            fclose($debugFile);
            //echo json_encode($post['data']);
            if (isset($post['data']))
            {
                if ($post['table'] == "scores") echo json_encode($dbConn->sampleScores($post['data']));
                else echo json_encode($dbConn->populateSamples($post));
            }
            else 
            {   
                $returnArr = $dbConn->popSampleStats();

                $debugFile = fopen("../debug.txt","a+");
                fwrite($debugFile,"======================================\n");
                fwrite($debugFile,print_r($debugFile,true));
                fwrite($debugFile,"\n======================================\n");
                fclose($debugFile);

                echo json_encode($returnArr);
            }
        }

    }
?>