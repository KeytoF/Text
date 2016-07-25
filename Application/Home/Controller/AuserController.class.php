<?php
namespace Home\Controller;
use Think\Controller;
class AuserController extends Controller {
	//构造函数--设置menu&sidebar
	public function _initialize(){
		// var_dump(123);
		R("Public/checkAdmin");
		$this->assign('user',$_SESSION['User']);
		//设置侧栏菜单
		R("Index/sidebar");
		//设置顶栏菜单
		$menu['click'] = "Auser";
		$this->assign('menu', $menu);
	}

	/*public function index(){
		$this->display();
	}*/

	//用户管理
	public function user(){
		$stu = D('Student');

		$count = $stu->where('stu_sign=0')->count();
		$page = new \Think\Page($count,10);
		$show = $page->show();
		$sql = sprintf("SELECT CONCAT(s.stu_year,ot_faculty.fac_numb,ot_major.maj_numb,ot_classs.cla_numb,s.stu_numb) AS stu_numb,
		stu_name, stu_time, stu_id, cla_name, maj_name, fac_name 
		FROM ot_student s
		LEFT JOIN ot_classs 
		ON s.cla_id=ot_classs.cla_id 
		LEFT JOIN ot_major 
		ON ot_classs.maj_id=ot_major.maj_id 
		LEFT JOIN ot_faculty 
		ON ot_major.fac_id=ot_faculty.fac_id 
		WHERE stu_sign=0 AND stu_name LIKE '%s'
		ORDER BY stu_id ASC","%".I('post.stu_name')."%");
		$list = $stu->query($sql);
		// var_dump($list);exit;
		$active = 'user';
		$this->assign('active',$active);
		$this->assign('list',$list);
		$this->assign('page',$show);
		$this->display();
	}

	public function addUser(){
		$cla = D('Classs');
		$data = $cla->where('cla_sign=0')->select();
		$this->assign('data',$data);
		$this->display('user.add');
	}

	public function saveUser(){
		$posts = I('post.');
		// var_dump($posts);exit;
		$user = D('Student');
		if($user->create()){
			if($user->add()){
				exit('succ');
			}
		}else{
			exit('error');	
		}
	}

	public function editUser(){
		$stu_id = I('get.stu_id');
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
		ORDER BY stu_id ASC";
		$Sdata = $stu->query($sql);
		$this->assign('data',$data);
		$this->assign('Sdata',$Sdata[0]);
		$this->display('user.edit');
	}

	public function updateUser(){
		$stu = D('Student');
		$posts = I('post.');
		$where['stu_id'] = $posts['stu_id'];
		if($stu->where($where)->save($posts)){
			exit('succ');
		}else{
			exit('error');
		}
	}

	public function deleteUser(){
		$stu = D('Student');
		$where['stu_id'] = I('get.stu_id');
		$data['stu_sign'] = 1;
		if($stu->where($where)->save($data)){
			exit('succ');
		}else{
			exit('error');
		}
	}

	// 管理员管理
	public function admin(){
		$where['tea_name'] = array('LIKE',"%".I('post.tea_name')."%");
		$where['tea_sign'] = 0; 
		$tea = D('Teacher');
		$data = $tea->where($where)->select();
		$active = 'admin';
		$this->assign('active',$active);
		$this->assign('data',$data);
		$this->display('admin');
	}

	public function addAdmin(){
		$this->display('admin.add');
	}

	public function saveAdmin(){
		$tea = D('Teacher');
		if($tea->create()){
			if($tea->add()){
				exit('succ');
			}
		}else{
			exit('error');	
		}
	}

	public function editAdmin(){
		$tea = D('Teacher');
		$sub = D('Subject');
		$data = $sub->select();
		$where['tea_id'] = I('get.tea_id');
		$Sdata = $tea->where($where)->find();
		// var_dump($Sdata['sin_answ']);exit;
		// var_dump($where);exit;
		$this->assign('data',$data);
		$this->assign('Sdata',$Sdata);
		$this->display('admin.edit');
	}

	public function updateAdmin(){
		$tea = D('Teacher');
		$posts = I('post.');
		$where['tea_id'] = $posts['tea_id'];
		if($tea->where($where)->save($posts)){
			exit('succ');
		}else{
			exit('error');
		}
	}

	public function deleteAdmin(){
		$tea = D('Teacher');
		$where['tea_id'] = I('get.tea_id');
		$data['tea_sign'] = 1;
		if($tea->where($where)->save($data)){
			exit('succ');
		}else{
			exit('error');
		}
	}

	// 院系管理
	public function faculty(){
		$where['fac_name'] = array('LIKE',"%".I('post.fac_name')."%");
		$where['fac_sign'] = 0; 
		$fac = D('Faculty');
		$data = $fac->where($where)->select();
		$active = 'faculty';
		$this->assign('data',$data);
		$this->assign('active',$active);
		$this->display();
	}
	
	public function addFaculty(){
		$this->display('faculty.add');
	}

	public function saveFaculty(){
		$fac = D('Faculty');
		if($fac->create()){
			if($fac->add()){
				exit('succ');
			}
		}else{
			exit('error');	
		}
	}

	public function editFaculty(){
		$fac = D('Faculty');
		$sub = D('Subject');
		$data = $sub->select();
		$where['fac_id'] = I('get.fac_id');
		$Sdata = $fac->where($where)->find();
		// var_dump($Sdata['sin_answ']);exit;
		// var_dump($where);exit;
		$this->assign('data',$data);
		$this->assign('Sdata',$Sdata);
		$this->display('faculty.edit');
	}

	public function updateFaculty(){
		$fac = D('Faculty');
		$posts = I('post.');
		$where['fac_id'] = $posts['fac_id'];
		if($fac->where($where)->save($posts)){
			exit('succ');
		}else{
			exit('error');
		}
	}

	public function deleteFaculty(){
		$fac = D('Faculty');
		$where['fac_id'] = I('get.fac_id');
		$data['fac_sign'] = 1;
		if($fac->where($where)->save($data)){
			exit('succ');
		}else{
			exit('error');
		}
	}

	// 专业管理
	public function major(){
		$maj = D('');
		$sql = sprintf('SELECT CONCAT(fac_numb,maj_numb)AS maj_numb,maj_name,maj_time,fac_name,maj_id 
		FROM ot_major o 
		LEFT JOIN ot_faculty
		ON o.fac_id=ot_faculty.fac_id
		WHERE maj_sign=0 AND maj_name LIKE "%s"
		ORDER BY maj_id',"%".I('post.maj_name')."%");
		$data = $maj->query($sql);
		$active = 'major';
		$this->assign('data',$data);
		$this->assign('active',$active);
		$this->display();
	}

	public function addMajor(){
		$fac = D('Faculty');
		$data = $fac->where('fac_sign=0')->select();
		$this->assign('data',$data);
		$this->display('major.add');
	}

	public function saveMajor(){
		$maj = D('Major');
		if($maj->create()){
			if($maj->add()){
				exit('succ');
			}
		}else{
			exit('error');	
		}
	}

	public function editMajor(){
		$maj = D('Major');
		$where['maj_id'] = I('get.maj_id');
		$Sdata = $maj->where($where)->find();
		// var_dump($Sdata['sin_answ']);exit;
		// var_dump($where);exit;
		$this->assign('Sdata',$Sdata);
		$this->display('major.edit');
	}

	public function updateMajor(){
		$maj = D('Major');
		$posts = I('post.');
		$where['maj_id'] = $posts['maj_id'];
		if($maj->where($where)->save($posts)){
			exit('succ');
		}else{
			exit('error');
		}
	}

	public function deleteMajor(){
		$maj = D('Major');
		$where['maj_id'] = I('get.maj_id');
		$data['maj_sign'] = 1;
		if($maj->where($where)->save($data)){
			exit('succ');
		}else{
			exit('error');
		}
	}

	// 班级管理
	public function classs(){
		$cla = D('');
		$sql = sprintf('SELECT CONCAT(fac_numb,maj_numb,cla_numb)AS cla_numb,cla_name,cla_time,maj_name,fac_name,cla_id 
		FROM ot_classs o 
		LEFT JOIN ot_major
		ON o.maj_id=ot_major.maj_id 
		LEFT JOIN ot_faculty
		ON ot_major.fac_id=ot_faculty.fac_id
		WHERE cla_sign=0 AND cla_name LIKE "%s"
		ORDER BY cla_id',"%".I('post.cla_name')."%");
		// var_dump($sql);exit;
		$data = $cla->query($sql);
		$active = 'classs';
		$this->assign('data',$data);
		$this->assign('active',$active);
		$this->display();
	}

	public function addClasss(){
		$maj = D('Major');
		$data = $maj->where('maj_sign=0')->select();
		$this->assign('data',$data);
		$this->display('class.add');
	}

	public function saveClasss(){
		$cla = D('Classs');
		if($cla->create()){
			if($cla->add()){
				exit('succ');
			}
		}else{
			exit('error');	
		}
	}

	public function editClasss(){
		$cla = D('Classs');
		$where['cla_id'] = I('get.cla_id');
		$Sdata = $cla->where($where)->find();
		// var_dump($Sdata['sin_answ']);exit;
		// var_dump($where);exit;
		$this->assign('Sdata',$Sdata);
		$this->display('class.edit');
	}
	
	public function updateClasss(){
		$cla = D('Classs');
		$posts = I('post.');
		$where['cla_id'] = $posts['cla_id'];
		// var_dump($posts['cla_name']);
		if($cla->where($where)->save($posts)){
			exit('succ');
		}else{
			exit('error');
		}
	}

	public function deleteClasss(){
		$cla = D('Classs');
		$where['cla_id'] = I('get.cla_id');
		$data['cla_sign'] = 1;
		if($cla->where($where)->save($data)){
			exit('succ');
		}else{
			exit('error');
		}
	}

	// 课程管理
	public function subject(){
		$where['sub_name'] = array('LIKE',"%".I('post.sub_name')."%");
		$where['sub_sign'] = 0; 
		$sub = D('Subject');
		$data = $sub->where($where)->select();
		$active = 'subject';
		$this->assign('active',$active);
		$this->assign('data',$data);
		$this->display();	
	}
	
	public function addSubject(){
		$this->display('subject.add');
	}

	public function saveSubject(){
		$sub = D('Subject');
		if($sub->create()){
			if($sub->add()){
				exit('succ');
			}
		}else{
			exit('error');	
		}
	}

	public function editSubject(){
		$sub = D('Subject');
		$where['sub_id'] = I('get.sub_id');
		$Sdata = $sub->where($where)->find();
		$this->assign('Sdata',$Sdata);
		$this->display('subject.edit');
	}
	
	public function updateSubject(){
		$sub = D('Subject');
		$posts = I('post.');
		$where['sub_id'] = $posts['sub_id'];
		// var_dump($posts['sub_name']);
		if($sub->where($where)->save($posts)){
			exit('succ');
		}else{
			exit('error');
		}
	}

	public function deleteSubject(){
		$sub = D('Subject');
		$where['sub_id'] = I('get.sub_id');
		$data['sub_sign'] = 1;
		if($sub->where($where)->save($data)){
			exit('succ');
		}else{
			exit('error');
		}
	}

	//课程安排
	public function arr(){
		$sub = D('');
		$sql = "SELECT tea_name,cla_name,sub_name,arr_time,arr_id
		FROM ot_arrangement o
		LEFT JOIN ot_teacher t
		ON t.tea_id = o.tea_id
		LEFT JOIN ot_subject s
		ON s.sub_id = o.sub_id
		LEFT JOIN ot_classs c
		ON c.cla_id = o.cla_id
		WHERE arr_sign=0
		ORDER BY arr_id";
		$data = $sub->query($sql);
		$active = 'arr';
		$this->assign('active',$active);
		$this->assign('data',$data);
		$this->display();	
	}
	
	public function addArrangement(){
		$sub = D('Subject');
		$tea = D('Teacher');
		$cla = D('Classs');
		$Sdata = $sub->where('sub_sign=0')->select();
		$Cdata = $cla->where('cla_sign=0')->select();
		$Tdata = $tea->where('tea_sign=0')->select();

		$this->assign('Sdata',$Sdata);
		$this->assign('Cdata',$Cdata);
		$this->assign('Tdata',$Tdata);
		$this->display('arrangement.add');
	}

	public function saveArrangement(){
		$sub = D('Arrangement');
		if($sub->create()){
			if($sub->add()){
				exit('succ');
			}
		}else{
			exit('error');	
		}
	}

	public function editArrangement(){
		$sub = D('Subject');
		$tea = D('Teacher');
		$cla = D('Classs');
		$Sdata = $sub->where('sub_sign=0')->select();
		$Cdata = $cla->where('cla_sign=0')->select();
		$Tdata = $tea->where('tea_sign=0')->select();

		$arr = D('Arrangement');
		$where['arr_id'] = I('get.arr_id');
		$data = $arr->where($where)->find();

		$this->assign('data',$data);
		$this->assign('Sdata',$Sdata);
		$this->assign('Cdata',$Cdata);
		$this->assign('Tdata',$Tdata);
		$this->display('arrangement.edit');
	}
	
	public function updateArrangement(){
		$sub = D('Arrangement');
		$posts = I('post.');
		$where['arr_id'] = $posts['arr_id'];
		// var_dump($posts);exit;
		if($sub->where($where)->save($posts)){
			exit('succ');
		}else{
			exit('error');
		}
	}

	public function deleteArrangement(){
		$sub = D('Arrangement');
		$where['arr_id'] = I('get.arr_id');
		$data['arr_sign'] = 1;
		if($sub->where($where)->save($data)){
			exit('succ');
		}else{
			exit('error');
		}
	}
}