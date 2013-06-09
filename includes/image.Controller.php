<?php
	require_once($_SERVER['DOCUMENT_ROOT'] . '/includes/class.Images.php');
	switch ($_POST['mode']) {
		case 'delete_image':
			echo $ImagesHandler->Delete($_POST['id']);
			break;
	}
?>