<?php
   if (!$user->checkUser()) {
      header("Location: /includes/login.php");
   }
?>