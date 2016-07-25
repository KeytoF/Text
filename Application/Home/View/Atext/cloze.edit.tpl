<div>
	<form id='form' method="post" class='pure-form pure-form-aligned' action="/Atext/updateCloze">
		<input type="hidden" name="clo_id" value="<{$Sdata.clo_id}>">
		<fieldset>
			<!-- <fieldset class='pure-group'> -->
			<div class="pure-control-group">
				<label for="clo_numb">编号</label>
				<input id="clo_numb" name='clo_numb' type="text" placeholder="" value="<{$Sdata.clo_numb}>" maxlength="12">
				<label id="firstname-error" class="error tip" for="clo_numb"></label>
			</div>
			<div class="pure-control-group">
				<label for="clo_ques">问题</label>
				<input id="clo_ques" name='clo_ques' type="text" placeholder="Question" value='<{$Sdata.clo_ques}>'>
				<label id="firstname-error" class="error tip" for="clo_ques"></label>
			</div>
			<div class="pure-control-group">
				<label for="clo_ansa">答案A</label>
				<input id="clo_ansa" name='clo_ansa' type="text" placeholder="OptionA" value='<{$Sdata.clo_ansa}>'>
				<label id="firstname-error" class="error tip" for="clo_ansa"></label>
			</div>
			<div class="pure-control-group">
				<label for="clo_ansb">答案B</label>
				<input id="clo_ansb" name='clo_ansb' type="text" placeholder="OptionB" value='<{$Sdata.clo_ansb}>'>
				<label id="firstname-error" class="error tip" for="clo_ansb"></label>
			</div>
			<div class="pure-control-group">
				<label for="clo_ansc">答案C</label>
				<input id="clo_ansc" name='clo_ansc' type="text" placeholder="OptionC" value='<{$Sdata.clo_ansc}>'>
				<label id="firstname-error" class="error tip" for="clo_ansc"></label>
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
			clo_ques: {
				required: true
			},
			clo_ansa: {
				required: true
			},
			clo_ansb: {
				required: true
			},
			clo_ansc: {
				required: true
			},
			clo_numb: {
				required: true,
				digits: true,
				remote: {
					url: "/Public/checkSameEdit",
					type: "post",
					data: {
						clo_numb: function() {
							return $("#clo_numb").val();
						},
						database: function() {
							return 'Cloze';
						},
						clo_id: function() {
							return "neq,"+<{$Sdata.clo_id}>;
						},
						name: function() {
							return 'clo_id';
						},
						clo_sign: function() {
							return 0;
						}
					}
				}
			}
		},
		messages: {
			clo_ques: {
				required: "请输入问题"
			},
			clo_ansa: {
				required: "请输入答案A"
			},
			clo_ansb: {
				required: "请输入答案B"
			},
			clo_ansc: {
				required: "请输入答案C"
			},
			clo_numb: {
				required: "请输入编号",
				digits: "编号必须为整数",
				remote: '重复了'
			}
		}
	});
</script>
<script src="__JS__/ajaxsubmit.js" type="text/javascript"></script>
