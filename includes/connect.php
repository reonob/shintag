<?php
   require_once($_SERVER['DOCUMENT_ROOT'] . '/includes/user_consts.php');

   class DBConnect {
		public function DBConnect($db_dsn, $db_user, $db_pass)
		{
			try {
				$this->link = new PDO($db_dsn, $db_user, $db_pass);
			} catch (PDOException $e) {
				die('Подключение не удалось: ' . $e->getMessage());
			}
			$this->link->exec("SET CHARACTER SET utf8");
		}

		public function exec($query, $params = array())
		{
			$f = $this->query($query, $params);
		}

		public function query($query, $params = array())
		{
			$st = $this->link->prepare($query);
			if (!$st->execute($params)) {
				throw new Exception(ERROR_QUERY);
			}
			return $st->fetchAll(PDO::FETCH_ASSOC);
		}
		
		public function Insert($table_name, $values) //первый параметр название таблицы 
		{
			$query = "INSERT INTO " . $table_name . " VALUES (" . str_repeat('?,', count($values)-1) . "?)";
			$this->exec($query, $values);
			return $this->link->lastInsertId();
		}
		
		public function Select_from_ID($table_name, $id) 
		{
			$query = "SELECT * FROM " . $table_name . " WHERE " . $table_name . ".id = ?";
			$arr = $this->query($query, array($id));
			return $arr[0];
		}
		
		public function Update($table_name, $id, $arr) 
		{
			$set = array();
			foreach ($arr as $key => $val) {
				$set[] = $key . '=?';
			}
			$query = "UPDATE " . $table_name . " SET " . join(', ', $set) . " WHERE " . $table_name . ".id = ?";
			$arr = $this->query($query, array_merge(array_values($arr), array($id))); //послдений ? - id
		}
		
		public function Delete($table_name, $id) 
		{
			$query = "DELETE FROM " . $table_name . " WHERE " . $table_name . ".id = ?";
			$arr = $this->query($query, array($id));
		}
		
   }

   $db = new DBConnect(DB_dsn, DB_user, DB_pass);
?>