<div>
	<form method="post" id='form' class='pure-form pure-form-aligned' action="/Auser/saveMajor">
		<fieldset>
			<div class="pure-control-group">
				<label for='fac_id'>院系</label>
				<select class='w167' id="fac_id" name='fac_id'>
					<volist name='data' id='l'>
						<option value="<{$l.fac_id}>"><{$l.fac_name}></option>
					</volist>
				</select>
			</div>

			<div class="pure-control-group">
				<label for="maj_numb">专业号</label>
				<input id="maj_numb" type="text" name="maj_numb" placeholder="MajorID">
				<label id="firstname-error" class="error tip" for="maj_numb"></label>
			</div>
			
			<div class="pure-control-group">
				<label for="maj_name">专业名称</label>
				<input id="maj_name" type="text" name="maj_name" placeholder="Name">
				<label id="firstname-error" class="error tip" for="maj_name"></label>
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
			maj_numb: {
				required: true,
				digits: true,
				maxlength: 2,
				remote: {
					url: "/Public/checksame",
					type: "post",
					data: {
						maj_numb: function() {
							return $("#maj_numb").val();
						},
						fac_id: function() {
							return $("#fac_id").val();
						},
						database: function() {
							return 'Major';
						},
						maj_sign: function() {
							return 0;
						}
					}
				}
			},
			maj_name: {
				required: true
			}
		},
		messages: {
			maj_numb: {
				required: "请输入专业号",
				digits: "专业号必须为整数",
				maxlength: "专业号的长度不能超过2位",
				remote: '编号重复啦'
			},
			maj_name: {
				required: "请输入专业姓名"
			}
		}
	});
</script>
<script src="__JS__/ajaxsubmit.js" type="text/javascript"></script>