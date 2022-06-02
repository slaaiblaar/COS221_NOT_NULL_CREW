<?php 
    error_reporting(E_ALL); //debugging purposes
    ini_set('display_errors', 1); //debugging purposes
    require_once "configDB.php";

    class Database {
        public static function instance() {
            static $instance = null; 
            if($instance === null)
                $instance = new Database();

            return $instance; 
        }

        function validateApi($apikey){
            $select = $GLOBALS['conn']->prepare("SELECT * FROM usersTBL WHERE user_API_key = ?");
            if (!$select){
                die($GLOBALS['conn']->errno. ' ' . $GLOBALS['conn']->error);
            }
            else{
                $select->bind_param('s', $apiKey);
                $select->execute();

                if ($select){
                    return true;
                }
                else{
                    return false;
                }
            }
        }
    }
    $instance = Database::instance();
?>