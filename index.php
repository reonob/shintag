<?php
	require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/container.php');
	require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/class.CreateForm.php');
	$smarty->assign('select_tyres_width', get_select_from_table($db_link, 'tyres_width'));
	$smarty->assign('select_tyres_height', get_select_from_table($db_link, 'tyres_height'));
	$smarty->assign('select_tyres_radius', get_select_from_table($db_link, 'tyres_radius'));
	$smarty->assign('label_and_select_tyres_type', get_label_and_select($db_link, 'tyres_type', 'Тип шины', 'long'));
	$smarty->assign('label_and_select_tyres_year', get_label_and_select($db_link, 'years', 'Год', '', 'tyres_year'));
	$smarty->assign('label_and_select_tyres_season', get_label_and_select($db_link, 'tyres_season', 'Сезон'));
	$smarty->assign('label_and_select_wheels_width', get_label_and_select($db_link, 'wheels_width', 'Ширина, см'));
	$smarty->assign('label_and_select_wheels_diameter', get_label_and_select($db_link, 'wheels_diameter', 'Диаметр, см'));
	$smarty->assign('label_and_select_wheels_binding', get_label_and_select($db_link, 'wheels_binding', 'Крепеж'));
	$smarty->assign('label_and_select_wheels_offset', get_label_and_select($db_link, 'wheels_offset', 'Вылет'));
	$smarty->display('index.tpl');
?>