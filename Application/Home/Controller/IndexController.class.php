<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {
	//构造函数
	public function _initialize(){
		//设置顶栏菜单
		$menu['click'] = "Index";
		$this->assign('menu', $menu);
	}
	//首页
	public function index(){
		R("Public/checkUser");
		$systeminfo['THINK_VERSION'] = THINK_VERSION;
		$systeminfo['SERVER_SOFTWARE'] = $_SERVER["SERVER_SOFTWARE"];
		$systeminfo['PHP_OS'] = PHP_OS;
		// mysql_connect('127.0.0.1','root','root');  
		$D = D();
		// $systeminfo['mysql'] = mysql_get_server_info();
		$mysql = $D->query('select VERSION()');
		$systeminfo['mysql'] = $mysql[0]['VERSION()'];
		// $systeminfo['core'] = require(CONF_PATH.'core.php');
		$this->assign('user',$_SESSION['User']);
		$this->assign('info',$systeminfo);
		$this->display();
	}
	//登录界面
	public function login(){
		// if (isset($_SESSION['User'])) {
		// 	$end_time=C('USER_AUTH_SESSION');
		// 	if ((time() - $_SESSION['User']['Logintime']) > $end_time) {
		// 		unset($_SESSION['User']);
		// 		$this->display();
		// 	}else {
		// 		$this->redirect('Index/main');
		// 	}
		// }else {
		// 	$this->display();
		// }
		session(null);
		$this->display();
	}
	//登录验证
	public function logincheck() {
		$posts = I('post.');
		// var_dump($posts);exit;
		if($posts['type']==0){
			// 学生
			// $sql = sprintf("SELECT CONCAT(stu_year,cla_id,stu_numb) as stu_numb, 
			// 	LEFT(cla_id,2) as fac_id, 
			// 	RIGHT(LEFT(cla_id,4),2) as maj_id, 
			// 	RIGHT(cla_id,2) as cla_id, 
			// 	stu_name, stu_time, stu_id, stu_auth, stu_pass 
			// 	FROM ot_student WHERE stu_sign=0 AND stu_name='%s' ORDER BY stu_id ASC",$posts['name']);
			$sql = sprintf("SELECT
				CONCAT(s.stu_year,ot_faculty.fac_numb,ot_major.maj_numb,ot_classs.cla_numb,s.stu_numb) AS stu_numb,
				stu_name,
				stu_time,
				stu_pass,
				stu_id,
				ot_faculty.fac_id,
				ot_classs.cla_id,
				ot_major.maj_id,
				stu_auth
				FROM ot_student s
				LEFT JOIN ot_classs
				ON s.cla_id = ot_classs.cla_id
				LEFT JOIN ot_major
				ON ot_classs.maj_id = ot_major.maj_id
				LEFT JOIN ot_faculty
				ON ot_major.fac_id = ot_faculty.fac_id
				WHERE stu_sign = 0 AND CONCAT(s.stu_year,ot_faculty.fac_numb,ot_major.maj_numb,ot_classs.cla_numb,s.stu_numb)='%s'
				ORDER BY stu_id ASC;",$posts['name']);
			$stu = D('Student');
			// var_dump($sql);exit;
			if($data = $stu->query($sql)){
				if(md5(sha1($posts['pass']))==$data[0]['stu_pass']){
					$_SESSION['Stu'] = $data[0];
					exit('stuok');
				}else{
					exit('nopass');
				}
			}else{
				exit('nouser');
			}
		}else{
			// 教师
			$tea = D('Teacher');
			$where['tea_numb'] = $posts['name'];
			if($data = $tea->where($where)->find()){
				if(md5(sha1($posts['pass']))==$data['tea_pass']){
					$_SESSION['Tea'] = $data;
					exit('teaok');
				}else{
					exit('nopass');
				}
			}else{
				exit('nouser');
			}
		}
	}
	//退出登录
	public function logout(){
		session(null);
		$this->display("Index/login");
	}
	//设置侧栏菜单
	public function sidebar(){
		// if(!S('sidebarList')){
			// $id  =  I('id'); 
			$id = I('get.id');
			// 	var_dump($sdsd);
			// var_dump($id);exit;
			$sub = D();
			if(isset($_SESSION['Stu'])){
				$where = "a.cla_id={$_SESSION['Stu']['cla_id']}";
			}elseif(isset($_SESSION['Tea'])){
				$where = "a.tea_id={$_SESSION['Tea']['tea_id']}";
			}
			$sql = sprintf("SELECT ot_subject.sub_name,a.sub_id
					FROM ot_arrangement a 
					RIGHT JOIN ot_subject
					ON ot_subject.sub_id=a.sub_id 
					WHERE %s AND sub_sign=0 AND arr_sign=0
					ORDER BY a.arr_id ASC",$where);
			// var_dump($_SESSION['Tea']['tea_id']);
			// var_dump($sql);exit;
			// var_dump($sql);exit;
			$sidebarList = $sub->query($sql);
			//设置URL
			/*if(stripos($_SERVER['PATH_INFO'],'/sid')){
				$sidebarList['url'] = substr($_SERVER['PATH_INFO'],0,stripos($_SERVER['PATH_INFO'],'/sid'));
			}else{
				$sidebarList['url'] = $_SERVER['PATH_INFO'];
			}*/
			// var_dump($sidebarList);exit;
		// 	$n = 0;
		// 	foreach ($sidebarList as &$key) {
		// 		$key['URL'] = "$url/sid/{$n}.html";
		// 		// $key['URL'] = "Data/index/id/{$id}/sid/{$n}.html";
		// 		// $key['URL'] = U("Data/index/id/{$id}/sid/{$n}");
		// 		$n++;
		// 	}
		// // 	S('sidebarList',$sidebarList);
		// }
		// var_dump($sidebarList);exit;
		// var_dump($id);
		$this->assign('id', $id);
		$this->assign('sidebarList', $sidebarList);
	}
	/*public function main(){
		// PublicController::checkUser();
		$this->assign('user',$_SESSION['User']);
		R("Public/checkUser");
		$this->display();
	}*/

	/*public function sidebar(){
		$this->display();
	}

	public function footer(){
		$this->display();
	}*/
}