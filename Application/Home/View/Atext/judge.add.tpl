<div>
	<form id='form' method="post" class='pure-form pure-form-aligned' action="/Atext/saveJudge">
		<fieldset>
			<!-- <fieldset class='pure-group'> -->
			<div class="pure-control-group">
				<label for="jud_numb">编号</label>
				<input id="jud_numb" name='jud_numb' type="text" placeholder="" maxlength="12">
				<label id="firstname-error" class="error tip" for="jud_numb"></label>
			</div>
			<div class="pure-control-group">
				<label for="jud_ques">问题</label>
				<input id="jud_ques" name='jud_ques' type="text" placeholder="Question">
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
				<input type="radio" name='jud_answ' value='1'>√
				<input type="radio" name='jud_answ' value='0'>×
				<label id="firstname-error" class="error tip" for="jud_answ"></label>
				<!-- </span> -->
			</div>
			<!-- </fieldset> -->
			<!-- <fieldset class='pure-group'> -->
			<div class="pure-control-group">
				<label for='sub_id'>课程名</label>
				<select class='w167' id="sub_id" name='sub_id'>
					<volist name='data' id='l'>
						<option value="<{$l.sub_id}>"><{$l.sub_name}></option>
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
					url: "/Public/checksame",
					type: "post",
					data: {
						jud_numb: function() {
							return $("#jud_numb").val();
						},
						database: function() {
							return 'Judge';
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
				remote: "重复啦"
			}
		}
	});
</script>
<script src="__JS__/ajaxsubmit.js" type="text/javascript"></script>
