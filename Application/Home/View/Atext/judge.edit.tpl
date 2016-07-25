<div>
	<form id='form' method="post" class='pure-form pure-form-aligned' action="/Atext/updateJudge">
		<input type="hidden" name="jud_id" value="<{$Sdata.jud_id}>">
		<fieldset>
			<!-- <fieldset class='pure-group'> -->
			<div class="pure-control-group">
				<label for="jud_numb">编号</label>
				<input id="jud_numb" name='jud_numb' type="text" placeholder="" value="<{$Sdata.jud_numb}>" maxlength="12">
				<label id="firstname-error" class="error tip" for="jud_numb"></label>
			</div>
			<div class="pure-control-group">
				<label for="jud_ques">问题</label>
				<input id="jud_ques" name='jud_ques' type="text" placeholder="Question" value='<{$Sdata.jud_ques}>'>
				<label id="firstname-error" class="error tip" for="jud_ques"></label>
			</div>
			<div class="pure-control-group">
				<label for="answer">答案</label>
				<!-- <select name="answer" id="answer">
					<option value="">1</option>
					<option value="">2</option>
					<option value="">3</option>
				</select> -->
				<!-- <span class='w167'> -->
				<input type="radio" name='jud_answ' value='1' <if condition="$Sdata['jud_answ']=='1'">checked='checked'<else/></if>>√
				<input type="radio" name='jud_answ' value='0' <if condition="$Sdata['jud_answ']=='0'">checked='checked'<else/></if>>×
				<label id="firstname-error" class="error tip" for="jud_answ"></label>
				<!-- </span> -->
			</div>
			<!-- </fieldset> -->
			<!-- <fieldset class='pure-group'> -->
			<div class="pure-control-group">
				<label for='sub_id'>课程名</label>
				<select class='w167' id="sub_id" name='sub_id'>
					<volist name='data' id='l'>
						<if condition="$l['sub_id'] eq $Sdata['sub_id']">
						<option value="<{$l.sub_id}>" selected><{$l.sub_name}></option>
						<else/>
						<option value="<{$l.sub_id}>"><{$l.sub_name}></option>
						</if>
					</volist>
				</select>
			</div>
			<!-- </fieldset> -->
			<div class='tc'>	
				<button type="submit" class="pure-button pure-button-primary">Submit</button>
			</div>
		</fieldset>
	</form>
</div>
<script>
var form = $('#form')
	$(form).validate({
		rules: {
			jud_ques: {
				required: true
			},
			jud_answ: {
				required: true
			},
			jud_numb: {
				required: true,
				digits: true,
				remote: {
					url: "/Public/checkSameEdit",
					type: "post",
					data: {
						jud_numb: function() {
							return $("#jud_numb").val();
						},
						database: function() {
							return 'Judge';
						},
						jud_id: function() {
							return "neq,"+<{$Sdata.jud_id}>;
						},
						name: function() {
							return 'jud_id';
						},
						jud_sign: function() {
							return 0;
						}
					}
				}
			}
		},
		messages: {
			jud_ques: {
				required: "请输入问题"
			},
			jud_answ: {
				required: "请输入答案"
			},
			jud_numb: {
				required: "请输入编号",
				digits: "编号必须为整数",
				remote: '重复了'
			}
		}
	});
</script>
<script src="__JS__/ajaxsubmit.js" type="text/javascript"></script>
