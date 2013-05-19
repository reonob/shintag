<h1>Изменение логина</h1>
<p style="font-weight: bold">{$errorMsg|default:''}</p>
<p style="font-weight: bold">{$successMsg|default:''}</p>
<table>
  <tr>
    <td class="label"><label for="new_login">Новый логин</label></td>
    <td><input id="new_login" name="new_login" /></td>
  </tr>
  <tr>
    <td colspan="2" class="buttons"><button id="send_data" class="red_button" name="submit" value="submit">Применить</button></td>
  </tr>
</table>