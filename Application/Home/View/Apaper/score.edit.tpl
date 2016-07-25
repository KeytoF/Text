<div>
	<form id='form' method="post" class='pure-form pure-form-aligned' action="/Apaper/updateScore">
		<input type="hidden" name="sco_id" value="<{$Sdata.sco_id}>">
		<fieldset>
			<!-- <fieldset class='pure-group'> -->
			<div class="pure-control-group">
				<label for="sco_numb">分值表号</label>
				<input id="sco_numb" name='sco_numb' type="text" placeholder="ID" value='<{$Sdata.sco_numb}>'>
				<label id="firstname-error" class="error tip" for="sco_numb"></label>
			</div>
			<div class="tc">
				<label style='color: red; font-size: 12px;'>分值自动保留小数点后一位</label><br/>
			</div>
			<div class="pure-control-group">
				<label for="sco_sing">单选题分值</label>
				<input id="sco_sing" name='sco_sing' type="text" placeholder="Score" value='<{$Sdata.sco_sing}>'>
				<label id="firstname-error" class="error tip" for="sco_sing"></label>
			</div>
			<div class="pure-control-group">
				<label for="sco_num_sing">单选题题数</label>
				<input id="sco_num_sing" name='sco_num_sing' type="text" placeholder="Number" value='<{$Sdata.sco_num_sing}>'>
				<label id="firstname-error" class="error tip" for="sco_num_sing"></label>
			</div>
			<div class="pure-control-group">
				<label for="sco_mult">多选题分值</label>
				<input id="sco_mult" name='sco_mult' type="text" placeholder="Score" value='<{$Sdata.sco_mult}>'>
				<label id="firstname-error" class="error tip" for="sco_mult"></label>
			</div>
			<div class="pure-control-group">
				<label for="sco_num_mult">多选题题数</label>
				<input id="sco_num_mult" name='sco_num_mult' type="text" placeholder="Number" value='<{$Sdata.sco_num_mult}>'>
				<label id="firstname-error" class="error tip" for="sco_num_mult"></label>
			</div>
			<div class="pure-control-group">
				<label for="sco_judg">判断分值</label>
				<input id="sco_judg" name='sco_judg' type="text" placeholder="Score" value="<{$Sdata.sco_judg}>">
				<label id="firstname-error" class="error tip" for="sco_judg"></label>
			</div>
			<div class="pure-control-group">
				<label for="sco_num_judg">判断题数</label>
				<input id="sco_num_judg" name='sco_num_judg' type="text" placeholder="Number" value='<{$Sdata.sco_num_judg}>'>
				<label id="firstname-error" class="error tip" for="sco_num_judg"></label>
			</div>
			<div class="pure-control-group">
				<label for="sco_cloz">填空分值</label>
				<input id="sco_cloz" name='sco_cloz' type="text" placeholder="Score" value='<{$Sdata.sco_cloz}>'>
				<label id="firstname-error" class="error tip" for="sco_cloz"></label>
			</div>
			<div class="pure-control-group">
				<label for="sco_num_cloz">填空题数</label>
				<input id="sco_num_cloz" name='sco_num_cloz' type="text" placeholder="Number" value='<{$Sdata.sco_num_cloz}>'>
				<label id="firstname-error" class="error tip" for="sco_num_cloz"></label>
			</div>
			<div class="pure-control-group">
				<label for="sco_answ">简答分值</label>
				<input id="sco_answ" name='sco_answ' type="text" placeholder="Score" value="<{$Sdata.sco_answ}>">
				<label id="firstname-error" class="error tip" for="sco_answ"></label>
			</div>
			<div class="pure-control-group">
				<label for="sco_num_answ">简答题数</label>
				<input id="sco_num_answ" name='sco_num_answ' type="text" placeholder="Number" value='<{$Sdata.sco_num_answ}>'>
				<label id="firstname-error" class="error tip" for="sco_num_answ"></label>
			</div>
			
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
			sco_numb: {
				required: true,
				digits: true,
				maxlength: 3,
				remote: {
					url: "/Public/checkSameEdit",
					type: "post",
					data: {
						sco_numb: function() {
							return $("#sco_numb").val();
						},
						database: function() {
							return "Score";
						},
						sco_id: function(){
							return "neq,"+<{$Sdata.sco_id}>;
						},
						name: function(){
							return 'sco_id';
						},
						sco_sign: function() {
							return 0;
						}
					}
				}
			},
			sco_sing: {
				required: true,
				maxlength: 4,
				max: 999.9
			},
			sco_num_sing: {
				required: true,
				maxlength: 2,
			},
			sco_mult: {
				required: true,
				maxlength: 4,
				max: 999.9
			},
			sco_num_mult: {
				required: true,
				maxlength: 2,
			},
			sco_judg: {
				required: true,
				maxlength: 4,
				max: 999.9
			},
			sco_num_judg: {
				required: true,
				maxlength: 2,
			},
			sco_cloz: {
				required: true,
				maxlength: 4,
				max: 999.9
			},
			sco_num_cloz: {
				required: true,
				maxlength: 2,
			},
			sco_answ: {
				required: true,
				maxlength: 4,
				max: 999.9
			},
			sco_num_answ: {
				required: true,
				maxlength: 2,
			}

		},
		messages: {
			sco_numb: {
				required: "请输入试卷号",
				digits: "试卷号必须为整数",
				maxlength: "试卷号不能超过3位",
				remote: '编号重复啦'
			},
			sco_sing: {
				required: "请输入单选题分数",
				maxlength: "分数不能超过3位",
				max: "分数不能超过999.9分"
			},
			sco_num_sing: {
				required: "请输入单选题数目",
				maxlength: "题目数不能超过2位",
			},
			sco_mult: {
				required: "请输入多选题分数",
				maxlength: "分数不能超过3位",
				max: "分数不能超过999.9分"
			},
			sco_num_mult: {
				required: "请输入多选题数目",
				maxlength: "题目数不能超过2位",
			},
			sco_judg: {
				required: "请输入判断题分数",
				maxlength: "分数不能超过3位",
				max: "分数不能超过999.9分"
			},
			sco_num_judg: {
				required: "请输入判断题数目",
				maxlength: "题目数不能超过2位",
			},
			sco_cloz: {
				required: "请输入填空题分数",
				maxlength: "分数不能超过3位",
				max: "分数不能超过999.9分"
			},
			sco_num_cloz: {
				required: "请输入填空题数目",
				maxlength: "题目数不能超过2位",
			},
			sco_answ: {
				required: "请输入简答题分数",
				maxlength: "分数不能超过3位",
				max: "分数不能超过999.9分"
			},
			sco_num_answ: {
				required: "请输入简答题数目",
				maxlength: "题目数不能超过2位",
			}
		}
	});
</script>
<script src="__JS__/ajaxsubmit.js" type="text/javascript"></script>
