{extends file='page.header_find.menu.2column.tpl'}
{block name='title'}Мой аккаунт{/block}
{block name='links' append}
  <link href="/css/my_account.css" media="all" rel="stylesheet" />
  {include file='my_acc.links.tpl'}
{/block}
{block name='left_column_attr'} class="my_acc"{/block}
{block name='page_title'}Мой аккаунт{/block}
{block name='left_column' append}
  <section id="search_settings">
    <form id="search_simple_form" name="search_form">
      <label for="search_input">{block name='account_search_input'}{/block}</label>
      <input type="text" id="search_name" name="search_name" /><button class="search_find"></button>
    </form>
    <ul id="search_menu">
      <li><a href="#">Расширенный поиск</a></li>
    </ul>
  </section>
{/block}