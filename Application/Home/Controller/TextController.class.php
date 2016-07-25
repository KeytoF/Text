<?php
namespace Home\Controller;
use Think\Controller;
header("Content-type:text/html;charset=utf-8"); 
class TextController extends Controller {
	public function _initialize(){
		//验证权限及传递权限参数
		R("Public/checkUser");
		$this->assign('user',$_SESSION['User']);
		//设置侧栏菜单
		R("Index/sidebar");
		//设置顶栏菜单
		$menu['click'] = "Text";
		$this->assign('menu', $menu);
	}
	
	public function index(){
		$posts['sub_id'] = I('get.id');
		$this->assign('sub_id',$posts['sub_id']);
		$this->display('index');
	}

	public function text(){
		$posts = I('post.');
		// var_dump($posts);exit;
		if(empty($posts)){
			R('Text/index');
		}else{
		// 测试数据
		// $posts['type'] = 'Single';
		// $posts['sin_sign'] = '0';

		// $posts['sub_id'] = I('get.id');
		// var_dump($posts['sub_id']);exit;
			$type = $posts['type'];
			unset($posts['type']);
			$text = D($type);
		// var_dump($posts);exit;
			$data = $text->where($posts)->order('RAND()')->find();
		// var_dump($data);exit;
			if(!$data){
				$this->display('notext');
			}else{
				$this->assign('sub_id',$posts['sub_id']);
				$this->assign('type',$type);
				$this->assign('data',$data);
				switch ($type) {
					case 'Single':
						$this->display();
						break;

					case 'Multiple':
						$this->display('mult');
						break;

					case 'Judge':
						$this->display('judge');
						break;
					
					case 'Cloze':
						$this->display('cloze');
						break;

					default:
						$this->display('index');
					break;
				}
			}
		}
	}

	public function mult(){
		$posts = I('post.');
		// var_dump($posts);exit;
		if(empty($posts)){
			R('Text/index');
		}else{
		// 测试数据
		// $posts['type'] = 'Single';
		// $posts['sin_sign'] = '0';

		// $posts['sub_id'] = I('get.id');
		// var_dump($posts['sub_id']);exit;
			$type = $posts['type'];
			unset($posts['type']);
			$text = D($type);
		// var_dump($posts);exit;
			$data = $text->where($posts)->order('RAND()')->find();
		// var_dump($data);exit;
			if(!$data){
				$this->display('notext');
			}else{
				$this->assign('sub_id',$posts['sub_id']);
				$this->assign('type',$type);
				$this->assign('data',$data);
				$this->display();
			}
		}
	}
	//ajax题目
	public function question($SubjectID=0){
		$GLOBALS['rand'] = rand(1,100);
		$chocie=M('Choice');
		$where['EorT']=C('Text');
		$where['SubjectID']=$SubjectID;
		$value=$chocie->where($where)->order("rand(".$GLOBALS['rand'].")")->select();
		// var_dump($value);exit;
		for($i=0;$i<count($value);$i++){
			$answers = explode('###',$value[$i]['Answer']);
			$arr[] = array(
				'question' => $i.'、'.$value[$i]['Question'],
				'answers' => $answers
				);
		}
		$json = json_encode($arr);
		exit($json);
	}
	//ajax结果
	public function result(){
		// $host="localhost";
		// $db_user="root";
		// $db_pass="root";
		// $db_name="demo";
		// $timezone="Asia/Shanghai";

		// $link=mysql_connect($host,$db_user,$db_pass);
		// mysql_select_db($db_name,$link);
		// mysql_query("SET names UTF8");

		// header("Content-Type: text/html; charset=utf-8");
		// date_default_timezone_set($timezone); //北京时间

		$data = $_REQUEST['an'];

		$answers = explode('|',$data);
		$an_len = count($answers)-1; //题目数

		// $sql = "select correct from quiz ORDER BY rand(3)";

		// $query = mysql_query($sql);

		$chocie=M('choice');
		$where['EorT']=C('Text');
		$value=$chocie->where($where)->order("rand(".$GLOBALS['rand'].")")->select();

		$i = 0;
		$score = 0; //初始得分
		$q_right = 0; //答对的题数
		for($i=0;$i<count($value);$i++){
			if($answers[$i]==$value[$i]['Correct']){
				$arr['res'][] = 1;
				$q_right += 1;
			}else{
				$arr['res'][] = 0;
			}
		}
		// while($row=mysql_fetch_array($query)){
		// 	if($answers[$i]==$row['correct']){
		// 		$arr['res'][] = 1;
		// 		$q_right += 1;
		// 	}else{
		// 		$arr['res'][] = 0;
		// 	}
		// 	$i++;
		// }
		$arr['score'] = round(($q_right/$an_len)*100);
		echo json_encode($arr);
	}
}