{extends file='reg_auth.tpl'}
{block name='title'}Авторизация{/block}
{block name='reg_auth_form'}
  <p>Пожалуйста, войдите в свой аккаунт, или, если у вас его еще нет, то пройдите <a href="registration.php">моментальную регистрацию</a>!</p>
  {$errorMsg|default:''}
  <form id="login_form" name="login_form" action="/includes/login.php" method="post">
    <div>
      <label for="mail">E-mail:</label>
      <input type="email" name="email" id="mail" value='{$email}' />
    </div>
    <div><label for="pass">Пароль:</label><input type="password" name="pass" id="pass" /></div>
    {if $hasCaptcha|default:false}
        <div><label for="keystring">Введите текст с картинки:</label>
        <img src="{$captcha_img_url}"></div>
        <div><input type="text" name="keystring" id="keystring" /></div>
    {/if}
    <div>
      <button id="send" type="submit" name="submit" value="login">Войти</button>
      <button id="remind">Забыли пароль?</button>
    </div>
  </form>
{/block}