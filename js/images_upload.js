$(function(){
	var $btnUpload = $('#upload_photo');
	var $status = $('#status_photo');
	new AjaxUpload($btnUpload, {
		action: '/includes/uploadfile.php',
		name: 'uploadfile',
		data: {ad_id: window.ad_id},
		onSubmit: function(file, ext){
			 if (! (ext && /^(jpg|png|jpeg|gif)$/.test(ext))) { 
				// extension is not allowed 
				$status.text('Поддерживаемые форматы JPG, PNG или GIF');
				return false;
			}
			$status.text('Загрузка...');
		},
		onComplete: function(file, response) {
			//On completion clear the status
			$status.text('');
			//Add uploaded file to list
			if(response != "error") {
				arr = response.split('@');
				file_name = arr[0];
				file_ext = arr[1];
				$.post("/includes/rename.php", {
					name: file_name,
					ext: file_ext
				}, function(data){
					$('#photos_div').append('<div class="in_image"><img src="' + data + '" /><button data="' + file_name + '">X</button></div>');
				});
			} else {
				alert('Файл не загружен ' + file);
			}
		}
	});
	$('#photos_div div.in_image button').live('click', function(){
		$button = $(this);
		$.post("/includes/image.Controller.php", {
			mode: 'delete_image',
			id: $button.attr('data')
		}, function() {
			$button.parent().empty().remove();
		});
	});
});