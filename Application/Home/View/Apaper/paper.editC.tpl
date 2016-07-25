<div>
	<form method="post" id='form' class='pure-form pure-form-aligned' action="/Apaper/updatePaperClass">
		<input type="hidden" name="pap_id" value="<{$data.pap_id}>">
		<fieldset>
			<div class="pure-control-group">
				<label for="pap_numb">试卷号</label>
				<input id="pap_numb" name='pap_numb' type="text" readonly placeholder="ID" value="<{$data.pap_numb}>" disabled>
				<label id="firstname-error" class="error tip" for="pap_numb"></label>
			</div>
			<div class="pure-control-group">
				<label for='cla_id'>班级</label>
				<select class='w167' id="cla_id" name='cla_id' autofocus>
					<volist name='Cdata' id='l'>
						<if condition="$l['cla_id'] eq $data['cla_id']">
							<option value="<{$l.cla_id}>" selected><{$l.cla_name}></option>
							<else/>
							<option value="<{$l.cla_id}>"><{$l.cla_name}></option>
						</if>
					</volist>
				</select>
				<label id="firstname-error" class="error tip" for="sub_id"></label>
			</div>
			
			<div class='tc'>
				<button type="submit" class="pure-button pure-button-primary">Submit</button>
			</div>
		</fieldset>
	</form>
</div>
<script>
	var form = $('#form');
</script>
<script src="__JS__/ajaxsubmit.js" type="text/javascript"></script>