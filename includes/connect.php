<?php
   require_once($_SERVER['DOCUMENT_ROOT'] . '/includes/user_consts.php');

   class DBConnect {
		function DBConnect($db_dsn, $db_user, $db_pass) {	
			try {
				$this->link = new PDO($db_dsn, $db_user, $db_pass);
			} catch (PDOException $e) {
				die('Подключение не удалось: ' . $e->getMessage());
			}
			$this->link->exec("SET CHARACTER SET utf8");
		}
		public function exec($query, $params = array()) {
			$f = $this->query($query, $params);
		}
		public function query($query, $params = array()) {
			$st = $this->link->prepare($query);
			if (!$st->execute($params)) {
				throw new Exception(ERROR_QUERY);
			}
			return $st->fetchAll(PDO::FETCH_ASSOC);
		}
   }

   $db = new DBConnect(DB_dsn, DB_user, DB_pass);
?>