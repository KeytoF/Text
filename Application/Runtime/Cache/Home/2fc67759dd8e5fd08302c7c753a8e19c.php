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
			<li><a href="/Atext/single.html" <?php if($active=='single'): ?>class='active'<?php else: ?>class='a'<?php endif; ?><strong>单选题</strong></a></li>
			<li><a href="/Atext/multiple.html" <?php if($active=='multiple'): ?>class='active'<?php else: ?>class='a'<?php endif; ?><strong>多选题</strong></a></li>
			<li><a href="/Atext/judge.html" <?php if($active=='judge'): ?>class='active'<?php else: ?>class='a'<?php endif; ?><strong>判断题</strong></a></li>
			<li><a href="/Atext/cloze.html" <?php if($active=='cloze'): ?>class='active'<?php else: ?>class='a'<?php endif; ?><strong>填空题</strong></a></li>
			<li><a href="/Atext/answer.html" <?php if($active=='answer'): ?>class='active'<?php else: ?>class='a'<?php endif; ?><strong>简答题</strong></a></li>
	</ul>
</nav>
</div>

<div class="right">
	<div class='tr pb10'>
		<form action="/Atext/single.html" method="post" accept-charset="utf-8">
			课程名称<input type="text" name='sub_name' class='h32 w70'>
			<input class="pure-button pure-button-primary" type="submit" value="搜索">
			<button type="button" class="pure-button pure-button-primary" onclick="popup('/Atext/addSingle','500px','420px')">新建</button>
		</form>
	</div>

	<table class='bordered'>
		<thead>
			<tr>
				<th>编号</th>
				<th>课程</th>
				<th>创建者</th>
				<th>问题</th>
				<th>答案</th>
				<th>创建时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<?php if(is_array($data)): $i = 0; $__LIST__ = $data;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$l): $mod = ($i % 2 );++$i;?><tr>
					<td><?php echo ($l["sin_numb"]); ?></td>
					<td><?php echo ($l["sub_name"]); ?></td>
					<td><?php echo ($l["tea_name"]); ?></td>
					<td><?php echo ($l["sin_ques"]); ?></td>
					<td><?php echo ($l["sin_answ"]); ?></td> 
					<td><?php echo ($l["sin_time"]); ?></td>
					<td><a href="javascript:;" onclick="popup('/Atext/editSingle?sin_id=<?php echo ($l["sin_id"]); ?>','500px','420px')">编辑</a>/<a onclick="deletes(this)" url='/Atext/deleteSingle?sin_id=<?php echo ($l["sin_id"]); ?>' href="javascript:;">删除</a></td>
				</tr><?php endforeach; endif; else: echo "" ;endif; ?>
		</tbody>
	</table>
</div>
</body>
</html>
<script src="/Public/js/popup.js" type="text/javascript"></script>