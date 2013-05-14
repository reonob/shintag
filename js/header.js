$(function(){
	$('header nav ul li').each(function() {
		if ($(this).children().length > 1) {
			$(this).children('a').append('<div class="arrow"></div>').addClass('parent');
		}
	});
   $('button#remind').click(function() {
   	location="/includes/edit_data.php?type=forgotten_pass";
      return false;
   });
	$('#language_select ul li a').each(function() {
		$(this).append('<span>' + $(this).attr('data') + '</span>');
	});
});