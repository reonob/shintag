<?php
	$uploaddir = 'uploads/'; 
	$path = $uploaddir . $_POST['name'] . $_POST['ext'];
	$im = imagecreatefromjpeg($path);
	$arr = getimagesize($path);
	$max = max($arr[0], $arr[1]);
	
	const BIG_SIZE = 400;
	const SMALL_SIZE = 130;
	
	if($max > BIG_SIZE) {
		if($arr[0] == $max) { //ширина
			$w = BIG_SIZE;
			$h = round(BIG_SIZE / $arr[0] * $arr[1]);
		} else {
			$h = BIG_SIZE;
			$w = round(BIG_SIZE / $arr[1] * $arr[0]);
		}
		$b_sm = imagecreatetruecolor($w, $h);
		$color1 = imagecolorallocate($b_sm, 255, 255, 255);
		imagefill($b_sm, 0, 0, $color1);
		imagecopyresampled($b_sm, $im, 0, 0, 0, 0, $w, $h, $arr[0], $arr[1]);
		$im = $b_sm;
		$arr[0] = $w; $arr[1] = $h;
		$max = BIG_SIZE;
	}
	$bg = imagecreatetruecolor($max, $max);
	$color1 = imagecolorallocate($bg, 255, 255, 255);
	imagefill($bg, 0, 0, $color1);
	$x = 0;
	$y = 0;
	if($arr[0] != $arr[1]) {
		if($arr[0] == $max) { //ширина
			$y = round(($max - $arr[1]) / 2);
		} else {
			$x = round(($max - $arr[0]) / 2);
		}
	}
	imagecopymerge($bg, $im, $x, $y, 0, 0, $arr[0], $arr[1], 100);
	$sm = imagecreatetruecolor(SMALL_SIZE, SMALL_SIZE);
	imagecopyresampled($sm, $bg, 0, 0, 0, 0, SMALL_SIZE, SMALL_SIZE, $max, $max);
	imagejpeg($bg, $path);
	imagejpeg($sm, $uploaddir . $_POST['name'] . '_s' . $_POST['ext']);
	echo $uploaddir . $_POST['name'] . '_s' . $_POST['ext'];
?>