<?php
include('kcaptcha.php');

session_start();

$captcha = new KCAPTCHA();

$log = fopen("captcha.log", "w");

fwrite($log, "here\n");
if($_REQUEST[session_name()])
{
   fwrite($log, "here2\n");
	$_SESSION['captcha_keystring'] = $captcha->getKeyString();
}

?>