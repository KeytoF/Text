<?php
namespace Home\Model;
use Think\Model;
class ArrangementModel extends Model {
	protected $_auto = array (
		array('arr_sign',0,1),
		array('arr_time','dates',1,'callback')
		);

	//时间
	protected function dates(){
		return date('Y-m-d');
	}
}
?>