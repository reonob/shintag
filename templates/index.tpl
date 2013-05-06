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
			<li class="active" id="menu1">Шины</li><li id="menu2">Литье</li><li id="menu3">Комплекты</li><li id="menu4">Аксессуары</li><li id="menu5">Услуги</li>
		</ul>
		<div class="form">
			<form id="filter1">
				<div class="left">
					<div class="long">
						<div>
							<label for="tyres_width">Ширина, см</label>
							<select id="tyres_width" name="tyres_width">
								<option>100</option>
								<option>101</option>
								<option>102</option>
								<option>103</option>
								<option>104</option>
							</select>
						</div>
						<div>
							<label for="tyres_height">Профиль, см</label>
							<select id="tyres_height" name="tyres_height">
								<option>95</option>
								<option>101</option>
								<option>102</option>
								<option>103</option>
								<option>104</option>
							</select>
						</div>
						<div>
							<label for="tyres_radius">Радиус, см</label>
							<select id="tyres_radius" name="tyres_radius">
								<option>44</option>
								<option>101</option>
								<option>102</option>
								<option>103</option>
								<option>104</option>
							</select>
						</div>
					</div>
					<div>
						<label for="tyres_rel">Остаток не менее, %</label>
						<select id="tyres_rel" name="tyres_rel">
							<option>98</option>
							<option>98.1</option>
							<option>98.2</option>
							<option>98.3</option>
							<option>98.4</option>
						</select>
					</div>
					<div>
						<label for="tyres_photo">Фото</label>
						<input type="checkbox" id="tyres_photo" name="tyres_photo">
					</div>
					<br />
					<div class="long">
						<label for="tyres_brand">Сезон</label>
						<select id="tyres_brand" name="tyres_brand">
							<option>Зима</option>
							<option>Лето</option>
						</select>
					</div>
					<div>
						<label for="tyres_year">Год</label>
						<select id="tyres_year" name="tyres_year">
							<option>2013</option>
							<option>2012</option>
							<option>2011</option>
							<option>2010</option>
							<option>2009</option>
						</select>
					</div>
					<div class="long">
						<label for="tyres_min_price">Цена, руб</label>
						<label for="tyres_min_price" class="inline">от</label>
						<input type="text" id="tyres_min_price" name="tyres_min_price" class="min" />
						<label for="tyres_max_price" class="inline">до</label>
						<input type="text" id="tyres_max_price" name="tyres_max_price" class="min" />
					</div>
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
				</div>
				<div id="tyre_sizes"><div class="none"></div></div>
			</form>
			<form id="filter2" style="display: none">
				<div class="left">
					<div class="long">
						<div>
							<label for="wheels_width">Ширина обода, см</label>
							<select id="wheels_width" name="wheels_width">
								<option>100</option>
								<option>101</option>
								<option>102</option>
								<option>103</option>
								<option>104</option>
							</select>
						</div>
						<div>
							<label for="wheels_height">Диаметр обода, см</label>
							<select id="wheels_height" name="wheels_height">
								<option>95</option>
								<option>101</option>
								<option>102</option>
								<option>103</option>
								<option>104</option>
							</select>
						</div>
						<div>
							<label for="wheels_diameter">Диаметр отверстий, см</label>
							<select id="wheels_diameter" name="wheels_diameter">
								<option>44</option>
								<option>101</option>
								<option>102</option>
								<option>103</option>
								<option>104</option>
							</select>
						</div>
					</div>
					<div>
						<label for="wheels_photo">Фото</label>
						<input type="checkbox" id="tyres_photo" name="wheels_photo">
					</div>
					<br />
					<div>
						<label for="wheels_brand">Кол-во отверстий</label>
						<select id="wheels_brand" name="wheels_brand">
							<option>12</option>
							<option>14</option>
						</select>
					</div>
					<div>
						<label for="wheels_year">Год</label>
						<select id="wheels_year" name="wheels_year">
							<option>2013</option>
							<option>2012</option>
							<option>2011</option>
							<option>2010</option>
							<option>2009</option>
						</select>
					</div>
					<div class="long">
						<label for="wheels_min_price">Цена, руб</label>
						<label for="wheels_min_price" class="inline">от</label>
						<input type="text" id="wheels_min_price" name="wheels_min_price" class="min" />
						<label for="wheels_max_price" class="inline">до</label>
						<input type="text" id="wheels_max_price" name="wheels_max_price" class="min" />
					</div>
					<div>
						<label for="wheels_year">Вылет</label>
						<select id="wheels_year" name="wheels_year">
							<option>2013</option>
							<option>2012</option>
							<option>2011</option>
							<option>2010</option>
							<option>2009</option>
						</select>
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
						<li><span class="menu_icon icon_1"></span><a href="#" class="main icon_1">Авто и мото</a>
							<ul>
								<li><a href="#">продажа легковых автомобилей</a></li>, <li><a href="#">автомобили на запчасти</a></li>, <li><a href="#">продажа запчастей</a></li>, <li><a href="#">спецтехника</a></li>, <li><a href="#">мото</a></li>, <li><a href="#">шины и диски</a></li>, <li><a href="#">gt и тюнинг</a></li>, <li><a href="#">гаражи</a></li>, <li><a href="#">продажа птс</a></li>, <li><a href="#">услуги</a></li>
							</ul>
						</li>
						<li><span class="menu_icon icon_2"></span><a href="#" class="main icon_2">Недвижимость</a>
							<ul>
								<li><a href="#">квартиры продажа</a></li>, <li><a href="#">квартиры аренда</a></li>, <li><a href="#">квартиры аренда посуточно</a></li>, <li><a href="#">дома и коттеджи продажа</a></li>, <li><a href="#">дачи продажа</a></li>, <li><a href="#">земельные участки продажа</a></li>, <li><a href="#">помещения продажа</a></li>, <li><a href="#">помещения аренда</a></li>
							</ul>
						</li>
					</ul>
				</td>
				<td>
					<ul>
						<li><span class="menu_icon icon_3"></span><a href="#" class="main icon_3">Бизнес</a>
							<ul>
								<li><a href="#">оборудование для бизнеса</a></li>, <li><a href="#">продажа готового бизнеса</a></li>, <li><a href="#">изготовление и продажа рекламы</a></li>
							</ul>
						</li>
						<li><span class="menu_icon icon_4"></span><a href="#" class="main icon_4">Дети и материнство</a>
							<ul>
								<li><a href="#">детская одежда и обувь, игрушки</a></li>, <li><a href="#">одежда для беременных</a></li>
							</ul>
						</li>
						<li><span class="menu_icon icon_5"></span><a href="#" class="main">Животные</a>
							<ul>
								<li><a href="#">собаки</a></li>, <li><a href="#">кошки</a></li>, <li><a href="#">аксессуары и корма</a></li>, <li><a href="#">отдам бесплатно</a></li>
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
		<ul class="prices">
			<li>
				<h2>BEST SELLERS - CAR TYRES</h2>
				<ul>
					<li>
						<article class="price">
							<img src="/images/tyres/im1.jpg" class="avatar">
							<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
							<span class="params">P 155/70R 13 75S</span>
							<span class="price">3 412 $</span>
							<div class="raiting"></div>
						</article>
					</li>
					<li>
						<article class="price">
							<img src="/images/tyres/im1.jpg" class="avatar">
							<h1><a href="#">Michelin PILOT SPORTY Tube Type</a></h1>
							<span class="params">P 155/70R 13 75S</span>
							<span class="price">3 412 $</span>
							<div class="raiting"></div>
						</article>
					</li>
					<li>
						<article class="price">
							<img src="/images/tyres/im1.jpg" class="avatar">
							<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
							<span class="params">P 155/70R 13 75S</span>
							<span class="price">3 412 $</span>
							<div class="raiting"></div>
						</article>
					</li>
					<li>
						<article class="price">
							<img src="/images/tyres/im1.jpg" class="avatar">
							<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
							<span class="params">P 155/70R 13 75S</span>
							<span class="price">3 412 $</span>
							<div class="raiting"></div>
						</article>
					</li>
					<li>
						<article class="price">
							<img src="/images/tyres/im1.jpg" class="avatar">
							<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
							<span class="params">P 155/70R 13 75S</span>
							<span class="price">3 412 $</span>
							<div class="raiting"></div>
						</article>
					</li>
					<li>
						<article class="price">
							<img src="/images/tyres/im1.jpg" class="avatar">
							<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
							<span class="params">P 155/70R 13 75S</span>
							<span class="price">3 412 $</span>
							<div class="raiting"></div>
						</article>
					</li>
					<li>
						<article class="price">
							<img src="/images/tyres/im1.jpg" class="avatar">
							<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
							<span class="params">P 155/70R 13 75S</span>
							<span class="price">3 412 $</span>
							<div class="raiting"></div>
						</article>
					</li>
					<li>
						<article class="price">
							<img src="/images/tyres/im1.jpg" class="avatar">
							<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
							<span class="params">P 155/70R 13 75S</span>
							<span class="price">3 412 $</span>
							<div class="raiting"></div>
						</article>
					</li>
				</ul>
			</li>
			<li>
				<h2>BEST SELLERS - CAR TYRES</h2>
				<ul>
					<li>
						<article class="price">
							<img src="/images/tyres/im2.jpg" class="avatar">
							<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
							<span class="params">P 155/70R 13 75S</span>
							<span class="price">3 412 $</span>
							<div class="raiting"></div>
						</article>
					</li>
					<li>
						<article class="price">
							<img src="/images/tyres/im2.jpg" class="avatar">
							<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
							<span class="params">P 155/70R 13 75S</span>
							<span class="price">3 412 $</span>
							<div class="raiting"></div>
						</article>
					</li>
					<li>
						<article class="price">
							<img src="/images/tyres/im2.jpg" class="avatar">
							<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
							<span class="params">P 155/70R 13 75S</span>
							<span class="price">3 412 $</span>
							<div class="raiting"></div>
						</article>
					</li>
					<li>
						<article class="price">
							<img src="/images/tyres/im2.jpg" class="avatar">
							<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
							<span class="params">P 155/70R 13 75S</span>
							<span class="price">3 412 $</span>
							<div class="raiting"></div>
						</article>
					</li>
					<li>
						<article class="price">
							<img src="/images/tyres/im2.jpg" class="avatar">
							<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
							<span class="params">P 155/70R 13 75S</span>
							<span class="price">3 412 $</span>
							<div class="raiting"></div>
						</article>
					</li>
					<li>
						<article class="price">
							<img src="/images/tyres/im2.jpg" class="avatar">
							<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
							<span class="params">P 155/70R 13 75S</span>
							<span class="price">3 412 $</span>
							<div class="raiting"></div>
						</article>
					</li>
					<li>
						<article class="price">
							<img src="/images/tyres/im2.jpg" class="avatar">
							<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
							<span class="params">P 155/70R 13 75S</span>
							<span class="price">3 412 $</span>
							<div class="raiting"></div>
						</article>
					</li>
				</ul>
			</li>
			<li>
				<h2>BEST SELLERS - CAR TYRES</h2>
				<ul>
					<li>
						<article class="price">
							<img src="/images/tyres/im1.jpg" class="avatar">
							<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
							<span class="params">P 155/70R 13 75S</span>
							<span class="price">3 412 $</span>
							<div class="raiting"></div>
						</article>
					</li>
					<li>
						<article class="price">
							<img src="/images/tyres/im1.jpg" class="avatar">
							<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
							<span class="params">P 155/70R 13 75S</span>
							<span class="price">3 412 $</span>
							<div class="raiting"></div>
						</article>
					</li>
					<li>
						<article class="price">
							<img src="/images/tyres/im1.jpg" class="avatar">
							<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
							<span class="params">P 155/70R 13 75S</span>
							<span class="price">3 412 $</span>
							<div class="raiting"></div>
						</article>
					</li>
					<li>
						<article class="price">
							<img src="/images/tyres/im1.jpg" class="avatar">
							<h1><a href="#">Bridgestone S322 Tubeless</a></h1>
							<span class="params">P 155/70R 13 75S</span>
							<span class="price">3 412 $</span>
							<div class="raiting"></div>
						</article>
					</li>
				</ul>
			</li>
		</ul>
	</div>
{/block}