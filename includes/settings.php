<?php
   define('SMARTY_DIR', $_SERVER['DOCUMENT_ROOT'] . '/includes/smarty/libs/');
   require_once SMARTY_DIR . 'Smarty.class.php' ;

   class TSmarty extends Smarty
   {

      function __construct()
      {
         $dir = $_SERVER['DOCUMENT_ROOT'] . '/';

         parent::__construct();

         $this->setTemplateDir($dir.'templates/');
         $this->setCompileDir($dir.'templates_c/');
         $this->setConfigDir($dir.'configs/');
         $this->setCacheDir($dir.'cache/');

         // $this->caching = Smarty::CACHING_LIFETIME_CURRENT;
         $this->assign('app_name', '8cost');
      }
   }

   class DBSettings
   {
      public $host = "localhost";
      public $user = "";
      public $password = "";
      public $database = "8cost";
      public $encode = "utf8";
   }

   class Settings
   {
      public $db;

      function __construct()
      {
         $this->db = new DBSettings();
      }
   }

   $settings = new Settings();
?>