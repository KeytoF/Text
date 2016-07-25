<include file='Index/main'/>
<include file='Index/sidebar'/>
<link rel="stylesheet" type="text/css" href="__CSS__/style.css" />
<style type="text/css" media="screen">
	.button-xlarge{height: 30px; width: 100px; margin-right: 5px;}
</style>
<div class='right mt30'>
	<div id="quiz-container" class="main-quiz-holder">
		<div class="slide-container" style="display: block;">
			<div class="question mb0"><{$data.jud_ques}></div>
			<ul class="answers tl">
				<li value="1">√</li>
				<li value="0">×</li>
			</ul>
			<strong style="display: none;" id="answ" value="<{$data.jud_answ}>"><{$data.jud_answ}></strong>
			<form action="/Text/text.html?id=<{$sub_id}>" method="post" accept-charset="utf-8">
				<input type="hidden" name="type" value="Judge">	
				<input type="hidden" name="jud_sign" value="0">	
				<input type="hidden" name="sub_id" value="<{$sub_id}>">
				<div class='tr'>
					<input type='submit' class="button-xlarge pure-button pure-button-primary" id='next' value='下一题 &gt;'>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
	$(document).ready(function(){
		// $(document).on('click',$(this).find('li'),function(){
		$(this).find('li').click(function() {
			var thisLi = $(this);
			var answ = $('#answ').attr('value');
			var right = <{$data.jud_righ}>;
			var all = <{$data.jud_all}> + 1;
			var id = "<{$data.jud_id}>";
			var arr = {"jud_id": id};
			if($(this).attr('value')==answ){
				right += 1;
			}
			$.get('/Public/right', { arr: arr, jud_righ: right , jud_all: all, database: 'Judge'}, function(data){
					// alert(data)
				});
			// alert(answ);
			$("li[value="+answ+"]").addClass('true');
			if (thisLi.hasClass('selected')) {
				thisLi.removeClass('selected');
			} else {
				thisLi.parents('.answers').children('li').removeClass('selected');
				thisLi.addClass('selected');
			}
		});
	});
</script>