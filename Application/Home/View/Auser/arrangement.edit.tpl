<div>
	<form method="post" id='form' class='pure-form pure-form-aligned' action="/Auser/updateArrangement">
		<input type="hidden" name="arr_id" value="<{$data.arr_id}>">
		<fieldset>
			<div class="pure-control-group">
				<label for='cla_id'>班级</label>
				<select class='w167' id="cla_id" name='cla_id'>
					<volist name='Cdata' id='l'>
						<if condition="$l['cla_id'] eq $data['cla_id']">
							<option value="<{$l.cla_id}>" selected><{$l.cla_name}></option>
							<else/>
							<option value="<{$l.cla_id}>"><{$l.cla_name}></option>
						</if>
					</volist>
				</select>
			</div>

			<div class="pure-control-group">
				<label for='sub_id'>课程</label>
				<select class='w167' id="sub_id" name='sub_id' autofocus>
					<volist name='Sdata' id='l'>
						<if condition="$l['sub_id'] eq $data['sub_id']">
							<option value="<{$l.sub_id}>" selected><{$l.sub_name}></option>
							<else/>
							<option value="<{$l.sub_id}>"><{$l.sub_name}></option>
						</if>
					</volist>
				</select>
				<label id="firstname-error" class="error tip" for="sub_id"></label>
			</div>

			<div class="pure-control-group">
				<label for='tea_id'>授课教师</label>
				<select class='w167' id="tea_id" name='tea_id'>
					<volist name='Tdata' id='l'>
						<if condition="$l['tea_id'] eq $data['tea_id']">
							<option value="<{$l.tea_id}>" selected><{$l.tea_name}></option>
							<else/>
							<option value="<{$l.tea_id}>"><{$l.tea_name}></option>
						</if>
					</volist>
				</select>
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
			sub_id: {
				remote: {
					url: "/Public/checkSameEdit",
					type: "post",
					data: {
						sub_id: function() {
							return $("#sub_id").val();
						},
						cla_id: function() {
							return $("#cla_id").val();
						},
						database: function() {
							return 'Arrangement';
						},
						arr_id: function(){
							return "neq,"+<{$data.arr_id}>;
						},
						name: function(){
							return 'arr_id';
						},
						arr_sign: function() {
							return 0;
						}
					}
				}
			}
		},
		messages: {
			sub_id: {
				remote: '重复啦'
			}
		}
	});
</script>
<script src="__JS__/ajaxsubmit.js" type="text/javascript"></script>