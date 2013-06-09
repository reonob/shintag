<h1>Изменение e-mail</h1>
{if $isSend}
  <p style="font-weight: bold; text-align: center">На указанный вами e-mail отправлено письмо с ссылкой для подтверждения смены e-mail.</p>
{else}
<p style="font-weight: bold; text-align: center">{$errorMsg|default:''}</p>
<table>
  <tr>
    <td class="label"><label for="new_mail">Новый e-mail</label></td>
    <td><input type="mail" id="new_mail" name="new_mail" /></td>
  </tr>
  <tr>
    <td colspan="2" class="small">На указанный вами e-mail будет отправленно письмо с ссылкой для подтверждения ваших действий.</td>
  </tr>
  <tr>
    <td colspan="2" class="buttons"><button id="send_data" class="red_button" name="submit" value="submit">Продолжить</button></td>
  </tr>
</table>
{/if}