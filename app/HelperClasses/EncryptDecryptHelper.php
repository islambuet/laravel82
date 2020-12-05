<?php
    namespace App\HelperClasses;  
    use Illuminate\Support\Str;  
    class EncryptDecryptHelper
    {
        public static $ENCRYPTED_DECRYPTED_METHOD="AES-128-ECB";
        public static $ENCRYPTED_DECRYPTED_KEY="Sh@iful123";

        
        public static function getEncrypt($string)
        {
            return openssl_encrypt($string,self::$ENCRYPTED_DECRYPTED_METHOD,self::$ENCRYPTED_DECRYPTED_KEY);
        }
        public static function getDecrypt($string)
        {
            return openssl_decrypt($string,self::$ENCRYPTED_DECRYPTED_METHOD,self::$ENCRYPTED_DECRYPTED_KEY);
        }
        public static function getUserApiToken($userId)
        {
            return self::getEncrypt($userId.'_'.time().'_'.Str::random(30));
        }
    }
    