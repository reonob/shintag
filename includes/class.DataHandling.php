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

      public function validatePassword($pass, $message = ERROR_PASS_LEN)
      {
         if (strlen($pass) < PASS_LEN) throw new Exception($message);
         return $this;
      }

      public function validateRepeatPasswords($pass1, $pass2, $message = ERROR_OLD_NEW_PASS)
      {
         if ($pass1 != $pass2) throw new Exception($message);
         return $this;
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