<?php
namespace Home\Controller;
use Think\Controller;
class ExamController extends Controller {
	public function _initialize(){
		//验证权限及传递权限参数
		R("Public/checkUser");
		// R("Public/checkUsers");
		$this->assign('user',$_SESSION['User']);
		//设置侧栏菜单
		R("Index/sidebar");
		//设置顶栏菜单
		$menu['click'] = "Exam";
		$this->assign('menu', $menu);
	}
	
	public function index(){
		$gets = I('get.');
		// var_dump(isset($gets['id']));
		if(trim($gets['id']=='')){
			$this->display();
		}
		$pap = D('');
		// $sqlpid = sprintf("SELECT DISTINCT pap_id
		// 				FROM ot_grade
		// 				WHERE stu_id = %d",$_SESSION['Stu']['stu_id']);
		// var_dump($sqlpid);
		$gra = D('Grade');
		$datapid = $gra->distinct(true)->field('pap_id')->where("stu_id={$_SESSION['Stu']['stu_id']}")->select();
		foreach ($datapid as $key => $value) {
			$pid .= $key==0?$value['pap_id']:','.$value['pap_id'];
		}
		// var_dump($pid);exit;
		$Wpap_id = $pid==''?'':sprintf("AND pap_id NOT IN (%s)",$pid);
		$sql = sprintf('SELECT tea_name,pap_numb,sub_name,pap_time,pap_id
			FROM ot_paper o
			LEFT JOIN ot_subject 
			ON o.sub_id=ot_subject.sub_id
			LEFT JOIN ot_teacher
			ON o.tea_id=ot_teacher.tea_id
			WHERE pap_sign=0 and o.sub_id=%d AND pap_star=1 AND cla_id=%d %s
			ORDER BY pap_id',$gets['id'],$_SESSION['Stu']['cla_id'],$Wpap_id);
		// var_dump($sql);exit;
		$data = $pap->query($sql);

		// $dd = serialize($data);
		// $ss = unserialize($dd);
		// var_dump($dd);exit;
		$this->assign('data',$data);
		$this->display('list');
	}

	public function exam(){
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
				$this->display();
			}else{
				$sqls = sprintf("SELECT * FROM %s WHERE %s IN (%s)",'ot_single','sin_id',$pap_cont['sin']);
				$sqlm = sprintf("SELECT * FROM %s WHERE %s IN (%s)",'ot_multiple','mul_id',$pap_cont['mul']);
				$sqlj = sprintf("SELECT * FROM %s WHERE %s IN (%s)",'ot_judge','jud_id',$pap_cont['jud']);
				$sqlc = sprintf("SELECT * FROM %s WHERE %s IN (%s)",'ot_cloze','clo_id',$pap_cont['clo']);
				$sqla = sprintf("SELECT * FROM %s WHERE %s IN (%s)",'ot_answer','ans_id',$pap_cont['ans']);
				$db = D();
				$data['sin'] = $db->query($sqls);
				$data['mul'] = $db->query($sqlm);
				$data['jud'] = $db->query($sqlj);				
				$data['clo'] = $pap_cont['clo']==''?'':$db->query($sqlc);				
				// var_dump($sqlj);exit;
				$data['ans'] = $pap_cont['ans']==''?'':$db->query($sqla);
				$this->assign('pap_auto',$data['pap_auto']);
				$this->assign('pap_id',$pap_id);
				$this->assign('data',$data);
				$this->display();
			}
		}
	}

	//试卷提交--系统打分
	public function score(){
		$score = 0;
		$pap = D('Paper');
		$where['pap_id'] = I('post.pap_id');
		$papData = $pap->where($where)->find();
		$pap_cont = unserialize($papData['pap_cont']);
		unset($where);
		$sco = D('Score');
		$where['sco_id'] = $papData['sco_id'];
		$scoData = $sco->where($where)->find();
		unset($where);
		// var_dump($scoData);exit;

		$sin = D('Single');
		$mul = D('Multiple');
		$jud = D('Judge');
		$clo = D('Cloze');
		// var_dump($pap_cont['sin_rand']);
		$data['sin'] = $sin->where("sin_sign=0 and sub_id={$papData['sub_id']}")->order("RAND({$pap_cont['sin_rand']})")->limit($scoData['sco_num_sing'])->getField('sin_answ',true);
		$data['mul'] = $mul->where("mul_sign=0 and sub_id={$papData['sub_id']}")->order("RAND({$pap_cont['mul_rand']})")->limit($scoData['sco_num_mult'])->getField('mul_answ',true);
		$data['jud'] = $jud->where("jud_sign=0 and sub_id={$papData['sub_id']}")->order("RAND({$pap_cont['jud_rand']})")->limit($scoData['sco_num_judg'])->getField('jud_answ',true);
		$data['clo'] = $clo->where("clo_sign=0 and sub_id={$papData['sub_id']}")->order("RAND({$pap_cont['clo_rand']})")->limit($scoData['sco_num_cloz'])->select();
		// var_dump($data['clo']);exit;
		$posts = I('post.');
		// var_dump($posts);
		// 单选题
		foreach ($data['sin'] as $key => $value) {
			// var_dump($value['sin_answ']);exit;
			$whereSin['sin_id'] = $posts['sin_id'][$key+1];
			if(isset($posts['sin_option'][$key+1])&&$value == $posts['sin_option'][$key+1]){
				$score += $scoData['sco_sing'];
				$saveSin['sin_righ'] = (int)$posts['sin_righ'][$key+1] + 1;
			}
			$saveSin['sin_all'] = (int)$posts['sin_all'][$key+1] + 1;
			// var_dump($whereSin,$saveSin);
			$sin->where($whereSin)->save($saveSin);
			// var_dump($whereSin,$saveSin);exit;
		}
		// 多选题
		// var_dump($data['mul']);exit;
		foreach ($data['mul'] as $key => $value) {
			// var_dump(implode('',$posts['mul_option'][$key+1]),$value);exit;
			$wheremul['mul_id'] = $posts['mul_id'][$key+1];
			if(isset($posts['mul_option'][$key+1])&&$value == implode('',$posts['mul_option'][$key+1])){
				$score += $scoData['sco_mult'];
				$savemul['mul_righ'] = (int)$posts['mul_righ'][$key+1] + 1;
			}
			$savemul['mul_all'] = (int)$posts['mul_all'][$key+1] + 1;
			$mul->where($wheremul)->save($savemul);
		}
		// 判断题
		foreach ($data['jud'] as $key => $value) {
			// var_dump($key);
			$wherejud['jud_id'] = $posts['jud_id'][$key+1];
			if(isset($posts['jud_option'][$key+1])&&$value == $posts['jud_option'][$key+1]){
				$score += $scoData['sco_judg'];
				$savejud['jud_righ'] = (int)$posts['jud_righ'][$key+1] + 1;
			}
			$savejud['jud_all'] = (int)$posts['jud_all'][$key+1] + 1;
			$jud->where($wherejud)->save($savejud);
		}
		// 填空题
		// var_dump($data['clo']);exit;
		foreach ($data['clo'] as $key => $value) {
			// var_dump($key);exit;
			if(isset($posts['clo_option'][$key+1])){
		// var_dump($value);exit;
				$whereclo['clo_id'] = $posts['clo_id'][$key+1];
				if($value['clo_ansa'] == $posts['clo_option'][$key+1]||$value['clo_ansb'] == $posts['clo_option'][$key+1]||$value['clo_ansc'] == $posts['clo_option'][$key+1]){
					$score += $scoData['sco_cloz'];
					$saveclo['clo_righ'] = (int)$posts['clo_righ'][$key+1] + 1;
				}
				$saveclo['clo_all'] = (int)$posts['clo_all'][$key+1] + 1;
				$clo->where($whereclo)->save($saveclo);
			}
		}
		// var_dump($score);exit;

		$gra = D('Grade');
		$posts['gra_answ']['scor'] = $scoData['sco_answ'] * $scoData['sco_num_answ'];
		$data['gra_answ'] = serialize($posts['gra_answ']);
		// var_dump($data['gra_answ']);
		// $data['gra_answ'] = unserialize($data['gra_answ']);
		// var_dump($data['gra_answ']);exit;
		$data['gra_grac'] = $score;
		$data['gra_siga'] = 0;
		$data['pap_id'] = I('post.pap_id');
		// var_dump($_SESSION['Stu']);exit;
		if($gra->create($data)){
			if($gra->add()){
				exit('succ');
			}
		}else{
			exit('error');	
		}
	}

	// 手动试卷--系统打分
	public function ScoreM(){
		$score = 0;
		$pap = D('Paper');
		$where['pap_id'] = I('post.pap_id');
		$papData = $pap->where($where)->find();
		$pap_cont = unserialize($papData['pap_cont']);

		$sqls = sprintf("SELECT sin_answ FROM %s WHERE %s IN (%s)",'ot_single','sin_id',$pap_cont['sin']);
		$sqlm = sprintf("SELECT mul_answ FROM %s WHERE %s IN (%s)",'ot_multiple','mul_id',$pap_cont['mul']);
		$sqlj = sprintf("SELECT jud_answ FROM %s WHERE %s IN (%s)",'ot_judge','jud_id',$pap_cont['jud']);
		$sqlc = sprintf("SELECT clo_ansa,clo_ansb,clo_ansc FROM %s WHERE %s IN (%s)",'ot_cloze','clo_id',$pap_cont['clo']);
		$db = D();
		$data['sin'] = $db->query($sqls);
		$data['mul'] = $db->query($sqlm);
		$data['jud'] = $db->query($sqlj);				
		$data['clo'] = $db->query($sqlc);				

		$sin = D('Single');
		$mul = D('Multiple');
		$jud = D('Judge');
		$clo = D('Cloze');

		$posts = I('post.');
		// var_dump($posts);exit;
		// var_dump($posts['sin_id']);exit;
		// 单选题
		foreach ($data['sin'] as $key => $value) {
			// var_dump(isset($posts['sin_option'][$key+1]),$value['sin_answ'] == $posts['sin_option'][$key+1]);exit;
			// var_dump($posts['sin_id'],$data['sin']);exit;
			$whereSin['sin_id'] = $posts['sin_id'][$key+1];
			if(isset($posts['sin_option'][$key+1])&&$value['sin_answ'] == $posts['sin_option'][$key+1]){
				$score += $pap_cont['sin_scor'];
				$saveSin['sin_righ'] = (int)$posts['sin_righ'][$key+1] + 1;
				// var_dump($posts['sin_id'][$key+1]);exit;
			}
			$saveSin['sin_all'] = (int)$posts['sin_all'][$key+1] + 1;
			// if($whereSin==null){
			// var_dump($whereSin,$saveSin,$key);exit;
			// }
			$sin->where($whereSin)->save($saveSin);
			// var_dump($whereSin,$saveSin);exit;
		}
		// exit;
		// 多选题
		// var_dump($data['mul']);exit;
		foreach ($data['mul'] as $key => $value) {
			// var_dump(implode('',$posts['mul_option'][$key+1]),$value);exit;
			$wheremul['mul_id'] = $posts['mul_id'][$key+1];
			if(isset($posts['mul_option'][$key+1])&&$value['mul_answ'] == implode('',$posts['mul_option'][$key+1])){
				$score += $pap_cont['mul_scor'];
				$savemul['mul_righ'] = (int)$posts['mul_righ'][$key+1] + 1;
			}
			$savemul['mul_all'] = (int)$posts['mul_all'][$key+1] + 1;
			$mul->where($wheremul)->save($savemul);
		}
		// 判断题
		foreach ($data['jud'] as $key => $value) {
			// var_dump($key);
			$wherejud['jud_id'] = $posts['jud_id'][$key+1];
			if(isset($posts['jud_option'][$key+1])&&$value['jud_answ'] == $posts['jud_option'][$key+1]){
				$score += $pap_cont['jud_scor'];
				$savejud['jud_righ'] = (int)$posts['jud_righ'][$key+1] + 1;
			}
			$savejud['jud_all'] = (int)$posts['jud_all'][$key+1] + 1;
			$jud->where($wherejud)->save($savejud);
		}
		// 填空题
		// var_dump($data['clo']);exit;
		foreach ($data['clo'] as $key => $value) {
			// var_dump($key);exit;
			if(isset($posts['clo_option'][$key+1])){
		// var_dump($value);exit;
				$whereclo['clo_id'] = $posts['clo_id'][$key+1];
				if($value['clo_ansa'] == $posts['clo_option'][$key+1]||$value['clo_ansb'] == $posts['clo_option'][$key+1]||$value['clo_ansc'] == $posts['clo_option'][$key+1]){
					$score += $pap_cont['clo_scor'];
					$saveclo['clo_righ'] = (int)$posts['clo_righ'][$key+1] + 1;
				}
				$saveclo['clo_all'] = (int)$posts['clo_all'][$key+1] + 1;
				$clo->where($whereclo)->save($saveclo);
			}
		}
		// var_dump($score);exit;

		$gra = D('Grade');
		$posts['gra_answ']['scor'] = $pap_cont['ans_scor'] * count($posts['gra_answ']);
		// var_dump($posts['gra_answ']['scor']);exit;
		$data['gra_answ'] = serialize($posts['gra_answ']);
		// var_dump($data['gra_answ']);
		// $data['gra_answ'] = unserialize($data['gra_answ']);
		// var_dump($data['gra_answ']);exit;
		$data['gra_grac'] = $score;
		$data['gra_siga'] = 0;
		$data['pap_id'] = I('post.pap_id');
		// var_dump($_SESSION['Stu']);exit;
		if($gra->create($data)){
			if($gra->add()){
				exit('succ');
			}
		}else{
			exit('error');	
		}
	}

	public function countDown(){
		$pap_id = I('post.pap_id');
		// var_dump($posts['pap_id']);
		date_default_timezone_set('PRC');
		// var_dump(date("Y-m-d H:i:s",strtotime("+2 hours")));
		// $h=date('H',$_SESSION['startTime'])-date('H',$time);
		// $m=date('i',$_SESSION['startTime'])-date('i',$time);
		// $s=date('s',$_SESSION['startTime'])-date('s',$time);
		// $h=date('H',$_SESSION['startTime']);
		// $m=date('i',$_SESSION['startTime']);
		// $s=date('s',$_SESSION['startTime']);
		// echo '当前时间：'.date("H:i:s" ,$time)."<br/>"."剩余时间:".$h.":".$m.":".$s ;
		// echo "剩余时间:".$h.":".$m.":".$s ;
		// echo $_SESSION['startTime'];
		$time = time();
		$data = $_SESSION['startTime'][$pap_id] - $time - 28800;
		$date = date('H:i:s',$data);
		if($date==date('H:i:s',-28800)){
			echo 'error';
		}else{
			echo $date;
		}
		// echo date('H:i:s',$_SESSION['startTime']);
		// echo date('H:i:s',time());
		// echo date('H:i:s',7200-28800);
	}
}