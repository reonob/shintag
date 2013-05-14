<?php
	$str = 'Литой Штампованный Кованый Оригинальный';
	$table_name = 'wheels_type';
	$str_arr = explode(' ', $str);
	foreach($str_arr as $i) {
	//for ($i = -48; $i < 53; $i++) {
		echo "INSERT INTO " . $table_name . " (id, name) VALUES(NULL, '" . $i . "');<br/>";
	}
?>