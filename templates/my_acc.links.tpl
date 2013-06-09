<link href="/css/aside.css" media="all" rel="stylesheet" />
<link href="/css/prices.css" media="all" rel="stylesheet" />
<!--<link href="/css/share_button.css" media="all" rel="stylesheet" />-->
<!--<link href="/css/multiselect.css" media="all" rel="stylesheet" />-->
<link href="/css/top_head.css" media="all" rel="stylesheet" />
<!--<script src="/js/share_button.js"></script>-->
<script src="/js/jquery.ui.js"></script>
<script src="/js/jquery.multiselect.min.js"></script>
<script src="/js/dropdown_blocks.js"></script>
<script>
  $(function() {
    $('#categories > ul > li > a').addClass('after_arrow');
    $('.after_arrow').append('<span></span>');
    $('button.add, button.like').click(function() {
      $(this).toggleClass('active');
    });
    $("select[multiple=multiple]").each(function(){
      $(this).multiselect({
        minWidth: 200,
        selectedList: 1,
        selectedText:"# выбрано",
        noneSelectedText: "",
        checkAllText:"Выбрать все",
        uncheckAllText:"Сбросить",
        height: Math.min($(this).children('option').length * 30, 6 * 30)
      });
    });
  });
</script>