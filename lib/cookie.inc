<?php
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/connect.php';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/lib/encryption.inc';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/lib/exception.inc';

   class Cookie
   {
      //cookie data
      public $email;
      public $pass;

      //cookie format info
      private static $glue = '|';
      private static $cookiepath   = '/';
      private static $expiration   = 86400000; //86400000 seconds in a 1000 days
      private static $cookiename   = 'USERAUTH';
      private static $cookiedomain = 'kolesa.su.com';


      function __construct($email = false, $pass = false)
      {
         if ($email) {
            $this->email = $email;
            $this->pass  = $pass;
         } else {
            if (array_key_exists(self::$cookiename, $_COOKIE)) {
               $this->_unpackage($_COOKIE[self::$cookiename]);
            } else {
               throw new CookieException();
            }
         }
      }

      public function getEmail()
      {
         return $this->email;
      }

      public function getPass()
      {
         return $this->pass;
      }

      public function set()
      {
         $cookie = $this->_package();
         $time = time() + self::$expiration;
         setcookie(self::$cookiename, $cookie, $time, self::$cookiepath, self::$cookiedomain);
      }

      public function remove()
      {
         setcookie(self::$cookiename, "", 0, self::$cookiepath, self::$cookiedomain);
      }

      public function validate()
      {
         $user = UserDB::findByEmail($this->email);
         if (!$user->isExist || $user->password != $this->pass) throw new CookieException();
      }

      private function _package()
      {
         $parts = array($this->email, $this->pass);
         $cookie = implode(self::$glue, $parts);
         return Encryption::encrypt($cookie);
      }

      private function _unpackage($cookie)
      {
         $buffer = Encryption::decrypt($cookie);
         list($this->email, $this->pass) = explode(self::$glue, $buffer);
      }

   }
?>