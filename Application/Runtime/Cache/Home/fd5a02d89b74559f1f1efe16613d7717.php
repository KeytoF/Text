<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
	<title>在线考试</title>
	<!--<link rel="stylesheet" type="text/css" href="/Public/foundation-5/css/foundation.min.css">
	<script src="/Public/foundation-5/js/foundation.min.js" type="text/javascript" charset="utf-8"></script>-->
	<!-- <link rel="stylesheet" type="text/css" href="/Public/pure-release-0.5.0/base-min.css"> -->
	<link rel="stylesheet" type="text/css" href="/Public/pure-release-0.5.0/grids-min.css">
	<link rel="stylesheet" type="text/css" href="/Public/pure-release-0.5.0/forms-min.css">
	<link rel="stylesheet" type="text/css" href="/Public/pure-release-0.5.0/tables-min.css">
	<link rel="stylesheet" type="text/css" href="/Public/pure-release-0.5.0/menus-min.css">
	<link rel="stylesheet" type="text/css" href="/Public/pure-release-0.5.0/buttons-min.css">
	<link rel="stylesheet" type="text/css" href="/Public/css/index.css">
	<link rel="stylesheet" type="text/css" href="/Public/css/public.css">
	<link rel="stylesheet" type="text/css" href="/Public/css/list.css">
	<link rel="stylesheet" type="text/css" href="/Public/css/sidebar.css">
	<link rel="stylesheet" type="text/css" href="/Public/css/page.css">
	<script src="/Public/js/jquery-1.12.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="/Public/js/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
	<script src="/Public/js/layer/layer.js"></script>
