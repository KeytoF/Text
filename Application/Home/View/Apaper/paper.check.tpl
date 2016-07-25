<style type="text/css" media="screen">
	/*.right{position: relative; }*/
	.countDown{float: right; position: absolute; top: 80px; right: 15px; color: red; }
	.exam{width: 100%; margin: 0 auto; background-color: #EAECEA; }
	.bt{display: block; width: 100%; text-align: center; background-color: rgb(231, 255, 231); }
	.textareas{width: 100%; height: 100px;}
	label{display: block; width: 100%;}
	td{word-break: break-all; }
</style>
<div style="display:block; position: relative;">
<div style="display:block; z-index: 11111; width: 100%; height: 100%; position: absolute; top: 1px">
	
</div>
<div style="z-index: -1;">
	<div class='exam tl'>
	<if condition="$pap_auto eq 1">
		<form id='form' action="/Exam/score" method="post" class='pure-form pure-form-aligned' accept-charset="utf-8">
		<else/>
		<form id='form' action="/Exam/scoreM" method="post" class='pure-form pure-form-aligned' accept-charset="utf-8">
	</if>
			<input type="hidden" name="pap_id" value="<{$pap_id}>">
			<div class='exam div' id="single">
				<label class='bt'>单选题</label>
				<volist name="data['sin']" id='ds' key='ks'>
					<table>
						<tbody>
							<tr>
								<td colspan="3"><label><{$ks}>、<{$ds.sin_ques}></label></td>
							</tr>
							<tr>
								<td><input type="radio" name="sin_option[<{$ks}>]" value='A'>A、<{$ds.sin_opta}></td>
								<td><input type="hidden" name="sin_id[<{$ks}>]" value="<{$ds.sin_id}>"></td>
								<td><input type="hidden" name="sin_righ[<{$ks}>]" value="<{$ds.sin_righ}>"></td>
								<td><input type="hidden" name="sin_all[<{$ks}>]" value="<{$ds.sin_all}>"></td>
							</tr>
							<tr>
								<td><input type="radio" name="sin_option[<{$ks}>]" value='B'>B、<{$ds.sin_optb}></td>
							</tr>
							<tr>
								<td><input type="radio" name="sin_option[<{$ks}>]" value='C'>C、<{$ds.sin_optc}></td>
							</tr>
							<tr>
								<td><input type="radio" name="sin_option[<{$ks}>]" value='D'>D、<{$ds.sin_optd}></td>
							</tr>
							<tr>&nbsp;</tr>
						</tbody>
					</table>
				</volist>
			</div>

			<div class='examdiv' id="multiple">
				<label class='bt'>多选题</label>
				<volist name="data['mul']" id='dm' key='km'>
					<table>
						<tbody>
							<tr>
								<td><label><{$km}>、<{$dm.mul_ques}></label></td>
								<td><input type="hidden" name="mul_id[<{$km}>]" value="<{$ds.mul_id}>"></td>
								<td><input type="hidden" name="mul_righ[<{$km}>]" value="<{$ds.mul_righ}>"></td>
								<td><input type="hidden" name="mul_all[<{$km}>]" value="<{$ds.mul_all}>"></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="mul_option[<{$km}>][]" value='A'>A、<{$dm.mul_opta}></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="mul_option[<{$km}>][]" value='B'>B、<{$dm.mul_optb}></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="mul_option[<{$km}>][]" value='C'>C、<{$dm.mul_optc}></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="mul_option[<{$km}>][]" value='D'>D、<{$dm.mul_optd}></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="mul_option[<{$km}>][]" value='E'>E、<{$dm.mul_opte}></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="mul_option[<{$km}>][]" value='F'>F、<{$dm.mul_optf}></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="mul_option[<{$km}>][]" value='G'>G、<{$dm.mul_optg}></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="mul_option[<{$km}>][]" value='H'>H、<{$dm.mul_opth}></td>
							</tr>
							<tr>&nbsp;</tr>
						</tbody>
					</table>
				</volist>
			</div>

			<div class='examdiv' id="judge">
				<label class='bt'>判断题</label>
				<volist name="data['jud']" id='dj' key='kj'>
					<table>
						<tbody>
							<tr style="width:100%;">
								<td colspan="3"><label><{$kj}>、<{$dj.jud_ques}></label></td>
							</tr>
							<tr>
								<td class='w40'><input type="radio" name="jud_option[<{$kj}>]" value='1'>√</td>
								<td><input type="radio" name="jud_option[<{$kj}>]" value='0'>×</td>
								<td><input type="hidden" name="jud_id[<{$kj}>]" value="<{$ds.jud_id}>"></td>
								<td><input type="hidden" name="jud_righ[<{$kj}>]" value="<{$ds.jud_righ}>"></td>
								<td><input type="hidden" name="jud_all[<{$kj}>]" value="<{$ds.jud_all}>"></td>
							</tr>
							<tr>&nbsp;</tr>
						</tbody>
					</table>
				</volist>
			</div>

			<div class='examdiv' id="cloze">
				<label class='bt'>填空题</label>
				<volist name="data['clo']" id='dc' key='kc'>
					<table>
						<tbody>
							<tr>
								<td><label><{$kc}>、<{$dc.clo_ques}></label></td>
								<td><input type="hidden" name="clo_id[<{$kc}>]" value="<{$ds.clo_id}>"></td>
								<td><input type="hidden" name="clo_righ[<{$kc}>]" value="<{$ds.clo_righ}>"></td>
								<td><input type="hidden" name="clo_all[<{$kc}>]" value="<{$ds.clo_all}>"></td>
							</tr>
							<tr>
								<td><input type="text" name="clo_option[<{$kc}>]"></td>
							</tr>
							<tr>&nbsp;</tr>
						</tbody>
					</table>
				</volist>
			</div>

			<div class='examdiv' id="answer">
				<label class='bt'>简答题</label>
				<volist name="data['ans']" id='da' key='ka'>
					<table>
						<tbody>
							<tr>
								<td><label><{$ka}>、<{$da.ans_ques}></label></td>
							</tr>
							<tr>
								<td>
								<input type="hidden" name="gra_answ[<{$ka}>][ques]" value="<{$da.ans_ques}>">
								<input type="hidden" name="gra_answ[<{$ka}>][answ]" value="<{$da.ans_answ}>">
								<textarea class='textareas' name="gra_answ[<{$ka}>][resu]"></textarea>
								</td>
							</tr>
							<tr>&nbsp;</tr>
						</tbody>
					</table>
				</volist>
			</div>
			<div class='tc'>
				<!-- <button type="submit" id='submit' class="pure-button pure-button-primary">Submit</button> -->
			</div>
		</form>
	</div>
</div>
</div>
<include file='Index/footer'/>
<script>
	var form = $('#form');

	$(form).submit(function() {
		data = $(this).serialize()
		bool = $(this).valid()
		url = $(this).attr('action')
		if(bool==true){
			console.log(data);
			$.post(url,data,function(s){
				if(s=='succ'){
					succ()
				}else{
					error()
				}
			});
		}
		return false;
	});
	function succ(){
		layer.msg('成功', {
			icon: 1,
			time: 2000 
		}, function(){
			window.location.href='/Exam/index';
		})
	}
	function error(){
		layer.msg('失败', {
			icon: 2,
			time: 2000 
		}, function(){
		})
	}
	function gett(){
		$(function(){
			$.ajax({
				url:'/Exam/countDown',
				type:"POST",
				data:{action:"guesslike",pap_id: <{$pap_id}>},
				dataType:"html",
				timeout:3000,
				cache:false,
				success:function(re){
					if(re=='error'){
						$('#submit').click();
					}else{
						$('#hh').html(re);
					}
				}
			})
		});
		setTimeout("gett()",1000) 
	}
	// gett();
</script>

