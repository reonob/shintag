<?php
   session_start();

   require_once($_SERVER['DOCUMENT_ROOT'] . '/includes/settings.php');
   require_once($_SERVER['DOCUMENT_ROOT'] . '/includes/constants.php');
   require_once($_SERVER['DOCUMENT_ROOT'] . '/includes/class.DataHandling.php');
   require_once($_SERVER['DOCUMENT_ROOT'] . '/includes/class.UserControl.php');
   require_once($_SERVER['DOCUMENT_ROOT'] . '/includes/smarty/libs/Smarty.class.php');

   $user   = new UserControl();
   $data_h = new dataHandling();
   $smarty = new TSmarty();

   $smarty->force_compile = true;
   $smarty->assign('isLogin', $user->checkUser());
?>