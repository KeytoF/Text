<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
	<title>在线考试-后台管理</title>
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
	<link rel="stylesheet" type="text/css" href="/Public/css/tip.css">
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
					<!-- <a href="/Public/err">退出登录</a> -->
					<a href="/Index/index.html">前台</a>
				</div>
				<div class="time">
					<p id='s'></p>
				</div>
				<script>setInterval("s.innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);</script>
				<nav>
					<ul> 
						<li <?php if($menu['click']==Auser): ?>class="menu checkmenu"<?php else: ?>class="menu"<?php endif; ?>><a class='menu' id='user' href="/Auser/user.html">用户管理</a></li>
						<li <?php if($menu['click']==Atext): ?>class="menu checkmenu"<?php else: ?>class="menu"<?php endif; ?>><a class='menu' id='text' href="/Atext/single.html">题目管理</a></li>
						<li <?php if($menu['click']==Apaper): ?>class="menu checkmenu"<?php else: ?>class="menu"<?php endif; ?>><a class='menu' id='Paper' href="/Apaper/paper.html">试卷管理</a></li>
						<li <?php if($menu['click']==Adata): ?>class="menu checkmenu"<?php else: ?>class="menu"<?php endif; ?>><a class='menu' id='data' href="/Adata/index.html">资料管理</a></li>
						<li <?php if($menu['click']==Agrade): ?>class="menu checkmenu"<?php else: ?>class="menu"<?php endif; ?>><a class='menu' id='grade' href="/Agrade/grade.html">成绩管理</a></li>
					</ul>
				</nav>
			</div>
		</div>
<div class='left'>
<nav>
	<ul class="mcd-menu sidebar">
			<li><a href="/Auser/user.html" <?php if($active=='user'): ?>class='active'<?php else: ?>class='a'<?php endif; ?><strong>用户管理</strong></a></li>
			<li><a href="/Auser/admin.html" <?php if($active=='admin'): ?>class='active'<?php else: ?>class='a'<?php endif; ?><strong>管理员管理</strong></a></li>
			<li><a href="/Auser/faculty.html" <?php if($active=='faculty'): ?>class='active'<?php else: ?>class='a'<?php endif; ?><strong>院系管理</strong></a></li>
			<li><a href="/Auser/major.html" <?php if($active=='major'): ?>class='active'<?php else: ?>class='a'<?php endif; ?><strong>专业管理</strong></a></li>
			<li><a href="/Auser/classs.html" <?php if($active=='classs'): ?>class='active'<?php else: ?>class='a'<?php endif; ?><strong>班级管理</strong></a></li>
			<li><a href="/Auser/subject.html" <?php if($active=='subject'): ?>class='active'<?php else: ?>class='a'<?php endif; ?><strong>课程管理</strong></a></li>
			<li><a href="/Auser/arr.html" <?php if($active=='arr'): ?>class='active'<?php else: ?>class='a'<?php endif; ?><strong>课程安排</strong></a></li>
	</ul>
</nav>
</div>

<!-- 侧栏隐藏效果 -->
<style type="text/css" media="screen">
	.hidden{
		/*float: left;*/
		width: 0px !important;
		transition-property:width;
		transition-duration:1s;
		transition-timing-function:linear;
		transition-delay:0s;
	}
</style>
<script>
	$(function(){
		$('#hidden').click(function(){
			alert(1231);
			$('.left').attr('class','left hidden');
		});
	});
</script>
<!-- <div class='left'>
	<nav class='left'>
		<div class="pure-menu pure-menu-open">
			<a id='hiddens' class='hiddens' href="javascript:;">隐藏</a>
			<ul class='pure-menu-items'>
				<li><a href="#">Flickr</a></li>
				<li><a href="#">Messenger</a></li>
				<li><a href="#">Sports</a></li>
				<li><a href="#">Finance</a></li>
				<li class="pure-menu-heading">More Sites!</li>
			</ul>
		</div>
	</nav>
</div>

<div class='right'>
	<div>
		<button type="button">1321123132313</button>
	</div>
</div> -->

<div class="right">
	<div class='tr pb10'>
		<form action="/Auser/user.html" method="post" accept-charset="utf-8">
			姓名<input type="text" name='stu_name' class='h32 w70'>
			<input class="pure-button pure-button-primary" type="submit" value="搜索">
			<button type="button" class="pure-button pure-button-primary" onclick="popup('/Auser/addUser','500px','300px')">新建</button>
		</form>
	</div>
	<table class='bordered'>
		<thead>
			<tr>
				<th>学号</th>
				<th>姓名</th>
				<th>院系</th>
				<th>专业</th>
				<th>班级</th>
				<th>创建时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$l): $mod = ($i % 2 );++$i;?><tr>
					<td><?php echo ($l["stu_numb"]); ?></td>
					<td><?php echo ($l["stu_name"]); ?></td>
					<td><?php echo ($l["fac_name"]); ?></td>
					<td><?php echo ($l["maj_name"]); ?></td> 
					<td><?php echo ($l["cla_name"]); ?></td>
					<td><?php echo ($l["stu_time"]); ?></td>
					<td><a href="javascript:;" onclick="popup('/Auser/editUser?stu_id=<?php echo ($l["stu_id"]); ?>','500px','280px')">编辑</a>/<a onclick="deletes(this)" url='/Auser/deleteUser?stu_id=<?php echo ($l["stu_id"]); ?>' href="javascript:;">删除</a></td>
				</tr><?php endforeach; endif; else: echo "" ;endif; ?>
		</tbody>
	</table>

	<div id='page'>
		<?php echo ($show); ?>
	</div>
</div>
</body>
</html>
<script src="/Public/js/popup.js" type="text/javascript"></script>