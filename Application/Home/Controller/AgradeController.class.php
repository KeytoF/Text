<?php
namespace Home\Controller;
use Think\Controller;
class AgradeController extends Controller {
	//构造函数--设置menu&sidebar
	public function _initialize(){
		R("Public/checkAdmin");
		$this->assign('user',$_SESSION['User']);
		//设置侧栏菜单
		R("Index/sidebar");
		//设置顶栏菜单
		$menu['click'] = "Agrade";
		$this->assign('menu', $menu);
	}

	public function grade(){
		$gra = D('');
		$sql = "SELECT stu_name,pap_numb,gra_time,gra_grac,sub_name,gra_id,gra_siga,CONCAT(s.stu_year,ot_faculty.fac_numb,ot_major.maj_numb,ot_classs.cla_numb,s.stu_numb) AS stu_numb
				FROM ot_grade o 
				LEFT JOIN ot_student s
				ON o.stu_id=s.stu_id
				LEFT JOIN ot_paper p
				ON o.pap_id=p.pap_id
				LEFT JOIN ot_subject
				ON ot_subject.sub_id=p.sub_id
				LEFT JOIN ot_classs 
				ON s.cla_id=ot_classs.cla_id 
				LEFT JOIN ot_major 
				ON ot_classs.maj_id=ot_major.maj_id 
				LEFT JOIN ot_faculty 
				ON ot_major.fac_id=ot_faculty.fac_id
				WHERE gra_sign=0 
				ORDER BY gra_id";
		$data = $gra->query($sql);
		$this->assign('active','grade');
		$this->assign('data',$data);
		$this->display();
	}

	public function addGrade(){
		$this->display('grade.add');
	}

	public function editGrade(){
		$gra_id = I('get.gra_id');
		$gra = D('');
		$sql = "SELECT stu_name,gra_id,gra_grac,gra_answ,sub_name,CONCAT(s.stu_year,ot_faculty.fac_numb,ot_major.maj_numb,ot_classs.cla_numb,s.stu_numb) AS stu_numb
				FROM ot_grade g
				LEFT JOIN ot_student s
				ON g.stu_id=s.stu_id
				LEFT JOIN ot_paper p
				ON g.pap_id=p.pap_id
				LEFT JOIN ot_classs 
				ON s.cla_id=ot_classs.cla_id 
				LEFT JOIN ot_major 
				ON ot_classs.maj_id=ot_major.maj_id 
				LEFT JOIN ot_faculty 
				ON ot_major.fac_id=ot_faculty.fac_id
				LEFT JOIN ot_subject 
    			ON ot_subject.sub_id =p.sub_id
				WHERE gra_id={$gra_id}";
				// var_dump($sql);
		$data = $gra->query($sql);
		$data[0]['gra_answ'] = unserialize($data[0]['gra_answ']);
		// var_dump($data[0]['gra_answ']);exit;
		// var_dump($data[0]['gra_answ']);exit;
		$scores = $data[0]['gra_answ']['scor'];
		unset($data[0]['gra_answ']['scor']);
		$this->assign('scores',$scores);
		$this->assign('data',$data[0]);
		$this->display('grade.edit');
	}

	public function updateGrade(){
		$data['gra_graa'] = I('post.gra_graa');
		$data['gra_siga'] = 1;
		$where['gra_id'] = I('post.gra_id');
		$gra = D('Grade');
		// var_dump($data['gra_graa']);
		// var_dump($where['gra_id']);
		if($gra->where($where)->save($data)){
			exit('succ');
		}else{
			exit('error');
		}
	}

	public function deleteGrade(){
		$gra = D('Grade');
		$data['gra_sign'] = 1;
		$where['gra_id'] = I('get.gra_id');
		if($gra->where($where)->save($data)){
			exit('succ');
		}else{
			exit('error');
		}
	}
}