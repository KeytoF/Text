<?php
namespace Home\Model;
use Think\Model;
class GradeModel extends Model {
	protected $_auto = array (
		array('gra_sign',0,1),
		array('gra_graa',0,1),
		array('stu_id','Student',1,'callback'),
		array('gra_time','dates',1,'callback')
		);

	//时间
	protected function dates(){
		return date('Y-m-d');
	}

	protected function Student(){
		return $_SESSION['Stu']['stu_id'];
	}
}
 ?>