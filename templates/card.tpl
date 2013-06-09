{extends file='page.tpl'}
{block name='links'}
  <link href="/css/card.css" media="all" rel="stylesheet" />
  <script>
  </script>
{/block}
{block name='div.main'}
   <form id="main_form" name="main_form" method="get" action="/includes/search.php" onsubmit="">
      <div id="form_block">
        <div><input type="text" id="search_input" name="search_input" autofocus placeholder="Например: iphone5 32gb" /></div>
        <div><button id="search_button" class="find">Найти</button></div>
      </div>
    </form>
   <div class="breadcrumbs">
      <a href="#">Главная страница</a> > <a href="#">Продажа авто в Большом Камне</a> > <a href="#">Toyota Mark II</a> > Объявление {$ad_id}
   </div>
   <article class="main_article">
      <h1>{$ad_arr['name']}</h1>
      <span class="data">Объявление {$ad_id} от {$ad_arr['date']}</span>
      <!--<span class="data">Город: {$user_info['city']}</span>-->
      <div class="left">
         <table class="gallery">
            <tr>
               <td colspan="4" class="main_photo"><img src="/includes/uploads/{$images[0]['id']}.jpg" alt="{$ad_arr['name']}" /></td>
            </tr>
			{for $i=1 to ($images_count - 1) / 4}
				<tr>
				{for $j=0 to 3}
					{if ($i + $j) <= ($images_count - 1)}
						<td><img class="mini" src="/includes/uploads/{$images[$i + $j]['id']}_s.jpg" alt="{$ad_arr['name']}" /></td>
					{/if}
				{/for}
				</tr>
			{/for}
         </table>
         <div class="about">
            <span>Продавец: <a href="#">{$user_info['login']} (1)</a></span>
			{foreach $ad_arr['contacts'] as $contact}
				<span><span class="ico_phone"></span>{$contact}</span>
			{/foreach}
            <span><a href="mailto:{$ad_arr['mail']}">{$ad_arr['mail']}</a></span>
         </div>
      </div>
      <div class="description">
         <ul class="params">
			{foreach $info_arr as $key => $val}
				{if $val != ''}
					<li><span>{$key}:</span> {$val}</li>
				{/if}
			{/foreach}
            <li class="price"><span>Цена:</span>{$ad_arr['price']} руб.</li>
         </ul>
         <div class="text">
			{$ad_arr['text']}
         </div>
      </div>
   </article>
{/block}