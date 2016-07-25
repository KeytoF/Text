<?php
namespace Home\Model;
use Think\Model;
class PaperModel extends Model {
	protected $_auto = array (
		array('pap_sign',0,1),
		array('pap_star',0,1),
		array('tea_id','Tea_ID',1,'callback'),
		array('pap_time','dates',1,'callback')
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