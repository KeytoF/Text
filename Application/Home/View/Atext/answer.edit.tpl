<div>
	<form id='form' method="post" class='pure-form pure-form-aligned' action="/Atext/updateAnswer">
	<input type="hidden" name="ans_id" value="<{$Sdata.ans_id}>">
		<fieldset>
			<!-- <fieldset class='pure-group'> -->
			<div class="pure-control-group">
				<label for="ans_numb">编号</label>
				<input id="ans_numb" name='ans_numb' type="text" placeholder="" value="<{$Sdata.ans_numb}>" maxlength="12">
				<label id="firstname-error" class="error tip" for="ans_numb"></label>
			</div>
			<div class="pure-control-group">
				<label for="ans_ques">问题</label>
				<input id="ans_ques" name='ans_ques' type="text" placeholder="Question" value='<{$Sdata.ans_ques}>'>
				<label id="firstname-error" class="error tip" for="ans_ques"></label>
			</div>
			<div class="pure-control-group">
				<label for="ans_answ">参考答案</label>
				<textarea class='w167' name='ans_answ' id="ans_answ" type="text" placeholder="Answer"><{$Sdata.ans_answ}></textarea>
				<label id="firstname-error" class="error tip" for="ans_answ"></label>
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
			ans_ques: {
				required: true
			},
			ans_ques: {
				required: true
			},
			ans_numb: {
				required: true,
				digits: true,
				remote: {
					url: "/Public/checkSameEdit",
					type: "post",
					data: {
						ans_numb: function() {
							return $("#ans_numb").val();
						},
						database: function() {
							return 'Answer';
						},
						ans_id: function() {
							return "neq,"+<{$Sdata.ans_id}>;
						},
						name: function() {
							return 'ans_id';
						},
						ans_sign: function() {
							return 0;
						}
					}
				}
			}
		},
		messages: {
			ans_answ: {
				required: "请输入名称"
			},
			ans_answ: {
				required: "请输入答案"
			},
			ans_numb: {
				required: "请输入编号",
				digits: "编号必须为整数",
				remote: '重复了'
			}
		}
	});
</script>
<script src="__JS__/ajaxsubmit.js" type="text/javascript"></script>
