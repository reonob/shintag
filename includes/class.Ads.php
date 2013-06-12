<?php
   require_once 'connect.php';

   class Ads
   {
      public $table;
      public $sub_params;
      public $main_params;
      public $main_table = 'main_ads';
      public $id;
      public $validate_funcs = array();
      public $main_relations = array(
                        'name' => 'ad_name',
                        'text' => 'ad_text',
                        'date' => 'ad_date',
                        'time' => 'ad_time',
                        'mail' => 'ad_mail',
                        'contacts' => 'ad_contacts',
                        'reffer' => 'ad_reffer',
                        'ad_type' => 'ad_type',
                        'user_id' => 'user_id'
                     );

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

      public function Insert()
      {
         global $db;
         $this->id = $db->Insert( $this->main_table,
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
         return $this->id;
      }

      public function Select_from_id($ad_id)
      {
         global $db;
         $arr = $db->Select_from_id($this->main_table, $ad_id);

         foreach ($this->main_relations as $key => $val) {
            $this->main_params[$val] = $arr[$key];
         }

         $this->id = $ad_id;
      }

      public function Get_array_of_contacts()
      {
         return explode("\n", $this->main_params['ad_contacts']);
      }

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

      public static function Get_class_from_type($ad_type)
      {
         $array_classes = array(1 => 'Tyres_Ads', 2 => 'Wheels_Ads');
         return new $array_classes[$ad_type]();
      }

      public static function Get_ad_from_id($ad_id)
      {
         $obj = new Ads();
         $obj->Select_from_id($ad_id);
         $res = Ads::Get_class_from_type($obj->main_params['ad_type']);
         $res->main_params = $obj->main_params;
         $res->Select_from_id($res->main_params['ad_reffer']);
         unset($obj);
         return $res;
      }

      public function Get_string()
      {
         return array_merge($this->main_params, $this->sub_params);
      }

      public function Delete()
      {
         global $db;
         $db->Delete($table->main_table, $this->id);
      }

      public function Update() {
         global $db;
         $res_arr = array();
         foreach ($this->main_relations as $key => $val) {
            $res_arr[$key] = $this->main_params[$val];
         }
         $db->Update($this->main_table, $res_arr, $this->$id);
      }
   }



   class Tyres_Ads extends Ads
   {
      public $table = 'tyres_ads';
      public $sub_relations = array(
                        'width' => 'tyres_width',
                        'height' => 'tyres_height',
                        'radius' => 'tyres_radius',
                        'season' => 'tyres_season',
                        'year' => 'tyres_year',
                        'brand' => 'tyres_brand',
                        'state' => 'tyres_state',
                        'count' => 'tyres_count',
                        'price' => 'ad_price'
                     );

      public function __construct()
      {
         $this->sub_params = array('tyres_width' => 0,
                              'tyres_height' => 0,
                              'tyres_radius' => 0,
                              'tyres_season' => 0,
                              'tyres_year' => 0,
                              'tyres_brand' => 0,
                              'tyres_state' => 0,
                              'tyres_count' => 0,
                              'ad_price' => 0);
         parent::__construct();
         $this->validate_funcs = array('validatePrice', 'validateEmail', 'validateContacts', 'validateCount');
         $this->main_params['ad_type'] = 1;
      }

      protected function validatePrice()
      {
         global $data_h;
         $price = $this->sub_params['ad_price'];
         echo $price;
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
         if (intval($price) <= 0) {
            throw new Exception('Количество должно быть положительным');
         }
      }

      public function Insert()
      {
         global $db;
         $this->main_params['ad_reffer'] = $db->Insert(  $this->table,
                                             array('NULL',
                                                $this->sub_params['tyres_width'],
                                                $this->sub_params['tyres_height'],
                                                $this->sub_params['tyres_radius'],
                                                $this->sub_params['tyres_season'],
                                                $this->sub_params['tyres_year'],
                                                $this->sub_params['tyres_brand'],
                                                $this->sub_params['tyres_state'],
                                                $this->sub_params['tyres_count'],
                                                $this->sub_params['ad_price'])
                                           );
         return parent::Insert();
      }
      public function Select_from_id($ad_id) { //не вызывается напрямую
         global $db;
         $arr = $db->Select_from_id($this->table, $ad_id);
         //////??
         foreach ($this->sub_relations as $key => $val) {
            $this->sub_params[$val] = $arr[$key];
         }
      }

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

      public function Delete()
      {
         parent::Delete();
         global $db;
         $db->Delete($table->table, $this->main_params['ad_reffer']);
      }

      public function Update()
      {
         parent::Update();
         global $db;
         $res_arr = array();
         foreach ($this->sub_relations as $key => $val) {
            $res_arr[$key] = $this->sub_params[$val];
         }
         $db->Update($this->table, $res_arr, $this->main_params['ad_reffer']);
      }

   }

?>