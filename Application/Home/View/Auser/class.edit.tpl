<div>
	<form method="post" id='form' class='pure-form pure-form-aligned' action="/Auser/updateClasss">
	<input type="hidden" name="cla_id" value="<{$Sdata.cla_id}>">
		<fieldset>
			<div class="pure-control-group">
				<label for='maj_id'>专业</label>
				<select class='w167' id="maj_id" name='maj_id'>
					<volist name='data' id='l'>
						<if condition="$l['maj_id'] eq $Sdata['maj_id']">
						<option value="<{$l.maj_id}>" selected><{$l.maj_name}></option>
						<else/>
						<option value="<{$l.maj_id}>"><{$l.maj_name}></option>
						</if>
					</volist>
				</select>
			</div>

			<div class="pure-control-group">
				<label for="cla_numb">班级号</label>
				<input id="cla_numb" type="text" name="cla_numb" placeholder="ClassID" value="<{$Sdata.cla_numb}>">
				<label id="firstname-error" class="error tip" for="cla_numb"></label>
			</div>

			<div class="pure-control-group">
				<label for="cla_name">班级名称</label>
				<input id="cla_name" type="text" name="cla_name" placeholder="Name" value="<{$Sdata.cla_name}>">
				<label id="firstname-error" class="error tip" for="cla_name"></label>
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
			cla_numb: {
				required: true,
				digits: true,
				maxlength: 2,
				remote: {
					url: "/Public/checkSameEdit",
					type: "post",
					data: {
						cla_numb: function() {
							return $("#cla_numb").val();
						},
						maj_id: function() {
							return $("#maj_id").val();
						},
						database: function() {
							return 'Classs';
						},
						cla_id: function(){
							return "neq,"+<{$Sdata.cla_id}>;
						},
						name: function(){
							return 'cla_id';
						},
						cla_sign: function() {
							return 0;
						}
					}
				}
			},
			cla_name: {
				required: true,
				maxlength: 2
			}
		},
		messages: {
			cla_numb: {
				required: "请输入班级号",
				digits: "班级号必须为整数",
				maxlength: "班级号的长度不能超过2位"
			},
			cla_name: {
				required: "请输入班级姓名",
				maxlength: "班级名称的长度不能超过2位"
			}
		}
	});
</script>
<script src="__JS__/ajaxsubmit.js" type="text/javascript"></script>