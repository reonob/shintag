<?php

   class Mail
   {
      private $isLocalhost = true;

      public function setIsLocalhost($isLocalhost)
      {
          $this->isLocalhost = $isLocalhost;
      }

      public function getUniqueSignature($email, $login)
      {
         $parts = explode('@', $email);
         return base64_encode(md5($login.$parts[0].md5($_SERVER['REMOTE_ADDR'].$parts[1])));
      }

      public function compareUniqueSignature($hash, $email, $login)
      {
         return $hash == $this->getUniqueSignature($email, $login);
      }

      private function saveToFile($email, $subject, $message)
      {
         $filename = $email.'.txt';
         $file = fopen($_SERVER['DOCUMENT_ROOT'] . "/mails/$filename", "w");
         $letter =
                 "From: www.8cost.com\nSubject: $subject\nTo: $email\n\n$message";
         fwrite($file, $letter);
         fclose($file);
      }

      public function sendActivationMail($email, $login)
      {
         $date = time();
         $subject = "Активация аккаунта";
         $hash = $this->getUniqueSignature($email, $login);
         $message = '8cost.com/includes/activation.php?type=activation&hash=' . $hash . '&email=' . $email;
         $header = 'Content-type:text/html; charset = utf-8';
         if ($this->isLocalhost) {
            $this->saveToFile($email, $subject, $message);
         }
         else {
            mail($email, $subject, $message, $header);
         }
      }

      public function sendChangeMail($old_email, $new_email)
      {
         global $db_link;
         $date = time();
         $subject = "Подтвердение изменения e-mail.";
         $login = $db_link->query('SELECT login FROM users WHERE email=?', [$old_email], true)[0]['login'];
         $hash = $this->getUniqueSignature($new_email, $login);
         $message = '8cost.com/includes/activation.php?type=change_email&hash=' . $hash
                  . '&old_email=' . $old_email . '&new_email=' . $new_email;
         $header = 'Content-type:text/html; charset = utf-8';
         if ($this->isLocalhost) {
            $this->saveToFile($new_email, $subject, $message);
         }
         else {
            mail($new_email, $subject, $message, $header);
         }
      }

      public function sendForgottenPassMail($email, $login, $pass)
      {
         $date = time();
         $subject = "Смена e-mail";
         $hash = $this->getUniqueSignature($email, $login);
         $message =
            'New password:' . "$pass\n" . '8cost.com/includes/activation.php?type=activation&subj=forgotten&hash='
          . $hash . '&email=' . $email;
         $header = 'Content-type:text/html; charset = utf-8';
         if ($this->isLocalhost) {
            $this->saveToFile($email, $subject, $message);
         }
         else {
            mail($email, $subject, $message, $header);
         }
      }

   }
?>