<?php
	require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/container.php');
	require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/class.CreateForm.php');

	$smarty->assign('select_tyres_width', get_select_from_table($db, 'tyres_width', true));
	$smarty->assign('select_tyres_height', get_select_from_table($db, 'tyres_height', true));
	$smarty->assign('select_tyres_radius', get_select_from_table($db, 'tyres_radius', true));
	$smarty->assign('label_and_select_tyres_season', get_label_and_select($db, 'tyres_season', 'Сезон', true));
	$smarty->assign('label_and_select_tyres_state', get_label_and_select($db, 'product_state', 'Состояние', true, '', 'tyres_state'));
	$smarty->assign('label_and_select_tyres_year', get_label_and_select($db, 'years', 'Год', true, '', 'tyres_year'));

	$smarty->assign('label_and_select_wheels_width', get_label_and_select($db, 'wheels_width', 'Ширина, см', true));
	$smarty->assign('label_and_select_wheels_radius', get_label_and_select($db, 'wheels_radius', 'Радиус, см', true));
	$smarty->assign('label_and_select_wheels_pcd', get_label_and_select($db, 'wheels_pcd', 'PCD', true));
	$smarty->assign('label_and_select_wheels_et', get_label_and_select($db, 'wheels_et', 'ET(Вылет)', true));
	$smarty->assign('label_and_select_wheels_type', get_label_and_select($db, 'wheels_type', 'Тип', true));
	$smarty->assign('label_and_select_wheels_state', get_label_and_select($db, 'product_state', 'Состояние', true, '', 'wheels_state'));
	$smarty->assign('label_and_select_wheels_year', get_label_and_select($db, 'years', 'Год', true, '', 'wheels_year'));

	$smarty->assign('label_and_select_accessories_state', get_label_and_select($db, 'product_state', 'Состояние', true, '', 'accessories_state'));
	$smarty->display('index.tpl');
?>