<div>
	<form method="post" id='form' class='pure-form pure-form-aligned' action="/Auser/saveSubject">
		<fieldset>
			<div class="pure-control-group">
				<label for="sub_numb">课程号</label>
				<input id="sub_numb" type="text" name="sub_numb" placeholder="ID">
				<label id="firstname-error" class="error tip" for="sub_numb"></label>
			</div>
			
			<div class="pure-control-group">
				<label for="sub_name">课程名称</label>
				<input id="sub_name" type="text" name="sub_name" placeholder="Name">
				<label id="firstname-error" class="error tip" for="sub_name"></label>
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
			sub_name: {
				required: true
			},
			sub_numb: {
				required: true,
				digits: true,
				maxlength: 4,
				remote: {
					url: "/Public/checksame",
					type: "post",
					data: {
						sub_numb: function() {
							return $("#sub_numb").val();
						},
						database: function() {
							return 'Subject';
						},
						sub_sign: function() {
							return 0;
						}
					}
				}
			}
		},
		messages: {
			sub_name: {
				required: "请输入课程名称"
			},
			sub_numb: {
				required: "请输入课程号",
				digits: "课程号必须为整数",
				maxlength: "课程号的长度不能超过4位",
				remote: '编号重复啦'
			}
		}
	});
</script>
<script src="__JS__/ajaxsubmit.js" type="text/javascript"></script>