<?php
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/container.php';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/class.CreateForm.php';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/guardian.php';

   $form = new Form('excel_');
   $form->add_fields(
      special_params('prices_count'),
      select_params('Стиль отображения', 'style', array('Логотип маназина', 'Категория', 'Производитель', 'Страна, город', 'Старая цена'), 1, 0, '', array(1, 2, 3)),
      button_params('Сохранить файл', 'save', 'ok blue_button')
   );
   $smarty->assign('form', $form->get_form_text());
   $smarty->display('my_account.tpl');
?>