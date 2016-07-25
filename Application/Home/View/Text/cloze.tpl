<include file='Index/main'/>
<include file='Index/sidebar'/>
<link rel="stylesheet" type="text/css" href="__CSS__/style.css" />
<style type="text/css" media="screen">
	.button-xlarge{height: 30px; width: 100px; margin-right: 5px;}
</style>
<div class='right mt30'>
	<div id="quiz-container" class="main-quiz-holder">
		<div class="slide-container" style="display: block;">
			<div class="question mb0"><{$data.clo_ques}></div>

			<div class='tl'>
				<label>答题框：</label>
				<input type="text" name="user_answ" id='user_answ' value="">
				<label id='false' class='disnone' style="color: red;">答错了</label>
				<label id='true' class='disnone' style="color: green;">答对了</label>
			</div>

			<strong class='disnone' id="answ" value="<{$data.clo_ansa}>">答案：<{$data.clo_ansa}>、<{$data.clo_ansb}>、<{$data.clo_ansc}></strong>
			<form action="/Text/text.html?id=<{$sub_id}>" method="post" accept-charset="utf-8">
				<input type="hidden" name="type" value="Cloze">	
				<input type="hidden" name="clo_sign" value="0">	
				<input type="hidden" name="sub_id" value="<{$sub_id}>">
				<div class='tr'>
					<input type="button" class="button-xlarge pure-button pure-button-primary" id="button" value="确定">
					<input type='submit' class="button-xlarge pure-button pure-button-primary" id='next' value='下一题 &gt;'>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
	$('#button').click(function(){
		var ansa = "<{$data.clo_ansa}>";
		var ansb = "<{$data.clo_ansb}>";
		var ansc = "<{$data.clo_ansc}>";
		var right = <{$data.clo_righ}>;
		var all = <{$data.clo_all}> + 1;
		var id = "<{$data.clo_id}>";
		var arr = {"clo_id": id};
		var value = $.trim($('#user_answ').val());
		// alert(value);
		if(value==ansa||value==ansb||value==ansc){
			right += 1;
			$('#true').removeClass();
		}else{
			$('#false').removeClass();
		}
		$('#answ').removeClass();
		$.get('/Public/right', { arr: arr, clo_righ: right , clo_all: all, database: 'Cloze'}, function(data){
		});
		$('#button').attr('readonly','true');
	})
	// $(document).ready(function(){
	// 	// $(document).on('click',$(this).find('li'),function(){
	// 	$(this).find('li').click(function() {
	// 		var thisLi = $(this);
	// 		var ansa = "<{$data.clo_ansa}>";
	// 		var ansb = "<{$data.clo_ansb}>";
	// 		var ansc = "<{$data.clo_ansc}>";
	// 		var right = <{$data.clo_righ}>;
	// 		var all = <{$data.clo_all}> + 1;
	// 		var id = "<{$data.clo_id}>";
	// 		var arr = {"clo_id": id};
	// 		var value = $(this).attr('value');
	// 		if(value==ansa||value==ansb||value==ansc){
	// 			right += 1;
	// 			$('#true').removeClass();
	// 		}else{
	// 			$('#false').removeClass();
	// 		}
	// 		$.get('/Public/right', { arr: arr, clo_righ: right , clo_all: all, database: 'Cloze'}, function(data){
	// 			});
	// 		// alert(answ);
	// 		$("li[value="+answ+"]").addClass('true');
	// 		if (thisLi.hasClass('selected')) {
	// 			thisLi.removeClass('selected');
	// 		} else {
	// 			thisLi.parents('.answers').children('li').removeClass('selected');
	// 			thisLi.addClass('selected');
	// 		}
	// 	});
	// });
</script>