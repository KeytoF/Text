<?php
namespace Home\Controller;
use Think\Controller;
class PublicController extends Controller {
	//检测用户是否已经登录
	public function checkUser(){
		if(isset($_SESSION['Stu'])||isset($_SESSION['Tea'])){
			return true;
		}else{
			R('Public/location',array('ONo！您还没有登录','/Index/login.html'));
		}
	}

	public function checkUsers(){
		if(isset($_SESSION['Stu'])){
			return true;
		}else{
			R('Public/location',array('您还没有登录,亲！','/Index/login.html'));
		}
	}
	//检测用户是否有管理员权限
	public function checkAdmin(){
		if(!isset($_SESSION['Tea'])){
			R('Public/location',array('ONo！您没有相应的权限','/Index/login.html'));
		}elseif(!isset($_SESSION['Tea']['tea_auth'])&&$_SESSION['Tea']['tea_auth']!=1){
			R('Public/location',array('ONo！您没有相应的权限','/Index/index.html'));
		}else{
			return true;
		}
	}

	//检测同名/同编号-模块-新增模块
	public function checksame(){
		$posts = I('post.');
		// var_dump($posts);exit;
		// 数据-测试
		// $posts['database'] = 'ot_teacher';
		// $posts['where'] = "tea_name = 'a' AND tea_id!=1";
		// $check = D($posts['database']);
		// $data = $check->where('')
		// $sql = "SELECT * FROM ot_teacher WHERE tea_name = 'a' AND tea_id!=4";
		$check = D($posts['database']);
		unset($posts['database']);
		// $posts['tea_id'] = json_decode($posts['tea_id']);
		// $posts['tea_id'] = array('neq','1');
		// $posts['sco_id'] = explode(',',$posts['sco_id']); 
		// $posts['id']  = array('neq',100);
		// var_dump($posts);exit;
		$data = $check->where($posts)->find();
		// var_dump($posts,$data);exit;
		// $sql = sprintf('SELECT * FROM %s WHERE %s',$posts['database'],$posts['where']);
		// $data = $check->query($sql);
		if($data){
			// 重名了
			exit('false');
		}else{
			// 木有重名
			exit('true');
		}
		// var_export($data==true);
	}

	//检测同名/同编号-模块-编辑模块
	public function checkSameEdit(){
		$posts = I('post.');
		// var_dump($posts);exit;
		$check = D($posts['database']);
		unset($posts['database']);
		$name = $posts['name'];
		unset($posts['name']);
		$posts[$name] = explode(',',$posts[$name]); 
		// var_dump($posts);exit;
		$data = $check->where($posts)->find();
		// var_dump($data);exit;
		if($data){
			// 重名了
			exit('false');
		}else{
			// 木有重名
			exit('true');
		}
	}

	//存儲對錯數
	public function right(){
		$gets = I('get.');
		$rig = D($gets['database']);
		unset($gets['database']);
		$where = $gets['arr'];
		unset($gets['arr']);
		
		$res = $rig->where($where)->save($gets);
		// var_dump($gets);exit;
		// $gets['array'] = json_decode($gets['arr']);
		// $where['sin_id'] = 1;
		// var_dump($where);
		// var_dump($gets['arr']);
	}

	public static function countDown(){
		// var_dump(123);exit;
		$time=time();
		$h=23-date('H',$time);
		$m=59-date('i',$time);
		$s=60-date('s',$time);
		echo '当前时间：'.date("Y-m-d H:i:s" ,$time)."剩余时间".$h.":".$m.":".$s ;
	}

	//弹出提示窗体
	public function location($title,$url) {
		header('Content-Type: text/html; charset=utf-8');	//输出头，防止中文乱码
		echo '<script>alert("'.$title.'"); window.top.location="'.$url.'"</script>';
		exit;
	}
	/*//生成验证码
	public function verify() {
		$Verify = new \Think\Verify();
		$Verify->length = 4;
		$Verify->entry();
	}
	//错误页面
	public function err() {
		$this->display();
	}
	public function errget($content) {
		$err=array('s'=>$content);
		exit($err);
	}
	public function errjson($content) {
		$err=array('s'=>$content);
		exit(json_encode($err));
	}
	//加密函数
	public function sha1pow($pow) {
		return sha1(md5($pow));
	}
	//时间美化函数
	public function Beautifytime($dtime) {
		$dtime = strtotime($dtime);
		$betime = time()-$dtime;
		$timename='';
		switch($betime) {
			case ($betime < 60):
				$timename = floor($betime).'秒前';
				break;
			case ($betime < 3600 && $betime > 60):
				$timename = floor(($betime/60)).'分钟前';
				break;
			case ($betime < 86400 && $betime > 3600):
				$timename = floor(($betime/60/60)).'小时前';
				break;
			case ($betime < 2592000 && $betime > 86400):
				$timename = floor(($betime/60/60/30)).'天前';
				break;
			case ($betime < 31536000 && $betime > 2592000):
				$timename = floor(($betime/60/60/30/12)).'个月前';
				break;
			case ($betime < 3153600000 && $betime > 31536000):
				$timename = floor(($betime/60/60/30/12/100)).'年前';
				break;
		}
		return $timename;
	}*/
}
?>