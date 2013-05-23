<?php
   class Mail
   {
      private $site = 'kolesa.su.com';
      private $activation_url = '/includes/activation.php';
      private $isLocalhost = false;

      public function setIsLocalhost($isLocalhost)
      {
          $this->isLocalhost = $isLocalhost;
      }

      public function getUniqueSignature($email, $login, $pass)
      {
         $parts = explode('@', $email);
         return base64_encode(md5(md5($parts[1].$login.$parts[0])).$pass);
      }

      public function compareUniqueSignature($hash, $email, $login, $pass)
      {
         return $hash == $this->getUniqueSignature($email, $login, $pass);
      }

      private function saveToFile($email, $subject, $message)
      {
         $filename = $email.'.txt';
         $file = fopen($_SERVER['DOCUMENT_ROOT'] . "/mails/$filename", "w");
         $letter =
                 "From: $this->site\nSubject: $subject\nTo: $email\n\n$message";
         fwrite($file, $letter);
         fclose($file);
      }

      public function sendActivationMail($email)
      {
         $user = new UserDB($email);
         $hash = $this->getUniqueSignature($email, $user->login, $user->password);

         $date = time();
         $subject = "Активация аккаунта";
         $message = $this->site.$this->activation_url.'?type=activation&hash='.$hash.'&email='.$email;
         $header = 'Content-type:text/html; charset = utf-8';

         if ($this->isLocalhost) {
            $this->saveToFile($email, $subject, $message);
         } else {
            mail($email, $subject, $message, $header);
         }
      }

      public function sendChangeMail($oldEmail, $newEmail)
      {
         $user = new UserDB($oldEmail);
         $hash = $this->getUniqueSignature($newEmail, $user->login, $user->password);

         $date = time();
         $subject = "Подтверждение изменения e-mail.";
         $message = $this->site.$this->activation_url.'?type=change_email&hash='.$hash
                   .'&old_email='.$oldEmail.'&new_email='.$newEmail;
         $header = 'Content-type:text/html; charset = utf-8';

         if ($this->isLocalhost) {
            $this->saveToFile($newEmail, $subject, $message);
         } else {
            mail($newEmail, $subject, $message, $header);
         }
      }

      public function sendForgottenPassMail($email, $pass)
      {
         $user = new UserDB($email);
         $hash = $this->getUniqueSignature($email, $user->login, $user->password);
         $date = time();
         $subject = "Забыли пароль";
         $message =
            'New password:'."$pass\n".$this->site.$this->activation_url.'?type=activation&subj=forgotten&hash='
           .$hash.'&email='.$email;
         $header = 'Content-type:text/html; charset = utf-8';
         if ($this->isLocalhost) {
            $this->saveToFile($email, $subject, $message);
         } else {
            mail($email, $subject, $message, $header);
         }
      }

   }
?>