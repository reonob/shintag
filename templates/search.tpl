{extends file='page.tpl'}
{block name='links'}
  <link href="/css/search.css" media="all" rel="stylesheet" />
  <link href="/css/prices.css" media="all" rel="stylesheet" />
  <link href="/css/aside.css" media="all" rel="stylesheet" />
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
{block name='div.main'}
    <form id="main_form" name="main_form" method="get" action="/includes/search.php" onsubmit="">
		<a href="/" id="logo_min"><img src="/images/logo_min.png" /></a>
		<div id="form_block" class="top_pages">
			<div><input type="text" id="search_input" name="search_input" autofocus placeholder="Например: iphone5 32gb" /></div>
			<div><button id="search_button" class="find">Найти</button></div>
		</div>
    </form>
	<aside>
		<form id="search_filter">
			<label for="tyres_width">Размер, см</label>
			<select id="tyres_width" name="tyres_width" class="min">
				<option>100</option>
				<option>101</option>
				<option>102</option>
				<option>103</option>
				<option>104</option>
			</select> / 
			<select id="tyres_height" name="tyres_height" class="min">
				<option>95</option>
				<option>101</option>
				<option>102</option>
				<option>103</option>
				<option>104</option>
			</select> R 
			<select id="tyres_radius" name="tyres_radius" class="min">
				<option>44</option>
				<option>101</option>
				<option>102</option>
				<option>103</option>
				<option>104</option>
			</select>
			<label for="tyres_rel">Остаток не менее, %</label>
			<select id="tyres_rel" name="tyres_rel">
				<option>98</option>
				<option>98.1</option>
				<option>98.2</option>
				<option>98.3</option>
				<option>98.4</option>
			</select>
			<label for="tyres_brand">Сезон</label>
			<select id="tyres_brand" name="tyres_brand">
				<option>Зима</option>
				<option>Лето</option>
			</select>
			<label for="tyres_year">Год</label>
			<select id="tyres_year" name="tyres_year">
				<option>2013</option>
				<option>2012</option>
				<option>2011</option>
				<option>2010</option>
				<option>2009</option>
			</select>
			<label for="tyres_min_price">Цена, руб</label>
			<label for="tyres_min_price" class="inline">от</label>
			<input type="text" id="tyres_min_price" name="tyres_min_price" class="min" />
			<label for="tyres_max_price" class="inline">до</label>
			<input type="text" id="tyres_max_price" name="tyres_max_price" class="min" />
			<label for="tyres_brand">Производитель</label>
			<select id="tyres_brand" name="tyres_brand" class="long">
				<option>Mitsi</option>
				<option>Suzaru</option>
				<option>Yoamota</option>
				<option>Binsitsi</option>
				<option>Toru</option>
			</select>
			<label for="tyres_auto">Тип авто</label>
			<select id="tyres_auto" name="tyres_auto" class="long">
				<option>4x4</option>
				<option>Nissan</option>
				<option>Suzuki</option>
			</select>
			<label for="tyres_make">Марка</label>
			<select id="tyres_make" name="tyres_make" class="long">
				<option>Toyota</option>
				<option>Nissan</option>
				<option>Suzuki</option>
			</select>
			<label for="tyres_model">Модель</label>
			<select id="tyres_model" name="tyres_model" class="long" disabled="disabled">
				<option>---</option>
				<option>Ss</option>
				<option>2011</option>
				<option>2010</option>
				<option>2009</option>
			</select>
			<label for="tyres_photo">Фото</label>
			<input type="checkbox" id="tyres_photo" name="tyres_photo" checked="checked" />
			<button class="red_button">Найти</button>
		</form>
		<section id="saler">
			<h1>Продавец</h1>
			<ul>
				<li><a href="#">Частный продавец</a></li>
				<li><a href="#">Онлайн-магазин</a></li>
			</ul>
		</section>
		<section id="categories">
			<ul>
				<li>
					<a href="javascript:void(0)">Бытовая техника (45)</a>
					<ul>
						<li><a href="#">Категория1 (13)</a></li>
						<li><a href="#">Категория категория (32)</a></li>
					</ul>
				</li>
				<li>
					<a href="javascript:void(0)">Смартфоны (32)</a>
					<ul>
						<li><a href="#">Категория1 (2)</a></li>
						<li><a href="#">Категория категория (20)</a></li>
						<li><a href="#">Категория 2 (10)</a></li>
					</ul>
				</li>
				<li>
					<a href="javascript:void(0)">Фотоаппараты (78)</a>
					<ul>
						<li><a href="#">Категория1 (58)</a></li>
						<li><a href="#">Категория категория (20)</a></li>
					</ul>
				</li>
			</ul>
		</section>
	</aside>
	<div class="catalog">
		<article class="price">
			<a href="#"><img src="/images/tyres/im1.jpg" class="avatar"></a>
			<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
			<span class="params">P 155/70R 13 75S</span>
			<span class="price">3 412 $</span>
			<div class="raiting"></div>
		</article>
		<article class="price">
			<a href="#"><img src="/images/tyres/im1.jpg" class="avatar"></a>
			<h1><a href="#">Michelin PILOT SPORTY Tube Type</a></h1>
			<span class="params">P 155/70R 13 75S</span>
			<span class="price">3 412 $</span>
			<div class="raiting"></div>
		</article>
		<article class="price">
			<a href="#"><img src="/images/tyres/im1.jpg" class="avatar"></a>
			<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
			<span class="params">P 155/70R 13 75S</span>
			<span class="price">3 412 $</span>
			<div class="raiting"></div>
		</article>
		<article class="price">
			<a href="#"><img src="/images/tyres/im1.jpg" class="avatar"></a>
			<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
			<span class="params">P 155/70R 13 75S</span>
			<span class="price">3 412 $</span>
			<div class="raiting"></div>
		</article>
		<article class="price">
			<a href="#"><img src="/images/tyres/im1.jpg" class="avatar"></a>
			<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
			<span class="params">P 155/70R 13 75S</span>
			<span class="price">3 412 $</span>
			<div class="raiting"></div>
		</article>
		<article class="price">
			<a href="#"><img src="/images/tyres/im1.jpg" class="avatar"></a>
			<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
			<span class="params">P 155/70R 13 75S</span>
			<span class="price">3 412 $</span>
			<div class="raiting"></div>
		</article>
		<article class="price">
			<a href="#"><img src="/images/tyres/im1.jpg" class="avatar"></a>
			<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
			<span class="params">P 155/70R 13 75S</span>
			<span class="price">3 412 $</span>
			<div class="raiting"></div>
		</article>
		<article class="price">
			<a href="#"><img src="/images/tyres/im1.jpg" class="avatar"></a>
			<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
			<span class="params">P 155/70R 13 75S</span>
			<span class="price">3 412 $</span>
			<div class="raiting"></div>
		</article>
	</div>
{/block}