<?php
	include $_SERVER['DOCUMENT_ROOT'] . '/includes/catalog.php';
	$catalog = array('ad_type' => 1, 'ad_saler' => true);
	$smarty->assign('catalog', $catalog);
	$smarty->display('search.tpl');
?>