<?php

   class DataHandling
   {
      public function validateForm($form_vars, $message = ERROR_FORM_FILL)
      {
         $result = true;
         foreach ($form_vars as $key => $value) {
            if (!isset($key) || empty($value)) {
               $result = false;
            }
         }
         if (!count($form_vars) || !$result) throw new Exception($message);
         return $this;
      }

      public function validateEmail($mail, $message = INCORRECT_MAIL)
      {
         if (!preg_match('/^[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$/', $mail)) {
            throw new Exception($message);
         }
         return $this;
      }

      public function validateLogin($login, $message = ERROR_LOGIN_LEN)
      {
         if (strlen($login) < LOGIN_LEN) throw new Exception($message);
         return $this;
      }

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