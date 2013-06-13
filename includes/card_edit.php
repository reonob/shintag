<?php
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/container.php';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/class.Ads.php';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/class.Images.php';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/class.CreateForm.php';

   $id = $_GET['ad_id'];
   $smarty->assign('ad_id', $id);

   $obj = Ads::Get_ad_from_id($id);
   
   if (empty($_SESSION) || ($_SESSION['email'] != $user->email)) {
      // header("Location: /includes/card.php?ad_id=" . $id);
   }
   if (isset($_POST['submit'])) {
      foreach($_POST as $key => $val) {
         if (array_key_exists($key, $obj->main_fields)) {
            $obj->main_fields[$key]->val = $val;
         } elseif (array_key_exists($key, $obj->sub_fields)) {
            $obj->sub_params[$key]->val = $val;
         }
      }
	  
      try {
         $obj->Update();
      } catch (Exception $e) {
         echo $e->getMessage();
      }
   }
   $ad_arr = $obj->Get_string();

   $smarty->assign('ad_arr', $ad_arr);
   $user = UserDB::findById($ad_arr['user_id']);

/*
   $smarty->assign('label_and_select_wheels_width', get_label_and_select($db, 'wheels_width', 'Ширина, см', true));
   $smarty->assign('label_and_select_wheels_radius', get_label_and_select($db, 'wheels_radius', 'Радиус, см', true));
   $smarty->assign('label_and_select_wheels_pcd', get_label_and_select($db, 'wheels_pcd', 'PCD', true));
   $smarty->assign('label_and_select_wheels_et', get_label_and_select($db, 'wheels_et', 'ET(Вылет)', true));
   $smarty->assign('label_and_select_wheels_type', get_label_and_select($db, 'wheels_type', 'Тип', true));
   $smarty->assign('label_and_select_wheels_state', get_label_and_select($db, 'product_state', 'Состояние', true, '', 'wheels_state'));
   $smarty->assign('label_and_select_wheels_year', get_label_and_select($db, 'years', 'Год', true, '', 'wheels_year'));
   $smarty->assign('label_and_select_wheels_brand', get_label_and_select($db, 'wheels_brand', 'Производитель', true, 'long'));

   $smarty->assign('label_and_select_accessories_state', get_label_and_select($db, 'product_state', 'Состояние', true, '', 'accessories_state'));
   */




   $images = $ImagesHandler->Select($id);
   $smarty->assign('images', $images);
   //$user_info = array('login' => $user->login);

   if ($ad_arr['ad_type'] == 1) {
      $smarty->assign('select_tyres_width', get_select_from_table($db, 'tyres_width', true, '', '', $ad_arr['tyres_width']));
      $smarty->assign('select_tyres_height', get_select_from_table($db, 'tyres_height', true, '', '', $ad_arr['tyres_height']));
      $smarty->assign('select_tyres_radius', get_select_from_table($db, 'tyres_radius', true, '', '', $ad_arr['tyres_radius']));
      $smarty->assign('label_and_select_tyres_season', get_label_and_select($db, 'tyres_season', 'Сезон*', true, '', '', '', $ad_arr['tyres_season']));
      $smarty->assign('label_and_select_tyres_brand', get_label_and_select($db, 'tyres_brand', 'Производитель*', true, 'long', '', '', $ad_arr['tyres_brand']));
      $smarty->assign('label_and_select_tyres_state', get_label_and_select($db, 'product_state', 'Состояние*', true, '', 'tyres_state', '', $ad_arr['tyres_state']));
      $smarty->assign('label_and_select_tyres_year', get_label_and_select($db, 'years', 'Год', true, '', 'tyres_year', '', $ad_arr['tyres_year']));
   }

   //$smarty->assign('user_info', $user_info);

   $smarty->display('card_edit.tpl');
?>