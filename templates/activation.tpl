{extends file='page.tpl'}
{block name='title'}{$title}{/block}
{block name='links'}
  <link href="/css/welcome.css" media="all" rel="stylesheet" />
  <link href="/css/welcome_media-queries.css" rel="stylesheet" />
{/block}
{block name='div.main'}
  <div id="center_block">
    <h1 style='font-size: 260%;'>{$title|default}</h1>
     {if isset($isException) && $isException}
        {$errorMsg|default:''}
        {if $isGoMain|default:false}<a href="/">На главную</a>{/if}
     {/if}
    <p style="font-weight: bold">{$successMsg|default:''}</p>
    {$successComment|default:''}
    {if $isGoAcc|default:false}
      <p style="font-weight: bold">
        <a href="/includes/my_account.php">Теперь вы можете перейти на страницу своего акаунта</a>
      </p>
    {/if}
    <h2>Что это за сайт?</h2>
    <p>
      <b>8cost.com</b> - это самый быстрый способ сравнить цены на технику в любых магазинов мира (в том числе и online-магазинов). Вы можете узнать, какая кофеварка будет вам по карману, и во сколько вам обойдется покупка нового смартфона, и тд.
    </p>
    <div id="benefits">
      <section class="b_fast_find">
         <h1>Гибкий и быстрый поиск</h1>
         <p>Максимальные возможности для минимальных затрат вашего времени.</p>
      </section>
      <section class="b_mobile">
         <h1>Мобильная версия сайта</h1>
         <p>Узнавайте цены в любом месте и с любого устройства с выходом в интернет!</p>
      </section>
      <section class="b_geo">
         <h1>Поддержка гео-локации</h1>
         <p>Ищите цены в вашем городе и просматривайте новости актуальные именно для вас!</p>
      </section>
      <section class="b_online">
         <h1>Поиск по online-магазинам</h1>
         <p>Сравните реальные цены с виртуальными!</p>
      </section>
      <section class="b_ads">
         <h1>Добавляйте свои объявления</h1>
         <p>Хотите что-то продать? <br /><a href="#">Этот сервис для вас!</a></p>
      </section>
    </div>
  </div>
{/block}