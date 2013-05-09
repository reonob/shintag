{extends file='page.header_find.tpl'}
{block name='div.main' append}
  {block name='page_title'}{/block}
  <div id="content_wrap">
    <aside class="{block name='left_column_class'}{/block}">
      {block name='left_column'}{/block}
    </aside>
    <div id="column_center"{block name='center_column_attr'}{/block}>
      {block name='center_column'}{/block}
    </div>
  </div>
{/block}
