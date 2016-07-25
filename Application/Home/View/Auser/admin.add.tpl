<div>
	<form method="post" id='form' class='pure-form pure-form-aligned' action="/Auser/saveAdmin">
		<fieldset>
			<div class="pure-control-group">
				<label for="tea_name">姓名</label>
				<input id="tea_name" type="text" name="tea_name" placeholder="Name">
				<label id="firstname-error" class="error tip" for="tea_name"></label>
			</div>

			<div class="pure-control-group">
				<label for="tea_numb">教师号</label>
				<input id="tea_numb" type="text" name="tea_numb" placeholder="ID">
				<label id="firstname-error" class="error tip" for="tea_numb"></label>
			</div>

			<div class="pure-control-group">
				<label for="tea_pass">密码</label>
				<input id="tea_pass" type="password" name="tea_pass" placeholder="Password">
				<label id="firstname-error" class="error tip" for="tea_pass"></label>
			</div>
			
			<div class='tc'>
				<button type="submit" class="pure-button pure-button-primary">Submit</button>
			</div>
		</fieldset>
	</form>
</div>
<script>
	var form = $('#form');
	$(form).validate({
		rules: {
			tea_name: {
				required: true
			},
			tea_numb: {
				required: true,
				digits: true,
				rangelength: [4,4],
				remote: {
					url: "/Public/checksame",
					type: "post",
					data: {
						tea_numb: function() {
							return $("#tea_numb").val();
						},
						database: function() {
							return 'Teacher';
						},
						tea_sign: function() {
							return 0;
						}
					}
				}
			},
			tea_pass: {
				required: true
			}
		},
		messages: {
			tea_name: {
				required: "请输入姓名"
			},
			tea_numb: {
				required: "请输入教师号",
				digits: "教师号必须为整数",
				rangelength: "教师号的长度必须为4位",
				remote: '编号重复啦'
			},
			tea_pass: {
				required: "请输入密码"
			}
		}
	});
</script>
<script src="__JS__/ajaxsubmit.js" type="text/javascript"></script>
