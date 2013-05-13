<?php
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/connect.php';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/container.php';

   class UserDB
   {
      private $id;

      public $salt;
      public $email;
      public $login;
      public $password;
      public $verification;
      public $register_date;

      public $isExist = false;

      public static function findByEmail($email)
      {
         global $db;
         $data = $db->query('SELECT id FROM users WHERE email = ?', array($email));
         return new UserDB(!empty($data) ? $email : null);
      }

      function __construct($email = false)
      {
         if (!$email) return;
         global $db;
         $query = 'SELECT id, email, login, password, verification, salt,
                          UNIX_TIMESTAMP(register_date) as register_date
                   FROM users WHERE email = ?';
         $data = $db->query($query, array($email));
         $this->email = $email;
         $this->isExist = !empty($data);
         if (!$this->isExist) return;
         foreach ($data[0] as $attr => $value) {
            $this->$attr = $value;
            // echo $this->$attr."<br>";
         }
      }

      public function update()
      {
         global $db, $data_h;
         $query = 'UPDATE users SET email = ?, login = ?, password = ?,
                          verification = ?, salt = ?, register_date = ?
                  WHERE id = ?';
         $new_values = array($this->email, $this->login, $this->password, $this->verification,
                             $this->salt, $data_h->unixToMySQL($this->register_date), $this->id);
         $db->query($query, $new_values, false);
      }

      public function insert()
      {
         global $db, $data_h;
         $query = 'INSERT INTO users(email, login, password, verification, salt, register_date)
                   VALUES(?, ?, ?, ?, ?, ?)';
         $values = array($this->email, $this->login, $this->password, $this->verification,
                         $this->salt, $data_h->unixToMySQL($this->register_date));
         $data = $db->query($query, $values, false);
      }

      public function delete()
      {
         global $db;
         $query = 'DELETE FROM users WHERE id = ?';
         $data = $db->query($query, array($this->id));
      }

   }

?>