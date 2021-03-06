<?php
   require_once($_SERVER['DOCUMENT_ROOT'] . '/includes/container.php');
   require_once($_SERVER['DOCUMENT_ROOT'] . '/includes/connect.php');

   $fromUri = isset($_GET['originating_uri']) ? $_GET['originating_uri'] : '/includes/my_account.php';
   if (Authentification::checkCredentials()) {
      header("Location: /includes/my_account.php");
   }
   $isException = false;
   if (isset($_POST['submit'])) {
      $bool = isset($_SESSION['attempts']);
      $_SESSION['attempts'] = $bool ? $_SESSION['attempts'] + 1 : 1;
      $post = array_map("trim", $_POST);
      $email = $post['email'];
      $pass  = $post['pass'];
      try {
         //captcha checking
         if (isset($_SESSION['attempts']) && $_SESSION['attempts'] >= NUMBER_OF_LOGIN_ATTEMPTS) {
            $key_string = isset($_POST['keystring']) ? $_POST['keystring'] : '';
            $bool = isset($_SESSION['captcha_keystring']) && $_SESSION['captcha_keystring'] === $key_string;
            if ($bool) {
               $_SESSION['attempts'] = null;
            } elseif ($_SESSION['attempts'] > NUMBER_OF_LOGIN_ATTEMPTS) {
               throw new Exception(ERROR_CAPTCHA);
            }
         }
         $data_h->validateForm($post, ERROR_LOGIN)
                ->validateEmail($email, ERROR_LOGIN)
                ->validatePassword($pass, ERROR_LOGIN);
         AuthorizedUser::login($email, $pass);
         header("Location: $fromUri");
      } catch (Exception $e) {
         $isException = true;
         $errorMsg = '<p style="font-weight: bold">'.$e->getMessage().'</p>';
      }
   }
   if (isset($_SESSION['attempts']) && $_SESSION['attempts'] >= NUMBER_OF_LOGIN_ATTEMPTS) {
      $smarty->assign('hasCaptcha', 'true');
   }
   $smarty->assign('email', isset($email) ? $email : '')
          ->assign('fromUri', $fromUri)
          ->assign('captcha_img_url', '/kcaptcha/captcha.php?'.session_name().'='.session_id())
          ->assign('errorMsg', isset($errorMsg) ? $errorMsg : false)
          ->display('login.tpl');
   unset($_SESSION['captcha_keystring']);
?>
