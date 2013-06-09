<?php
	require_once 'connect.php';
	class Ads 
	{
		public $table;
		public $params_names;
		public $main_params;
		public $main_table = 'main_ads';
		
		public function __construct() 
		{
			$this->main_params = array('ad_name' => '',
									   'ad_text' => '',
									   'ad_date' => date('y-m-d'),
								       'ad_time' => 0,
									   'ad_mail' => '',
									   'ad_contacts' => '',
									   'ad_reffer' => 0,
									   'ad_type' => 0,
									   'user_id' => 0);
		}
		
		public function Insert_in_DB($table_name, $values) //первый параметр название таблицы 
		{
			global $db;
			$query = "INSERT INTO " . $table_name . " VALUES (" . str_repeat('?,', count($values)-1) . "?)";
			$db->exec($query, $values);
			return $db->link->lastInsertId();
		}
		
		public function Insert_in_main_table() 
		{									
			return $this->Insert_in_DB( $this->main_table, 
										array('NULL',
											  $this->main_params['ad_name'],
											  $this->main_params['ad_text'],
											  $this->main_params['ad_date'],
											  $this->main_params['ad_time'],
											  $this->main_params['ad_contacts'],
											  $this->main_params['ad_mail'],
											  $this->main_params['ad_reffer'],
											  $this->main_params['ad_type'],
											  $this->main_params['user_id'])
										);
		}
		
		public function Select_from_DB($table_name, $ad_id) 
		{
			global $db;
			$query = "SELECT * FROM " . $table_name . " WHERE " . $table_name . ".id = ?";
			$arr = $db->query($query, array($ad_id));
			
			return $arr[0];
		}
		
		public function Select_from_main_DB($ad_id)
		{
			return $this->Select_from_DB($this->main_table, $ad_id);
		}
		
		public function Insert_in_sub_table()
		{
		}
		
		public function Insert() 
		{
			$this->Insert_in_sub_table();
			return $this->Insert_in_main_table();
		}
		
		public function get_array_of_contacts($contacts) 
		{
			return explode("\n", $contacts);
		}
		
		public function State($id) 
		{
			$x = $this->Select_from_DB('product_state', $id);
			return $x['name'];
		}
		
		public function Year($id) 
		{
			$x = $this->Select_from_DB('years', $id);
			return $x['name'];
		}
	}
	
	function get_type_of_ad($ad_id) 
	{
		$obj = new Ads();
		$arr = $obj->Select_from_DB($obj->main_table, $ad_id);
		$type = $arr['ad_type'];
		unset($obj);
		return $type;
	}
	
	class Tyres_Ads extends Ads 
	{
		public $table = 'tyres_ads';
		
		public function __construct() 
		{
			$this->params_names = array('tyres_width' => 0, 
										'tyres_height' => 0, 
										'tyres_radius' => 0,
										'tyres_season' => 0, 
										'tyres_year' => 0, 
										'tyres_brand' => 0, 
										'tyres_state' => 0, 
										'tyres_count' => 0,
										'tyres_price' => 0);
			parent::__construct();
			$this->main_params['ad_type'] = 1;
		}
		
		public function Insert_in_sub_table() 
		{
			$this->main_params['ad_reffer'] = $this->Insert_in_DB(  $this->table,
																	array('NULL',
																		$this->params_names['tyres_width'],
																		$this->params_names['tyres_height'],
																		$this->params_names['tyres_radius'],
																		$this->params_names['tyres_season'],
																		$this->params_names['tyres_year'],
																		$this->params_names['tyres_brand'],
																		$this->params_names['tyres_state'],
																		$this->params_names['tyres_count'],
																		$this->params_names['tyres_price'])
																	);
			
			return $this->main_params['ad_reffer'];
		}
		public function Select($ad_id) {
			$ad_arr = $this->Select_from_main_DB($ad_id);
			$ad_sub_id = $ad_arr['reffer'];
			$ad_sub_arr = $this->Select_from_DB($this->table, $ad_sub_id);
			return array_merge($ad_arr, $ad_sub_arr);
		}
		
		public function Width($id) 
		{
			$x = $this->Select_from_DB('tyres_width', $id);
			return $x['name'];
		}
		
		public function Height($id) 
		{
			$x = $this->Select_from_DB('tyres_height', $id);
			return $x['name'];
		}
		
		public function Radius($id) 
		{
			$x = $this->Select_from_DB('tyres_radius', $id);
			return $x['name'];
		}
		
		public function Season($id) 
		{
			$x = $this->Select_from_DB('tyres_season', $id);
			return $x['name'];
		}
		
		public function Brand($id) {
			$x = $this->Select_from_DB('tyres_brand', $id);
			return $x['name'];
		}
	}
	
?>