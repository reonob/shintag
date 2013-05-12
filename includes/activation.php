<?php
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/container.php';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/class.Activation.php';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/connect.php';


   if ((empty($_GET['hash']) || empty($_GET['email'])) && $_GET['type'] != 'change_email') {
      header("Location: /includes/registration.php");
   }

   if ($_GET['type'] == 'change_email' && (empty($_GET['hash']) || empty($_GET['old_email']) || empty($_GET['new_email']))) {
      header("Location: /includes/registration.php");
   }


   $isException = false;

   try {
      Activation::activate($_GET['type'], $_GET['hash']);
   } catch (Exception $e) {
      $isException = true;
      $errorMsg = '<p style="font-weight: bold">'.$e->getMessage().'</p>';
   }

   $smarty->assign('isException', $isException)
          ->assign('errorMsg', isset($errorMsg) ? $errorMsg : false)
          ->display('activation.tpl');
?>