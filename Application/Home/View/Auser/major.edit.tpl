<div>
	<form method="post" id='form' class='pure-form pure-form-aligned' action="/Auser/updateMajor">
	<input type="hidden" name="maj_id" value="<{$Sdata.maj_id}>">
		<fieldset>
			<div class="pure-control-group">
				<label for='fac_id'>院系</label>
				<select class='w167' id="fac_id" name='fac_id'>
					<volist name='data' id='l'>
						<if condition="$l['fac_id'] eq $Sdata['fac_id']">
						<option value="<{$l.fac_id}>" selected><{$l.fac_name}></option>
						<else/>
						<option value="<{$l.fac_id}>"><{$l.fac_name}></option>
						</if>
					</volist>
				</select>
			</div>

			<div class="pure-control-group">
				<label for="maj_numb">专业号</label>
				<input id="maj_numb" type="text" name="maj_numb" placeholder="MajorID" value='<{$Sdata.maj_numb}>'>
				<label id="firstname-error" class="error tip" for="maj_numb"></label>
			</div>
			
			<div class="pure-control-group">
				<label for="maj_name">专业名称</label>
				<input id="maj_name" type="text" name="maj_name" placeholder="Name" value='<{$Sdata.maj_name}>'>
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
					url: "/Public/checkSameEdit",
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
						maj_id: function(){
							return "neq,"+<{$Sdata.maj_id}>;
						},
						name: function(){
							return 'maj_id';
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
				maxlength: "专业号的长度不能超过2位"
			},
			maj_name: {
				required: "请输入专业姓名"
			}
		}
	});
</script>
<script src="__JS__/ajaxsubmit.js" type="text/javascript"></script>