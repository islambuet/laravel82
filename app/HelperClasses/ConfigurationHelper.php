<?php
    namespace App\HelperClasses;
    use App\Models\SystemConfiguration;
    class ConfigurationHelper
    {
        public static $config = array();
        public static function load_config()
        {
            $results = SystemConfiguration::where('status', 'Active')
                                            ->get();
            
            foreach($results as $result){
                self::$config[$result->purpose]=$result->config_value;
            }
        }
    }
    