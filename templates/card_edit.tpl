{extends file='page.header_find.tpl'}
{block name='links'}
  <link href="/css/card_edit.css" media="all" rel="stylesheet" />
  <script src="/js/ajaxupload.3.5.js"></script>
  <script>
	$(function() {
		window.ad_id = {$ad_id};
	});
  </script>
  <script src="/js/images_upload.js"></script>
  <script src="/js/check_form.js"></script>
{/block}
{block name='div.main' append}
<form id="edit_ad_form" name="edit_ad_form" action="/includes/card_edit.php?ad_id={$ad_id}" method="POST">
  <article id="card_edit">
	<div class="column">
			{if $ad_arr['ad_type'] == 1}
				<label for="tyres_width">Размер, см *</label>
				{$select_tyres_width} / {$select_tyres_height} R {$select_tyres_radius}
				{$label_and_select_tyres_season}
				<label for="ad_price">Цена, руб *</label>
				<input type="text" id="ad_price" name="ad_price" class="min" value="{$ad_arr['ad_price']}" />
				{$label_and_select_tyres_brand}
				{$label_and_select_tyres_year}
				{$label_and_select_tyres_state}
				<label for="tyres_count">Количество*</label>
				<input type="text" id="tyres_count" name="tyres_count" class="min" value="{$ad_arr['tyres_count']}" />
				<!--<div>
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
				</div>-->
			{/if}
			<!--<div>
				<button class="red_button" name="submit" value="submit">Сохранить</button>
			</div>-->
	</div>
	<div class="column">
		<label for="ad_name">Заголовок объявления *</label>
		<input type="text" id="ad_name" name="ad_name" size="70" value="{$ad_arr['ad_name']}" />
		<label for="ad_text">Текст объявления *</label>
		<textarea name="ad_text" id="ad_text" rows="15" cols="100">{$ad_arr['ad_text']}</textarea>
		<label for="ad_contacts">Контактные данные *</label>
		<small>Только телефоны. Каждый контакт с новой строки.</small>
		<textarea name="ad_contacts" id="ad_contacts" rows="5">{$ad_arr['ad_contacts']}</textarea>
		<label for="ad_mail">E-mail</label>
		<input type="mail" id="ad_mail" name="ad_mail" size="40" value="{$ad_arr['ad_mail']}" />
		<div id="bottom_part">
			<small>Загрузите фотографии для вашего объявления.</small>
			<small>Первая фотография автоматически становится аватаром.</small>
			<small>Максимум в объявлении может быть 15 фотографий.</small>
			<button class="green_button" id="upload_photo">Добавить фотографию</button>
			<div id="photos_div">
				{foreach from=$images item=image}
					<div class="in_image"><img src="/includes/uploads/{$image.id}_s.jpg" /><button data="{$image.id}">X</button></div>
				{/foreach}
			</div>
			<span id="status_photo"></span>
			<div>
				<button class="red_button" name="submit" value="submit">Сохранить и перейти на страницу объявления</button>
			</div>
		</div>
	</div>
  </article>
</form>
{/block}