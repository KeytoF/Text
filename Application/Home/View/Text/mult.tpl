<include file='Index/main'/>
<include file='Index/sidebar'/>
<link rel="stylesheet" type="text/css" href="__CSS__/style.css" />
<style type="text/css" media="screen">
	.button-xlarge{height: 30px; width: 100px; margin-right: 5px;}
</style>
<div class='right mt30'>
	<div id="quiz-container" class="main-quiz-holder">
		<div class="slide-container" style="display: block;">
			<div class="question mb0"><{$data.mul_ques}></div>
			<ul class="answers tl">
				<li value="A">A、<input class='disnone' id='' type="checkbox" name='checkbox' value='A'><{$data.mul_opta}></li>
				<li value="B">B、<input class='disnone' id='' type="checkbox" name='checkbox' value='B'><{$data.mul_optb}></li>
				<li value="C">C、<input class='disnone' id='' type="checkbox" name='checkbox' value='C'><{$data.mul_optc}></li>
				<li value="D">D、<input class='disnone' id='' type="checkbox" name='checkbox' value='D'><{$data.mul_optd}></li>
				<li value="E">E、<input class='disnone' id='' type="checkbox" name='checkbox' value='E'><{$data.mul_opte}></li>
				<li value="F">F、<input class='disnone' id='' type="checkbox" name='checkbox' value='F'><{$data.mul_optf}></li>
				<li value="G">G、<input class='disnone' id='' type="checkbox" name='checkbox' value='G'><{$data.mul_optg}></li>
				<li value="H">H、<input class='disnone' id='' type="checkbox" name='checkbox' value='H'><{$data.mul_opth}></li>
				<li class='disnone' id='answ'>答案、<{$data.mul_answ}></li>
			</ul>
			<strong style="display: none;" id="answ" value="<{$data.mul_answ}>"><{$data.mul_answ}></strong>
			<form action="/Text/text.html?id=<{$sub_id}>" method="post" accept-charset="utf-8">
				<input type="hidden" name="type" value="Multiple">	
				<input type="hidden" name="mul_sign" value="0">	
				<input type="hidden" name="sub_id" value="<{$sub_id}>">
				<div class='tr'>
					<input type="button" id='button' class="button-xlarge pure-button pure-button-primary" value="确定">
					<input type='submit' class="button-xlarge pure-button pure-button-primary" id='next' value='下一题 &gt;'>
				</div>
			</form>
		</div>
	</div>
</div>



<script>
	$(document).ready(function(){
		$('#button').click(function(){
			var right = <{$data.mul_righ}>;
			var all = <{$data.mul_all}> + 1;
			var id = "<{$data.mul_id}>"
			var arr = {"mul_id": id};
			var chk_value = ''; 
			$('input[name="checkbox"]:checked').each(function(){ 
				chk_value += $(this).val(); 
			}); 
			var answer = 'disbloc selected';
			alert(chk_value);
			if(chk_value=="<{$data.mul_answ}>"){
				answer = 'disbloc true'
				right += 1; 
			}
			$('#answ').attr('class',answer);

			$.get('/Public/right', { arr: arr, mul_righ: right , mul_all: all, database: 'Multiple'}, function(data){
					// alert(data)
				});
		});
		$(this).find('li').click(function() {
			var thisLi = $(this);
			var answ = $('#answ').attr('value');
			if($(thisLi).attr('class')=='true'){
				$(thisLi).removeClass();
				$(thisLi).children('input').removeAttr('checked');
				$(thisLi).children('input').removeAttr('id');
			}else{
				$(thisLi).addClass('true');
				$(thisLi).children('input').attr('checked','checked');
				$(thisLi).children('input').attr('id','checked');
			}
		});
	});
</script>