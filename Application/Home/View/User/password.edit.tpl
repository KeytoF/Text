<div>
	<form class='pure-form pure-form-aligned' action="">
		<fieldset>
			<!-- <fieldset class='pure-group'> -->
			<div class="pure-control-group">
				<label for="stu_name">姓名</label>
				<input id="stu_name" name='stu_name' readonly="true" type="text" placeholder="Username">
			</div>
			<div class="pure-control-group">
				<label for="stu_pass">密码</label>
				<input id="stu_pass" name="stu_pass" type="password" placeholder="Password">
			</div>
			<!-- </fieldset> -->

			<!-- <fieldset class='pure-group'> -->
			<!-- </fieldset> -->
			<div class='tc'>
				<button type="submit" class="pure-button pure-button-primary">Submit</button>
			</div>
		</fieldset>
	</form>
</div>
<script>
	$('#form').validate({
		rules: {
			stu_pass: {
				required: true
			}
		},
		messages: {
			stu_pass: {
				required: "请输入密码"
			}
		}
	});
</script>