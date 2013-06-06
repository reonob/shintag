{extends file='my_acc.base.tpl'}
{block name='title' append} - Добавить объявления{/block}
{block name='links' append}
	<script>
		/*$(function(){
			$('#new_ad_article button.to_step').click(function(){
				$('#new_ad_article div.all_divs').hide();
				$('#div_' + $(this).attr('id')).show();
				return false;
			});
		});*/
	</script>
{/block}
{block name='top_menu'}
  <li><a href="/includes/my_account.php">Учетная запись</a></li>
  <li class="active">Добавить объявления</li>
  <li><a href="/includes/my_favourite.php">Избранное</a></li>
  <li><a href="/includes/my_money.php">Управление счетом</a></li>
{/block}
{block name='content_wrap'}
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
		{if $step == 1 || $step == ''}
			<form id="new_ad_form" name="new_ad_form" action="/includes/my_add_ad.php?step=2" method="POST">
				<div id="div_step_1">
					<h2>Шаг 1/4</h2>
					<label for="ad_category_main">Выберите раздел объявления</label>
					<select id="ad_category_main" name="ad_category_main">
						<option value="unset" selected disabled></option>
						<option value="1">Шины</option>
						<option value="2">Диски</option>
						<option value="3">Комплекты</option>
						<option value="4">Аксессуары</option>
						<option value="5">Услуги</option>
					</select>
					<div>
						<button class="red_button">Шаг 2</button>
					</div>
				</div>
			</form>
		{elseif $step == 2}
			<form id="new_ad_form" name="new_ad_form" action="/includes/my_add_ad.php?step=3" method="POST">
				<div id="div_step_2">
					<h2>Шаг 2/4</h2>
					{if $form_type == 1}
						<label for="tyres_width">Размер, см *</label>
						{$select_tyres_width} / {$select_tyres_height} R {$select_tyres_radius}
						{$label_and_select_tyres_season}
						<label for="tyres_price">Цена, руб *</label>
						<label for="tyres_min_price" class="inline">от</label>
						<input type="text" id="tyres_min_price" name="tyres_min_price" class="min" />
						<label for="tyres_max_price" class="inline">до</label>
						<input type="text" id="tyres_max_price" name="tyres_max_price" class="min" />
						{$label_and_select_tyres_brand}
						{$label_and_select_tyres_year}
						{$label_and_select_tyres_state}
						<label for="tyres_count">Количество</label>
						<input type="text" id="tyres_count" name="tyres_count" class="min" />
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
						{elseif $form_type == 2}
							<div class="inline">
								{$label_and_select_wheels_width}
							</div>
							<div class="inline">
								{$label_and_select_wheels_radius}
							</div>
							<div class="inline">
								{$label_and_select_wheels_pcd}
							</div>
							<div class="inline">
								{$label_and_select_wheels_et}
							</div>
							{$label_and_select_wheels_type}
							<label for="tyres_price">Цена, руб *</label>
							<label for="wheels_min_price" class="inline">от</label>
							<input type="text" id="wheels_min_price" name="wheels_min_price" class="min" />
							<label for="wheels_max_price" class="inline">до</label>
							<input type="text" id="wheels_max_price" name="wheels_max_price" class="min" />
							{$label_and_select_wheels_brand}
							{$label_and_select_wheels_year}
							{$label_and_select_wheels_state}
							<label for="wheels_count">Количество</label>
							<input type="text" id="wheels_count" name="wheels_count" class="min" />
							<div>
							<div class="inline">
								<label for="wheels_auto">Тип авто</label>
								<select id="wheels_auto" name="wheels_auto" class="long">
									<option>4x4</option>
									<option>Nissan</option>
									<option>Suzuki dsf sdf </option>
								</select>
							</div>
							<div class="inline">
								<label for="wheels_make">Марка</label>
								<select id="wheels_make" name="wheels_make" class="long">
									<option>Toyota</option>
									<option>Nissan</option>
									<option>Suzuk dsfs df dsi</option>
								</select>
							</div>
							<div class="inline">
								<label for="wheels_model">Модель</label>
								<select id="wheels_model" name="wheels_model" class="long" disabled="disabled">
									<option>---</option>
									<option>Ss</option>
									<option>2011 fsdf ds  sdg</option>
									<option>2010</option>
									<option>2009</option>
								</select>
							</div>
						{/if}
					</div>
					<div>
						<button class="red_button">Шаг 3</button>
					</div>
				</div>
			</form>
		{elseif $step == 3}
			<form id="new_ad_form" name="new_ad_form" action="/includes/my_add_ad.php?step=4" method="POST">
				<div id="div_step_3">
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
						<button class="red_button">Шаг 4</button>
					</div>
				</div>
			</form>
		{elseif $step == 4}
			<form id="new_ad_form" name="new_ad_form" action="/includes/my_add_ad.php?step=5" method="POST">
				<div id="div_step_4">
					<h2>Шаг 4/4</h2>
					<small>Загрузите фотографии для вашего объявления.</small>
					<small>Первая фотография автоматически становится аватаром.</small>
					<small>Максимум в объявлении может быть 15 фотографий.</small>
					<button class="green_button" id="upload_photo">Добавить фотографию</button>
					<div>
						<button class="red_button">Создать объявление</button>
					</div>
				</div>
			</form>
		{/if}
    </form>
  </section>
{/block}

