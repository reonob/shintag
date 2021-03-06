<aside>
	<form id="search_filter">
		{if $catalog['search_for_my'] == true}
			<label for="input_find">Поиск по моим объявлениям</label>
			<input name="input_find" id="input_find" /><button id="input_find_button"></button>
		{/if}
		{if $catalog['extend_block'] == true}
			<h1 class="after_arrow dropdown_head">Расширенный поиск</h1>
			<div class="dropdown_block">
		{/if}
		{if $catalog['ad_type'] == 1}
			<label for="tyres_width">Размер, см</label>
			{$select_tyres_width} / {$select_tyres_height} R {$select_tyres_radius}
			{$label_and_select_tyres_season}
			<label for="tyres_min_price">Цена, руб</label>
			<label for="tyres_min_price" class="inline">от</label>
			<input type="text" id="tyres_min_price" name="tyres_min_price" class="min" />
			<label for="tyres_max_price" class="inline">до</label>
			<input type="text" id="tyres_max_price" name="tyres_max_price" class="min" />
			{$label_and_select_tyres_brand}
			{$label_and_select_tyres_year}
			<!--
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
			-->
		{/if}
		{if $catalog['ad_saler'] == true}
			<label>Продавец</label>
			<ul id="saler">
				<li><input type="checkbox" value="1" id="saler1" checked="checked" name="saler" /><label for="saler1">Частный продавец</label></li>
				<li><input type="checkbox" value="2" id="saler2" checked="checked" name="saler" /><label for="saler2">Онлайн-магазин</label></li>
			</ul>
		{/if}
		<label for="tyres_photo">Фото</label>
		<input type="checkbox" id="tyres_photo" name="tyres_photo" checked="checked" />
		<button class="red_button">Найти</button>
	</form>
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
	{if $catalog['extend_block'] == true}
		</div>
	{/if}
</aside>
<div id="column_center">
	<div id="top_head">
		<h2>Всего найдено объявлений (702)</h2>
		<a href="#" class="dark_button" id="show_on_map">Показать на карте</a>
	</div>
	<h1 id="settings_prices" class="after_arrow dropdown_head my_ads">Настройки</h1>
	<div class="dropdown_block">
		<form id="settings_form" name="settings_form">
		  <label for="set_auto">Автопрокрутка</label>
		  <input type="checkbox" name="set_auto" id="set_auto" />
		  <label for="set_num">Показывать по</label>
		  <select name="set_num" id="set_num">
			<option value="1">20</option>
			<option value="2">50</option>
			<option value="3">75</option>
		  </select>
		  <label for="set_currency">Цены</label>
		  <select name="set_currency" id="set_currency">
			<option value="1">в рублях</option>
			<option value="2">в долларах</option>
			<option value="3">в юанях</option>
		  </select>
		</form>
	</div>
	<ul class="catalog_menu">
		<li><a href="#" class="active">Шины</a></li>
		<li><a href="#">Диски</a></li>
		<li><a href="#">Комплекты</a></li>
		<li><a href="#">Аксессуары</a></li>
		<li><a href="#">Услуги</a></li>
	</ul>
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
</div>