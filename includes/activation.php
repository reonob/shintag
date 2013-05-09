<?php
   require_once($_SERVER['DOCUMENT_ROOT'] . '/includes/container.php');
   require_once($_SERVER['DOCUMENT_ROOT'] . '/includes/connect.php');
   require_once($_SERVER['DOCUMENT_ROOT'] . '/includes/class.Mail.php');

   $mail = new Mail();

   $isException = false;
   try {
      $hash = $_GET['hash'];
      $type = $_GET['type'];
      switch ($type) {
         case 'activation':
            $subj = !empty($_POST['subj']) ? $_POST['subj'] : '';
            $smarty->assign('isGoMain', true);
            $_SESSION['isAdded'] = null;
            if (empty($_GET['hash']) || empty($_GET['email'])) {
               header("Location: /includes/registration.php");
            }
            $email = $_GET['email'];
            $result = $db_link->query('SELECT login, password, UNIX_TIMESTAMP(register_date) as reg_date, salt
                                          FROM users WHERE email=? AND verification=?',
                                       array($email, false));
            if (count($result) == 0) throw new Exception(ERROR_MAIL);
            $login = $result[0]['login'];
            $pass  = $result[0]['password'];
            $time  = $result[0]['reg_date'];
            $salt  = $result[0]['salt'];
            if (time() - $time > CONFIRMATION_TERM) {
               throw new Exception(ERROR_MAIL_CONFIRM_EXPIRED);
            }

            if($mail->compareUniqueSignature($hash, $email, $login)) {
               $result = $db_link->query('UPDATE users SET password=sha1(?), verification=? WHERE email=?',
                                          array($pass, true, $email), false);
               // header('Refresh: 3; URL=/includes/my_account.php');
               $user->setUserCookie($email, $pass);
               $smarty->assign('isLogin', true);
            } else {
               throw new Exception($subj == 'forgotten' ? ERROR_FORGOTTEN_PASS : ERROR_MAIL);
            }
            if ($subj == 'forgotten') {
               $smarty->assign('title', 'Восстановление пароля');
               $smarty->assign('successMsg', 'Новый пароль успешно сгенерирован.');
            } else {
               $smarty->assign('title', 'Активация аккаунта');
               $smarty->assign('successMsg', 'Вы успешно зарегистрированы!');
            }
            $smarty->assign('isGoAcc', true);
            break;
         case 'change_email':
            $smarty->assign('title', 'Изменение e-mail');
            $old_email = $_GET['old_email'];
            $new_email = $_GET['new_email'];
            $result = $db_link->query('SELECT login FROM users WHERE email=?', [$old_email], true);
            if (!empty($result[0])) {
               $login = $result[0]['login'];
            } else {
               throw new Exception(SEND_INCORRECT_MAIL);
            }
            if ($mail->compareUniqueSignature($hash, $new_email, $login)) {
               $user->changeEmail($old_email, $new_email);
            } else {
               throw new Exception(ERROR_CHANGE_MAIL);
            }
            $smarty->assign('successMsg', 'E-mail успешно изменен.');
            break;
         case 'forgotten_pass':
            $smarty->assign('isGoMain', true);
            $email = $_GET['email'];
            $result = $db_link->query('SELECT login FROM users WHERE email=?', [$email], true);
            if (!empty($result[0])) {
               $login = $result[0]['login'];
            } else {
               throw new Exception(INCORRECT_MAIL);
            }
            if ($mail->compareUniqueSignature($hash, $email, $login)) {
               $user->forgottenPass($email);
            } else {
               throw new Exception(ERROR_FORGOTTEN_PASS);
            }
            $smarty->assign('isLogin', true);
            $smarty->assign('isGoAcc', true);
            break;
      }
   } catch (Exception $e) {
      $isException = true;
      $errorMsg = '<p style="font-weight: bold">'.$e->getMessage().'</p>';
   }
   $smarty->assign('isException', $isException);
   $smarty->assign('errorMsg', isset($errorMsg) ? $errorMsg : false);
   $smarty->display('activation.tpl');
?>