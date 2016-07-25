<div>
	<form method="post" id='form' class='pure-form pure-form-aligned' action="/Auser/saveFaculty">
		<fieldset>
			<div class="pure-control-group">
				<label for="fac_numb">院系号</label>
				<input id="fac_numb" type="text" name="fac_numb" placeholder="ID">
				<label id="firstname-error" class="error tip" for="fac_numb"></label>
			</div>

			<div class="pure-control-group">
				<label for="fac_name">院系名称</label>
				<input id="fac_name" type="text" name="fac_name" placeholder="Name">
				<label id="firstname-error" class="error tip" for="fac_name"></label>
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
			fac_numb: {
				required: true,
				digits: true,
				maxlength: 2,
				remote: {
					url: "/Public/checksame",
					type: "post",
					data: {
						fac_numb: function() {
							return $("#fac_numb").val();
						},
						database: function() {
							return 'Faculty';
						},
						fac_sign: function() {
							return 0;
						}
					}
				}
			},
			fac_name: {
				required: true
			}
		},
		messages: {
			fac_numb: {
				required: "请输入院系号",
				digits: "院系号必须为整数",
				maxlength: "院系号的长度不能超过2位",
				remote: '编号重复啦'
			},
			fac_name: {
				required: "请输入院系姓名"
			}
		}
	});
</script>
<script src="__JS__/ajaxsubmit.js" type="text/javascript"></script>