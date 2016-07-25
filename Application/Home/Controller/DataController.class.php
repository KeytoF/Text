<?php
namespace Home\Controller;
use Think\Controller;
class DataController extends Controller {
	//构造函数--设置menu&sidebar
	public function _initialize(){
		//验证权限及传递权限参数
		R("Public/checkUser");
		// var_dump($_SESSION);exit;
		$this->assign('user',$_SESSION['User']);
		//设置侧栏菜单
		R("Index/sidebar");
		//设置顶栏菜单
		$menu['click'] = "Data";
		$this->assign('menu', $menu);
	}

	public function index(){
		$gets = I('get.');
		if(trim($gets['id'])==''){
			$this->display();
		}else{
			$sub_id = $gets['id'];
			$sql = "SELECT dat_id,dat_name,CONCAT(sub_numb,dat_numb) AS dat_numb,tea_name,sub_name,dat_time,dat_url  
			FROM ot_data o
			LEFT JOIN ot_teacher
			ON o.tea_id=ot_teacher.tea_id
			LEFT JOIN ot_subject
			ON o.sub_id=ot_subject.sub_id
			WHERE dat_sign=0 AND o.sub_id={$sub_id} 
			ORDER BY dat_id";
			$dat = D();
			// var_dump($sql);exit;
			$data = $dat->query($sql);
			$this->assign('active','data');
			$this->assign('data',$data);
			$this->display('data');
		}
	}

	public function data(){
		$sub_id = I('get.sub_id');
		$sql = "SELECT dat_id,dat_name,dat_numb,tea_name,sub_name,dat_time,dat_url  
		FROM ot_data o
		LEFT JOIN ot_teacher
		ON o.tea_id=ot_teacher.tea_id
		LEFT JOIN ot_subject
		ON o.sub_id=ot_subject.sub_id
		WHERE dat_sign=0 AND sub_id={sub_id}
		ORDER BY dat_id";
		$dat = D();
		$data = $dat->query($sql);
		$this->assign('active','data');
		$this->assign('data',$data);
		$this->display();
	}
 	/*public function lists(){
		$data = M('Data');
		$count = $data->count();
		$Page = new \Think\Page($count,1);
		$show = $Page->show();
		$dataList = $data->limit($Page->firstRow.','.$Page->listRows)->select();
		$this->assign('dataList',$dataList);
		$this->assign('count',$count);
		$this->assign('show',$show);
		$this->display();
	}*/
}