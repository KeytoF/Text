<?php
namespace Home\Model;
use Think\Model;
class ClasssModel extends Model {
	protected $_auto = array (
		array('cla_sign',0,1),
		array('maj_id','Maj_id',1,'callback'),
		array('cla_time','dates',1,'callback')
		);

	//时间
	protected function dates(){
		return date('Y-m-d');
	}

	protected function Maj_id(){
		return I('post.fac_id').I('post.maj_id');
	}
}
?>