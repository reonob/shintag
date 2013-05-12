<?php
   define('CONFIRMATION_TERM', 1800); //86400
   define('COOKIE_LIFETIME', 86400000);
   define('COOKIE_SITE', "kolesa.su.com");
   define('ERROR_QUERY', 'В данный момент невозможно подключение к базе данных.');
   define('ERROR_MAIL', 'Подтверждение e-mail невозможно.');
   define('ERROR_MAIL_ALREADY_REGISTERED', 'Этот e-mail уже зарегистрирован, используйте другой.');
   define('ERROR_MAIL_CONFIRM', 'Не истекло время подтверждения e-mail.');
   define('ERROR_MAIL_CONFIRM_EXPIRED', 'Истекло время подтверждения e-mail.');
   define('ERROR_LOGIN', 'Неверное имя пользователя или пароль.');
   define('ERROR_PASS', 'Неверный пароль.');
   define('INCORRECT_MAIL', 'Введен неверный e-mail.');
   define('SEND_INCORRECT_MAIL', 'Неправильный e-mail.');
   define('ERROR_CHANGE_MAIL', 'Невозможно изменить e-mail.');
   define('ERROR_FORM_FILL', 'Некорректно заполнена форма.');
   define('PASS_LEN', 6);
   define('ERROR_PASS_LEN', 'Пароль должен быть длиннее '.PASS_LEN.'-ти символов.');
   define('LOGIN_LEN', 6);
   define('ERROR_LOGIN_LEN', 'Пароль должен быть длиннее '.LOGIN_LEN.'-ти символов.');
   define('ERROR_FORGOTTEN_PASS', 'Невозможно активировать пароль.');
   define('ERROR_OLD_NEW_PASS', 'Введенные пароли не совпадают.');
   define('ERROR_INVALID_EMAIL', 'Введен недействительный e-mail.');
   define('ERROR_CAPTCHA', 'Ошибка при вводе символов с картинки');
   define('NUMBER_OF_LOGIN_ATTEMPTS', 3);
?>