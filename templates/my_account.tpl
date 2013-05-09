{extends file='my_acc.2column.base.tpl'}
{block name='title' append} - Учетная запись{/block}
{block name='links' append}
  <link href="/css/ui-slider.css" media="all" rel="stylesheet" />
  {literal}
  <script>
    $(function() {
      $("#excel_prices_count_slider").slider({
        range: true,
        min: 0,
        max: 500,
        values: [ 75, 300 ]
      });
    });
  </script>
  {/literal}
{/block}
{block name='top_menu'}
  <li class="active">Учетная запись</li>
  <li><a href="/includes/my_add_ad.php">Добавить объявления</a></li>
  <li><a href="/includes/my_prices.php">Мои цены</a></li>
  <li><a href="/includes/my_shops.php">Мои магазины</a></li>
  <li><a href="/includes/my_stat.php">Моя статистика</a></li>
{/block}
{block name='left_column' append}
  <section id="excel_settings">
    <h1 class="after_arrow dropdown_head">Сохранить в Excel</h1>
    <div class="dropdown_block">
      <form id="excel_form" name="excel_form">
        {$form}
      </form>
    </div>
  </section>
{/block}
{block name='account_search_input'}Поиск по моим объявлениям{/block}
{block name='center_column'}
  <section id="person_settings">
    <div id="my_avatar">
      <img src="/images/shops/amazon.png" />
      <div class="avatar_buttons">
        <button class="edit"></button>
        <button class="delete"></button>
      </div>
    </div>
    <h1>Amazon</h1>
    <div class="column">
      <span><a href="#">Ссылка на мой профиль</a></span>
      <span>Просмотров профиля: <b>45</b></span>
      <span>Мои цены лайнкули: <b>78</b></span>
      <span>Мои цены добавили: <b>41</b></span>
    </div>
    <div class="column">
      <span class="with_icon"><span class="i_bay"></span><a href="#">Купить платный аккаунт</a></span>
      <span class="with_icon"><span class="i_edit"></span>
        <a href="/includes/edit_data.php?type=change_login">Сменить логин</a></span>
      <span class="with_icon"><span class="i_password"></span>
        <a href="/includes/edit_data.php?type=change_pass">Сменить пароль</a></span>
    </div>
    <div class="column">
      <span class="with_icon"><span class="i_privacy"></span><a href="#">Изменить настройки приватности</a></span>
      <span class="with_icon"><span class="i_del"></span>
        <a href="/includes/edit_data.php?type=delete_acc">Удалить аккаунт</a></span>
    </div>

    <section id="contact_info">
      <form id="contact_info_form">
        <h1 class="after_arrow dropdown_head">Контактные данные</h1>
        <div class="dropdown_block">
          <div class="column">
            <label for="p_country">Страна:</label>
            <select id="p_country" name="p_country">
              <option value="1">Англия</option>
              <option value="2" selected="selected">Россия</option>
            </select>
            <label for="p_city">Город:</label>
            <select id="p_city" name="p_city">
              <option value="1">Нижний Новгород</option>
              <option value="2" selected="selected">Владивосток</option>
            </select>
            <label for="p_tel">Телефон:</label><input type="tel" id="p_tel" name="p_tel" value="89157016320" />
          </div>
          <div class="column">
            <label for="p_adress">Адрес:</label><textarea id="p_adress" name="p_adress">Пологая 69, к.6</textarea>
            <span class="with_icon"><span class="i_mail"></span><a href="/includes/edit_data.php?type=change_email">Сменить e-mail</a></span>
            <button class="blue_button">Принять изменения</button>
          </div>
        </div>
      </form>
    </section>
  </section>
  <div id="top_head" class="my_ads">
    <h2>Всего добавлено объявлений (702)</h2>
    <a href="#" class="dark_button" id="show_on_map">Показать на карте</a>
  </div>
  <h1 id="settings_prices" class="after_arrow dropdown_head my_ads">Настройки</h1>
  <div class="dropdown_block">
    <form id="settings_form" name="settings_form">
      <label for="set_auto">Автопрокрутка</label>
      <input type="checkbox" name="set_auto" id="set_auto" />
      <label for="set_num">Показывать по</label>
      <select name="set_num" id="set_num">
        <option value="1">20</option>
        <option value="2">50</option>
        <option value="3">75</option>
      </select>
      <label for="set_currency">Цены</label>
      <select name="set_currency" id="set_currency">
        <option value="1">в рублях</option>
        <option value="2">в долларах</option>
        <option value="3">в юанях</option>
      </select>
    </form>
  </div>
  <article class="price_article my_ad">
    <table>
      <tr>
        <td rowspan="4" class="shop_avatar">
          <a href="#"><img src="/images/shops/amazon.png" /></a>
        </td>
        <td>
          <h1>Iphone 5 32GB White (б/у)</h1>
        </td>
        <td class="price red" rowspan="2">3000$</td>
      </tr>
      <tr>
        <td rowspan="2" class="description">
          <span class="breadcrumbs"><a href="#">Смартфоны</a> > <a href="#">Apple</a></span>
          <span class="city">Россия, г. Нижний Новгород</span>
          <span class="deffects">Деффекты: <b>разбитое стекло, деффект клавиатуры</b></span>
        </td>
      </tr>
      <tr>
        <td class="right_description">
          <span class="old_price">2900$</span>
        </td>
      </tr>
      <tr>
        <td class="shop"><a href="#">Amazon</a></td>
        <td class="buttons">
          <div class="share share_to_left">
            <div>
              <ul>
                <li><a href="#" class="twitter" title="Twitter"></a></li>
                <li><a href="#" class="facebook" title="Facebook"></a></li>
                <li><a href="#" class="googleplus" title="Google+"></a></li>
                <li><a href="#" class="vkontakte" title="Vkontakte"></a></li>
              </ul>
            </div>
            <button class="light_button">Поделиться</button>
          </div>
          <button class="add active">17</button>
          <button class="like active">1</button>
        </td>
      </tr>
    </table>
    <div class="control">
      <button class="edit"></button>
      <button class="stats"></button>
      <button class="delete"></button>
    </div>
  </article>
  <article class="price_article my_ad">
    <table>
      <tr>
        <td rowspan="4" class="shop_avatar">
          <a href="#"><img src="/images/shops/amazon.png" /></a>
        </td>
        <td>
          <h1>Iphone 5 32GB White</h1>
        </td>
        <td class="price" rowspan="2">3000$</td>
      </tr>
      <tr>
        <td rowspan="2" class="description">
          <span class="breadcrumbs"><a href="#">Смартфоны</a> > <a href="#">Apple</a></span>
          <span class="city">Россия, г. Нижний Новгород</span>
        </td>
      </tr>
      <tr>
        <td class="right_description">
          <span class="go_to"><a href="#">Перейти к товару</a></span>
        </td>
      </tr>
      <tr>
        <td class="shop"><a href="#">Amazon</a></td>
        <td class="buttons">
          <div class="share share_to_left">
            <div>
              <ul>
                <li><a href="#" class="twitter" title="Twitter"></a></li>
                <li><a href="#" class="facebook" title="Facebook"></a></li>
                <li><a href="#" class="googleplus" title="Google+"></a></li>
                <li><a href="#" class="vkontakte" title="Vkontakte"></a></li>
              </ul>
            </div>
            <button class="light_button">Поделиться</button>
          </div>
          <button class="add active">3</button>
          <button class="like active">7</button>
        </td>
      </tr>
    </table>
    <div class="control">
      <button class="edit"></button>
      <button class="stats"></button>
      <button class="delete"></button>
    </div>
  </article>
  <article class="price_article my_ad">
    <table>
      <tr>
        <td rowspan="4" class="shop_avatar">
          <a href="#"><img src="/images/shops/amazon.png" /></a>
        </td>
        <td>
          <h1>Iphone 5 32GB White</h1>
        </td>
        <td class="price green" rowspan="2">2100$</td>
      </tr>
      <tr>
        <td rowspan="2" class="description">
          <span class="breadcrumbs"><a href="#">Смартфоны</a> > <a href="#">Apple</a></span>
          <span class="city">Россия, г. Нижний Новгород</span>
        </td>
      </tr>
      <tr>
        <td class="right_description">
          <span class="old_price">2500$</span>
        </td>
      </tr>
      <tr>
        <td class="shop"><a href="#">Amazon</a></td>
        <td class="buttons">
          <div class="share share_to_left">
            <div>
              <ul>
                <li><a href="#" class="twitter" title="Twitter"></a></li>
                <li><a href="#" class="facebook" title="Facebook"></a></li>
                <li><a href="#" class="googleplus" title="Google+"></a></li>
                <li><a href="#" class="vkontakte" title="Vkontakte"></a></li>
              </ul>
            </div>
            <button class="light_button">Поделиться</button>
          </div>
          <button class="add active">1</button>
          <button class="like active"></button>
        </td>
      </tr>
    </table>
    <div class="control">
      <button class="edit"></button>
      <button class="stats"></button>
      <button class="delete"></button>
    </div>
  </article>
  <article class="price_article my_ad">
    <table>
      <tr>
        <td rowspan="4" class="shop_avatar">
          <a href="#"><img src="/images/shops/amazon.png" /></a>
        </td>
        <td>
          <h1>Iphone 5 32GB White</h1>
        </td>
        <td class="price red" rowspan="2">3000$</td>
      </tr>
      <tr>
        <td rowspan="2" class="description">
          <span class="breadcrumbs"><a href="#">Смартфоны</a> > <a href="#">Apple</a></span>
          <span class="city">Россия, г. Нижний Новгород</span>
        </td>
      </tr>
      <tr>
        <td class="right_description">
          <span class="old_price">2800$</span>
          <span class="go_to"><a href="#">Перейти к товару</a></span>
        </td>
      </tr>
      <tr>
        <td class="shop"><a href="#">Amazon</a></td>
        <td class="buttons">
          <div class="share share_to_left">
            <div>
              <ul>
                <li><a href="#" class="twitter" title="Twitter"></a></li>
                <li><a href="#" class="facebook" title="Facebook"></a></li>
                <li><a href="#" class="googleplus" title="Google+"></a></li>
                <li><a href="#" class="vkontakte" title="Vkontakte"></a></li>
              </ul>
            </div>
            <button class="light_button">Поделиться</button>
          </div>
          <button class="add active">4</button>
          <button class="like active">1</button>
        </td>
      </tr>
    </table>
    <div class="control">
      <button class="edit"></button>
      <button class="stats"></button>
      <button class="delete"></button>
    </div>
  </article>
{/block}