<div>
	<form id='form' method="post" class='pure-form pure-form-aligned' action="/Apaper/updatePaper">
		<input type="hidden" name="pap_id" value="<{$Sdata.pap_id}>">
		<fieldset>
			<!-- <fieldset class='pure-group'> -->
			<div class="pure-control-group">
				<label for="pap_numb">试卷号</label>
				<input id="pap_numb" name='pap_numb' type="text" placeholder="ID" value="<{$Sdata.pap_numb}>">
				<label id="firstname-error" class="error tip" for="pap_numb"></label>
			</div>
			<div class="pure-control-group">
				<label for="pap_exti">考试时长(分钟)</label>
				<input id="pap_exti" name='pap_exti' type="text" placeholder="Time" value="<{$Sdata.pap_exti}>">
				<label id="firstname-error" class="error tip" for="pap_exti"></label>
			</div>
			<div class="pure-control-group">
				<label for='sco_id'>分值表</label>
				<select class='w167' id="sco_id" name='sco_id'>
					<volist name='score' id='s'>
						<if condition="$s['sco_id'] eq $Sdata['sco_id']">
						<option value="<{$s.sco_id}>" selected><{$s.sco_numb}></option>
						<else/>
						<option value="<{$s.sco_id}>"><{$s.sco_numb}></option>
						</if>
					</volist>
				</select>
			</div>
			<!-- <div class="pure-control-group">
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
			</div> -->
			<!-- </fieldset> -->

			<!-- <fieldset class='pure-group'> -->
			<!-- <div class="pure-control-group">
				<label for='sub_id'>课程名</label>
				<select class='w167' id="sub_id" name='sub_id'>
					<volist name='data' id='l'>
						<option value="<{$l.sub_id}>"><{$l.sub_name}></option>
					</volist>
				</select>
			</div> -->
			<!-- <div class="pure-control-group">
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
			</div> -->
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
			pap_numb: {
				required: true,
				digits: true,
				maxlength: 12,
				remote: {
					url: "/Public/checkSameEdit",
					type: "post",
					data: {
						pap_numb: function() {
							return $("#pap_numb").val();
						},
						sub_id: function() {
							return <{$Sdata.sub_id}>;
						},
						database: function() {
							return 'Paper';
						},
						pap_id: function() {
							return "neq,"+<{$Sdata.pap_id}>;
						},
						name: function() {
							return 'pap_id';
						},
						pap_sign: function() {
							return 0;
						}
					}
				}
			},
			pap_exti: {
				required: true,
				digits: true,
				max: 300,
			}
		},
		messages: {
			pap_numb: {
				required: "请输入试卷号",
				digits: "试卷号必须为整数",
				maxlength: "试卷号不能超过12位",
				remote: '重复了'
			},
			pap_exti: {
				required: '请输入考试时长',
				digits: '考试时长必须为整数',
				max: '考试时长不能超过300分钟'
			}
		}
	});
</script>
<script src="__JS__/ajaxsubmit.js" type="text/javascript"></script>
