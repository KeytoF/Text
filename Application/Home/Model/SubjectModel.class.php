<?php
namespace Home\Model;
use Think\Model;
class SubjectModel extends Model {
	protected $_auto = array (
		array('sub_sign',0,1),
		array('sub_time','dates',1,'callback')
		);
	
	//时间
	protected function dates(){
		return date('Y-m-d');
	}
}
 ?>