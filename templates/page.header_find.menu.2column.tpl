{extends file='page.header_find.menu.tpl'}
{block name='content_wrap'}
   {block name='top_part'}{/block}
   <aside{block name='left_column_attr'}{/block}>
      {block name='left_column'}{/block}
   </aside>
   <div id="column_center"{block name='center_column_attr'}{/block}>
      {block name='center_column'}{/block}
   </div>
   {block name='bottom_part'}{/block}
{/block}