<div>
	<form id='form' method="post" class='pure-form pure-form-aligned' action="/Atext/updateSingle">
		<fieldset>
			<!-- <fieldset class='pure-group'> -->
			<input type="hidden" name="sin_id" value="<{$Sdata.sin_id}>">
			<div class="pure-control-group">
				<label for="sin_numb">编号</label>
				<input id="sin_numb" name='sin_numb' type="text" placeholder="" value='<{$Sdata.sin_numb}>' maxlength="12">
				<label id="firstname-error" class="error tip" for="sin_numb"></label>
			</div>
			<div class="pure-control-group">
				<label for="sin_ques">问题</label>
				<input id="sin_ques" name='sin_ques' type="text" placeholder="Question" value='<{$Sdata.sin_ques}>'>
				<label id="firstname-error" class="error tip" for="sin_ques"></label>
			</div>
			<div class="pure-control-group">
				<label for="sin_opta">选项A</label>
				<input id="sin_opta" name="sin_opta" type="text" placeholder="OptionA" value='<{$Sdata.sin_opta}>'>
				<label id="firstname-error" class="error tip" for="sin_opta"></label>
			</div>
			<div class="pure-control-group">
				<label for="sin_optb">选项B</label>
				<input id="sin_optb" name="sin_optb" type="text" placeholder="OptionB" value='<{$Sdata.sin_optb}>'>
				<label id="firstname-error" class="error tip" for="sin_optb"></label>
			</div>
			<div class="pure-control-group">
				<label for="sin_optc">选项C</label>
				<input id="sin_optc" name="sin_optc" type="text" placeholder="OptionC" value='<{$Sdata.sin_optc}>'>
				<label id="firstname-error" class="error tip" for="sin_optc"></label>
			</div>
			<div class="pure-control-group">
				<label for="sin_optd">选项D</label>
				<input id="sin_optd" name="sin_optd" type="text" placeholder="OptionD" value='<{$Sdata.sin_optd}>'>
				<label id="firstname-error" class="error tip" for="sin_optd"></label>
			</div>
			<div class="pure-control-group">
				<label for="sin_answ">答案</label>
				<select name="sin_answ" id="sin_answ">
					<option value="A" <if condition="$Sdata['sin_answ']=='A'">selected='selected'<else/></if>>A</option>
					<option value="B" <if condition="$Sdata['sin_answ']=='B'">selected='selected'<else/></if>>B</option>
					<option value="C" <if condition="$Sdata['sin_answ']=='C'">selected='selected'<else/></if>>C</option>
					<option value="D" <if condition="$Sdata['sin_answ']=='D'">selected='selected'<else/></if>>D</option>
				</select>
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
	var form = $('#form');
	$(form).validate({
		rules: {
			sin_ques: {
				required: true
			},
			sin_opta: {
				required: true
			},
			sin_optb: {
				required: true
			},
			sin_optc: {
				required: true
			},
			sin_optd: {
				required: true
			},
			sin_numb: {
				required: true,
				digits: true,
				remote: {
					url: "/Public/checkSameEdit",
					type: "post",
					data: {
						sin_numb: function() {
							return $("#sin_numb").val();
						},
						database: function() {
							return 'Single';
						},
						sin_id: function() {
							return "neq,"+<{$Sdata.sin_id}>;
						},
						name: function() {
							return 'sin_id';
						},
						sin_sign: function() {
							return 0;
						}
					}
				}
			}
		},
		messages: {
			sin_ques: {
				required: "请输入问题"
			},
			sin_opta: {
				required: "请输入选项A"
			},
			sin_optb: {
				required: "请输入选项B"
			},
			sin_optc: {
				required: "请输入选项C"
			},
			sin_optd: {
				required: "请输入选项D"
			},
			sin_numb: {
				required: "请输入编号",
				digits: "编号必须为整数",
				remote: '重复了'
			}
		}
	});
</script>
<script src="__JS__/ajaxsubmit.js" type="text/javascript"></script>