{extends file='my_acc.1column.base.tpl'}
{block name='title' append} - Добавить объявления{/block}
{block name='links' append}
	<script>
		$(function(){
			$('#new_ad_article button.to_step').click(function(){
				$('#new_ad_article div.all_divs').hide();
				$('#div_' + $(this).attr('id')).show();
				return false;
			});
		});
	</script>
{/block}
{block name='top_menu'}
  <li><a href="/includes/my_account.php">Учетная запись</a></li>
  <li class="active">Добавить объявления</li>
  <li><a href="/includes/my_favourite.php">Избранное</a></li>
  <li><a href="/includes/my_money.php">Управление счетом</a></li>
{/block}
{block name='center_column_attr'} class="once"{/block}
{block name='center_column'}
  <section id="add_from_excel">
    <form id="add_from_excel_form">
      <h1 class="after_arrow dropdown_head">Загрузить из Excel</h1>
      <div class="dropdown_block">
		<small>*Файлы должны быть <a href="#">определенного формата</a></small>
		<label for="excel_file">Адрес файла</label>
		<input type="file" id="excel_file" name="excel_file" />
		<button class="red_button">Загрузить</button>
      </div>
    </form>
  </section>
  <section id="new_ad_article">
	<h1>Новое объявление</h1>
	<small>Добавление объявления состоит из четырех шагов. Чем более подробно вы заполните поля, тем больше вероятность что ваше объявление станет популярным.</small>
	<small>* - обязательные для заполнения поля</small>
    <form id="new_ad_form" name="new_ad_form">
		<div id="div_step_1" class="all_divs">
			<h2>Шаг 1/4</h2>
			<label for="add_category_main">Выберите раздел объявления</label>
			<select id="add_category_main" name="add_category_main">
				<option value="unset"></option>
				<option value="1">Шины</option>
				<option value="2">Диски</option>
				<option value="3">Аксессуары</option>
				<option value="4">Услуги</option>
			</select>
			<div>
				<button class="red_button to_step" id="step_2">Шаг 2</button>
			</div>
		</div>
		<div id="div_step_2" class="all_divs">
			<h2>Шаг 2/4</h2>
			<label for="tyres_width">Размер, см *</label>
			{$select_tyres_width} / {$select_tyres_height} R {$select_tyres_radius}
			{$label_and_select_tyres_season}
			<label for="tyres_price">Цена, руб *</label>
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
			{$label_and_select_tyres_year}
			{$label_and_select_tyres_state}
			<div>
				<div class="inline">
					<label for="tyres_complex">Комлект</label>
					<input type="checkbox" id="tyres_complex" name="tyres_complex">
				</div>
				<div class="inline">
					<label for="tyres_more">4+</label>
					<input type="checkbox" id="tyres_more" name="tyres_more">
				</div>
			</div>
			<div>
				<div class="inline">
					<label for="tyres_auto">Тип авто</label>
					<select id="tyres_auto" name="tyres_auto" class="long">
						<option>4x4</option>
						<option>Nissan</option>
						<option>Suzuki dsf sdf </option>
					</select>
				</div>
				<div class="inline">
					<label for="tyres_make">Марка</label>
					<select id="tyres_make" name="tyres_make" class="long">
						<option>Toyota</option>
						<option>Nissan</option>
						<option>Suzuk dsfs df dsi</option>
					</select>
				</div>
				<div class="inline">
					<label for="tyres_model">Модель</label>
					<select id="tyres_model" name="tyres_model" class="long" disabled="disabled">
						<option>---</option>
						<option>Ss</option>
						<option>2011 fsdf ds  sdg</option>
						<option>2010</option>
						<option>2009</option>
					</select>
				</div>
			</div>
			<div>
				<button class="red_button to_step" id="step_1">Шаг 1</button>
				<button class="red_button to_step" id="step_3">Шаг 3</button>
			</div>
		</div>
		<div id="div_step_3" class="all_divs">
			<h2>Шаг 3/4</h2>
			<label for="ad_name">Заголовок объявления *</label>
			<small>Кратко и информативно опишите ваше объявление.</small>
			<input type="text" id="ad_name" name="ad_name" size="70" />
			<label for="ad_text">Текст объявления *</label>
			<textarea name="ad_text" id="ad_text" rows="15" cols="100"></textarea>
			<label for="ad_time">Срок актуальности объявления *</label>
			<select name="ad_time" id="ad_time">
				<option value="1">21 день</option>
			</select>
			<label for="ad_contacts">Контактные данные *</label>
			<small>Только телефоны и примечания. Каждый контакт с новой строки.</small>
			<textarea name="ad_contacts" id="ad_contacts" rows="5"></textarea>
			<label for="ad_mail">E-mail</label>
			<input type="mail" id="ad_mail" name="ad_mail" size="40" />
			<div>
				<button class="red_button to_step" id="step_2">Шаг 2</button>
				<button class="red_button to_step" id="step_4">Шаг 4</button>
			</div>
		</div>
		<div id="div_step_4" class="all_divs">
			<h2>Шаг 4/4</h2>
			<small>Загрузите фотографии для вашего объявления.</small>
			<small>Первая фотография автоматически становится аватаром.</small>
			<small>Максимум в объявлении может быть 15 фотографий.</small>
			<button class="green_button" id="upload_photo">Добавить фотографию</button>
			<div>
				<button class="red_button to_step" id="step_3">Шаг 3</button>
				<button class="red_button to_step" id="step_5">Создать объявление</button>
			</div>
		</div>
    </form>
  </section>
{/block}

