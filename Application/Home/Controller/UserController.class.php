<?php
// require APP_PATH.'Home/mod/mod_user.php';
namespace Home\Controller;
use Think\Controller;
class UserController extends Controller {
	public function _initialize(){
		//验证权限及传递权限参数
		R("Public/checkUser");
		R("Public/checkUsers");
		$this->assign('user',$_SESSION['User']);
		//设置侧栏菜单
		R("Index/sidebar");
		//设置顶栏菜单
		$menu['click'] = "User";
		$this->assign('menu', $menu);
	}
	
	public function index(){
		$stu_id = $_SESSION['Stu']['cla_id'];
		$cla = D('Classs');
		$stu = D();
		$data = $cla->where('cla_sign=0')->select();
		$sql = "SELECT stu_numb,stu_name, stu_time, stu_id, cla_name, maj_name, fac_name, stu_year  
		FROM ot_student s
		LEFT JOIN ot_classs 
		ON s.cla_id=ot_classs.cla_id 
		LEFT JOIN ot_major 
		ON ot_classs.maj_id=ot_major.maj_id 
		LEFT JOIN ot_faculty 
		ON ot_major.fac_id=ot_faculty.fac_id 
		WHERE stu_id={$stu_id} 
		ORDER BY stu_id ASC;";
		$Sdata = $stu->query($sql);

		$sql = "SELECT sub_name,(gra_graa+gra_grac) AS gra_grad
				FROM ot_grade g
				LEFT JOIN ot_paper p
				ON g.pap_id=p.pap_id
				LEFT JOIN ot_subject s
				ON p.sub_id=s.sub_id
				WHERE stu_id={$stu_id} AND gra_sign=0";
		$Gdata = $stu->query($sql);
		$this->assign('data',$data);
		$this->assign('Gdata',$Gdata);
		$this->assign('Sdata',$Sdata[0]);
		$this->display();
	}
}