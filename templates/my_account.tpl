{extends file='my_acc.base.tpl'}
{block name='title' append} - Учетная запись{/block}
{block name='links' append}
{literal}
<script type="text/javascript">
	$(function() {
	   $('#contact_info_form').submit(function() {
	   	var $form = $(this);
			$.post("/includes/change_contact_info.php", {
				'country_id': $form.find('#p_country option:selected').val(),
				'region_id': $form.find('#p_district option:selected').val(),
				'city_id': $form.find('#p_city option:selected').val(),
				'phone': $form.find('input[name="p_tel"]').val(),
				'skype': $form.find('input[name="p_skype"]').val(),
				'other_info': $form.find('#p_others').val(),
				'adress': $form.find('#p_adress').val()
			}, function(data) {
				if (!data.result) {
					alert(data.message)
				}
         }, "json");
	      return false;
		});
		$('#info_about button').click(function() {
			alert('f');
			$.post("/includes/change_contact_info.php", {
				'about': $('#p_about').val()
			}, function(data) {
				if (!data.result) {
					alert(data.message)
				}
			}, "json");
			return false;
		});
	});
</script>
{/literal}
{/block}
{block name='top_menu'}
<li class="active">Учетная запись</li>
<li><a href="/includes/my_add_ad.php">Добавить объявления</a></li>
<li><a href="/includes/my_favourite.php">Избранное</a></li>
<li><a href="/includes/my_money.php">Управление счетом</a></li>
{/block}
{block name='content_wrap'}
<section id="person_settings">
	<h1>{$contact_info.login|default:""}</h1>
	<div class="column">
	  <span><a href="#">Ссылка на мой профиль</a></span>
	  <span>Просмотров профиля: <b>45</b></span>
	  <span>Мои цены лайнкули: <b>78</b></span>
	  <span>Мои цены добавили: <b>41</b></span>
	</div>
	<div class="column">
	  <span class="with_icon"><span class="i_bay"></span><a href="#">Купить платный аккаунт</a></span>
	  <span class="with_icon"><span class="i_edit"></span>
		<a href="/includes/edit_data.php?type=change_login">Сменить логин</a></span>
	  <span class="with_icon"><span class="i_password"></span>
		<a href="/includes/edit_data.php?type=change_pass">Сменить пароль</a></span>
	</div>
	<div class="column">
	  <span class="with_icon"><span class="i_del"></span>
		<a href="/includes/edit_data.php?type=delete_acc">Удалить аккаунт</a></span>
	</div>
	<div id="info_about">
		<h2><label>Информация для остальных пользователей</label></h2>
		<textarea id="p_about" name="p_about" cols="70" rows="12">{$contact_info.about|default:"Нет информации."}</textarea>
		<button class="red_button">Изменить</button>
	</div>
	<section id="contact_info">
	  <form id="contact_info_form">
		<h1 class="after_arrow dropdown_head">Контактные данные</h1>
		<div class="dropdown_block">
		  <div class="column">
			<label for="p_country">Страна:</label>
			<select id="p_country" name="p_country">
				<option value="0">Не указано</option>
				{html_options options=$geo_locations.countries selected=$contact_info.country_id|default:0}
			</select>
			<label for="p_district">Регион:</label>
			<select id="p_district" name="p_district">
				<option value="0">Не указано</option>
				{html_options options=$geo_locations.regions selected=$contact_info.region_id|default:0}
			</select>
			<label for="p_city">Город:</label>
			<select id="p_city" name="p_city">
			  <option value="0">Не указано</option>
			  {html_options options=$geo_locations.cities selected=$contact_info.city_id|default:0}
			</select>
		  </div>
		  <div class="column">
			<label for="p_tel">Телефон:</label><input type="tel" id="p_tel" name="p_tel" value="{$contact_info.phone|default:""}" />
			<label for="p_skype">Skype:</label><input id="p_skype" name="p_skype" value="{$contact_info.skype|default:""}" />
			<label for="p_others">Другие контакты:</label><textarea id="p_others" name="p_others">{$contact_info.other_info|default:""}</textarea>
		  </div>
		  <div class="column">
			<label for="p_adress">Адрес:</label><textarea id="p_adress" name="p_adress">{$contact_info.adress|default:""}</textarea>
			<label>E-mail: <b>{$contact_info.email|default:""}</b></label>
			<span class="with_icon"><span class="i_mail"></span><a href="/includes/edit_data.php?type=change_email">Сменить e-mail</a></span>
			<button class="red_button">Принять изменения</button>
		  </div>
		</div>
	  </form>
	</section>
</section>
{include file='catalog.tpl'}
{/block}