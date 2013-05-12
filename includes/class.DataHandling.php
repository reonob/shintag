<?php

   class DataHandling
   {
      public function isFilledOut($form_vars)
      {
         foreach ($form_vars as $key => $value) {
            if (!isset($key) || ($value == '')) {
               return false;
            }
         }
         return true;
      }

      public function isValidEmail($mail)
      {
         return preg_match('/^[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$/', $mail);
      }

      public function createEncryptPass($email, $pass, $salt)
      {

         return md5($salt.md5($pass.$salt).$email);
      }

      function unixToMySQL($timestamp)
      {
         return date('Y-m-d H:i:s', $timestamp);
      }

      public function createSalt($len = 7)
      {
         $pattern = "abcdefghiklmnopqrstvwxyzABCDEFGHIKLMNOPQRSTVWXYZ0123456789";
         $pattern_len = strlen($pattern);
         mt_srand((int) (microtime(true) * 0xFFFF));
         $salt = '';
         for ($i = 0; $i < $len; $i++) {
            $salt .= $pattern[mt_rand() % $pattern_len];
         }
         return $salt;
      }

   }
?>