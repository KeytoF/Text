<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html class='wh100'>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title></title>
	<link rel="stylesheet" type="text/css" href="/Public/pure-release-0.5.0/forms-min.css">
	<link rel="stylesheet" type="text/css" href="/Public/pure-release-0.5.0/buttons-min.css">
	<link rel="stylesheet" type="text/css" href="/Public/css/public.css">
	<link rel="stylesheet" type="text/css" href="/Public/css/tip.css">
	<script src="/Public/js/jquery-1.12.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="/Public/js/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
	<script src="/Public/js/layer/layer.js"></script>
	<style type="text/css" media="screen">
		.wh100{width: 100%; height: 90%; }
		.top-center{height:-webkit-calc(100% / 2 - 100px) !important; height:-moz-calc(100% / 2 - 100px) !important; height:calc(100% / 2 - 100px) !important;}
		body{background:url(/Public/image/login_bg1.jpg) no-repeat center top;}
	</style>
</head>
<body class='wh100'>
	<div class='top-center'>
		
	</div>
	<div class='w500 h200' style="margin: 0 auto; background-color:#EEEEEE; padding-top: 50px; ">
		<label style="display: block; width: 100%; text-align: center; color: blue;">在线考试系统</label>
		<form method="post" id='form' class='pure-form pure-form-aligned' action="/Index/logincheck">
			<fieldset>
				<div class="pure-control-group">
					<label for="name">账号</label>
					<input id="name" type="text" name="name" placeholder="Name">
					<label id="firstname-error" class="error tip" for="name"></label>
				</div>

				<div class="pure-control-group">
					<label for="pass">密码</label>
					<input id="pass" type="password" name="pass" placeholder="Password">
					<label id="firstname-error" class="error tip" for="pass"></label>
				</div>

				<div class="pure-control-group">
					<label for="stu">用户类型</label>
					<input type="radio" name='type' value='0' checked="true" id='stu'><label for='stu' class='wa'>学生</label>
					<input type="radio" name='type' value='1' id='tea'><label for='tea' class='wa'>教师</label>
				</div>

				<div class='tc'>
					<button type="submit" class="pure-button pure-button-primary">登录</button>
				</div>
			</fieldset>
		</form>
	</div>
</body>
</html>
<script>
	var form = $('#form');
	$(form).validate({
		rules: {
			name: {
				required: true
			},
			pass: {
				required: true
			}
		},
		messages: {
			name: {
				required: "请输入姓名"
			},
			pass: {
				required: "请输入密码"
			}
		}
	});
	$(form).submit(function() {
		data = $(this).serialize()
		bool = $(this).valid()
		url = $(this).attr('action')
		if(bool==true){
			console.log(data);
			$.post(url,data,function(s){
				if(s=='nouser'){
					nouser()
				}else if(s=='nopass'){
					nopass()
				}else if(s=='teaok'){
					teaok()
				}else if(s=='stuok'){
					stuok()
				}
			});
		}
		return false;
	});
	function teaok(){
		layer.msg('成功', {
			icon: 1,
			time: 2000 
		}, function(){
			window.location = '/Auser/user.html'
		})
	}
	function stuok(){
		layer.msg('成功', {
			icon: 1,
			time: 2000 
		}, function(){
			window.location = '/Index/index.html'
		})
	}
	function nouser(){
		layer.msg('没有此用户', {
			icon: 2,
			time: 2000 
		}, function(){
		})
	}
	function nopass(){
		layer.msg('密码错误', {
			icon: 2,
			time: 2000 
		}, function(){
		})
	}
</script>