{extends file='reg_auth.tpl'}
{block name='title'}Регистрация{/block}
{block name='reg_auth_form'}
   {$errorMsg|default:''}
   {if isset($isAdded) && $isAdded}
      <p>На ваш e-mail было отправлено письмо с ссылкой
         для подтверждения регистрации. <b class="step">Шаг 2/3</b>.</p>
   {else}
   <p>Регистрация занимает всего пару минут и состоит из трех шагов. <b id="step_info" class="step">Шаг 1/3</b>.</p>
   <form id="registration_form" name="registration_form" action="/includes/registration.php" method="post">
      <div id="step1" style="display: block;">
         <div>
            <label for="login">Логин:</label>
            <input type="text" name="login" id="login" value="{$login}"/>
         </div>
         <div>
            <label for="email">E-mail:</label>
            <input type="email" name="email" id="email" value="{$email}"/>
         </div>
         <div>
            <label for="pass">Пароль:</label>
            <input type="password" name="pass" id="pass" />
         </div>
         <div>
            <label for="repass">Повторите пароль:</label>
            <input type="password" name="repass" id="repass" />
            </div>
         <div class="buttons">
            <button type="submit" name="submit" class="next" rel="1" value="register">Зарегистрироваться</button>
         </div>
      </div>
      <div id="step2" style="display: none;">
         <p>Пожалуйста подтвердите регистрацию, пройдя по ссылке, присланной вам на указанный вами e-mail.</p>
         <div class="buttons">
            <button class="next" rel="2">Шаг 3 ></button>
         </div>
      </div>
   </form>
   {/if}
{/block}