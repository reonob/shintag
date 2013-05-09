<header>
	<div id="full_menu">
		<nav class="left">
			<ul>
				<li><a href="/news.php?category=all">Новости</a></li>
				<li><a href="/includes/top8_discounts.php">Топ 8</a></li>
				<li><a href="#">Добавить объявление</a></li>
			</ul>
		</nav>
		<nav class="right">
			<ul>
			{if isset($isLogin) && $isLogin}
				<li><a href="/includes/my_account.php">Мой аккаунт</a></li>
				<li id="logout"><a href="">Выйти</a></li>
			{else}
				<li>
					<a href="javascript:void(0)" tabindex="0">Войти</a>
					<form id="fast_login" action="/includes/login.php" method="post">
						<div><label for="fast_login_mail">E-mail:</label><input type="email" name="email" id="fast_login_mail" /></div>
						<div><label for="fast_login_pass">Пароль:</label><input type="password" name="pass" id="fast_login_pass" /></div>
						<div>
							<button id="fast_login_submit" type="submit" name="submit" value="login">Войти</button>
							<button id="remind">Забыли пароль?</button>
						</div>
					</form>
				</li>
				<li><a href="/includes/registration.php">Регистрация</a></li>
			{/if}
			</ul>
		</nav>
	</div>
</header>
