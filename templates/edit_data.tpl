{extends file='page.tpl'}
{block name='title'}
{/block}
{block name='links'}
  <link href="/css/edit_data.css" media="all" rel="stylesheet" />
  <link href="/css/edit_data_media-queries.css" rel="stylesheet" />
{/block}
{block name='div.main'}
  <div id="center_block">
  <form id="edit_data" action='/includes/edit_data.php?type={$type}' method='post'>
    {assign var='file' value="edit_data.$type.tpl"}
  	{include file="edit_data.$type.tpl"}
	</form>
  </div>
{/block}