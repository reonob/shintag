<?php
   if (!Authentification::checkCredentials()) {
      header("Location: /includes/login.php?originating_uri=".$_SERVER['REQUEST_URI']);
   }
?>