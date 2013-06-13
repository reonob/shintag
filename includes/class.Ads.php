<?php
   require_once 'connect.php';
   require_once 'class.Validate.php';
   
   class Field 
   {
	  public $table_name;
	  public $validate = array();
	  public $default_val;
	  public $val;
	  
	  public function __construct($table_name, $default_val, $validate = array())
	  {
		$this->table_name = $table_name;
		$this->default_val = $default_val;
		$this->validate = $validate;
	  }
	  
	  public function validate()
	  {
		foreach($this->validate as $sign) {
			Validate::$sign($this->val);
		}
	  }
   }
   
   
   class Ads
   {
      public $table;
      public $main_table = 'main_ads';
      public $id;
      //public $validate_funcs = array();
	  public $main_fields;
	  public $sub_fields;


      public function __construct()
      {
		 $this->main_fields = array(
			'ad_name' => new Field('name', '', array('is_Set')),
			'ad_text' => new Field('text', '', array('is_Set')),
			'ad_date' => new Field('date', date('y-m-d'), array('is_Set', 'is_Date')),
			'ad_time' => new Field('time', 0, array('is_Set')),
			'ad_mail' => new Field('mail', '', array('is_Set', 'is_Email')),
			'ad_contacts' => new Field('contacts', '', array('is_Set', 'is_Contacts')),
			'ad_reffer' => new Field('reffer', 0, array('is_Set')),
			'ad_type' => new Field('ad_type', 0, array('is_Set')),
			'user_id' => new Field('user_id', 0, array('is_Set'))
		 );
	  }
/*
      protected function validateContacts()
      {
         global $data_h;
         $this->main_params['ad_contacts'] = trim($this->main_params['ad_contacts']);
         $contacts = explode("\n", $this->main_params['ad_contacts']);
         foreach ($contacts as $phone) {
            $data_h->validatePhone($phone);
         }
      }

      protected function validateEmail()
      {
         global $data_h;
         $this->main_params['ad_mail'] = trim($this->main_params['ad_mail']);
         if (!empty($this->main_params['ad_mail'])) {
            $data_h->validateEmail($this->main_params['ad_mail']);
         }
      }

      public function validate()
      {
         foreach ($this->validate_funcs as $func) {
            $this->$func();
         }
      }
*/
      public function Insert()
      {
         global $db;
		 
		 $res = array();
		 foreach ($this->sub_fields as $name => $field) {
			$field->validate();
			$res[$field->table_name] = $field->val;
		 }
         $this->main_fields['ad_reffer']->val = $db->Insert( 
													  $this->table,
													  array_merge(array('id' => 'NULL'), $res)
												);
		 
		 $res = array();
		 foreach ($this->main_fields as $name => $field) {
			$field->validate();
			$res[$field->table_name] = $field->val;
		 }
         $this->id = $db->Insert( 
								  $this->main_table,
								  array_merge(array('id' => 'NULL'), $res)
								);
         return $this->id;
      }

      public function Select_from_id($ad_id)
      {
         global $db;
         $arr = $db->Select_from_id($this->main_table, $ad_id);

         foreach ($this->main_fields as $name => $field) {
            $this->main_fields[$name]->val = $arr[$field->table_name];
			//$field->val = $arr[$field->table_name];
         }
         $this->id = $ad_id;
      }

      public function Get_array_of_contacts()
      {
         return explode("\n", $this->main_fields['ad_contacts']->val);
      }
	////подумать
      public static function State($id)
      {
         global $db;
         $t = $db->Select_from_id('product_state', $id);
         return $t['name'];
      }

      public static function Year($id)
      {
         global $db;
         $t = $db->Select_from_id('years', $id);
         return $t['name'];
      }
///////////
      public static function Get_class_from_type($ad_type)
      {
         $array_classes = array(1 => 'Tyres_Ads', 2 => 'Wheels_Ads');
         return new $array_classes[$ad_type]();
      }

      public static function Get_ad_from_id($ad_id)
      {
         $obj = new Ads();
         $obj->Select_from_id($ad_id);
		 ////подумать
         $res = Ads::Get_class_from_type($obj->main_fields['ad_type']->val);
         $res->main_fields = $obj->main_fields;
		 $res->id = $obj->id;
         $res->Select_from_id($res->main_fields['ad_reffer']->val);
         unset($obj);
         return $res;
      }

      public function Get_string()
      {
		 $res = array();
		 foreach ($this->main_fields as $name => $field) {
			$res[$name] = $field->val;
		 }
		 foreach ($this->sub_fields as $name => $field) {
			$res[$name] = $field->val;
		 }
		 //результирующий массив имеет ключи такие же как в классе и в формах - не такие как имена в таблице
         return $res;
      }

      public function Delete()
      {
         global $db;
         $db->Delete($table->main_table, $this->id);
      }

      public function Update() {
         global $db;
         $res = array();
         foreach ($this->main_fields as $name => $field) {
			$field->validate();
            $res[$field->table_name] = $field->$val;
         }
         $db->Update($this->main_table, $this->id, $res);
      }
   }



   class Tyres_Ads extends Ads
   {
      public $table = 'tyres_ads';
      
      public function __construct()
      {
         parent::__construct();
		 $this->sub_fields = array(
			'tyres_width' => new Field('width', 0, array('is_Set')),
			'tyres_height' => new Field('height', 0, array('is_Set')),
			'tyres_radius' => new Field('radius', 0, array('is_Set')),
			'tyres_season' => new Field('season', 0, array('is_Set')),
			'tyres_year' => new Field('year', 'NULL'),
			'tyres_brand' => new Field('brand', 0, array('is_Set')),
			'tyres_state' => new Field('state', 0, array('is_Set')),
			'tyres_count' => new Field('count', 0, array('is_Set', 'is_Numeric')),
			'ad_price' => new Field('price', 0, array('is_Set', 'is_Numeric'))
		 );
         //$this->validate_funcs = array('validatePrice', 'validateEmail', 'validateContacts', 'validateCount');
         $this->main_fields['ad_type']->val = 1;
      }
/*
      protected function validatePrice()
      {
         global $data_h;
         $price = $this->sub_params['ad_price'];
         $data_h->validateNum($price, 'Неверно введена цена');
         if (intval($price) <= 0) {
            throw new Exception('Цена должна быть положительной');
         }
      }

      protected function validateCount()
      {
         global $data_h;
         $count = $this->sub_params['tyres_count'];
         $data_h->validateNum($count, 'Неверно введено количество');
         if (intval($count) <= 0) {
            throw new Exception('Количество должно быть положительным');
         }
      }
*/
      public function Select_from_id($ad_id) { //не вызывается напрямую
         global $db;
		 
         $arr = $db->Select_from_id($this->table, $ad_id);
         //////??
		 foreach ($this->sub_fields as $name => $field) {
            $this->sub_fields[$name]->val = $arr[$field->table_name];
			//$field->val = $arr[$field->table_name];
         }
      }
///////
      public static function Width($id)
      {
         global $db;
         $t = $db->Select_from_id('tyres_width', $id);
         return $t['name'];
      }

      public static function Height($id)
      {
         global $db;
         $t = $db->Select_from_id('tyres_height', $id);
         return $t['name'];
      }

      public static function Radius($id)
      {
         global $db;
         $t = $db->Select_from_id('tyres_radius', $id);
         return $t['name'];
      }

      public static function Season($id)
      {
         global $db;
         $t = $db->Select_from_id('tyres_season', $id);
         return $t['name'];
      }

      public static function Brand($id)
      {
         global $db;
         $t = $db->Select_from_id('tyres_brand', $id);
         return $t['name'];
      }
/////////
      public function Delete()
      {
         parent::Delete();
         global $db;
         $db->Delete($table->table, $this->main_fields['ad_reffer']->val);
      }

      public function Update()
      {
         parent::Update();
         global $db;
         $res = array();
         foreach ($this->sub_fields as $name => $field) {
			$field->validate();
            $res[$field->table_name] = $field->$val;
         }
         $db->Update($this->table, $this->main_fields['ad_reffer']->val, $res);
      }

   }

?>