<div>
	<form id='form' class='pure-form pure-form-aligned' action="/Agrade/updateGrade">
		<input type="hidden" name="gra_id" value="<{$data.gra_id}>">
		<fieldset>
			<!-- <fieldset class='pure-group'> -->
			<div class="pure-control-group">
				<label for="stu_name">学生姓名</label>
				<input id="stu_name" name='stu_name' type="text" readonly="true" value='<{$data.stu_name}>'>
			</div>
			<div class="pure-control-group">
				<label for="stu_numb">学生学号</label>
				<input id="stu_numb" name='stu_numb' type="text" readonly="true" value='<{$data.stu_numb}>'>
			</div>
			<div class="pure-control-group">
				<label for="gra_grac">分数(系统自动计算)</label>
				<input id="gra_grac" name='gra_grac' type="text" readonly="true" value='<{$data.gra_grac}>'>
			</div>
			<!-- foreach循环 -->
			<volist name='data.gra_answ' id='a'>
				<div class="pure-control-group">
					<label for="ans_ques">题目</label>
					<input type='text' name="ans_ques" readonly="true" value="<{$a.ques}>"></input>
				</div>
				<div class="pure-control-group">
					<label for="gra_answ">参考答案</label>
					<textarea name="gra_answ" readonly="true"><{$a.answ}></textarea>
				</div>
				<div class="pure-control-group">
					<label for="gra_resu">学生答案</label>
					<textarea name="gra_resu" readonly="true"><{$a.resu}></textarea>
				</div>
			</volist>
			<div class="pure-control-group">
				<label for="gra_graa">分数(简答题-教师打分)</label>
				<input name='gra_graa' id="gra_graa" type="text">
				<label id="firstname-error" class="error tip" for="gra_graa"></label>
			</div>

			<!-- </fieldset> -->

			<!-- <fieldset class='pure-group'> -->
			<div class="pure-control-group">
				<label>课程名</label>
				<input type='text' name="sub_name" readonly="true" value="<{$data.sub_name}>"></input>
			</div>
			<!-- </fieldset> -->
			<div class='tc'>
				<button type="submit"  class="pure-button pure-button-primary">Submit</button>
			</div>
		</fieldset>
	</form>
</div>
<script>
var form = $('#form');
	$(form).validate({
		rules: {
			gra_graa: {
				required: true,
				max: <{$scores}>, 
				min: 0,
			}
		},
		messages: {
			gra_graa: {
				required: "请输入分数",
				max: "分数不能大于<{$scores}>分", 
				min: "分数不能小于0分",
			}
		}
	});
</script>
<script src="__JS__/ajaxsubmit.js" type="text/javascript"></script>

