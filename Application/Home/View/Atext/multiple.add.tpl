<div>
	<form id='form' method="post" class='pure-form pure-form-aligned' action="/Atext/saveMultiple">
		<fieldset>
			<!-- <fieldset class='pure-group'> -->
			<div class="pure-control-group">
				<label for="mul_numb">编号</label>
				<input id="mul_numb" name='mul_numb' type="text" placeholder="" maxlength="12">
				<label id="firstname-error" class="error tip" for="mul_numb"></label>
			</div>
			<div class="pure-control-group">
				<label for="mul_ques">问题</label>
				<input id="mul_ques" name='mul_ques' type="text" placeholder="Question">
				<label id="firstname-error" class="error tip" for="mul_ques"></label>
			</div>
			<div class="pure-control-group">
				<label for="mul_opta">选项A</label>
				<input id="mul_opta" name="mul_opta" type="text" placeholder="OptionA" maxlength='100'>
				<label id="firstname-error" class="error tip" for="mul_opta"></label>
			</div>
			<div class="pure-control-group">
				<label for="mul_optb">选项B</label>
				<input id="mul_optb" name="mul_optb" type="text" placeholder="OptionB" maxlength='100'>
				<label id="firstname-error" class="error tip" for="mul_optb"></label>
			</div>
			<div class="pure-control-group">
				<label for="mul_optc">选项C</label>
				<input id="mul_optc" name="mul_optc" type="text" placeholder="OptionC" maxlength='100'>
				<label id="firstname-error" class="error tip" for="mul_optc"></label>
			</div>
			<div class="pure-control-group">
				<label for="mul_optd">选项D</label>
				<input id="mul_optd" name="mul_optd" type="text" placeholder="OptionD" maxlength='100'>
				<label id="firstname-error" class="error tip" for="mul_optd"></label>
			</div>
			<div class="pure-control-group">
				<label for="mul_opte">选项E</label>
				<input id="mul_opte" name="mul_opte" type="text" placeholder="OptionE" maxlength='100'>
				<label id="firstname-error" class="error tip" for="mul_opte"></label>
			</div>
			<div class="pure-control-group">
				<label for="mul_optf">选项F</label>
				<input id="mul_optf" name="mul_optf" type="text" placeholder="OptionF" maxlength='100'>
				<label id="firstname-error" class="error tip" for="mul_optf"></label>
			</div>
			<div class="pure-control-group">
				<label for="mul_optg">选项G</label>
				<input id="mul_optg" name="mul_optg" type="text" placeholder="OptionG" maxlength='100'>
				<label id="firstname-error" class="error tip" for="mul_optg"></label>
			</div>
			<div class="pure-control-group">
				<label for="mul_opth">选项H</label>
				<input id="mul_opth" name="mul_opth" type="text" placeholder="OptionH" maxlength='100'>
				<label id="firstname-error" class="error tip" for="mul_opth"></label>
			</div>
			<div class="pure-control-group">
				<label for="mul_answ">答案</label>
				<input id="mul_answ" name="mul_answ" type="text" placeholder="Answer" maxlength="8">
				<label id="firstname-error" class="error tip" for="mul_answ"></label>
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
	var form = $('#form');
	//自定义验证字段--大小写字母
	jQuery.validator.addMethod("letter", function(value, element) {
		return this.optional(element) || /^[A-H]+$/.test(value);
	}, "只能包括大写英文字母A-H");
	$(form).validate({
		rules: {
			mul_ques: {
				required: true
			},
			mul_opta: {
				required: true
			},
			mul_optb: {
				required: true
			},
			mul_optc: {
				required: true
			},
			mul_optd: {
				required: true
			},
			mul_opte: {
				required: true
			},
			mul_optf: {
				required: true
			},
			mul_optg: {
				required: true
			},
			mul_opth: {
				required: true
			},
			mul_answ: {
				required: true,
				letter: true
			},
			mul_numb: {
				required: true,
				digits: true,
				remote: {
					url: "/Public/checksame",
					type: "post",
					data: {
						mul_numb: function() {
							return $("#mul_numb").val();
						},
						database: function() {
							return 'Multiple';
						},
						mul_sign: function() {
							return 0;
						}
					}
				}
			}
		},
		messages: {
			mul_ques: {
				required: "请输入问题"
			},
			mul_opta: {
				required: "请输入选项A"
			},
			mul_optb: {
				required: "请输入选项B"
			},
			mul_optc: {
				required: "请输入选项C"
			},
			mul_optd: {
				required: "请输入选项D"
			},
			mul_opte: {
				required: "请输入选项E"
			},
			mul_optf: {
				required: "请输入选项F"
			},
			mul_optg: {
				required: "请输入选项G"
			},
			mul_opth: {
				required: "请输入选项H"
			},
			mul_answ: {
				required: "请输入答案"
			},
			mul_numb: {
				required: "请输入编号",
				digits: "编号必须为整数",
				remote: "重复啦"
			}
		}
	});
</script>
<script src="__JS__/ajaxsubmit.js" type="text/javascript"></script>
