<?php
	require_once($_SERVER['DOCUMENT_ROOT'] . '/includes/container.php');
	require_once($_SERVER['DOCUMENT_ROOT'] . '/includes/guardian.php');
	require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/class.CreateForm.php');
	require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/class.Ads.php');
	
	$smarty->assign('select_tyres_width', get_select_from_table($db, 'tyres_width', true));
	$smarty->assign('select_tyres_height', get_select_from_table($db, 'tyres_height', true));
	$smarty->assign('select_tyres_radius', get_select_from_table($db, 'tyres_radius', true));
	$smarty->assign('label_and_select_tyres_season', get_label_and_select($db, 'tyres_season', 'Сезон*', true));
	$smarty->assign('label_and_select_tyres_brand', get_label_and_select($db, 'tyres_brand', 'Производитель*', true));
	$smarty->assign('label_and_select_tyres_state', get_label_and_select($db, 'product_state', 'Состояние*', true, '', 'tyres_state'));
	$smarty->assign('label_and_select_tyres_year', get_label_and_select($db, 'years', 'Год', true, '', 'tyres_year'));
	
	$smarty->assign('label_and_select_wheels_width', get_label_and_select($db, 'wheels_width', 'Ширина, см', true));
	$smarty->assign('label_and_select_wheels_radius', get_label_and_select($db, 'wheels_radius', 'Радиус, см', true));
	$smarty->assign('label_and_select_wheels_pcd', get_label_and_select($db, 'wheels_pcd', 'PCD', true));
	$smarty->assign('label_and_select_wheels_et', get_label_and_select($db, 'wheels_et', 'ET(Вылет)', true));
	$smarty->assign('label_and_select_wheels_type', get_label_and_select($db, 'wheels_type', 'Тип', true));
	$smarty->assign('label_and_select_wheels_state', get_label_and_select($db, 'product_state', 'Состояние', true, '', 'wheels_state'));
	$smarty->assign('label_and_select_wheels_year', get_label_and_select($db, 'years', 'Год', true, '', 'wheels_year'));
	$smarty->assign('label_and_select_wheels_brand', get_label_and_select($db, 'wheels_brand', 'Производитель', true, 'long'));
	
	$smarty->assign('step', $_GET['step']);
	
	$array_classes = array(1 => 'Tyres_Ads', 2 => 'Wheels_Ads');
	if ($_GET['step'] == 2) {
		$smarty->assign('ad_type', $_POST['ad_category_main']);
		$_SESSION['ad_info'] = serialize( new $array_classes[$_POST['ad_category_main']]() );
	}
	if ($_GET['step'] == 3) {
		$obj = unserialize($_SESSION['ad_info']);
		foreach($_POST as $key => $val) {
			if (array_key_exists($key, $obj->params_names) && $val != 'unset') {
				$obj->params_names[$key] = $val;
			}
		}
		$_SESSION['ad_info'] = serialize($obj);
	}
	if ($_GET['step'] == 4) {
		$obj = unserialize($_SESSION['ad_info']);
		foreach($_POST as $key => $val) {
			if (array_key_exists($key, $obj->main_params)) {
				$obj->main_params[$key] = $val;
			}
		}
		
		$user = new UserDB($_SESSION['email']);
		$obj->main_params['user_id'] = $user->id;
		
		$ad_id = $obj->Insert();
		$smarty->assign('ad_id', $ad_id);
	}
	$smarty->display('my_add_ad.tpl');
?>