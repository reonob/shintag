<?php
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/container.php';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/class.Mail.php';

   class Activation
   {

      public static function activate($type, $hash)
      {
         switch ($type) {
            case 'activation': case 'forgotten_pass':
               self::_accountActivate($hash, $_GET['email']);
               break;

            case 'change_email':
               self::_changeEmail($hash);
               break;
         }
      }

      private static function _accountActivate($hash, $email)
      {
         $subj = isset($_GET['subj']) ? $_GET['subj'] : '';
         $_SESSION['isAdded'] = null;

         global $smarty;
         $smarty->assign('isGoMain', true);
         if ($subj == 'forgotten') {
            $smarty->assign('title', 'Восстановление пароля');
         } else {
            $smarty->assign('title', 'Активация аккаунта');
         }
         $user = UserDB::findByEmail($email);
         if (!$user->isExist || $user->verification) throw new Exception(ERROR_MAIL);
         if (time() - $user->register_date > CONFIRMATION_TERM) throw new Exception(ERROR_MAIL_CONFIRM_EXPIRED);

         $mail = new Mail();
         if($mail->compareUniqueSignature($hash, $email, $user->login, $user->password)) {
            $user->verification = true;
            $user->update();
            $cookie = new Cookie($email, $user->password);
            $cookie->set();
            $smarty->assign('isLogin', true);
         } else {
            throw new Exception($subj == 'forgotten' ? ERROR_FORGOTTEN_PASS : ERROR_MAIL);
         }

         if ($subj == 'forgotten') {
            $smarty->assign('successMsg', 'Новый пароль успешно сгенерирован.');
         } else {
            $smarty->assign('successMsg', 'Вы успешно зарегистрированы!');
         }
         $smarty->assign('isGoAcc', true);
      }

      private static function _changeEmail($hash)
      {
         global $smarty;
         $smarty->assign('title', 'Изменение e-mail');

         $oldEmail = $_GET['old_email'];
         $newEmail = $_GET['new_email'];

         $user = UserDB::findByEmail($oldEmail);
         if (!$user->isExist) throw new Exception(SEND_INCORRECT_MAIL);

         $mail = new Mail();
         if ($mail->compareUniqueSignature($hash, $newEmail, $user->login, $user->password)) {
            AuthorizedUser::changeEmail($oldEmail, $newEmail);
         } else {
            throw new Exception(ERROR_CHANGE_MAIL);
         }
         $smarty->assign('successMsg', 'E-mail успешно изменен.');
      }

   }
?>