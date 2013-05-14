<?php
   session_start();

   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/settings.php';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/constants.php';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/class.DataHandling.php';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/smarty/libs/Smarty.class.php';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/lib/exception.inc';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/lib/encryption.inc';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/lib/cookie.inc';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/lib/userDB.inc';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/lib/reg_auth.inc';

   $data_h = new DataHandling();
   $smarty = new TSmarty();

   $smarty->force_compile = true;
   $smarty->assign('isLogin', Authentification::checkCredentials());
?>