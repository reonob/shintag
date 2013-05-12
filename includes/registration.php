<?php
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/container.php';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/connect.php';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/class.Mail.php';

   $isException = false;
   if (isset($_POST['submit'])) {
      $post   = array_map('trim', $_POST);
      $email  = strip_tags($post['email']);
      $login  = strip_tags($post['login']);
      $pass   = $post['pass'];
      $repass = $post['repass'];
      try {
         $data_h->validateForm($post)
                ->validateEmail($email)
                ->validateLogin($login)
                ->validateRepeatPasswords($pass, $repass)
                ->validatePassword($pass);
         Registration::register($email, $pass, $login);
         $mail = new Mail();
         $mail->sendActivationMail($email, $login);
         $_SESSION['isAdded'] = true;
         header("Location: /includes/registration.php");
      } catch (Exception $e) {
         $isException = true;
         $errorMsg = '<p style="font-weight: bold">'.$e->getMessage().'</p>';
      }
   }
   $smarty->assign('login', isset($login) ? $login : '')
          ->assign('email', isset($email) ? $email : '')
          ->assign('errorMsg', isset($errorMsg) ? $errorMsg : false)
          ->assign('isAdded', isset($_SESSION['isAdded']) ? $_SESSION['isAdded'] : false)
          ->display('registration.tpl');
?>