<?php
namespace Home\Controller;
use Think\Controller;
class AdminController extends Controller {
	//构造函数--设置menu&sidebar
	public function _initialize(){
		R("Public/checkAdmin");
	}
	public function index(){
//		$module = D('module');
//		$adminList=$module->where("Sid = $id")->order('Msort asc')->select();
//		$volist=$module->where('Sid > 0')->order('Msort asc')->select();
//		// var_dump($list);exit;
//		$this->assign('adminList', $adminList);
//		$this->assign('volist', S('volist'));
		$this->display();
	}
	
	// public function main(){
	// 	R("Public/checkUser");
	// 	$this->display();
	// }
}