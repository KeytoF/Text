<?php
namespace Home\Model;
use Think\Model;
class JudgeModel extends Model {
	protected $_auto = array (
		array('jud_sign',0,1),
		array('jud_righ',0,1),
		array('jud_all',0,1),
		array('tea_id','Tea_ID',1,'callback'),
		array('jud_time','dates',1,'callback')
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