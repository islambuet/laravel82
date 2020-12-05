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
        public static function isApiOffline()
        {
            return isset(self::$config['SITE_OFF_LINE'])&&(self::$config['SITE_OFF_LINE']==1)?true:false;
        }
    }
    