<h1>Изменение e-mail</h1>
<p style="font-weight: bold">{$errorMsg|default:''}</p>
<p style="font-weight: bold">{$successMsg|default:''}</p>
<table>
  <tr>
    <td class="label"><label for="new_mail">Новый e-mail</label></td>
    <td><input type="mail" id="new_mail" name="new_mail" /></td>
  </tr>
  <tr>
    <td colspan="2" class="small">На указанный вами e-mail будет отправленно письмо с ссылкой для подтверждения ваших действий.</td>
  </tr>
  <tr>
    <td colspan="2" class="buttons"><button id="send_data" class="blue_button" name="submit" value="submit">Продолжить</button></td>
  </tr>
</table>