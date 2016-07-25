<?php if (!defined('THINK_PATH')) exit();?><div>
	<form method="post" id='form' class='pure-form pure-form-aligned' action="/Auser/updateUser">
		<input type="hidden" name="stu_id" value="<?php echo ($Sdata["stu_id"]); ?>">
		<fieldset>
			<div class="pure-control-group">
				<label for="stu_name">姓名</label>
				<input id="stu_name" type="text" name="stu_name" placeholder="Name" value="<?php echo ($Sdata["stu_name"]); ?>"> 
				<label id="firstname-error" class="error tip" for="stu_name"></label>
			</div>

			<div class="pure-control-group">
				<label for="stu_year">年份</label>
				<input id="stu_year" type="text" name="stu_year" placeholder="Year" value="<?php echo ($Sdata["stu_year"]); ?>">
				<label id="firstname-error" class="error tip" for="stu_year"></label>
			</div>

			<div class="pure-control-group">
				<label for='cla_id'>班级</label>
				<select class='w167' id="cla_id" name='cla_id'>
					<?php if(is_array($data)): $i = 0; $__LIST__ = $data;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$l): $mod = ($i % 2 );++$i; if($l['cla_id'] == $Sdata['cla_id']): ?><option value="<?php echo ($l["cla_id"]); ?>" selected><?php echo ($l["cla_name"]); ?></option>
							<?php else: ?>
							<option value="<?php echo ($l["cla_id"]); ?>"><?php echo ($l["cla_name"]); ?></option><?php endif; endforeach; endif; else: echo "" ;endif; ?>
				</select>
			</div>

			<div class="pure-control-group">
				<label for="stu_numb">学生号</label>
				<input id="stu_numb" type="text" name="stu_numb" placeholder="ID" value="<?php echo ($Sdata["stu_numb"]); ?>">
				<label id="firstname-error" class="error tip" for="stu_numb"></label>
			</div>

			<!-- <div class="pure-control-group">
				<label for="stu_pass">密码</label>
				<input id="stu_pass" type="password" name="stu_pass" placeholder="Password">
				<label id="firstname-error" class="error tip" for="stu_pass"></label>
			</div> -->
			
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
			stu_name: {
				required: true
			},
			stu_year: {
				required: true,
				digits: true,
				rangelength: [4,4]
			},
			stu_numb: {
				required: true,
				digits: true,
				rangelength: [2,2],
				remote: {
					url: "/Public/checkSameEdit",
					type: "post",
					data: {
						stu_numb: function() {
							return $("#stu_numb").val();
						},
						stu_year: function() {
							return $("#stu_year").val();
						},
						cla_id: function() {
							return $("#cla_id").val();
						},
						database: function() {
							return 'Student';
						},
						stu_id: function(){
							return "neq,"+<?php echo ($Sdata["stu_id"]); ?>;
						},
						name: function(){
							return 'stu_id';
						},
						stu_sign: function() {
							return 0;
						}
					}
				}
			}
		},
		messages: {
			stu_name: {
				required: "请输入姓名"
			},
			stu_year: {
				required: "请输入年份",
				digits: "年份必须为整数",
				rangelength: "年份的长度必须为4位"
			},
			stu_numb: {
				required: "请输入学生号",
				digits: "学生号必须为整数",
				rangelength: "学生号的长度必须为2位"
			}
		}
	});
</script>
<script src="/Public/js/ajaxsubmit.js" type="text/javascript"></script>