<!DOCTYPE HTML>
<html lang="ru">
<head>
	<title>{block name='title'}8cost{/block}</title>
	<meta charset="utf-8" />
	{include file='head.tpl'}
	{block name='links'}{/block}
</head>
<body>
	<div id="wrap">
		{include file='header.tpl'}
		<div id="main">
			<div id="center_block">
			{block name='div.main'}{/block}
			</div>
		</div>
	</div>
	{include file='footer.tpl'}
</body>
</html>