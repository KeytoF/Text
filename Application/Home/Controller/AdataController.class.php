<?php
namespace Home\Controller;
use Think\Controller;
class AdataController extends Controller {
	//构造函数--设置menu&sidebar
	public function _initialize(){
		R("Public/checkAdmin");
		$this->assign('user',$_SESSION['User']);
		//设置侧栏菜单
		R("Index/sidebar");
		//设置顶栏菜单
		$menu['click'] = "Adata";
		$this->assign('menu', $menu);
	}

	// 资料数据展示
	public function index(){
		$sql = sprintf("SELECT dat_id,dat_name,CONCAT(sub_numb,dat_numb) AS dat_numb,tea_name,sub_name,dat_time,dat_url  
				FROM ot_data o
				LEFT JOIN ot_teacher
				ON o.tea_id=ot_teacher.tea_id
				LEFT JOIN ot_subject
				ON o.sub_id=ot_subject.sub_id
				WHERE dat_sign=0 AND sub_name LIKE '%s'
				ORDER BY dat_id","%".I('post.sub_name')."%");
		$dat = D();
		$data = $dat->query($sql);
		$this->assign('active','data');
		$this->assign('data',$data);
		$this->display();
	}

	// 新增资料
	public function addData(){
		$sub = D('Subject');
		$data = $sub->select();
		$this->assign('data',$data);
		$this->display('data.add');
	}

	// 保存资料
	public function saveData(){
		// import(“ORG.Net.UploadFile”); 
		$posts = I('post.');
		$dat = D('Data');
		// var_dump(123);exit;
		$config = array('autoSub'       =>  false);
		$upload = new \Think\Upload($config); 
		$upload->maxSize   = 3145728 ;
		$upload->saveName   = $posts['dat_name'];
		$upload->exts      = array('doc', 'docx');
		// $upload->savePath  =      '/Uploads/';
		$info   =   $upload->upload();
			// var_dump($info);exit;
		if($info){
			$posts['dat_url'] = $info['dat_file']['savename'];
			if($dat->create($posts)){
				if($dat->add()){
					$this->success('文件上传成功!!');
				}else{
					$this->error('文件上传失败!!');
				}
			}else{
				$this->error('文件上传失败!!');
			}
		}else{
			$this->error('文件上传失败!!');
		}
	}

	// 编辑资料
	public function editData(){
		$sub = D('Subject');
		$dat = D('Data');
		$data = $sub->where('sub_sign=0')->select();
		$where['dat_id'] = I('get.dat_id');
		$Sdata = $dat->where($where)->find();
		// var_dump($Sdata);exit;
		$this->assign('data',$data);
		$this->assign('Sdata',$Sdata);
		$this->display('data.edit');
	}

	// 更新资料
	public function updateData(){
		$posts = I('post.');
		$dat = D('Data');
		$where['dat_id'] = $posts['dat_id'];
		if(isset($_FILES['dat_file'])&&trim($_FILES['dat_file']['name'])!=''){
		// mport(ORG.Net.UploadFile); 
			// var_dump($_FILES);
			// var_dump($posts);exit;
			$config = array('autoSub'       =>  false);
			$upload = new \Think\Upload($config);
			$upload->maxSize   = 3145728 ;
			$upload->saveName   = $posts['dat_name'];
			$upload->exts      = array('doc', 'docx');  
			$info   =   $upload->upload();
		}else{
			$info['dat_file']['savename'] = $posts['dat_url'];
		}
		// var_dump($info);exit;
		if($info){
			$posts['dat_url'] = $info['dat_file']['savename'];
			// var_dump($where);
			// var_dump($posts);exit;
			if($dat->where($where)->save($posts)){
				$this->success('数据保存成功!!');
			}else{
				$this->error('数据保存失败!!');
			}
		}else{
			$this->error('文件上传失败!!');
		}
	}

	// 刪除资料
	public function deleteData(){
		$dat = D('Data');
		$data['dat_sign'] = 1;
		$where['dat_id'] = I('get.dat_id');
		if($dat->where($where)->save($data)){
			exit('succ');
		}else{
			exit('error');
		}
	}
}