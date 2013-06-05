<?php
	include 'connect.php';
	class Ads {
		var $table;
		var $params_names;
		var $db_link;
		function Ads($db_link) {
			$this->db_link = $db_link;
		}
		function Insert() {
			$args = func_get_args();
			$query = "INSERT INTO " . $this->table . " VALUES (" . str_repeat('?,', count($args)-1) . "?)";
			echo $query;
			$this->db_link->exec($query, $args);
		}
	}

	class Tyres_Ads extends Ads {
		var $table = 'tyres_ads';
		var $params_names = array('id', 'name', 'width', 'height', 'radius', 'season', 'year', 'brand', 'state', 'count');
	}
	$ad = new Tyres_Ads($db);
	$ad->Insert('NULL', 'fdfdfdfdf', 1, 2, 5, 1, 6, 1, 1, 83);
?>