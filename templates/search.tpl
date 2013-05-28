{extends file='page.header_find.tpl'}
{block name='links'}
  <link href="/css/search.css" media="all" rel="stylesheet" />
  <link href="/css/prices_table.css" media="all" rel="stylesheet" />
  <link href="/css/aside.css" media="all" rel="stylesheet" />
  <link href="/css/top_head.css" media="all" rel="stylesheet" />
  <script src="/js/dropdown_blocks.js"></script>
  <script>
	$(function(){
		$('#categories > ul > li > a').addClass('after_arrow');
		$('.after_arrow').append('<span></span>');
		$('#categories a.after_arrow').click(function(){
			$(this).addClass('dropdown_head');
			$(this).siblings('ul').addClass('dropdown_block');
		});
	});
  </script>
{/block}
{block name='bottom'}
	{include file='catalog.tpl'}
{/block}