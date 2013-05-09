<h1>Напомнить пароль</h1>
<p style="font-weight: bold">{$errorMsg|default:''}</p>
<p style="font-weight: bold">{$successMsg|default:''}</p>
<table>
  <tr>
    <td colspan="2" class="small">На указанный вами e-mail будет отправленно письмо с вашим новым паролем и ссылкой для подтверждения его изменения.</td>
  </tr>
  <tr>
    <td class="label"><label for="mail">Ваш e-mail</label></td>
    <td><input type="mail" id="mail" name="mail" /></td>
  </tr>
  <tr>
    <td colspan="2" class="buttons"><button id="send_data" class="blue_button" name="submit" value="submit">Отправить</button></td>
  </tr>
</table>