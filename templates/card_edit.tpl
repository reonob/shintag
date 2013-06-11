{extends file='page.tpl'}
{block name='links'}
  <link href="/css/card_edit.css" media="all" rel="stylesheet" />
  <script>
  </script>
{/block}
{block name='div.main' append}
  <article id="card_edit">
	<form id="edit_ad_form" name="edit_ad_form" action="/includes/edit.php" method="POST">
		{if $ad_arr['ad_type'] == 1}
			<label for="tyres_width">Размер, см *</label>
			{$select_tyres_width} / {$select_tyres_height} R {$select_tyres_radius}
			{$label_and_select_tyres_season}
			<label for="tyres_price">Цена, руб *</label>
			<input type="text" id="tyres_price" name="tyres_price" class="min" value="{$ad_arr['ad_price']}" />
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
		<div>
			<button class="red_button">Сохранить</button>
		</div>
	</form>
  </article>
{/block}