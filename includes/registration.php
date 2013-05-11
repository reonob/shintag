<?php
   require_once($_SERVER['DOCUMENT_ROOT'] . '/includes/container.php');
   require_once($_SERVER['DOCUMENT_ROOT'] . '/includes/connect.php');

   $isException = false;
   if (isset($_POST['submit'])) {
      $post   = array_map('trim', $_POST);
      $email  = strip_tags($post['email']);
      $login  = strip_tags($post['login']);
      $pass   = $post['pass'];
      $repass = $post['repass'];
      try {
         if ((!$data_h->isFilledOut($post))||(!$data_h->isValidEmail($email))
               ||($pass != $repass)||(strlen($pass) <= 5) || (strlen($login) < 5)) {
            // throw new Exception('Здесь ошибка, просто редирект на error.php закомментен');
            header("Location: /includes/error.php");
         }
         $user->register($login, $email, $pass);
         include_once($_SERVER['DOCUMENT_ROOT'] . '/includes/class.Mail.php');
         $mail = new Mail();
         $mail->sendActivationMail($email, $login);
         $_SESSION['isAdded'] = true;
         header("Location: /includes/registration.php");
      } catch (Exception $e) {
         $isException = true;
         $errorMsg = '<p style="font-weight: bold">'.$e->getMessage().'</p>';
      }
   }
   $smarty->assign('login', isset($login) ? $login : '');
   $smarty->assign('email', isset($email) ? $email : '');
   $smarty->assign('errorMsg', isset($errorMsg) ? $errorMsg : false);
   $smarty->assign('isAdded', isset($_SESSION['isAdded']) ? $_SESSION['isAdded'] : false);
   $smarty->display('registration.tpl');
?>