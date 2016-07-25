<?php
namespace Home\Controller;
use Think\Controller;
class AtextController extends Controller {
	//构造函数--设置menu&sidebar
	public function _initialize(){
		R("Public/checkAdmin");
		$this->assign('user',$_SESSION['User']);
		//设置侧栏菜单
		R("Index/sidebar");
		//设置顶栏菜单
		$menu['click'] = "Atext";
		$this->assign('menu', $menu);
	}

	public function index(){
		$this->display();
	}

	// 单选题
	public function single(){
		$sql = sprintf('SELECT sin_numb,sin_id,sin_ques,sin_opta,sin_optb,sin_optc,sin_optd,sin_answ,s.sub_id,sub_name,s.tea_id,tea_name,sin_time 
				FROM ot_single s 
				LEFT JOIN ot_subject 
				ON s.sub_id=ot_subject.sub_id 
				LEFT JOIN ot_teacher 
				ON s.tea_id=ot_teacher.tea_id 
				WHERE sin_sign=0 AND sub_name LIKE "%s"
				ORDER BY sin_id',I('post.sub_name')."%");
		$sin = D();
		$data = $sin->query($sql);
		$active = 'single';
		$this->assign('active',$active);
		$this->assign('data',$data);
		$this->display();
	}

	public function addSingle(){
		$sub = D('Subject');
		$data = $sub->select();
		$this->assign('data',$data);
		$this->display('single.add');
	}

	public function saveSingle(){
		$posts = I('post.');
		$sin = D('Single');
		// var_dump($sin->create($posts));exit;
		// var_dump($_SESSION['Tea']['tea_id']);exit;
		if($sin->create($posts)){
			if($sin->add()){
				exit('succ');
			}
		}else{
			exit('error');	
		}
	}

	public function editSingle(){
		$sin = D('Single');
		$sub = D('Subject');
		$data = $sub->select();
		$where['sin_id'] = I('get.sin_id');
		$Sdata = $sin->where($where)->find();
		// var_dump($Sdata['sin_answ']);exit;
		// var_dump($where);exit;
		$this->assign('data',$data);
		$this->assign('Sdata',$Sdata);
		$this->display('single.edit');
	}

	public function updateSingle(){
		$sin = D('Single');
		$posts = I('post.');
		$where['sin_id'] = $posts['sin_id'];
		if($sin->where($where)->save($posts)){
			exit('succ');
		}else{
			exit('error');
		}
	}

	public function deleteSingle(){
		$sin = D('Single');
		$data['sin_sign'] = 1;
		$where['sin_id'] = I('get.sin_id');
		if($sin->where($where)->save($data)){
			exit('succ');
		}else{
			exit('error');
		}
	}

	// 多选题
	public function multiple(){
		$sql = sprintf('SELECT mul_numb,mul_id,mul_ques,mul_opta,mul_optb,mul_optc,mul_optd,mul_answ,s.sub_id,sub_name,s.tea_id,tea_name,mul_time 
				FROM ot_multiple s 
				LEFT JOIN ot_subject 
				ON s.sub_id=ot_subject.sub_id 
				LEFT JOIN ot_teacher 
				ON s.tea_id=ot_teacher.tea_id 
				WHERE mul_sign=0 AND sub_name LIKE "%s"
				ORDER BY mul_id',"%".I('post.sub_name')."%");
		$mul = D();
		$data = $mul->query($sql);
		$active = 'multiple';
		$this->assign('active',$active);
		$this->assign('data',$data);
		$this->display();
	}

	public function addMultiple(){
		$sub = D('Subject');
		$data = $sub->select();
		$this->assign('data',$data);
		$this->display('multiple.add');
	}

	public function saveMultiple(){
		$posts = I('post.');
		$posts['mul_answ'] = $this->scoreM($posts['mul_answ']);
		$mul = D('Multiple');
		if($mul->create($posts)){
			if($mul->add()){
				exit('succ');
			}
		}else{
			exit('error');	
		}
	}

	public function editMultiple(){
		$mul = D('Multiple');
		$sub = D('Subject');
		$data = $sub->select();
		$where['mul_id'] = I('get.mul_id');
		$Sdata = $mul->where($where)->find();
		// var_dump($Sdata['sin_answ']);exit;
		// var_dump($where);exit;
		$this->assign('data',$data);
		$this->assign('Sdata',$Sdata);
		$this->display('multiple.edit');
	}

	public function updateMultiple(){
		$mul = D('Multiple');
		$posts = I('post.');
		// var_dump($posts);exit;
		$posts['mul_answ'] = $this->scoreM($posts['mul_answ']);
		$where['mul_id'] = $posts['mul_id'];
		unset($posts['mul_id']);
		// var_dump($where);
		// var_dump($posts);exit;
		if($mul->where($where)->save($posts)){
			exit('succ');
		}else{
			exit('error');
		}
	}

	public function deleteMultiple(){
		$mul = D('Multiple');
		$data['mul_sign'] = 1;
		$where['mul_id'] = I('get.mul_id');
		if($mul->where($where)->save($data)){
			exit('succ');
		}else{
			exit('error');
		}
	}

	// 判断题
	public function judge(){
		$sql = sprintf("SELECT jud_numb,jud_id,jud_ques,jud_answ,s.sub_id,sub_name,s.tea_id,tea_name,jud_time,IF(jud_answ=1,'√','×')AS jud_answer 
				FROM ot_judge s 
				LEFT JOIN ot_subject 
				ON s.sub_id=ot_subject.sub_id 
				LEFT JOIN ot_teacher 
				ON s.tea_id=ot_teacher.tea_id 
				WHERE jud_sign=0 AND sub_name LIKE '%s' 
				ORDER BY jud_id",I('post.sub_name')."%");
		$jud = D();
		$data = $jud->query($sql);
		$active = 'judge';
		$this->assign('active',$active);
		$this->assign('data',$data);
		$this->display();
	}

	public function addJudge(){
		$sub = D('Subject');
		$data = $sub->select();
		$this->assign('data',$data);
		$this->display('judge.add');
	}

	public function saveJudge(){
		$posts = I('post.');
		$jud = D('Judge');
		if($jud->create($posts)){
			if($jud->add()){
				exit('succ');
			}
		}else{
			exit('error');	
		}
	}

	public function editJudge(){
		$jud = D('Judge');
		$sub = D('Subject');
		$data = $sub->select();
		$where['jud_id'] = I('get.jud_id');
		$Sdata = $jud->where($where)->find();
		// var_dump($Sdata['sin_answ']);exit;
		// var_dump($where);exit;
		$this->assign('data',$data);
		$this->assign('Sdata',$Sdata);
		$this->display('judge.edit');
	}

	public function updateJudge(){
		// var_dump(123);exit;
		$jud = D('Judge');
		$posts = I('post.');
		$where['jud_id'] = $posts['jud_id'];
		if($jud->where($where)->save($posts)){
			exit('succ');
		}else{
			exit('error');
		}
	}

	public function deleteJudge(){
		$jud = D('Judge');
		$data['jud_sign'] = 1;
		$where['jud_id'] = I('get.jud_id');
		if($jud->where($where)->save($data)){
			exit('succ');
		}else{
			exit('error');
		}
	}

	// 填空题
	public function cloze(){
		$sql = sprintf("SELECT clo_numb,clo_id,clo_ques,clo_ansa,s.sub_id,sub_name,s.tea_id,tea_name,clo_time 
				FROM ot_cloze s 
				LEFT JOIN ot_subject 
				ON s.sub_id=ot_subject.sub_id 
				LEFT JOIN ot_teacher 
				ON s.tea_id=ot_teacher.tea_id 
				WHERE clo_sign=0 AND sub_name LIKE '%s'
				ORDER BY clo_id",I('post.sub_name')."%");
		$clo = D();
		$data = $clo->query($sql);
		$active = 'cloze';
		$this->assign('active',$active);
		$this->assign('data',$data);
		$this->display();
	}

	public function addCloze(){
		$sub = D('Subject');
		$data = $sub->select();
		$this->assign('data',$data);
		$this->display('cloze.add');
	}

	public function saveCloze(){
		// var_dump(132);exit;
		$posts = I('post.');
		$clo = D('Cloze');
		if($clo->create($posts)){
			if($clo->add()){
				exit('succ');
			}
		}else{
			exit('error');	
		}
	}

	public function editCloze(){
		$clo = D('Cloze');
		$sub = D('Subject');
		$data = $sub->select();
		$where['clo_id'] = I('get.clo_id');
		$Sdata = $clo->where($where)->find();
		$this->assign('data',$data);
		$this->assign('Sdata',$Sdata);
		$this->display('cloze.edit');
	}

	public function updateCloze(){
		$clo = D('Cloze');
		$posts = I('post.');
		$where['clo_id'] = $posts['clo_id'];
		if($clo->where($where)->save($posts)){
			exit('succ');
		}else{
			exit('error');
		}
	}

	public function deleteCloze(){
		$clo = D('Cloze');
		$data['clo_sign'] = 1;
		$where['clo_id'] = I('get.clo_id');
		if($clo->where($where)->save($data)){
			exit('succ');
		}else{
			exit('error');
		}
	}
	
	// 简答题
	public function answer(){
		$sql = sprintf("SELECT ans_numb,ans_id,ans_ques,ans_answ,s.sub_id,sub_name,s.tea_id,tea_name,ans_time 
				FROM ot_answer s 
				LEFT JOIN ot_subject 
				ON s.sub_id=ot_subject.sub_id 
				LEFT JOIN ot_teacher 
				ON s.tea_id=ot_teacher.tea_id 
				WHERE ans_sign=0 AND sub_name LIKE '%s'
				ORDER BY ans_id","%".I('post.sub_name')."%");
		$ans = D();
		$data = $ans->query($sql);
		$active = 'answer';
		$this->assign('active',$active);
		$this->assign('data',$data);
		$this->display();
	}

	public function addAnswer(){
		$sub = D('Subject');
		$data = $sub->select();
		$this->assign('data',$data);
		$this->display('answer.add');
	}

	public function saveAnswer(){
		$posts = I('post.');
		$ans = D('Answer');
		// var_dump($_SESSION['Tea']['tea_id']);exit;
		// var_dump($posts);exit;
		if($ans->create($posts)){
			if($ans->add()){
				exit('succ');
			}
		}else{
			exit('error');	
		}
	}

	public function editAnswer(){
		$ans = D('Answer');
		$sub = D('Subject');
		$data = $sub->select();
		$where['ans_id'] = I('get.ans_id');
		$Sdata = $ans->where($where)->find();
		$data['select'] = $Sdata['sub_id'];
		// var_dump($Sdata);exit;
		$this->assign('data',$data);
		$this->assign('Sdata',$Sdata);
		$this->display('answer.edit');
	}

	public function updateAnswer(){
		$ans = D('Answer');
		$posts = I('post.');
		$where['ans_id'] = $posts['ans_id'];
		// var_dump($posts);exit;
		if($ans->where($where)->save($posts)){
			exit('succ');
		}else{
			exit('error');
		}
	}

	public function deleteAnswer(){
		$ans = D('Answer');
		$data['ans_sign'] = 1;
		$where['ans_id'] = I('get.ans_id');
		if($ans->where($where)->save($data)){
			exit('succ');
		}else{
			exit('error');
		}
	}

	//字符串排序函数
	public static function scoreM($data){
		$res = str_split($data);
		asort($res);
		$res = implode($res);
		return $res;
	}
}