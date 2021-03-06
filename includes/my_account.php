<?php
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/container.php';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/class.CreateForm.php';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/guardian.php';
   
   include $_SERVER['DOCUMENT_ROOT'] . '/includes/catalog.php';
   
   //contact info
   $user = new UserDB($_SESSION['email']);
   //$user = new UserDB('abramin@mail.ru');
   $ci['email']      = $user->email;
   $ci['login']      = $user->login;
   $ci['skype']      = $user->skype;
   $ci['phone']      = $user->phone;
   $ci['other_info'] = $user->other_info;
   $ci['adress']     = $user->adress;
   $ci['city_id']    = $user->city_id;
   $ci['region_id']  = $user->region_id;
   $ci['country_id'] = $user->country_id;
   $ci['about']      = $user->about;

   $geo_locations = array(
                     'cities' => array(),
                     'countries' => array(),
                     'regions' => array());
   // $data = $db->query('SELECT id, city FROM cities');
   // foreach ($data as $row) {
      // $geo_locations['cities'][$row['id']] = $row['city'];
   // }
   // $data = $db->query('SELECT id, country FROM countries');
   // foreach ($data as $row) {
      // $geo_locations['countries'][$row['id']] = $row['country'];
   // }
   // $data = $db->query('SELECT id, region FROM regions');
   // foreach ($data as $row) {
      // $geo_locations['regions'][$row['id']] = $row['region'];
   // }

   $catalog = array('ad_type' => 1, 'ad_saler' => false, 'extend_block' => true, 'search_for_my' => true);
   $smarty->assign('catalog', $catalog);
   
   $smarty->assign('contact_info', $ci)
          ->assign('geo_locations', $geo_locations)
          ->display('my_account.tpl');
?>