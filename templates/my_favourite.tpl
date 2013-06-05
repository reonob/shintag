{extends file='my_acc.base.tpl'}
{block name='title' append} - Учетная запись{/block}
{block name='top_menu'}
<li><a href="/includes/my_account.php">Учетная запись</a></li>
<li><a href="/includes/my_add_ad.php">Добавить объявления</a></li>
<li class="active">Избранное</li>
<li><a href="/includes/my_money.php">Управление счетом</a></li>
{/block}
{block name='content_wrap'}
<section id="favourite_shops">
	<h1>Избранные продавцы</h1>
	<table>
		<tr>
			<td><a href="#">Amazon</a></td><td class="about">Клевые шины</td><td><button class="edit"></button><button class="delete"></button></td>
		</tr><tr>
			<td><a href="#">Bridgestone</a></td><td class="about">Нужно обязательно купить те шины для тойоты Нужно обязательно купить те шины для тойоты Нужно обязательно купить те шины для тойоты</td><td><button class="edit"></button><button class="delete"></button></td>
		</tr><tr>
			<td><a href="#">Md_tyres</a></td><td class="about">Супер крутой</td><td><button class="edit"></button><button class="delete"></button></td>
		</tr><tr>
			<td><a href="#">WheelsMastaz</a></td><td class="about"></td><td><button class="edit"></button><button class="delete"></button></td>
		</tr><tr>
			<td><a href="#">Anya</a></td class="about"><td>Хочу эти диски завтра в понедельник</td><td><button class="edit"></button><button class="delete"></button></td>
		</tr>
	</table>
</section>
	<aside>
		<form id="search_filter">
			<label for="input_find">Поиск по избранному</label>
			<input name="input_find" id="input_find" /><button id="input_find_button"></button>
			<h1 class="after_arrow dropdown_head">Расширенный поиск</h1>
			<div class="dropdown_block">
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
				<label for="tyres_min_price" class="inline">от</label><input type="text" id="tyres_min_price" name="tyres_min_price" class="min" /><label for="tyres_max_price" class="inline">до</label><input type="text" id="tyres_max_price" name="tyres_max_price" class="min" /><label for="tyres_brand">Производитель</label><select id="tyres_brand" name="tyres_brand" class="long">
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
			</div>
		</form>
	</aside>
	<div id="column_center">
		<div id="top_head" class="my_ads">
			<h2>Всего добавлено объявлений (702)</h2>
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
				<div class="controls">
					<button class="delete"></button>
				</div>
			</article>
			<article class="price">
				<a href="#"><img src="/images/tyres/im1.jpg" class="avatar"></a>
				<h1><a href="#">Michelin PILOT SPORTY Tube Type</a></h1>
				<span class="params">P 155/70R 13 75S</span>
				<span class="price">3 412 $</span>
				<div class="raiting"></div>
				<div class="controls">
					<button class="delete"></button>
				</div>
			</article>
			<article class="price">
				<a href="#"><img src="/images/tyres/im1.jpg" class="avatar"></a>
				<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
				<span class="params">P 155/70R 13 75S</span>
				<span class="price">3 412 $</span>
				<div class="raiting"></div>
				<div class="controls">
					<button class="delete"></button>
				</div>
			</article>
			<article class="price">
				<a href="#"><img src="/images/tyres/im1.jpg" class="avatar"></a>
				<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
				<span class="params">P 155/70R 13 75S</span>
				<span class="price">3 412 $</span>
				<div class="raiting"></div>
				<div class="controls">
					<button class="delete"></button>
				</div>
			</article>
			<article class="price">
				<a href="#"><img src="/images/tyres/im1.jpg" class="avatar"></a>
				<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
				<span class="params">P 155/70R 13 75S</span>
				<span class="price">3 412 $</span>
				<div class="raiting"></div>
				<div class="controls">
					<button class="delete"></button>
				</div>
			</article>
			<article class="price">
				<a href="#"><img src="/images/tyres/im1.jpg" class="avatar"></a>
				<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
				<span class="params">P 155/70R 13 75S</span>
				<span class="price">3 412 $</span>
				<div class="raiting"></div>
				<div class="controls">
					<button class="delete"></button>
				</div>
			</article>
			<article class="price">
				<a href="#"><img src="/images/tyres/im1.jpg" class="avatar"></a>
				<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
				<span class="params">P 155/70R 13 75S</span>
				<span class="price">3 412 $</span>
				<div class="raiting"></div>
				<div class="controls">
					<button class="delete"></button>
				</div>
			</article>
			<article class="price">
				<a href="#"><img src="/images/tyres/im1.jpg" class="avatar"></a>
				<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
				<span class="params">P 155/70R 13 75S</span>
				<span class="price">3 412 $</span>
				<div class="raiting"></div>
				<div class="controls">
					<button class="delete"></button>
				</div>
			</article>
			<article class="price">
				<a href="#"><img src="/images/tyres/im2.jpg" class="avatar"></a>
				<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
				<span class="params">P 155/70R 13 75S</span>
				<span class="price">3 412 $</span>
				<div class="raiting"></div>
				<div class="controls">
					<button class="delete"></button>
				</div>
			</article>
			<article class="price">
				<a href="#"><img src="/images/tyres/im2.jpg" class="avatar"></a>
				<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
				<span class="params">P 155/70R 13 75S</span>
				<span class="price">3 412 $</span>
				<div class="raiting"></div>
				<div class="controls">
					<button class="delete"></button>
				</div>
			</article>
		</div>
	</div>
{/block}