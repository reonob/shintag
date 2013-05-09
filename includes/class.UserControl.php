<?php
   require_once($_SERVER['DOCUMENT_ROOT'] . '/includes/connect.php');

   class userControl
   {

      private
         $data_h,
         $isRegisterUser = false;


      public function userControl()
      {
         $this->data_h = new dataHandling();
         // $this->is_register_user = $this->checkUser();
      }

      public function getIsRegisterUser()
      {
          return $this->checkUser();
      }

      public function register($login, $email, $password)
      {
         global $db_link;
         $result = $db_link->query('SELECT verification, UNIX_TIMESTAMP(register_date) as reg_date
                                    FROM users WHERE email=?',
                                    array($email));
         $salt = $this->data_h->createSalt();
         $pass = $this->data_h->createEncryptPass($email, $password, $salt);
         if (count($result) > 0) {
            //check if the user tried to register before time expires but confirmation e-mail
            $time = $result[0]['reg_date'];
            $verification = $result[0]['verification'];
            if ($verification) {
               throw new Exception(ERROR_MAIL_ALREADY_REGISTERED);
            }
            else {
               if (time() - $time > CONFIRMATION_TERM) {
                  $db_link->query('UPDATE users SET login=?, password=?, register_date=now(), salt=?
                                       WHERE email=?',
                                   array($login, $pass, $salt, $email),
                                   false);
               } else {
                  throw new Exception(ERROR_MAIL_CONFIRM);
               }
            }
         }
         else {
            $db_link->query('INSERT INTO users(email, login, password, verification, salt, register_date)
                                 VALUES (?, ?, ?, false, ?, now())',
                             array($email, $login, $pass, $salt),
                             false);
         }
      }

      private function registerSession($email)
      {
         $_SESSION['email'] = $email;
      }

      public function setUserCookie($email = null, $pass = null)
      {
         $time = time() + COOKIE_LIFETIME; //86400000 seconds in a 1000 days
         if (!empty($email)) setcookie('email', $email, $time, "/", COOKIE_SITE);
         if (!empty($pass))  setcookie('pass', $pass, $time, "/", COOKIE_SITE);
         $this->registerSession($email);
      }

      public function unregisterUser()
      {
         $_SESSION['email'] = null;
         if (isset($_COOKIE['email']) && isset($_COOKIE['pass'])) {
            $time = time() - 3600;
            setcookie('email', "", $time, "/", COOKIE_SITE);
            setcookie('pass', "", $time, "/", COOKIE_SITE);
            session_destroy();
         }
      }

      public function checkUser()
      {
         $result = true;
         if (empty($_SESSION['email'])) {
            if (!(empty($_COOKIE['email']) || empty($_COOKIE['pass']))) {
               global $db_link;
               $email = $_COOKIE['email'];
               $pass  = $_COOKIE['pass'];
               $result = $db_link->query('SELECT * FROM users WHERE email=? AND password=sha1(?)',
                                          array($email, $pass));
               if (count($result) > 0) {
                  $this->registerSession($email);
                  $result = true;
               } else {
                  $result = false;
               }
            } else {
               $result = false;
            }
         } else {
            $result = $this->data_h->isValid_Email($_SESSION['email']);
         }
         return $result;
      }

      public function login($email, $password)
      {
         global $db_link;
         $result = $db_link->query('SELECT salt FROM users WHERE email=?', array($email));
         if (count($result) > 0) {
            $salt = $result[0]['salt'];
            $pass = $this->data_h->createEncryptPass($email, $password, $salt);
            $result = $db_link->query('SELECT id FROM users WHERE email=?
                                          AND password=sha1(?) AND verification=?',
                                       array($email, $pass, true));
            if (count($result) > 0) {
               $this->setUserCookie($email, $pass);
            } else {
               throw new Exception(ERROR_LOGIN);
            }
         } else {
            throw new Exception(ERROR_LOGIN);
         }
      }

      public function changeLogin($new_login, $email)
      {
         global $db_link;
         $db_link->query('UPDATE users SET login = ? WHERE email = ?', [$new_login, $email], false);
      }

      public function changePass($old_pass, $new_pass, $email)
      {
         try {
            $this->login($email, $old_pass);
         } catch (Exception $e) {
            throw new Exception(ERROR_PASS);
         }
         global $db_link;
         $salt = $db_link->query('SELECT salt FROM users WHERE email=?', [$email], true)[0]['salt'];
         $pass = $this->data_h->createEncryptPass($email, $new_pass, $salt);
         $db_link->query('UPDATE users SET password=sha1(?) WHERE email=?', [$pass, $email], false);
         $this->setUserCookie($email, $pass);
      }

      public function forgottenPass($email)
      {
         global $db_link;
         $salt = $db_link->query('SELECT salt FROM users WHERE email=?', [$email], true)[0]['salt'];
         $pass = $this->data_h->createSalt(10);
         $new_pass = $this->data_h->createEncryptPass($email, $pass, $salt);
         $db_link->query('UPDATE users SET password=?, verification=?, register_date=now() WHERE email=?',
                         [$new_pass, false, $email],
                         false);
         return $pass;
      }

      public function changeEmail($old_email, $new_email)
      {
         global $db_link;
         $db_link->query('UPDATE users SET email=? WHERE email=?', [$new_email, $old_email]);
         $this->registerSession($new_email);
         $this->setUserCookie($new_email);
      }

      public function deleteAcc($email)
      {
         global $db_link;
         $db_link->query('DELETE FROM users WHERE email=?', [$email], false);
         $this->unregisterUser();
      }


      // public function CheckUserCookie($id)
      // {
      //    $db_link = db_connect();
      //    $result = $db_link->query("SELECT login FROM sessions_id WHERE id='$id'");
      //    if (!$result || $result->num_rows == 0)
      //    {
      //       return;
      //    }
      //    $result = $result->fetch_assoc();
      //    $login = $result['login'];
      //    $result = $db_link->query("SELECT username FROM user WHERE login='$login'");
      //    if (!$result || $result->num_rows == 0)
      //    {
      //       return;
      //    }
      //    $this->username = $login;
      //    $this->is_register_user = true;
      // }

   }

?>