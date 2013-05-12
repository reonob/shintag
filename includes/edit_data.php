<?php
   require_once($_SERVER['DOCUMENT_ROOT'] . '/includes/container.php');
   require_once($_SERVER['DOCUMENT_ROOT'] . '/includes/connect.php');
   require_once($_SERVER['DOCUMENT_ROOT'] . '/includes/class.Mail.php');

   $mail = new Mail();
   $type = $_GET['type'];

   if ($type != 'forgotten_pass') {
      require_once($_SERVER['DOCUMENT_ROOT'] . '/includes/guardian.php');
   }

   $possible_types = array('edit_contact_data', 'delete_acc', 'change_login', 'change_pass', 'change_email', 'forgotten_pass');
   if (!array_search($type, $possible_types)) header("Location: /");

   if ($type == 'edit_contact_data') {
      #some code
   } else {
      try {
         $smarty->assign('type', $type);
         $msg = '';
         $post = array_map('trim', $_POST);
         if (!empty($post['submit'])) {
            if ($type == 'delete_acc') {
               switch ($post['submit']) {
                  case 'delete':
                     AuthorizedUser::deleteAccount($_SESSION['email']);
                     header("Location: /");
                     break;
                  case 'cancel':
                     header("Location: /includes/my_account.php");
                     break;
                  default:
                     break;
               }
            } else {
               $data_h->validateForm($post);
               switch ($type) {
                  case 'change_login':
                     AuthorizedUser::changeLogin($_SESSION['email'], $post['new_login']);
                     $smarty->assign('successMsg', 'Логин успешно изменен.');
                     break;
                  case 'change_pass':
                     if ($post['new_pass'] != $post['rep_pass']) throw new Exception(ERROR_OLD_NEW_PASS);
                     AuthorizedUser::changePassword($_SESSION['email'], $post['old_pass'], $post['new_pass']);
                     $smarty->assign('successMsg', 'Пароль успешно изменен.');
                     break;
                  case 'change_email':
                     $new_email = $_POST['new_mail'];
                     $data_h->validateEmail($new_email, ERROR_INVALID_EMAIL);
                     $user = new UserDB($new_email);
                     if ($user->isExist) throw new Exception(ERROR_MAIL_ALREADY_REGISTERED);
                     $mail->sendChangeMail($_SESSION['email'], $new_email);
                     $smarty->assign('successMsg', 'Письмо отправлено.');
                     break;
                  case 'forgotten_pass':
                     $new_pass = AuthorizedUser::forgottenPassword($post['email']);
                     $mail->sendForgottenPassMail($post['email'], $new_pass);
                     $_SESSION['isAdded'] = true;
                     break;
                  default:
                     header('Location: /');
                     break;
               }
            }
         }
      } catch (Exception $e) {
         $smarty->assign('errorMsg', $e->getMessage());
      }
      $smarty->display('edit_data.tpl');
   }
?>