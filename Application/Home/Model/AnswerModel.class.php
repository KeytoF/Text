<?php
namespace Home\Model;
use Think\Model;
class AnswerModel extends Model {
	protected $_auto = array (
		array('ans_sign',0,1),
		array('ans_righ',0,1),
		array('ans_all',0,1),
		array('tea_id','Tea_ID',1,'callback'),
		array('ans_time','dates',1,'callback')
		);

	//时间
	protected function dates(){
		return date('Y-m-d');
	}

	protected function Tea_ID(){
		// exit($_SESSION['Tea']['tea_id']);
		return $_SESSION['Tea']['tea_id'];
	}
}
?>