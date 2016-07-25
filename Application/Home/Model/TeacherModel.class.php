<?php
namespace Home\Model;
use Think\Model;
class TeacherModel extends Model {
	protected $_auto = array (
		array('tea_auth',1,1),
		array('tea_sign',0,1),
		array('tea_pass','Pass',3,'callback'),
		array('tea_time','dates',1,'callback')
		);

	//加密函数
	protected function Pass($Tea_Pass){
		return md5(sha1($Tea_Pass));
	}

	protected function dates(){
		return date('Y-m-d');
	}
}
 ?>