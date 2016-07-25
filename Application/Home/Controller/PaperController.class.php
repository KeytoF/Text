<?php
namespace Home\Controller;
use Think\Controller;
class PaperController extends Controller {
	public function _initialize(){
		//验证权限及传递权限参数
		R("Public/checkUser");
		$this->assign('user',$_SESSION['User']);
		//设置侧栏菜单
		R("Index/sidebar");
		//设置顶栏菜单
		$menu['click'] = "Paper";
		$this->assign('menu', $menu);
	}
	
	public function index($id,$sid=''){
		$this->display();
	}
}