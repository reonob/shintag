<?php
	$uploaddir = 'uploads/'; 
	preg_match('/(.*)(\..*)/', basename($_FILES['uploadfile']['name']), $arr);
	$ext = $arr[2];  
	$filetypes = array('.jpg','.gif','.bmp','.png','.JPG','.BMP','.GIF','.PNG','.jpeg','.JPEG');

	if(!in_array($ext, $filetypes)) {
		echo "error";
	} else {
		require_once($_SERVER['DOCUMENT_ROOT'] . '/includes/class.Images.php');
		$file = $ImagesHandler->Insert($_POST['ad_id']);
		if (move_uploaded_file($_FILES['uploadfile']['tmp_name'], $uploaddir . $file . $ext)) { 
			echo "$file@$ext"; 
		} else {
			echo "error";
		}
	}
?>