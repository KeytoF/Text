<div>
	<form class='pure-form pure-form-aligned' action="">
		<fieldset>
			<!-- <fieldset class='pure-group'> -->
			<div class="pure-control-group">
				<label for="tea_name">姓名</label>
				<input id="tea_name" name='tea_name' readonly="true" type="text" placeholder="Username">
			</div>
			<div class="pure-control-group">
				<label for="tea_pass">密码</label>
				<input id="tea_pass" name="tea_pass" type="password" placeholder="Password">
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
			tea_pass: {
				required: true
			}
		},
		messages: {
			tea_pass: {
				required: "请输入密码"
			}
		}
	});
</script>