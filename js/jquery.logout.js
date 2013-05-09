$(function() {
   $('header nav.right ul li#logout a').click(function() {
      $.post("/includes/logout.php", {},
         function(data) {
            location.reload(true)
         }, "json");
      return false;
   }
   );
});