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
<div class="right">
	<div class='tr pb10'>
		<!-- <select name="1" class='h34'>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
		</select> -->
		<!-- <input class="pure-button pure-button-primary" type="button" value="搜索">
		<button type="button" class="pure-button pure-button-primary" onclick="popup('/Atext/addAnswer','500px','250px')">新建</button> -->
	</div>

	<table class='bordered'>
		<thead>
			<tr>
				<th>编号</th>
				<th>创建者</th>
				<th>课程</th>
				<th>创建时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<?php if(is_array($data)): $i = 0; $__LIST__ = $data;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$l): $mod = ($i % 2 );++$i;?><tr>
					<td><?php echo ($l["pap_numb"]); ?></td>
					<td><?php echo ($l["tea_name"]); ?></td>
					<td><?php echo ($l["sub_name"]); ?></td>
					<td><?php echo ($l["pap_time"]); ?></td>
					<td><a href="/Exam/exam.html?pap_id=<?php echo ($l["pap_id"]); ?>&id=<?php echo ($id); ?>">考试</a></td>
				</tr><?php endforeach; endif; else: echo "" ;endif; ?>
		</tbody>
	</table>
</div>
</body>
</html>
<script src="/Public/js/popup.js" type="text/javascript"></script>