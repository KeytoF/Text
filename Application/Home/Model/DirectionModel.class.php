<?php
namespace Home\Model;
use Think\Model;
class DirectionModel extends Model {
	protected $_auto = array (
		array('Dir_Sign',1,1),
		array('Dir_Time','dates',1,'callback')
		);

	//时间
	protected function dates(){
		return date('Y-m-d');
	}
}
 ?>