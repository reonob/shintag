<h1>Изменение пароля</h1>
<p style="font-weight: bold">{$errorMsg|default:''}</p>
<p style="font-weight: bold">{$successMsg|default:''}</p>
<table>
  <tr>
    <td class="label"><label for="old_pass">Старый пароль</label></td>
    <td><input type="password" id="old_pass" name="old_pass" /></td>
  </tr>
  <tr>
    <td class="label"><label for="new_pass">Новый пароль</label></td>
    <td><input type="password" id="new_pass" name="new_pass" /></td>
  </tr>
  <tr>
    <td class="label"><label for="rep_pass">Повторите пароль</label></td>
    <td><input type="password" id="rep_pass" name="rep_pass" /></td>
  </tr>
  <tr>
    <td colspan="2" class="buttons"><button id="send_data" class="blue_button" name="submit" value="submit">Применить</button></td>
  </tr>
</table>