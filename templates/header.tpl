<header>
	<div id="full_menu">
		<nav class="left">
			<ul>
				<li><a href="/includes/news.php?category=all">Новости</a></li>
				<li><a href="/includes/top8_discounts.php">Услуги</a></li>
				<li><a href="#">Добавить объявление</a></li>
			</ul>
		</nav>
		<nav class="right">
			<ul>
				<li>
					<a href="javascript:void(0)" tabindex="0">Войти</a>
					<form id="fast_login" action="/includes/login.php" method="post">
						<div><label for="fast_login_mail">E-mail:</label><input type="email" name="email" id="fast_login_mail" /></div>
						<div><label for="fast_login_pass">Пароль:</label><input type="password" name="pass" id="fast_login_pass" /></div>
						<div>
							<button id="fast_login_submit" type="submit" name="submit" value="login">Войти</button>
							<button id="fast_login_remind">Забыли пароль?</button>
						</div>
					</form>
				</li>
				<li><a href="/includes/registration.php">Регистрация</a></li>
			</ul>
		</nav>
	</div>
</header>