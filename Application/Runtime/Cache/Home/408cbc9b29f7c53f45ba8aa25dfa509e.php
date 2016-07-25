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
	.la{font-size: 25px; color: red; }
</style>
<div class='right'>
	<label class='la'><-请选择课程</label>
</div>