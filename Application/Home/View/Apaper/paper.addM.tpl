<div class='tc'>
	选择课程
	<select class='h32' id="sub_ids" name='sub_id'>
		<volist name='data' id='l'>
			<option value="<{$l.sub_id}>"><{$l.sub_name}></option>
		</volist>
	</select>
	<button type="button" class="pure-button pure-button-primary" onclick="abc()">手动新建</button>
</div>
<script>
	function abc(){
        // if($('#sub_id').val())
        var url = '/Apaper/addPaperMt.html?sub_id='+$('#sub_ids').val();
        popup(url,'500px','500px');
    }
</script>
