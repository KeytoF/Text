<?php
namespace Home\Model;
use Think\Model;
class FacultyModel extends Model {
	protected $_auto = array (
		array('fac_sign',0,1),
		array('fac_time','dates',1,'callback')
		);

	//时间
	protected function dates(){
		return date('Y-m-d');
	}
}
 ?>