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
                     $user->deleteAcc($_COOKIE['email']);
                     header("Location: /");
                     break;
                  case 'cancel':
                     header("Location: /includes/my_account.php");
                     break;
                  default:
                     break;
               }
            } else {
               if (!(count($post) && $data_h->isFilled_Out($post))) throw new Exception(ERROR_FORM_FILL);
               switch ($type) {
                  case 'change_login':
                     if (strlen($post['new_login']) >= 5) {
                        $user->changeLogin($post['new_login'], $_COOKIE['email']);
                        $smarty->assign('successMsg', 'Логин успешно изменен.');
                     } else {
                        throw new Exception('Логин должен быть длиннее 5 символов');
                     }
                     break;
                  case 'change_pass':
                     $new_pass = $post['new_pass'];
                     $rep_pass = $post['rep_pass'];
                     if ($new_pass != $rep_pass) throw new Exception(ERROR_OLD_NEW_PASS);
                     if (strlen($new_pass) <= 5) throw new Exception(ERROR_PASS_LEN);
                     $user->changePass($post['old_pass'], $new_pass, $_COOKIE['email']);
                     $smarty->assign('successMsg', 'Пароль успешно изменен.');
                     break;
                  case 'change_email':
                     $new_email = $_POST['new_mail'];
                     if (!$data_h->isValid_Email($new_email)) throw new Exception(ERROR_INVALID_EMAIL);
                     $mail->sendChangeMail($_COOKIE['email'], $new_email);
                     $smarty->assign('successMsg', 'Письмо отправлено.');
                     break;
                  case 'forgotten_pass':
                     $email = $post['mail'];
                     $result = $db_link->query('SELECT login FROM users WHERE email=?', [$email], true);
                     if (empty($result)) {
                        throw new Exception(INCORRECT_MAIL);
                     }
                     $pass = $user->forgottenPass($email);
                     $mail->sendForgottenPassMail($email, $result[0]['login'], $pass);
                     $smarty->assign('successMsg', 'Письмо отправлено.');
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