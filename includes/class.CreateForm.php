<?php
	require_once($_SERVER['DOCUMENT_ROOT'] . '/includes/connect.php');
	function get_select_from_table($db_link, $table_name, $fictive = false, $class = '', $id = '') {
		if ($id == '') {
			$id = $table_name;
		}
		$options = $db_link->query('SELECT * FROM ' . $table_name . ' i ORDER BY i.id');
		$result = '<select id="' . $id . '" name="' . $id . '" class="' . $class . '">';
		if ($fictive == true) {
			$result .= '<option value="unset"></option>';
		}
		foreach ($options as $option) {
			$result .= '<option value="' . $option['id'] .'">' . $option['name'] . '</option>';
		}
		$result .= '</select>';
		return $result;
	}
	 function get_label_and_select($db_link, $table_name, $rus_name, $fictive, $select_class = '', $id = '', $label_class = '') {
		if ($id == '') {
			$id = $table_name;
		}
		$result = '<label for="' . $id . '" class="' . $label_class . '">' . $rus_name . '</label>';
		$result .= get_select_from_table($db_link, $table_name, $fictive, $select_class, $id);
		return $result;
	 }
	/*
   function select_params($name, $id, $options, $multiple = 0, $disabled = 0, $class = '', $selected = array()) {
      $new_options = array();
      for ($i = 0; $i < count($options); $i++) {
         $new_options[$options[$i]] = in_array($i, $selected) + 0;
      }
      return array(
         'type' => 'select',
         'name' => $name,
         'id' => $id,
         'options' => $new_options,
         'multiple' => $multiple,
         'disabled' => $disabled,
         'class' => $class
      );
   }
   function text_params($text) {
      return array(
         'type' => 'text',
         'text' => $text
      );
   }
   function input_params($name, $id, $i_type = 'text', $class = '') {
      return array(
         'type' => 'input',
         'name' => $name,
         'id' => $id,
         'i_type' => $i_type,
         'class' => $class
      );
   }
   function slider_params($name, $id, $bot, $top, $class = '') {
      return array(
         'type' => 'slider',
         'name' => $name,
         'id' => $id,
         'bot' => $bot,
         'top' => $top,
         'class' => $class
      );
   }
   function special_params($special) {
      $arr_special = array(
         'prices_count' => 'create_prices_count',
         'price' => 'create_price',
         'country' => 'create_country',
         'city' => 'create_city',
         'category' => 'create_category',
         'subcategory' => 'create_subcategory',
         'shop' => 'create_shop',
         'brand' => 'create_brand',
         'find_button' => 'create_find_button',
         'free_search' => 'create_free_search'
      );
        return $arr_special[$special]();
   }
   function button_params($name, $id, $class = '') {
      return array(
         'type' => 'button',
         'name' => $name,
         'id' => $id,
         'class' => $class
      );
   }
   function create_free_search() {
      return input_params('Свободный поиск', 'free_search', 'text');
   }

   function create_prices_count() {
      return slider_params('Количество цен', 'prices_count', 'от', 'до', 'count_slider');
   }

   function create_price() {
      return slider_params('Цена', 'price', 'от', 'до', 'count_slider');
   }

   function create_country() {
      return select_params('Страна', 'country', array('Первая категория', 'Вторая категория'), 1, 0);
   }

   function create_city() {
      return select_params('Город', 'city', array('Первая категория', 'Вторая категория'), 1, 1);
   }

   function create_category() {
      return select_params('Категория', 'category', array('Первая категория', 'Вторая категория'), 1, 0);
   }

   function create_subcategory() {
      return select_params('Подкатегория', 'subcategory', array('Первая категория', 'Вторая категория'), 1, 1);
   }

   function create_shop() {
      return select_params('Магазин', 'shop', array('Первая категория', 'Вторая категория'), 1, 0);
   }

   function create_brand() {
      return select_params('Производитель', 'brand', array('Первая категория', 'Вторая категория'), 1, 0);
   }

   function create_find_button() {
      return button_params('Найти', 'find', 'ok blue_button');
   }

   class Form {
      var $prefix;
      var $fields;

      function Form($prefix) {
         $this->prefix = $prefix;
         $this->fields = array();
      }

      function set_prefix($prefix) {
         $this->prefix = $prefix;
      }

      function add_fields() {
         $args = func_get_args();
         foreach ($args as $params) {
            $this->fields[] = $params;
         }
      }

      function get_form_text() {
         $result = '';
         foreach ($this->fields as $field) {
            switch ($field['type']) {
               case 'select':
                  $id       = $this->prefix . $field['id'];
                  $name     = $field['name'];
                  $class    = $field['class'];
                  $options  = $field['options'];
                  $multiple = $field['multiple'];
                  $disabled = $field['disabled'];

                  $result .= '<label for="' . $id . '">' . $name . '</label>';
                  $result .= '<select id="' . $id . '" name="' . $id . '"' .
                              ($class ? ' class="' . $class . '"' : '') .
                              ($multiple ? ' multiple="multiple"' : '') .
                              ($disabled ? ' disabled="disabled"' : '') .
                              '>';
                  $i = 0;
                  foreach ($options as $option => $selected) {
                     $i++;
                     $result .= '<option value="' . $i . '"' . ($selected ? ' selected="selected"' : '') . '>' . $option . '</option>';
                  }
                  $result .= '</select>';
                  break;
               case 'slider':
                  $id = $this->prefix . $field['id'];
                  $name = $field['name'];
                  $class = $field['class'];
                  $bot = $field['bot'];
                  $top = $field['top'];
                  $result .= '<label for="' . $id . '_bottom">' . $name . '</label>';
                  $result .= '<label for="' . $id . '_bottom" class="inline">' . $bot . '</label> ';
                  $result .= '<input type="text" id="' . $id . '_bottom" name="' . $id . '_bottom" class="slider_input" />';
                  $result .= '<label for="' . $id . '_top" class="inline">' . $top . '</label> ';
                  $result .= '<input type="text" id="' . $id . '_top" name="' . $id . '_top" class="slider_input" />';
                  $result .= '<div id="' . $id . '_slider"' . ($class ? ' class="' . $class . '"' : '') . '></div>';
                  break;
               case 'text':
                  $result .= $text;
                  break;
               case 'button':
                  $id = $this->prefix . $field['id'];
                  $name = $field['name'];
                  $class = $field['class'];
                  $result .= '<button id="' . $id . '"' . ($class ? ' class="' . $class . '"' : '') . '>' . $name . '</button>';
                  break;
               case 'input':
                  $id = $this->prefix . $field['id'];
                  $name = $field['name'];
                  $i_type = $field['i_type'];
                  $class = $field['class'];
                  $result .= '<label for="' . $id . '">' . $name . '</label>';
                  $result .= '<input id="' . $id . '" name="' . $id . '"' .
                             ($class ? ' class="' . $class . '"' : '') .
                             ($i_type != 'text' ? ' type="' . $i_type . '"' : '') . '/>';
                  break;
            }
         }
         return $result;
      }
   }
   */
?>