{extends file='page.tpl'}
{block name='links'}
  <link href="/css/index.css" media="all" rel="stylesheet" />
  <link href="/css/prices.css" media="all" rel="stylesheet" />
  <link href="/css/filter.css" media="all" rel="stylesheet" />
  <link href="/css/board.css" media="all" rel="stylesheet" />
  <link href="/css/categories.css" media="all" rel="stylesheet" />
  <script>
	$(function(){
		$('#filter ul.buttons li').click(function(){
			$('#filter ul.buttons li').removeClass('active');
			$(this).addClass('active');
			var id = $(this).attr('id');
			id = id.split('menu').pop();
			$('div.form form').hide();
			$('#filter' + id).show();
		});
		$('#tyres_width').hover(function(){
			$('#tyre_sizes div').removeClass('none width height radius').addClass('width');
		}, function(){
			$('#tyre_sizes div').removeClass('width height radius').addClass('none');
		});
		$('#tyres_height').hover(function(){
			$('#tyre_sizes div').removeClass('none width height radius').addClass('height');
		}, function(){
			$('#tyre_sizes div').removeClass('width height radius').addClass('none');
		});
		$('#tyres_radius').hover(function(){
			$('#tyre_sizes div').removeClass('none width height radius').addClass('radius');
		}, function(){
			$('#tyre_sizes div').removeClass('width height radius').addClass('none');
		});
	});
  </script>
{/block}
{block name='div.main'}
	<img src="/images/logo.png" alt="ShinTag.ru" id="main_logo" />
    <form id="main_form" name="main_form" method="get" action="/includes/search.php" onsubmit="">
      <div id="form_block">
        <div><input type="text" id="search_input" name="search_input" autofocus placeholder="Например: iphone5 32gb" /></div>
        <div><button id="search_button" class="find">Найти</button></div>
      </div>
    </form>
	<div id="filter">
		<ul class="buttons">
			<li class="active" id="menu1">Шины</li><li id="menu2">Диски</li><li id="menu3">Аксессуары</li><li id="menu4">Услуги</li>
		</ul>
		<div class="form">
			<form id="filter1">
				<div class="wrap"> 
					<div class="left">
						<div class="long">
							<label for="tyres_width">Размер, см</label>
							{$select_tyres_width} / {$select_tyres_height} R {$select_tyres_radius}
						</div>
						<div>
							{$label_and_select_tyres_season}
						</div>
						<div class="long">
							<label for="tyres_min_price">Цена, руб</label>
							<label for="tyres_min_price" class="inline">от</label>
							<input type="text" id="tyres_min_price" name="tyres_min_price" class="min" />
							<label for="tyres_max_price" class="inline">до</label>
							<input type="text" id="tyres_max_price" name="tyres_max_price" class="min" />
						</div>
						<br />
						<div class="long">
							<label for="tyres_brand">Производитель</label>
							<select id="tyres_brand" name="tyres_brand" class="long">
								<option>Mitsi</option>
								<option>Suzaru</option>
								<option>Yoamota</option>
								<option>Binsitsi</option>
								<option>Toru</option>
							</select>
						</div>
						<div class="long">
							{$label_and_select_tyres_year}
						</div>
						<div class="long">
							{$label_and_select_tyres_state}
						</div>
						<div>
							<label for="tyres_photo">Фото</label>
							<input type="checkbox" id="tyres_photo" name="tyres_photo">
						</div>
						<div>
							<label for="tyres_complex">Комлект</label>
							<input type="checkbox" id="tyres_complex" name="tyres_complex">
						</div>
						<div>
							<label for="tyres_more">4+</label>
							<input type="checkbox" id="tyres_more" name="tyres_more">
						</div>
						<br />
						<div class="long">
							<label for="tyres_auto">Тип авто</label>
							<select id="tyres_auto" name="tyres_auto" class="long">
								<option>4x4</option>
								<option>Nissan</option>
								<option>Suzuki</option>
							</select>
						</div>
						<div class="long">
							<label for="tyres_make">Марка</label>
							<select id="tyres_make" name="tyres_make" class="long">
								<option>Toyota</option>
								<option>Nissan</option>
								<option>Suzuki</option>
							</select>
						</div>
						<div class="long">
							<label for="tyres_model">Модель</label>
							<select id="tyres_model" name="tyres_model" class="long" disabled="disabled">
								<option>---</option>
								<option>Ss</option>
								<option>2011</option>
								<option>2010</option>
								<option>2009</option>
							</select>
						</div>
					</div>
					<div class="right">
						<input type="submit" class="submit" value="Найти" />
						<span class="watch_all"><a href="#">Смотреть все</a></span>
					</div>
					<div id="tyre_sizes"><div class="none"></div></div>
				</div>
			</form>
			<form id="filter2" style="display: none">
				<div class="wrap">
					<div class="left">
						<div>
							{$label_and_select_wheels_width}
						</div>
						<div>
							{$label_and_select_wheels_radius}
						</div>
						<div>
							{$label_and_select_wheels_pcd}
						</div>
						<div class="long">
							{$label_and_select_wheels_et}
						</div>
						<div class="long">
							<label for="wheels_min_price">Цена, руб</label>
							<label for="wheels_min_price" class="inline">от</label>
							<input type="text" id="wheels_min_price" name="wheels_min_price" class="min" />
							<label for="wheels_max_price" class="inline">до</label>
							<input type="text" id="wheels_max_price" name="wheels_max_price" class="min" />
						</div>
						<br />
						<div class="long">
							<label for="wheels_brand">Производитель</label>
							<select id="wheels_brand" name="wheels_brand" class="long">
								<option>Mitsi</option>
								<option>Suzaru</option>
								<option>Yoamota</option>
								<option>Binsitsi</option>
								<option>Toru</option>
							</select>
						</div>
						<div class="long">
							{$label_and_select_wheels_type}
						</div>
						<div class="long">
							{$label_and_select_wheels_state}
						</div>
						<div class="long">
							{$label_and_select_wheels_year}
						</div>
						<div>
							<label for="wheels_photo">Фото</label>
							<input type="checkbox" id="wheels_photo" name="wheels_photo">
						</div>
						<div>
							<label for="wheels_complex">Комлект</label>
							<input type="checkbox" id="wheels_complex" name="wheels_complex">
						</div>
						<div>
							<label for="wheels_more">4+</label>
							<input type="checkbox" id="wheels_more" name="wheels_more">
						</div>
						<br />
						<div class="long">
							<label for="wheels_auto">Тип авто</label>
							<select id="wheels_auto" name="wheels_auto" class="long">
								<option>4x4</option>
								<option>Nissan</option>
								<option>Suzuki</option>
							</select>
						</div>
						<div class="long">
							<label for="wheels_make">Марка</label>
							<select id="wheels_make" name="wheels_make" class="long">
								<option>Toyota</option>
								<option>Nissan</option>
								<option>Suzuki</option>
							</select>
						</div>
						<div class="long">
							<label for="wheels_model">Модель</label>
							<select id="wheels_model" name="wheels_model" class="long" disabled="disabled">
								<option>---</option>
								<option>Ss</option>
								<option>2011</option>
								<option>2010</option>
								<option>2009</option>
							</select>
						</div>
					</div>
					<div class="right">
						<input type="submit" class="submit" value="Найти" />
						<span class="watch_all"><a href="#">Смотреть все</a></span>
					</div>
				</div>
			</form>
			<form id="filter3" style="display: none">
				<div class="wrap">
					<div class="left">
						<div class="long">
							<label for="accessories_type">Тип аксессуаров</label>
							<select id="accessories_type" name="accessories_type" class="long">
								<option>4x4</option>
								<option>Nissan</option>
								<option>Suzuki</option>
							</select>
						</div>
						<div class="long">
							{$label_and_select_accessories_state}
						</div>
						<div class="long">
							<label for="accessories_min_price">Цена, руб</label>
							<label for="accessories_min_price" class="inline">от</label>
							<input type="text" id="accessories_min_price" name="accessories_min_price" class="min" />
							<label for="accessories_max_price" class="inline">до</label>
							<input type="text" id="accessories_max_price" name="accessories_max_price" class="min" />
						</div>
						<br/>
						<div class="long">
							<label for="accessories_auto">Тип авто</label>
							<select id="accessories_auto" name="accessories_auto" class="long">
								<option>4x4</option>
								<option>Nissan</option>
								<option>Suzuki</option>
							</select>
						</div>
						<div class="long">
							<label for="accessories_make">Марка</label>
							<select id="accessories_make" name="accessories_make" class="long">
								<option>Toyota</option>
								<option>Nissan</option>
								<option>Suzuki</option>
							</select>
						</div>
						<div class="long">
							<label for="accessories_model">Модель</label>
							<select id="accessories_model" name="accessories_model" class="long" disabled="disabled">
								<option>---</option>
								<option>Ss</option>
								<option>2011</option>
								<option>2010</option>
								<option>2009</option>
							</select>
						</div>
					</div>
					<div class="right">
						<input type="submit" class="submit" value="Найти" />
						<span class="watch_all"><a href="#">Смотреть все</a></span>
					</div>
				</div>
			</form>
			<form id="filter4" style="display: none">
				<div class="wrap">
					<div class="left">
						<div>
							<label for="service_type">Тип услуг</label>
							<select id="service_type" name="service_type">
								<option>Связанные с шинами</option>
								<option>Связанные с дисками</option>
							</select>
							<select id="service_type_adv" name="service_type_adv" class="long">
								<option>Шиномонтаж</option>
								<option>Nissan</option>
								<option>Suzuki</option>
							</select>
						</div>
						<br/>
						<div class="long">
							<label for="service_auto">Тип авто</label>
							<select id="service_auto" name="service_auto" class="long">
								<option>4x4</option>
								<option>Nissan</option>
								<option>Suzuki</option>
							</select>
						</div>
						<div class="long">
							<label for="service_min_price">Цена, руб</label>
							<label for="service_min_price" class="inline">от</label>
							<input type="text" id="service_min_price" name="service_min_price" class="min" />
							<label for="service_max_price" class="inline">до</label>
							<input type="text" id="service_max_price" name="service_max_price" class="min" />
						</div>
					</div>
					<div class="right">
						<input type="submit" class="submit" value="Найти" />
						<span class="watch_all"><a href="#">Смотреть все</a></span>
					</div>
				</div>
			</form>
		</div>
	</div>
	<section id="side">
		<section class="banner">
			<img src="http://static.baza.farpost.ru/v/1367365458537_block">
		</section>
		<section id="forum">
			<h1>Сегодня на форуме</h1>
			<ul>	
				<li><a href="#">Летние шины по супер-ценам в компании "РОСА. Шины, Диски"</a></li>
				<li><a href="#">Bridgestone S322 Tubeless</a></li>
				<li><a href="#">Огромный выбор дисков "Sakura wheels"</a></li>
				<li><a href="#">Новое поступление Литых дисков и шин. Оптом и в розницу</a></li>
			</ul>
		</section>
	</section>
	<section id="categories">
		<table>
			<tr>
				<td>
					<ul>
						<li><span class="menu_icon icon_1"></span><a href="#" class="main icon_1">Шины</a>
							<ul>
								<li><a href="#">всесезонные шины</a></li>, <li><a href="#">летние шины</a></li>, <li><a href="#">зимние шины</a></li>, <li><a href="#">каталог шин</a></li>, <li><a href="#">китайские шины</a></li>, <li><a href="#">японские шины</a></li>, <li><a href="#">спортивные шины</a></li>, <li><a href="#">шины для грузовиков</a></li>, <li><a href="#">шины на заказ</a></li>, <li><a href="#">продажа шин оптом</a></li>, <li><a href="#">аукционы</a></li>, <li><a href="#">объявления магазинов</a></li>, <li><a href="#">шины на рынках</a></li>, <li><a href="#">частные объявления</a></li>, <li><a href="#">шины со скидкой</a></li>
							</ul>
						</li>
						<li><span class="menu_icon icon_2"></span><a href="#" class="main icon_2">Диски</a>
							<ul>
								<li><a href="#">литые диски</a></li>, <li><a href="#">кованные диски</a></li>, <li><a href="#">штампованные диски</a></li>, <li><a href="#">оригинальные диски</a></li>, <li><a href="#">б/у диски</a></li>, <li><a href="#">диски со скидкой</a></li>, <li><a href="#">спортивные диски</a></li>, <li><a href="#">диски на заказ</a></li>, <li><a href="#">китайские диски</a></li>, <li><a href="#">японские диски</a></li>, <li><a href="#">продажа дисков оптом</a></li>, <li><a href="#">VIP диски</a></li>, <li><a href="#">цветные диски</a></li>
							</ul>
						</li>
					</ul>
				</td>
				<td>
					<ul>
						<li><span class="menu_icon icon_3"></span><a href="#" class="main icon_3">Аксессуары</a>
							<ul>
								<li><a href="#">колпаки для дисков</a></li>, <li><a href="#">инструменты</a></li>, <li><a href="#">секретки</a></li>, <li><a href="#">насосы</a></li>, <li><a href="#">домкраты</a></li>, <li><a href="#">химия для ухода за колесами</a></li>, <li><a href="#">наборы ключей</a></li>, <li><a href="#">полки для колес</a></li>, <li><a href="#">цепи для колес</a></li>, <li><a href="#">продажа аксессуаров оптом</a></li>, <li><a href="#">аксессуары из Японии</a></li>, <li><a href="#">аксессуары из Китая</a></li>
							</ul>
						</li>
						<li><span class="menu_icon icon_4"></span><a href="#" class="main icon_4">Услуги</a>
							<ul>
								<li><a href="#">шиномонтаж</a></li>, <li><a href="#">балансировка</a></li>, <li><a href="#">прокат литья</a></li>, <li><a href="#">никилировка литья</a></li>, <li><a href="#">сезонное хранение колес</a></li>, <li><a href="#">востановление резины</a></li>, <li><a href="#">востановление резины</a></li>, <li><a href="#">востановление литья</a></li>, <li><a href="#">перевозка и траспортировка колес</a></li>, <li><a href="#">отправка из японии</a></li>, <li><a href="#">найти партнеров</a></li>
							</ul>
						</li>
					</ul>
				</td>
			</tr>
		</table>
	</section>
	<section id="board">
		<a href="#" id="how_in">Как сюда попасть?</a><h1>Доска объявлений</h1>
		<article>
			<table>
				<tr>
					<td><img src="/images/tyres/im2.jpg" /></td>
					<td>
						<h1><a href="#">Летние шины по супер-ценам в компании "РОСА. Шины, Диски"</a></h1>
						Цена: 1399 руб.
					</td>
				</tr>
			</table>
		</article>
		<article>
			<table>
				<tr>
					<td><img src="/images/tyres/im1.jpg" /></td>
					<td>
						<h1><a href="#">Огромный выбор дисков "Sakura wheels"</a></h1>
						Цена: 1399 руб.
					</td>
				</tr>
			</table>
		</article>
		<article>
			<table>
				<tr>
					<td><img src="/images/tyres/im2.jpg" /></td>
					<td>
						<h1><a href="#">Невероятные ЦЕНЫ на новую летнюю авторезину!</a></h1>
						Цена: 1399 руб.
					</td>
				</tr>
			</table>
		</article>
		<article>
			<table>
				<tr>
					<td><img src="/images/tyres/im1.jpg" /></td>
					<td>
						<h1><a href="#">Летние шины по супер-ценам в компании "РОСА. Шины, Диски"</a></h1>
						Цена: 1399 руб.
					</td>
				</tr>
			</table>
		</article>
		<article>
			<table>
				<tr>
					<td><img src="/images/tyres/im1.jpg" /></td>
					<td>
						<h1><a href="#">Новое поступление Литых дисков и шин. Оптом и в розницу.</a></h1>
						Цена: 1399 руб.
					</td>
				</tr>
			</table>
		</article>
		<article>
			<table>
				<tr>
					<td><img src="/images/tyres/im2.jpg" /></td>
					<td>
						<h1><a href="#">Огромный выбор дисков "Sakura wheels"</a></h1>
						Цена: 1399 руб.
					</td>
				</tr>
			</table>
		</article>
	</section>
	<div class="catalog">
		<h2>BEST SELLERS - CAR TYRES</h2>
		<article class="price">
			<img src="/images/tyres/im1.jpg" class="avatar">
			<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
			<span class="params">P 155/70R 13 75S</span>
			<span class="price">3 412 $</span>
			<div class="raiting"></div>
		</article>
		<article class="price">
			<img src="/images/tyres/im1.jpg" class="avatar">
			<h1><a href="#">Michelin PILOT SPORTY Tube Type</a></h1>
			<span class="params">P 155/70R 13 75S</span>
			<span class="price">3 412 $</span>
			<div class="raiting"></div>
		</article>
		<article class="price">
			<img src="/images/tyres/im1.jpg" class="avatar">
			<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
			<span class="params">P 155/70R 13 75S</span>
			<span class="price">3 412 $</span>
			<div class="raiting"></div>
		</article>
		<article class="price">
			<img src="/images/tyres/im1.jpg" class="avatar">
			<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
			<span class="params">P 155/70R 13 75S</span>
			<span class="price">3 412 $</span>
			<div class="raiting"></div>
		</article>
		<article class="price">
			<img src="/images/tyres/im1.jpg" class="avatar">
			<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
			<span class="params">P 155/70R 13 75S</span>
			<span class="price">3 412 $</span>
			<div class="raiting"></div>
		</article>
		<article class="price">
			<img src="/images/tyres/im1.jpg" class="avatar">
			<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
			<span class="params">P 155/70R 13 75S</span>
			<span class="price">3 412 $</span>
			<div class="raiting"></div>
		</article>
		<article class="price">
			<img src="/images/tyres/im1.jpg" class="avatar">
			<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
			<span class="params">P 155/70R 13 75S</span>
			<span class="price">3 412 $</span>
			<div class="raiting"></div>
		</article>
		<article class="price">
			<img src="/images/tyres/im1.jpg" class="avatar">
			<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
			<span class="params">P 155/70R 13 75S</span>
			<span class="price">3 412 $</span>
			<div class="raiting"></div>
		</article>
		<h2>BEST SELLERS - CAR TYRES</h2>
		<article class="price">
			<img src="/images/tyres/im2.jpg" class="avatar">
			<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
			<span class="params">P 155/70R 13 75S</span>
			<span class="price">3 412 $</span>
			<div class="raiting"></div>
		</article>
		<article class="price">
			<img src="/images/tyres/im2.jpg" class="avatar">
			<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
			<span class="params">P 155/70R 13 75S</span>
			<span class="price">3 412 $</span>
			<div class="raiting"></div>
		</article>
		<article class="price">
			<img src="/images/tyres/im2.jpg" class="avatar">
			<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
			<span class="params">P 155/70R 13 75S</span>
			<span class="price">3 412 $</span>
			<div class="raiting"></div>
		</article>
		<article class="price">
			<img src="/images/tyres/im2.jpg" class="avatar">
			<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
			<span class="params">P 155/70R 13 75S</span>
			<span class="price">3 412 $</span>
			<div class="raiting"></div>
		</article>
		<article class="price">
			<img src="/images/tyres/im2.jpg" class="avatar">
			<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
			<span class="params">P 155/70R 13 75S</span>
			<span class="price">3 412 $</span>
			<div class="raiting"></div>
		</article>
		<article class="price">
			<img src="/images/tyres/im2.jpg" class="avatar">
			<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
			<span class="params">P 155/70R 13 75S</span>
			<span class="price">3 412 $</span>
			<div class="raiting"></div>
		</article>
		<article class="price">
			<img src="/images/tyres/im2.jpg" class="avatar">
			<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
			<span class="params">P 155/70R 13 75S</span>
			<span class="price">3 412 $</span>
			<div class="raiting"></div>
		</article>
		<article class="price">
			<img src="/images/tyres/im1.jpg" class="avatar">
			<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
			<span class="params">P 155/70R 13 75S</span>
			<span class="price">3 412 $</span>
			<div class="raiting"></div>
		</article>
		<article class="price">
			<img src="/images/tyres/im1.jpg" class="avatar">
			<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
			<span class="params">P 155/70R 13 75S</span>
			<span class="price">3 412 $</span>
			<div class="raiting"></div>
		</article>
		<article class="price">
			<img src="/images/tyres/im1.jpg" class="avatar">
			<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
			<span class="params">P 155/70R 13 75S</span>
			<span class="price">3 412 $</span>
			<div class="raiting"></div>
		</article>
		<article class="price">
			<img src="/images/tyres/im1.jpg" class="avatar">
			<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
			<span class="params">P 155/70R 13 75S</span>
			<span class="price">3 412 $</span>
			<div class="raiting"></div>
		</article>
	</div>
{/block}