</head>
<body>
	<div class='div'>
		<div class='top'>
			<div class='logo'><img class='logoimage' src="/Public/image/logo.png"></div>
			<div class='topmenu'>
				<div class='divuser'>
					<div style="height: 14px">
						
					</div>
					<a href="/User/index/id/2.html"><?php echo ($user["username"]); ?></a>
					<a href="/Index/logout.html">退出登录</a>
					<!-- <a href="javascript:;" onclick="getajax('123')">退出登录</a> -->
					<a href="/Auser/user.html">后台</a>
				</div>
				<div class="time">
					<p id='s'></p>
				</div>
				<script>setInterval("s.innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);</script>
				<nav>
					<ul> 
						<li <?php if($menu['click']==Index): ?>class="menu checkmenu"<?php else: ?>class="menu"<?php endif; ?>><a class='menu' id='index' href="/Index/index/id/0.html">网站首页</a></li>
						<li <?php if($menu['click']==Text): ?>class="menu checkmenu"<?php else: ?>class="menu"<?php endif; ?>><a class='menu' id='text' href="/Text/index.html">真题练习</a></li>
						<li <?php if($menu['click']==Exam): ?>class="menu checkmenu"<?php else: ?>class="menu"<?php endif; ?>><a class='menu' id='Exam' href="/Exam/index.html">在线考试</a></li>
						<li <?php if($menu['click']==Data): ?>class="menu checkmenu"<?php else: ?>class="menu"<?php endif; ?>><a class='menu' id='data' href="/Data/index.html">学习资料</a></li>
						<li <?php if($menu['click']==User): ?>class="menu checkmenu"<?php else: ?>class="menu"<?php endif; ?>><a class='menu' id='user' href="/User/index/id/2.html">用户信息</a></li>
					</ul>
				</nav>
			</div>
		</div>
<!-- <link rel="stylesheet" type="text/css" href="/Public/pure-release-0.5.0/grids-min.css"> -->
<script>
	$(document).ready(function() {
		$('.mcd-menu li').click(function() {
			$('.mcd-menu li').removeClass();
			$(this).addClass('active');
		});
	});
</script>
<nav class='left'>
	<ul class="mcd-menu">
		<?php if(is_array($sidebarList)): foreach($sidebarList as $key=>$sL): ?><li><a <?php if($sL['sub_id']==$id): ?>class="active"<?php else: ?>class='a'<?php endif; ?>
				href="?id=<?php echo ($sL["sub_id"]); ?>"><strong><?php echo ($sL["sub_name"]); ?></strong></a>
			</li><?php endforeach; endif; ?>
	</ul>
</nav>
<!-- <div id='left'>
    <nav id='left'>
        <ul class="mcd-menu">
            <?php if(is_array($sidebarList)): foreach($sidebarList as $key=>$sL): ?><li><a <?php if(isset($sL['class'])): ?>class="<?php echo ($sL["class"]); ?>"<?php else: ?>class='a'<?php endif; ?>
                   href="/<?php echo ($sL["URL"]); ?>"><strong><?php echo ($sL["sub_name"]); ?></strong></a>
                </li><?php endforeach; endif; ?>
        </ul>
    </nav>
</div> -->
<style type="text/css" media="screen">
	/*.right{position: relative; }*/
	.countDown{float: right; position: absolute; top: 80px; right: 15px; color: red; }
	.exam{width: 100%; margin: 0 auto; background-color: #EAECEA; }
	.bt{display: block; width: 100%; text-align: center; background-color: rgb(231, 255, 231); }
	.textareas{width: 100%; height: 100px;}
	label{display: block; width: 100%;}
	td{word-break: break-all; }
</style>
<div class='right'>
	<div id="hh" class='countDown'>

	</div>
	<div class='exam tl'>
	<?php if($pap_auto == 1): ?><form id='form' action="/Exam/score" method="post" class='pure-form pure-form-aligned' accept-charset="utf-8">
		<?php else: ?>
		<form id='form' action="/Exam/scoreM" method="post" class='pure-form pure-form-aligned' accept-charset="utf-8"><?php endif; ?>
			<input type="hidden" name="pap_id" value="<?php echo ($pap_id); ?>">
			<div class='exam div' id="single">
				<label class='bt'>单选题</label>
				<?php if(is_array($data['sin'])): $ks = 0; $__LIST__ = $data['sin'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$ds): $mod = ($ks % 2 );++$ks;?><table>
						<tbody>
							<tr>
								<td colspan="3"><label><?php echo ($ks); ?>、<?php echo ($ds["sin_ques"]); ?></label></td>
							</tr>
							<tr>
								<td><input type="radio" name="sin_option[<?php echo ($ks); ?>]" value='A'>A、<?php echo ($ds["sin_opta"]); ?></td>
								<td><input type="hidden" name="sin_id[<?php echo ($ks); ?>]" value="<?php echo ($ds["sin_id"]); ?>"></td>
								<td><input type="hidden" name="sin_righ[<?php echo ($ks); ?>]" value="<?php echo ($ds["sin_righ"]); ?>"></td>
								<td><input type="hidden" name="sin_all[<?php echo ($ks); ?>]" value="<?php echo ($ds["sin_all"]); ?>"></td>
							</tr>
							<tr>
								<td><input type="radio" name="sin_option[<?php echo ($ks); ?>]" value='B'>B、<?php echo ($ds["sin_optb"]); ?></td>
							</tr>
							<tr>
								<td><input type="radio" name="sin_option[<?php echo ($ks); ?>]" value='C'>C、<?php echo ($ds["sin_optc"]); ?></td>
							</tr>
							<tr>
								<td><input type="radio" name="sin_option[<?php echo ($ks); ?>]" value='D'>D、<?php echo ($ds["sin_optd"]); ?></td>
							</tr>
							<tr>&nbsp;</tr>
						</tbody>
					</table><?php endforeach; endif; else: echo "" ;endif; ?>
			</div>

			<div class='examdiv' id="multiple">
				<label class='bt'>多选题</label>
				<?php if(is_array($data['mul'])): $km = 0; $__LIST__ = $data['mul'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$dm): $mod = ($km % 2 );++$km;?><table>
						<tbody>
							<tr>
								<td><label><?php echo ($km); ?>、<?php echo ($dm["mul_ques"]); ?></label></td>
								<td><input type="hidden" name="mul_id[<?php echo ($km); ?>]" value="<?php echo ($ds["mul_id"]); ?>"></td>
								<td><input type="hidden" name="mul_righ[<?php echo ($km); ?>]" value="<?php echo ($ds["mul_righ"]); ?>"></td>
								<td><input type="hidden" name="mul_all[<?php echo ($km); ?>]" value="<?php echo ($ds["mul_all"]); ?>"></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="mul_option[<?php echo ($km); ?>][]" value='A'>A、<?php echo ($dm["mul_opta"]); ?></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="mul_option[<?php echo ($km); ?>][]" value='B'>B、<?php echo ($dm["mul_optb"]); ?></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="mul_option[<?php echo ($km); ?>][]" value='C'>C、<?php echo ($dm["mul_optc"]); ?></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="mul_option[<?php echo ($km); ?>][]" value='D'>D、<?php echo ($dm["mul_optd"]); ?></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="mul_option[<?php echo ($km); ?>][]" value='E'>E、<?php echo ($dm["mul_opte"]); ?></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="mul_option[<?php echo ($km); ?>][]" value='F'>F、<?php echo ($dm["mul_optf"]); ?></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="mul_option[<?php echo ($km); ?>][]" value='G'>G、<?php echo ($dm["mul_optg"]); ?></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="mul_option[<?php echo ($km); ?>][]" value='H'>H、<?php echo ($dm["mul_opth"]); ?></td>
							</tr>
							<tr>&nbsp;</tr>
						</tbody>
					</table><?php endforeach; endif; else: echo "" ;endif; ?>
			</div>

			<div class='examdiv' id="judge">
				<label class='bt'>判断题</label>
				<?php if(is_array($data['jud'])): $kj = 0; $__LIST__ = $data['jud'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$dj): $mod = ($kj % 2 );++$kj;?><table>
						<tbody>
							<tr style="width:100%;">
								<td colspan="3"><label><?php echo ($kj); ?>、<?php echo ($dj["jud_ques"]); ?></label></td>
							</tr>
							<tr>
								<td class='w40'><input type="radio" name="jud_option[<?php echo ($kj); ?>]" value='1'>√</td>
								<td><input type="radio" name="jud_option[<?php echo ($kj); ?>]" value='0'>×</td>
								<td><input type="hidden" name="jud_id[<?php echo ($kj); ?>]" value="<?php echo ($ds["jud_id"]); ?>"></td>
								<td><input type="hidden" name="jud_righ[<?php echo ($kj); ?>]" value="<?php echo ($ds["jud_righ"]); ?>"></td>
								<td><input type="hidden" name="jud_all[<?php echo ($kj); ?>]" value="<?php echo ($ds["jud_all"]); ?>"></td>
							</tr>
							<tr>&nbsp;</tr>
						</tbody>
					</table><?php endforeach; endif; else: echo "" ;endif; ?>
			</div>

			<div class='examdiv' id="cloze">
				<label class='bt'>填空题</label>
				<?php if(is_array($data['clo'])): $kc = 0; $__LIST__ = $data['clo'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$dc): $mod = ($kc % 2 );++$kc;?><table>
						<tbody>
							<tr>
								<td><label><?php echo ($kc); ?>、<?php echo ($dc["clo_ques"]); ?></label></td>
								<td><input type="hidden" name="clo_id[<?php echo ($kc); ?>]" value="<?php echo ($ds["clo_id"]); ?>"></td>
								<td><input type="hidden" name="clo_righ[<?php echo ($kc); ?>]" value="<?php echo ($ds["clo_righ"]); ?>"></td>
								<td><input type="hidden" name="clo_all[<?php echo ($kc); ?>]" value="<?php echo ($ds["clo_all"]); ?>"></td>
							</tr>
							<tr>
								<td><input type="text" name="clo_option[<?php echo ($kc); ?>]"></td>
							</tr>
							<tr>&nbsp;</tr>
						</tbody>
					</table><?php endforeach; endif; else: echo "" ;endif; ?>
			</div>

			<div class='examdiv' id="answer">
				<label class='bt'>简答题</label>
				<?php if(is_array($data['ans'])): $ka = 0; $__LIST__ = $data['ans'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$da): $mod = ($ka % 2 );++$ka;?><table>
						<tbody>
							<tr>
								<td><label><?php echo ($ka); ?>、<?php echo ($da["ans_ques"]); ?></label></td>
							</tr>
							<tr>
								<td>
								<input type="hidden" name="gra_answ[<?php echo ($ka); ?>][ques]" value="<?php echo ($da["ans_ques"]); ?>">
								<input type="hidden" name="gra_answ[<?php echo ($ka); ?>][answ]" value="<?php echo ($da["ans_answ"]); ?>">
								<textarea class='textareas' name="gra_answ[<?php echo ($ka); ?>][resu]"></textarea>
								</td>
							</tr>
							<tr>&nbsp;</tr>
						</tbody>
					</table><?php endforeach; endif; else: echo "" ;endif; ?>
			</div>
			<div class='tc'>
				<button type="submit" id='submit' class="pure-button pure-button-primary">Submit</button>
			</div>
		</form>
	</div>
</div>
</body>
</html>
<script src="/Public/js/popup.js" type="text/javascript"></script>
<script>
	var form = $('#form');

	$(form).submit(function() {
		data = $(this).serialize()
		bool = $(this).valid()
		url = $(this).attr('action')
		if(bool==true){
			console.log(data);
			$.post(url,data,function(s){
				if(s=='succ'){
					succ()
				}else{
					error()
				}
			});
		}
		return false;
	});
	function succ(){
		layer.msg('成功', {
			icon: 1,
			time: 2000 
		}, function(){
			window.location.href='/Exam/index';
		})
	}
	function error(){
		layer.msg('失败', {
			icon: 2,
			time: 2000 
		}, function(){
		})
	}
	function gett(){
		$(function(){
			$.ajax({
				url:'/Exam/countDown',
				type:"POST",
				data:{action:"guesslike",pap_id: <?php echo ($pap_id); ?>},
				dataType:"html",
				timeout:3000,
				cache:false,
				success:function(re){
					if(re=='error'){
						$('#submit').click();
					}else{
						$('#hh').html(re);
					}
				}
			})
		});
		setTimeout("gett()",1000) 
	}
	gett();
</script>