<style type="text/css" media="screen">
	div{}
/*	.single{width: 100px !important; display: inline-block !important; }
	.multiple{width: 100px !important; display: inline-block !important; }
	.judge{width: 100px !important; display: inline-block !important; }
	.cloze{width: 100px !important; display: inline-block !important; }
	.answer{width: 100px !important; display: inline-block !important; }*/
</style>
<div>
	<form id='form' action="savePaperM" class='pure-form pure-form-aligned' method="post" accept-charset="utf-8">
		<input type="hidden" name="sub_id" value="<{$sub_id}>">
		<fieldset>
			<!-- <fieldset class='pure-group'> -->
			<div class="tc">
				<label for="pap_numb">&nbsp;试卷号:</label>
				<input id="pap_numb" name='pap_numb' type="text" placeholder="ID">
				<label for="pap_exti">&nbsp;&nbsp;</label>
				<label id="firstname-error" class="error tip" for="pap_numb"></label>
			</div>
			<div class="tc">
				<label for="pap_exti">考试时长:</label>
				<input id="pap_exti" name='pap_exti' type="text" placeholder="Time">
				<label for="pap_exti">分钟</label>
				<label id="firstname-error" class="error tip" for="pap_exti"></label>
			</div>
			<!-- </fieldset> -->
		</fieldset>

		<div class='tc single'>
			<label>单选题：&nbsp;</label>每题<input type="text" name='sin_scor'>分
		</div>
		<div class='plr100 pb10'>
		<volist name='Sdata' id='d'>
			<input type="checkbox" name="sin[]" value="<{$d.sin_id}>"><label style="color: red;"><{$d.sin_numb}></label>
		</volist>
		</div>

		<div class='tc multiple'>
			<label>多选题：&nbsp;</label>每题<input type="text" name='mul_scor'>分
		</div>
		<div class='plr100 pb10'>
		<volist name='Mdata' id='d'>
			<input type="checkbox" name="mul[]" value="<{$d.mul_id}>"><label style="color: red;"><{$d.mul_numb}></label>
		</volist>
		</div>

		<div class='tc judge'>
			<label>判断题：&nbsp;</label>每题<input type="text" name='jud_scor'>分
		</div>
		<div class='plr100 pb10'>
		<volist name='Jdata' id='d'>
			<input type="checkbox" name="jud[]" value="<{$d.jud_id}>"><label style="color: red;"><{$d.jud_numb}></label>
		</volist>
		</div>

		<div class='tc cloze'>
			<label>填空题：&nbsp;</label>每题<input type="text" name='clo_scor'>分
		</div>
		<div class='plr100 pb10'>
		<volist name='Cdata' id='d'>
			<input type="checkbox" name="clo[]" value="<{$d.clo_id}>"><label style="color: red;"><{$d.clo_numb}></label>
		</volist>
		</div>

		<div class='tc answer'>
			<label>简答题：&nbsp;</label>每题<input type="text" name='ans_scor'>分
		</div>
		<div class='plr100 pb10'>
		<volist name='Adata' id='d'>
			<input type="checkbox" name="ans[]" value="<{$d.ans_id}>"><label style="color: red;"><{$d.ans_numb}></label>
		</volist>
		</div>


		<div class='tc'>
			<button type="submit" class="pure-button pure-button-primary">Submit</button>
		</div>
	</form>
</div>

<script>
	var form = $('#form');
	$(form).validate({
		rules: {
			pap_numb: {
				required: true,
				digits: true,
				maxlength: 12,
				remote: {
					url: "/Public/checksame",
					type: "post",
					data: {
						pap_numb: function() {
							return $("#pap_numb").val();
						},
						sub_id: function() {
							return <{$sub_id}>;
						},
						database: function() {
							return 'Paper';
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
				remote: '编号重复啦'
			},
			pap_exti: {
				required: '请输入考试时长',
				digits: '考试时长必须为整数',
				max: '考试时长不能超过300分钟',
			}
		}
	});
</script>
<script src="__JS__/ajaxsubmit.js" type="text/javascript"></script>