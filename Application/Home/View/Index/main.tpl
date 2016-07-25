<!DOCTYPE html>
<html>
<head>
	<title>在线考试</title>
	<!--<link rel="stylesheet" type="text/css" href="__FOUNDATION__/css/foundation.min.css">
	<script src="__FOUNDATION__/js/foundation.min.js" type="text/javascript" charset="utf-8"></script>-->
	<!-- <link rel="stylesheet" type="text/css" href="__PURE__/base-min.css"> -->
	<link rel="stylesheet" type="text/css" href="__PURE__/grids-min.css">
	<link rel="stylesheet" type="text/css" href="__PURE__/forms-min.css">
	<link rel="stylesheet" type="text/css" href="__PURE__/tables-min.css">
	<link rel="stylesheet" type="text/css" href="__PURE__/menus-min.css">
	<link rel="stylesheet" type="text/css" href="__PURE__/buttons-min.css">
	<link rel="stylesheet" type="text/css" href="__CSS__/index.css">
	<link rel="stylesheet" type="text/css" href="__CSS__/public.css">
	<link rel="stylesheet" type="text/css" href="__CSS__/list.css">
	<link rel="stylesheet" type="text/css" href="__CSS__/sidebar.css">
	<link rel="stylesheet" type="text/css" href="__CSS__/page.css">
	<script src="__JS__/jquery-1.12.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="__JS__/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
	<script src="__JS__/layer/layer.js"></script>
</head>
<body>
	<div class='div'>
		<div class='top'>
			<div class='logo'><img class='logoimage' src="__IMAGE__/logo.png"></div>
			<div class='topmenu'>
				<div class='divuser'>
					<div style="height: 14px">
						
					</div>
					<a href="__APP__/User/index/id/2.html"><{$user.username}></a>
					<a href="__APP__/Index/logout.html">退出登录</a>
					<!-- <a href="javascript:;" onclick="getajax('123')">退出登录</a> -->
					<a href="__APP__/Auser/user.html">后台</a>
				</div>
				<div class="time">
					<p id='s'></p>
				</div>
				<script>setInterval("s.innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);</script>
				<nav>
					<ul> 
						<li <if condition="$menu['click']==Index">class="menu checkmenu"<else />class="menu"</if>><a class='menu' id='index' href="__APP__/Index/index/id/0.html">网站首页</a></li>
						<li <if condition="$menu['click']==Text">class="menu checkmenu"<else />class="menu"</if>><a class='menu' id='text' href="__APP__/Text/index.html">真题练习</a></li>
						<li <if condition="$menu['click']==Exam">class="menu checkmenu"<else />class="menu"</if>><a class='menu' id='Exam' href="__APP__/Exam/index.html">在线考试</a></li>
						<li <if condition="$menu['click']==Data">class="menu checkmenu"<else />class="menu"</if>><a class='menu' id='data' href="__APP__/Data/index.html">学习资料</a></li>
						<li <if condition="$menu['click']==User">class="menu checkmenu"<else />class="menu"</if>><a class='menu' id='user' href="__APP__/User/index/id/2.html">用户信息</a></li>
					</ul>
				</nav>
			</div>
		</div>