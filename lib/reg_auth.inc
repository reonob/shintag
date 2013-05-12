<?php
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/connect.php';

//------------class Authentification------------

   class Authentification
   {
      public static function checkCredentials()
      {
         $isAuth = true;
         if (empty($_SESSION['email'])) {
            try {
               $cookie = new Cookie();
               $cookie->validate();
               AuthorizedUser::authorize($cookie->getEmail(), $cookie->getPass());
            } catch (CookieException $e) {
               $isAuth = false;
            } catch (Exception $e) {
               $isAuth = false;
            }
         }
         return $isAuth;
      }

   }

//------------class Registration------------

   class Registration
   {
      public static function register($email, $password, $login)
      {
         global $db, $data_h;
         $user = new UserDB($email);

         $user->verification  = false;
         $user->login         = $login;
         $user->register_date = time();
         $user->salt          = Encryption::generateRandomString();
         $user->password      = Encryption::encryptPass($email, $password, $user->salt);

         if ($user->isExist) {
            //check if the user tried to register before time expires but confirmation e-mail
            $time = $user->register_date;
            $verification = $user->verification;
            if ($verification) {
               throw new Exception(ERROR_MAIL_ALREADY_REGISTERED);
            } else {
               if (time() - $time > CONFIRMATION_TERM) {
                  $user->update();
               } else {
                  throw new Exception(ERROR_MAIL_CONFIRM);
               }
            }
         } else {
            $user->insert();
         }
      }

   }

//------------class AuthorizedUser------------

   class AuthorizedUser
   {
      public static function login($email, $pass)
      {
         $user = UserDB::findByEmail($email);
         if (!$user->isExist) throw new Exception(ERROR_LOGIN);
         $encryptpass = Encryption::encryptPass($email, $pass, $user->salt);
         if ($encryptpass == $user->password) {
            self::authorize($email, $encryptpass, true);
         } else {
            throw new Exception(ERROR_LOGIN);
         }
      }

      public static function authorize($email, $pass, $isCookie = false)
      {
         $_SESSION['email'] = $email;
         if ($isCookie) {
            $cookie = new Cookie($email, $pass);
            $cookie->set();
         }
      }

      public static function unauthorized()
      {
         $_SESSION['email'] = null;
         try {
            $cookie = new Cookie();
            $cookie->remove();
         } catch (CookieException $e) {
            //
         }
         session_destroy();
      }

      public static function changeEmail($oldEmail, $newEmail)
      {
         $user = new UserDB($oldEmail);
         $user->email = $newEmail;
         $user->update();
         self::authorize($newEmail, $user->password, true);
      }

      public static function changeLogin($email, $newLogin)
      {
         global $data_h;
         $data_h->validateLogin($newLogin);

         $user = new UserDB($email);
         $user->login = $newLogin;
         $user->update();
      }

      public static function changePassword($email, $oldPass, $newPass)
      {
         global $data_h;
         $data_h->validatePassword($newPass);

         try {
            self::login($email, $oldPass);
         } catch (Exception $e) {
            throw new Exception(ERROR_PASS);
         }

         $user = new UserDB($email);
         $user->password = Encryption::encryptPass($email, $newPass, $user->salt);
         $user->update();

         self::authorize($email, $user->password, true);
      }

      public static function forgottenPassword($email)
      {
         $user = new UserDB($email);
         if (!$user->isExist) throw new Exception(INCORRECT_MAIL);
         global $data_h;
         $new_pass            = $data_h->createSalt(10);
         $user->password      = Encryption::encryptPass($email, $new_pass, $user->salt);
         $user->verification  = false;
         $user->register_date = time();
         $user->update();

         return $new_pass;
      }

      public static function deleteAccount($email)
      {
         $user = new UserDB($email);
         $user->delete();
         self::unauthorized();
      }

   }
?>