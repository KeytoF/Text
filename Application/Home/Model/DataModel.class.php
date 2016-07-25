<?php
namespace Home\Model;
use Think\Model;
class DataModel extends Model {
	protected $_auto = array (
		array('dat_sign',0,1),
		array('dat_time','dates',1,'callback'),
		array('tea_id','Tea_ID',1,'callback')
		);
	
	//录入时间
	function dates(){
		return date('Y-m-d');
	}

	protected function Tea_ID(){
		return $_SESSION['Tea']['tea_id'];
	}
}

?>