<?php
	require_once($_SERVER['DOCUMENT_ROOT'] . '/includes/container.php');
	require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/class.Ads.php');
	require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/class.Images.php');
	
	$id = $_GET['ad_id'];
	$smarty->assign('ad_id', $id);
	
	$array_classes = array(1 => 'Tyres_Ads', 2 => 'Wheels_Ads');
	
	$type = get_type_of_ad($id);
	$obj = new $array_classes[$type]();
	$ad_arr = $obj->Select($id);
	$ad_arr['contacts'] = $obj->get_array_of_contacts($ad_arr['contacts']);
	$smarty->assign('ad_arr', $ad_arr);
	
	$images = $ImagesHandler->Select($id);
	$smarty->assign('images', $images);
	$smarty->assign('images_count', count($images));
	
	$user = new UserDB();
	$user = $user->findById($ad_arr['user_id']);
	$user_info = array('login' => $user->login);
	///////
	//$city = $db->query('SELECT c.name FROM city c WHERE c.id=?', array($user->city));
	//$user_info['city'] = $city;
	////
	$smarty->assign('user_info', $user_info);
	
	$info_arr = array();
	
	if ($ad_arr['ad_type'] == 1) {
		$info_arr = array(
			'Размер,см' => $obj->Width($ad_arr['width']) . ' / ' . $obj->Height($ad_arr['height']) . ' R ' . $obj->Radius($ad_arr['radius']),
			'Сезон' => $obj->Season($ad_arr['season']),
			'Производитель' => $obj->Brand($ad_arr['brand']),
			'Год' => $obj->Year($ad_arr['year']),
			'Состояние' => $obj->State($ad_arr['state']),
			'Количество' => $ad_arr['count']
		);
	}
	$smarty->assign('info_arr', $info_arr);
	
	$smarty->display('card.tpl');
?>