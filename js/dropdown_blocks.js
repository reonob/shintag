$(function(){
	$('.dropdown_head').live('click', function() {
		$head = $(this);
		if ($head.hasClass('active')) {
			$head.siblings('.dropdown_block').stop(true, true).slideUp('slow');
		} else {
			$head.siblings('.dropdown_block').stop(true, true).slideDown('slow');
		}
		$head.toggleClass('active');
	});
});