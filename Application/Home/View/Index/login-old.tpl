<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>登录 - 在线考试系统</title>
	<link rel="stylesheet" href="">
	<link rel="stylesheet" type="text/css" href="__CSS__/login.css"  />
	<link rel="stylesheet" type="text/css" href="__CSS__/public.css"  />
	<script type="text/javascript" src="__JS__/jquery-1.12.1.js"></script>
	<script src="__JS__/layer/layer.js"></script>
	
</head>
<body>
	<div style="width: 100%; height: 100%;">

	<div class='top_height'>
			&nbsp;
		</div>
		<div id="content">
			<form id='form' action="__APP__/Index/logincheck" method="post">
				<dl>
					<dt>在线考试系统</dt>
					<dd><input type="text" name="username" class="utext" maxlength="12" placeholder="Username" /></dd>
					<dd><input type="password" name="password" class="ptext" maxlength="18" placeholder="Password" /></dd>
					<dd><input type="text" name="code" class="code" maxlength="5" /> <img style="width: 100px; height: 40px" src="__APP__/Public/verify/" border="0" id="verify"/><input type="submit" name="login" value="登 录" class='button' id="button" /></dd>
					<dd><label>版本：V 1.0　　设计和维护：Key</label>
					</dd>
				</dl>
			</form>
		</div>
	</div>
</body>
</html>
<script>
	var form = $('form');
	//更换验证码
	function rcode(obj) {
		obj.attr('src','__APP__/Public/verify/'+Math.random());
	}
	$('#verify').click(function() {
		rcode($(this));
	});
	$('#content input').eq(0).focus();
	/*$(function() {
		$('#button').click(function(event) {
			// event.preventDefault();
			var usernames=$('#content .utext').val();
			var passwords=$('#content .ptext').val();
			var codes=$('#content .code').val();
			// alert();
			// if (!/^[a-zA-Z0-9_-]|[\u4e00-\u9fa5]{2,16}$/.test(username)) {
			// 	$('#content .utext').val('');
			// 	$('#content .utext').focus();
			// 	layer.msg('请输入正确的用户名',{icon: 0,time: 2000 });
			// 	return;
			// }
			// if (password.length<6) {
			// 	$('#content .ptext').val('');
			// 	$('#content .ptext').focus();
			// 	layer.msg('请输入6位数以上的密码',{icon: 0,time: 2000 });
			// 	return;
			// }
			// if (!/^[a-zA-Z0-9]{4}$/.test(code)) {
			// 	$('#content .code').val('');
			// 	$('#content .code').focus();
			// 	layer.msg('请输入正确的验证码',{icon: 0,time: 2000 });
			// 	return;
			// }
			$.post("__APP__/Index/logincheck", {username:usernames,password:passwords,code:codes}, function(data) {
				// alert(data=='nocode');
				if (data=='ok') {
					window.location.href='__APP__/Index/index/';
				}else{
					layer.msg('输入信息错误');
					rcode($('#verify'));
				}
				// if (data=='nocode'){
				// 	alert('验证码错误')
				// 	// layer.msg('验证码错误');
				// 	// rcode($('#verify'));
				// }
				// if (data=='nouser'){
				// 	layer.msg('用户名错误');
				// 	rcode($('#verify'));
				// }
				// if (data=='noajax'){
				// 	layer.msg('错误请求');
				// 	rcode($('#verify'));
				// }
				// console.log(data)
				// switch(data){
				// 	case nocode:
				// 		alert('验证码错误');
				// 		break;
				// 	case nouser:
				// 		alert('用户名错误');
				// 		break;
				// 	case onpassword:
				// 		alert('密码错误');
				// 		break;
				// 	case ok:
				// 		alert('登录成功');
				// 		break;
				// }
			});
			// $.ajax({
			// 	url:"__APP__/Index/logincheck",
			// 	type:'POST',
			// 	cache:false,
			// 	data:'username='+username+'&password='+password+'&code='+code,
			// 	success: function(data) {
			// 		if (data.s=='ok') {
			// 			window.location.href='__APP__/Index/index/';
			// 		}
			// 		if (data.s=='nocode'){
			// 			layer.msg('验证码错误');
			// 			rcode($('#verify'));
			// 		}
			// 		if (data.s=='nouser'){
			// 			layer.msg('用户名错误');
			// 			rcode($('#verify'));
			// 		}
			// 		if (data.s=='noajax'){
			// 			layer.msg('错误请求');
			// 			rcode($('#verify'));
			// 		}
			// 	}
			// });
		});*/
</script>
<script src="__JS__/ajaxsubmit.js" type="text/javascript"></script>