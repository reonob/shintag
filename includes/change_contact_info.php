<?php
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/container.php';

   $isValidData = false;
   $result['result'] = true;
   try {
      $phone = trim($_POST['phone']);
      if (!empty($phone)) {
         $data_h->validatePhone($phone);
      }
      $isValidData = true;
      // $user = new UserDB($_SESSION['email']);
      $user             = new UserDB('abramin@mail.ru');
      $user->skype      = $_POST['skype'];
      $user->phone      = $phone;
      $user->other_info = $_POST['other_info'];
      $user->adress     = $_POST['adress'];
      $user->update();
   } catch (Exception $e) {
      $result['result'] = false;
      if (!$isValidData) {
         $result['message'] = $e->getMessage();
      }
   }
   echo json_encode($result);
?>