$(function(){
	$('header nav ul li').each(function() {
		if ($(this).children().length > 1) {
			$(this).children('a').append('<div class="arrow"></div>').addClass('parent');
		}
	});
	$('#language_select ul li a').each(function() {
		$(this).append('<span>' + $(this).attr('data') + '</span>');
	});
	/*
	$('#show_dropdown').click(function() {
		if ($(this).hasClass('visible')) {
			$(this).removeClass('visible');
		} else {
			$(this).addClass('visible');
		}
	});
	*/
});