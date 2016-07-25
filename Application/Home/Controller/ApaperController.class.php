<?php
namespace Home\Controller;
use Think\Controller;
class ApaperController extends Controller {
	//构造函数--设置menu&sidebar
	public function _initialize(){
		R("Public/checkAdmin");
		$this->assign('user',$_SESSION['User']);
		//设置侧栏菜单
		R("Index/sidebar");
		//设置顶栏菜单
		$menu['click'] = "Apaper";
		$this->assign('menu', $menu);
	}

	//试卷展示
	public function paper(){
		$pap = D('');
		$sub = D('Subject');
		$data = $sub->where('sub_sign=0')->select();
		$sql = sprintf("SELECT pap_id,pap_numb,tea_name,o.sco_id,pap_time,sco_numb,pap_star,sub_name 
			FROM ot_paper o
			LEFT JOIN ot_teacher
			ON o.tea_id=ot_teacher.tea_id
			LEFT JOIN ot_score
			ON o.sco_id=ot_score.sco_id	
			LEFT JOIN ot_subject 
			ON o.sub_id = ot_subject.sub_id 			
			WHERE pap_sign=0 AND sub_name LIKE '%s'
			ORDER BY pap_id","%".I('post.sub_name')."%");
		$Sdata = $pap->query($sql);
		$active = 'paper';
		$this->assign('active',$active);
		$this->assign('data',$data);
		$this->assign('Sdata',$Sdata);
		$this->display();
	}

	// 新增试卷
	public function addPaper(){
		$sub = D('Subject');
		$sco = D('Score');
		$score = $sco->where('sco_sign=0')->select();
		$data = $sub->where('sub_sign=0')->select();
		$this->assign('data',$data);
		$this->assign('score',$score);
		$this->display('paper.add');
	}

	// 保存试卷
	public function savePaper(){
		$posts = I('post.');
		$sin = D('Single');
		$mul = D('Multiple');
		$jud = D('Judge');
		$clo = D('Cloze');
		$ans = D('Answer');
		$datasin = $sin->where("sin_sign=0 and sub_id={$posts['sub_id']}")->count();
		$datamul = $mul->where("mul_sign=0 and sub_id={$posts['sub_id']}")->count();
		$datajud = $jud->where("jud_sign=0 and sub_id={$posts['sub_id']}")->count();
		$dataclo = $clo->where("clo_sign=0 and sub_id={$posts['sub_id']}")->count();
		$dataans = $ans->where("ans_sign=0 and sub_id={$posts['sub_id']}")->count();
		$sco = D('Score');
		$datasco = $sco->where("sco_id={$posts['sco_id']}")->find();
		if($datasin<$datasco['sco_num_sing']||$datamul<$datasco['sco_num_mult']||$datajud<$datasco['sco_num_judg']||$dataclo<$datasco['sco_num_cloz']||$dataans<$datasco['sco_num_answ']){
			exit('error');
		}else{
			$count['sin_rand'] = rand(1,100);
			$count['mul_rand'] = rand(1,100);
			$count['jud_rand'] = rand(1,100);
			$count['clo_rand'] = rand(1,100);
			$count['ans_rand'] = rand(1,100);
			$posts['pap_cont'] = serialize($count);
			$posts['pap_auto'] = 1;
			$pap = D('Paper');
			if($pap->create($posts)){
				if($pap->add()){
					exit('succ');
				}else{
					exit('error');
				}
			}else{
				exit('error');
			}
		}
	}

	// 编辑试卷
	public function editPaper(){
		$sub = D('Subject');
		$pap = D('Paper');
		$sco = D('Score');
		$where['pap_id'] = I('get.pap_id');
		$Pdata = $pap->where($where)->find();
		if($Pdata['pap_auto']==1){
			$data = $sub->where('sub_sign=0')->select();
			$score = $sco->where('sco_sign=0')->select();
			$this->assign('Sdata',$Pdata);
			$this->assign('score',$score);
			$this->assign('data',$data);
			$this->display('paper.edit');
		}else{
			$pap_cont = unserialize($Pdata['pap_cont']);
			$Pdata['pap_cont'] = unserialize($Pdata['pap_cont']);
			// var_dump($Pdata);exit;
			$sqls = sprintf("SELECT * FROM %s WHERE %s IN (%s)",'ot_single','sin_id',$pap_cont['sin']);
			$sqlm = sprintf("SELECT * FROM %s WHERE %s IN (%s)",'ot_multiple','mul_id',$pap_cont['mul']);
			$sqlj = sprintf("SELECT * FROM %s WHERE %s IN (%s)",'ot_judge','jud_id',$pap_cont['jud']);
			$sqlc = sprintf("SELECT * FROM %s WHERE %s IN (%s)",'ot_cloze','clo_id',$pap_cont['clo']);
			$sqla = sprintf("SELECT * FROM %s WHERE %s IN (%s)",'ot_answer','ans_id',$pap_cont['ans']);
			$db = D();
			$data['sin'] = $pap_cont['sin']==''?'':$db->query($sqls);
			$data['mul'] = $pap_cont['mul']==''?'':$db->query($sqlm);
			$data['jud'] = $pap_cont['jud']==''?'':$db->query($sqlj);				
			$data['clo'] = $pap_cont['clo']==''?'':$db->query($sqlc);				
			$data['ans'] = $pap_cont['ans']==''?'':$db->query($sqla);

			$sin = D('Single');
			$mul = D('Multiple');
			$jud = D('Judge');
			$clo = D('Cloze');
			$ans = D('Answer');
			$where['sub_id'] = $Pdata['sub_id'];

			$where['sin_sign'] = 0;
			$where['sin_id'] = array('not in',$pap_cont['sin']);

			$Sdata = $sin->where($where)->select();
			unset($where['sin_sign']);
			unset($where['sin_id']);

			$where['mul_sign'] = 0;
			$where['mul_id'] = array('not in',$pap_cont['mul']);

			$Mdata = $mul->where($where)->select();
			unset($where['mul_sign']);
			unset($where['mul_id']);

			$where['jud_sign'] = 0;
			$where['jud_id'] = array('not in',$pap_cont['jud']);

			$Jdata = $jud->where($where)->select();
			unset($where['jud_sign']);
			unset($where['jud_id']);

			$where['clo_sign'] = 0;
			$where['clo_id'] = array('not in',$pap_cont['clo']);

			$Cdata = $clo->where($where)->select();
			unset($where['clo_sign']);
			unset($where['clo_id']);

			$where['ans_sign'] = 0;
			$where['ans_id'] = array('not in',$pap_cont['ans']);

			$Adata = $ans->where($where)->select();


			$this->assign('data',$data);
			$this->assign('Pdata',$Pdata);
			$this->assign('Sdata',$Sdata);
			$this->assign('Mdata',$Mdata);
			$this->assign('Jdata',$Jdata);
			$this->assign('Cdata',$Cdata);
			$this->assign('Adata',$Adata);
			$this->display('paper.editMt');
		}
	}

	// 更新试卷
	public function updatePaper(){
		$pap = D('Paper');
		$posts = I('post.');
		$where['pap_id'] = $posts['pap_id'];
		if($pap->where($where)->save($posts)){
			exit('succ');
		}else{
			exit('error');
		}
	}

	public function updatePaperM(){
		$posts = I('post.');
		$pap = D('Paper');
		$data['pap_exti'] = $posts['pap_exti'];
		$data['pap_numb'] = $posts['pap_numb'];
		unset($posts['pap_exti']);
		unset($posts['sub_id']);
		unset($posts['pap_numb']);
		$posts['sin'] = implode(',',$posts['sin']);
		$posts['mul'] = implode(',',$posts['mul']);
		$posts['jud'] = implode(',',$posts['jud']);
		$posts['clo'] = implode(',',$posts['clo']);
		$posts['ans'] = implode(',',$posts['ans']);
		$data['pap_cont'] = serialize($posts);
		$data['pap_auto'] = 0;

		$where['pap_id'] = $posts['pap_id'];
		if($pap->where($where)->save($data)){
			exit('succ');
		}else{
			exit('error');
		}
	}

	// 删除试卷
	public function deletePaper(){
		$pap = D('Paper');
		$data['pap_sign'] = 1;
		$where['pap_id'] = I('get.pap_id');
		if($pap->where($where)->save($data)){
			exit('succ');
		}else{
			exit('error');
		}
	}

	// 开始考试
	public function startPaper(){
		$gets = I('get.');
		// var_dump($gets);exit;
		$data['pap_star'] = 1;
		$pap = D('Paper');
		if($pap->where($gets)->save($data)){
			exit('succ');
		}else{
			exit('error');
		}
	}

	// 结束考试
	public function endPaper(){
		$gets = I('get.');
		// var_dump($gets);exit;
		$data['pap_star'] = 0;
		$pap = D('Paper');
		if($pap->where($gets)->save($data)){
			exit('succ');
		}else{
			exit('error');
		}
	}

	// 开始考试-关联班级
	public function editPaperClass(){
		$where['pap_id'] = I('get.pap_id');
		$cla = D('');
		$pap = D('Paper');

		$data = $pap->where($where)->find();
		
		$sql = sprintf("SELECT cla_name,c.cla_id 
			FROM ot_arrangement a
			LEFT JOIN ot_teacher t
			ON a.tea_id=t.tea_id
			LEFT JOIN ot_classs c
			ON a.cla_id=c.cla_id
			LEFT JOIN ot_subject s
			ON a.sub_id=s.sub_id
			WHERE arr_sign=0 AND a.tea_id=%d AND a.sub_id=%d",$_SESSION['Tea']['tea_id'],$data['sub_id']);
		$Cdata = $cla->query($sql);
		// var_dump($Cdata);
		$this->assign('Cdata',$Cdata);
		$this->assign('data',$data);
		$this->display('paper.editC');
	}

	// 保存开考数据
	public function updatePaperClass(){
		$posts = I('post.');
		$pap = D('Paper');
		$where['pap_id'] = $posts['pap_id'];
		unset($posts['pap_id']);
		$posts['pap_star'] = 1;
		if($pap->where($where)->save($posts)){
			exit('succ');
		}else{
			exit('error');
		}
		// var_dump($posts);
	}


	// 新增手动试卷
	public function addPaperManual(){
		$sin = D('Single');
		$mul = D('Multiple');
		$jud = D('Judge');
		$clo = D('Cloze');
		$ans = D('Answer');
		$where['sin_sign'] = 0;
		$where['sub_id'] = I('get.sub_id');
		// var_dump($where);
		$Sdata = $sin->where($where)->select();
		unset($where['sin_sign']);

		$where['mul_sign'] = 0;
		$Mdata = $mul->where($where)->select();
		unset($where['mul_sign']);

		$where['jud_sign'] = 0;
		$Jdata = $jud->where($where)->select();
		unset($where['jud_sign']);

		$where['clo_sign'] = 0;
		$Cdata = $clo->where($where)->select();
		unset($where['clo_sign']);

		$where['ans_sign'] = 0;
		$Adata = $ans->where($where)->select();


		$sub = D('Subject');
		$data = $sub->where('sub_sign=0')->select();

		$this->assign('data',$data);
		$this->assign('sub_id',$where['sub_id']);
		$this->assign('Sdata',$Sdata);
		$this->assign('Mdata',$Mdata);
		$this->assign('Jdata',$Jdata);
		$this->assign('Cdata',$Cdata);
		$this->assign('Adata',$Adata);
		$this->display('paper.addM');
		// var_dump(123);
	}

	public function addPaperMt(){
		$sin = D('Single');
		$mul = D('Multiple');
		$jud = D('Judge');
		$clo = D('Cloze');
		$ans = D('Answer');
		$where['sin_sign'] = 0;
		$where['sub_id'] = I('get.sub_id');
		// var_dump($where);exit;
		$Sdata = $sin->where($where)->select();
		unset($where['sin_sign']);

		$where['mul_sign'] = 0;
		$Mdata = $mul->where($where)->select();
		unset($where['mul_sign']);

		$where['jud_sign'] = 0;
		$Jdata = $jud->where($where)->select();
		unset($where['jud_sign']);

		$where['clo_sign'] = 0;
		$Cdata = $clo->where($where)->select();
		unset($where['clo_sign']);

		$where['ans_sign'] = 0;
		$Adata = $ans->where($where)->select();


		$sub = D('Subject');
		$data = $sub->where('sub_sign=0')->select();
		
		$this->assign('data',$data);
		$this->assign('sub_id',$where['sub_id']);
		$this->assign('Sdata',$Sdata);
		$this->assign('Mdata',$Mdata);
		$this->assign('Jdata',$Jdata);
		$this->assign('Cdata',$Cdata);
		$this->assign('Adata',$Adata);
		$this->display('paper.addMt');
	}

	// 保存手动试卷
	public function savePaperM(){
		$posts = I('post.');
		$pap = D('Paper');
		$data['pap_exti'] = $posts['pap_exti'];
		$data['sub_id'] = $posts['sub_id'];
		$data['pap_numb'] = $posts['pap_numb'];
		unset($posts['pap_exti']);
		unset($posts['sub_id']);
		unset($posts['pap_numb']);
		$posts['sin'] = implode(',',$posts['sin']);
		$posts['mul'] = implode(',',$posts['mul']);
		$posts['jud'] = implode(',',$posts['jud']);
		$posts['clo'] = implode(',',$posts['clo']);
		$posts['ans'] = implode(',',$posts['ans']);
		$data['pap_cont'] = serialize($posts);
		$data['pap_auto'] = 0;
		// var_dump($data);
		if($pap->create($data)){
			if($pap->add()){
				exit('succ');
			}else{
				exit('error');
			}
		}else{
			exit('error');
		}

		// $posts
	}

	// 分值表数据展示
	public function score(){
		$sql = "SELECT sco_id,sco_numb,tea_name,sco_id,sco_time
		FROM ot_score o
		LEFT JOIN ot_teacher
		ON o.tea_id=ot_teacher.tea_id
		WHERE sco_sign=0
		ORDER BY sco_id";
		$sco = D();
		$Sdata = $sco->query($sql);
		$active = 'score';
		$this->assign('active',$active);
		$this->assign('Sdata',$Sdata);
		$this->display();
	}

	// 新增分值表
	public function addScore(){
		$this->display('score.add');
	}

	// 保存分值表
	public function saveScore(){
		$posts = I('post.');
		$sco = D('Score');
		if($sco->create($posts)){
			if($sco->add()){
				exit('succ');
			}
		}else{
			exit('error');
		}
	}

	// 编辑分值表
	public function editScore(){
		$sco = D('Score');
		$where['sco_id'] = I('get.sco_id');
		$Sdata = $sco->where($where)->find();
		$this->assign('Sdata',$Sdata);
		$this->display('score.edit');
	}

	// 更新分值表
	public function updateScore(){
		$sco = D('Score');
		$posts = I('post.');
		$where['sco_id'] = $posts['sco_id'];
		if($sco->where($where)->save($posts)){
			exit('succ');
		}else{
			exit('error');
		}
	}

	// 删除分值表
	public function deleteScore(){
		$sco = D('Score');
		$data['sco_sign'] = 1;
		$where['sco_id'] = I('get.sco_id');
		if($sco->where($where)->save($data)){
			exit('succ');
		}else{
			exit('error');
		}
	}

	public function check(){
		$pap_id = I('get.pap_id');
		// var_dump($pap_id);
		if($pap_id==''){
			$this->index();
		}else{
		// var_dump($_SESSION['startTime']);exit;
			$pap = D('Paper');
			$where['pap_id'] = $pap_id;
			$data = $pap->where($where)->find();
			$pap_cont = unserialize($data['pap_cont']);
			$pap_id = $data['pap_id'];
			if(!isset($_SESSION['startTime'][$pap_id])){
				$times = $data['pap_exti'] * 60;
				$_SESSION['startTime'][$pap_id] = time() + $times;
			}
			if($data['pap_auto']==1){
				$sco = D('Score');
				$SWhere['sco_id'] = $data['sco_id'];
				$Sdata = $sco->where($SWhere)->find();
				$sin = D('Single');
				$mul = D('Multiple');
				$jud = D('Judge');
				$clo = D('Cloze');
				$ans = D('Answer');
				$data['sin'] = $sin->where("sin_sign=0 and sub_id={$data['sub_id']}")->order("RAND({$pap_cont['sin_rand']})")->limit($Sdata['sco_num_sing'])->select();
				$data['mul'] = $mul->where("mul_sign=0 and sub_id={$data['sub_id']}")->order("RAND({$pap_cont['mul_rand']})")->limit($Sdata['sco_num_mult'])->select();
				$data['jud'] = $jud->where("jud_sign=0 and sub_id={$data['sub_id']}")->order("RAND({$pap_cont['jud_rand']})")->limit($Sdata['sco_num_judg'])->select();
				$data['clo'] = $clo->where("clo_sign=0 and sub_id={$data['sub_id']}")->order("RAND({$pap_cont['clo_rand']})")->limit($Sdata['sco_num_cloz'])->select();
				$data['ans'] = $ans->where("ans_sign=0 and sub_id={$data['sub_id']}")->order("RAND({$pap_cont['ans_rand']})")->limit($Sdata['sco_num_answ'])->select();
				$this->assign('pap_auto',$data['pap_auto']);
				$this->assign('pap_id',$pap_id);
				$this->assign('data',$data);
				$this->display('paper.check');
			}else{
				$sqls = sprintf("SELECT * FROM %s WHERE %s IN (%s)",'ot_single','sin_id',$pap_cont['sin']);
				$sqlm = sprintf("SELECT * FROM %s WHERE %s IN (%s)",'ot_multiple','mul_id',$pap_cont['mul']);
				$sqlj = sprintf("SELECT * FROM %s WHERE %s IN (%s)",'ot_judge','jud_id',$pap_cont['jud']);
				$sqlc = sprintf("SELECT * FROM %s WHERE %s IN (%s)",'ot_cloze','clo_id',$pap_cont['clo']);
				$sqla = sprintf("SELECT * FROM %s WHERE %s IN (%s)",'ot_answer','ans_id',$pap_cont['ans']);
				$db = D();
				$data['sin'] = $pap_cont['sin']==''?'':$db->query($sqls);
				$data['mul'] = $pap_cont['mul']==''?'':$db->query($sqlm);
				$data['jud'] = $pap_cont['jud']==''?'':$db->query($sqlj);				
				$data['clo'] = $pap_cont['clo']==''?'':$db->query($sqlc);				
				$data['ans'] = $pap_cont['ans']==''?'':$db->query($sqla);
				$this->assign('pap_auto',$data['pap_auto']);
				$this->assign('pap_id',$pap_id);
				$this->assign('data',$data);
				$this->display('paper.check');
			}
		}
	}

}