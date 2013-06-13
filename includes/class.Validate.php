<?php
	class Validate
	{
		public static function is_Numeric($var) 
		{
			return true;
		}
		
		public static function is_Email($var)
		{
			return true;
		}	
		
		public static function is_Set($var)
		{
			return isset($var);
		}
		
		public static function is_Phone($var)
		{
			return true;
		}
		
		public static function is_Login($var)
		{
			return true;
		}
		
		public static function is_Contacts($var)
		{
			return true;
		}
		
		public static function is_Date($var)
		{
			return true;
		}
	}

?>