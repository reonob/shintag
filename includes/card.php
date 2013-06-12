<?php
	require_once($_SERVER['DOCUMENT_ROOT'] . '/includes/container.php');
	require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/class.Ads.php');
	require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/class.Images.php');
	
	$id = $_GET['ad_id'];
	$smarty->assign('ad_id', $id);

	$obj = Ads::Get_ad_from_id($id);
	$ad_arr = $obj->Get_string();
	$ad_arr['ad_contacts'] = $obj->Get_array_of_contacts();
	$smarty->assign('ad_arr', $ad_arr);
	
	$images = $ImagesHandler->Select($id);
	$smarty->assign('images', $images);
	$smarty->assign('images_count', count($images));
	
	$user = UserDB::findById($ad_arr['user_id']);
	$user_info = array('login' => $user->login);
	///////
	//$city = $db->query('SELECT c.name FROM city c WHERE c.id=?', array($user->city));
	//$user_info['city'] = $city;
	////
	$smarty->assign('user_info', $user_info);
	
	if ($ad_arr['ad_type'] == 1) {
		$info_arr = array(
			'Размер,см' => $obj->Width($ad_arr['tyres_width']) . ' / ' . $obj->Height($ad_arr['tyres_height']) . ' R ' . $obj->Radius($ad_arr['tyres_radius']),
			'Сезон' => $obj->Season($ad_arr['tyres_season']),
			'Производитель' => $obj->Brand($ad_arr['tyres_brand']),
			'Год' => $obj->Year($ad_arr['tyres_year']),
			'Состояние' => $obj->State($ad_arr['tyres_state']),
			'Количество' => $ad_arr['tyres_count']
		);
	}
	$smarty->assign('info_arr', $info_arr);
	
	$smarty->display('card.tpl');
?>