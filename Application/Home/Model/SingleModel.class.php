<?php
namespace Home\Model;
use Think\Model;
class SingleModel extends Model {
	protected $_auto = array (
		array('sin_sign',0,1),
		array('sin_righ',0,1),
		array('sin_all',0,1),
		array('tea_id','Tea_ID',1,'callback'),
		array('sin_time','dates',1,'callback')
		);

	//时间
	protected function dates(){
		return date('Y-m-d');
	}

	protected function Tea_ID(){
		return $_SESSION['Tea']['tea_id'];
	}
}
 ?>