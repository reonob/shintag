<?php
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/settings.php';

   class DBConnect
   {

      private $link;

      function __construct()
      {
         global $settings;
         $this->link = new PDO('mysql:host='.$settings->db->host.';dbname='.$settings->db->database,
                               $settings->db->user,
                               $settings->db->password);
         $this->link->exec("SET CHARACTER SET utf8");
      }

      private function bindParams(&$h, $cols, $vals)
      {
         foreach ($cols as $k => $v) {
            $h->bindValue(":$v", $vals[$v]);
         }
      }

      public function query($query, $params = array(), $getResult = true)
      {
         $st = $this->link->prepare($query);
         if (!$st->execute($params)) {
            throw new Exception(ERROR_QUERY);
         }
         if ($getResult) {
            return $st->fetchAll(PDO::FETCH_ASSOC);
         }
      }

   }

   $db = new DBConnect();
   $db_link = new DBConnect();
?>