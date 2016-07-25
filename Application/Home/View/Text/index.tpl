<include file='Index/main'/>
<include file='Index/sidebar'/>
<link rel="stylesheet" type="text/css" href="__CSS__/style.css" />
<style type="text/css" media="screen">
	/*.choicediv{width: 300px; height: 200px; margin: 0 auto;}*/
	/*.centerdiv{height:-webkit-calc(100% / 2 - 100px) !important; height:-moz-calc(100% / 2 - 100px) !important; height:calc(100% / 2 - 100px) !important;}*/
	.button-xlarge{height: -webkit-calc(100% / 2 - 100px) !important; height: -moz-calc(100% / 2 - 100px) !important; height: calc(100% / 2 - 100px) !important; width: -webkit-calc(100% / 2 - 100px) !important; width: -moz-calc(100% / 2 - 100px) !important; width: calc(100% / 2 - 100px) !important; margin-top: 20px; margin-left: 20px; font-size: 200%; background-color: green;}
</style>
<div class='right tc'>
	<form action="/Text/text.html?id=<{$sub_id}>" method="post" accept-charset="utf-8">
		<input type="hidden" name="type" value="Single">	
		<input type="hidden" name="sin_sign" value="0">	
		<input type="hidden" name="sub_id" value="<{$sub_id}>">
		<button type="submit" class="button-xlarge pure-button pure-button-primary">单选题</button>
	</form>
	<form action="/Text/text.html?id=<{$sub_id}>" method="post" accept-charset="utf-8">
		<input type="hidden" name="type" value="Multiple">
		<input type="hidden" name="mul_sign" value="0">	
		<input type="hidden" name="sub_id" value="<{$sub_id}>">
		<button type="submit" class="button-xlarge pure-button pure-button-primary">多选题</button>
	</form>
	<form action="/Text/text.html?id=<{$sub_id}>" method="post" accept-charset="utf-8">
		<input type="hidden" name="type" value="Judge">
		<input type="hidden" name="jud_sign" value="0">	
		<input type="hidden" name="sub_id" value="<{$sub_id}>">
		<button type="submit" class="button-xlarge pure-button pure-button-primary">判断题</button>
	</form>
	<form action="/Text/text.html?id=<{$sub_id}>" method="post" accept-charset="utf-8">
		<input type="hidden" name="type" value="Cloze">
		<input type="hidden" name="clo_sign" value="0">	
		<input type="hidden" name="sub_id" value="<{$sub_id}>">
		<button type="submit" class="button-xlarge pure-button pure-button-primary">填空题</button>
	</form>
</div>