<?php
namespace Home\Model;
use Think\Model;
class StudentModel extends Model {
	protected $_auto = array (
		// array('cla_id','Cla_ID',1,'callback'),
		array('stu_pass','Stu_Pass',3,'callback'),
		array('stu_auth',0,1),
		array('stu_sign',0,1),
		array('stu_time','dates',1,'callback')
		);

	protected function Cla_ID(){
		return I('post.stu_fac').I('post.stu_maj').I('post.stu_cla');
	}

	//加密函数
	protected function Stu_Pass($Stu_Pass){
		return md5(sha1(I('post.stu_pass')));
	}
	
	protected function dates(){
		return date('Y-m-d');
	}

/*	protected $_link = array(
		'classs' => array(
			'mapping_type'	=> 	BELONGS_TO,
			'class_name'	=> 	'Classs',
			'foreign_key'	=> 	'cla_id',
			'mapping_name'	=>	'classs',
			'mapping_fields'=> 	'cla_name',
			'as_fields'		=>	'clas_name'
			)
		);
*/
// 'Maj_ID'
// 'Cla_ID'
// 'Dir_ID'
}
 ?>