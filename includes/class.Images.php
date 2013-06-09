<?php
	require_once 'connect.php';
	
	class ImagesHandler
	{
		public $table = 'images';
		public function ImagesHandler() 
		{
			
		}
		
		public function Insert($ad_id) 
		{
			global $db;
			$query = "INSERT INTO " . $this->table . "(id, ad_id) VALUES (NULL, ?)";
			$db->exec($query, array($ad_id));
			return $db->link->lastInsertId();
		}
		
		public function Delete($id) 
		{
			global $db;
			$query = "DELETE FROM " . $this->table . " WHERE " . $this->table . ".id = ?";
			$db->exec($query, array($id));
			
			unlink('./uploads/' . $id . '.jpg');
			unlink('./uploads/' . $id . '_s.jpg');
		}
		
		public function Select($ad_id) 
		{
			global $db;
			$query = "SELECT * FROM " . $this->table . " t WHERE t.ad_id = ?";
			return $db->query($query, array($ad_id));
		}
		
		public function Select_first($ad_id) 
		{
			$photos = $this->select($ad_id);
			return $photos[0];
		}
		
		public function Get_first_image_id($ad_id) 
		{
			$photo = $this->select_first($ad_id);
			return $photo['id'];
		}
	}
	$ImagesHandler = new ImagesHandler(); 
?>