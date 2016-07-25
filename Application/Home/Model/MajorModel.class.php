<?php
namespace Home\Model;
use Think\Model;
class MajorModel extends Model {
	protected $_auto = array (
		array('maj_sign',0,1),
		array('maj_righ',0,1),
		array('maj_all',0,1),
		array('maj_time','dates',1,'callback')
		);

	//时间
	protected function dates(){
		return date('Y-m-d');
	}

	/*protected $_link = array(
		'Fac' => array(
			'mapping_type'	=> 	BELONGS_TO,
			'class_name'	=> 	'faculty',
			'foreign_key'	=> 	'fac_id',
			'mapping_name'	=>	'Facultys',
			'mapping_fields'=> 	'fac_name',
			// 'as_fields'		=>	'fac_name'
			)
		);*/
}
?>