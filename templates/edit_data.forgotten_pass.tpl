<h1>Напомнить пароль</h1>

{if $isAdded}
  <p style="font-weight: bold; text-align: center">На указанный вами e-mail отправленно письмо с вашим новым паролем и ссылкой для подтверждения его изменения.</p>
{else}
  <p style="font-weight: bold; text-align: center">{$errorMsg|default:''}</p>
  <table>
    <tr>
      <td colspan="2" class="small">На указанный вами e-mail будет отправленно письмо с вашим новым паролем и ссылкой для подтверждения его изменения.</td>
    </tr>
    <tr>
      <td class="label"><label for="email">Ваш e-mail</label></td>
      <td><input type="mail" id="email" name="email" /></td>
    </tr>
    <tr>
      <td colspan="2" class="buttons"><button id="send_data" class="red_button" name="submit" value="submit">Отправить</button></td>
    </tr>
  </table>
{/if}