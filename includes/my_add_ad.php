<?php
	require_once($_SERVER['DOCUMENT_ROOT'] . '/includes/container.php');
	//require_once($_SERVER['DOCUMENT_ROOT'] . '/includes/guardian.php');
	require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/class.CreateForm.php');
	$smarty->assign('select_tyres_width', get_select_from_table($db, 'tyres_width', true));
	$smarty->assign('select_tyres_height', get_select_from_table($db, 'tyres_height', true));
	$smarty->assign('select_tyres_radius', get_select_from_table($db, 'tyres_radius', true));
	$smarty->assign('label_and_select_tyres_season', get_label_and_select($db, 'tyres_season', 'Сезон', true));
	$smarty->assign('label_and_select_tyres_brand', get_label_and_select($db, 'tyres_brand', 'Производитель', true));
	$smarty->assign('label_and_select_tyres_state', get_label_and_select($db, 'product_state', 'Состояние', true, '', 'tyres_state'));
	$smarty->assign('label_and_select_tyres_year', get_label_and_select($db, 'years', 'Год', true, '', 'tyres_year'));
	$smarty->assign('step', $_GET['step']);
	$smarty->display('my_add_ad.tpl');
?>