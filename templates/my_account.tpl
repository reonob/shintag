{extends file='page.header_find.menu.1column.tpl'}
{block name='title' append} - Учетная запись{/block}
{block name='top_menu'}
  <li class="active">Учетная запись</li>
  <li><a href="/includes/my_add_ad.php">Добавить объявления</a></li>
  <li><a href="/includes/my_favourite.php">Избранное</a></li>
  <li><a href="/includes/my_money.php">Управление счетом</a></li>
{/block}
{block name='top_part' append}
	<section id="person_settings">
		<h1>Amazon</h1>
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
			<p>Бла бла бла бла бла бла бла.</p>
			<button class="red_button">Изменить</button>
		</div>
		<section id="contact_info">
		  <form id="contact_info_form">
			<h1 class="after_arrow dropdown_head">Контактные данные</h1>
			<div class="dropdown_block">
			  <div class="column">
				<label for="p_country">Страна:</label>
				<select id="p_country" name="p_country">
				  <option value="1">Англия</option>
				  <option value="2" selected="selected">Россия</option>
				</select>
				<label for="p_district">Регион:</label>
				<select id="p_district" name="p_district">
				  <option value="1" selected="selected">Приморский край</option>
				  <option value="2">Владивосток</option>
				</select>
				<label for="p_city">Город:</label>
				<select id="p_city" name="p_city">
				  <option value="1">Нижний Новгород</option>
				  <option value="2" selected="selected">Владивосток</option>
				</select>
			  </div>
			  <div class="column">
				<label for="p_tel">Телефон:</label><input type="tel" id="p_tel" name="p_tel" value="89157016320" />
				<label for="p_skype">Skype:</label><input id="p_skype" name="p_skype" value="kostya" />
				<label for="p_others">Другие контакты:</label><textarea id="p_others" name="p_others">401542</textarea>
			  </div>
			  <div class="column">
				<label for="p_adress">Адрес:</label><textarea id="p_adress" name="p_adress">Пологая 69, к.6</textarea>
				<span class="with_icon"><span class="i_mail"></span><a href="/includes/edit_data.php?type=change_email">Сменить e-mail</a></span>
				<button class="red_button">Принять изменения</button>
			  </div>
			</div>
		  </form>
		</section>
  </section>
{/block}
{block name='bottom'}
	{include file='catalog.tpl'}
{/block}