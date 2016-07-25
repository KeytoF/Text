<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title></title>
	<link rel="stylesheet" href="">
</head>
<body>
	<form action="Text/text.html" method="post" accept-charset="utf-8">
		<!-- <foreach from="data" id='tl'> -->
		<div id='single'>
			<table>
			</table>
			<strong><$tl.Sin_Ques></strong>
			<input type="radio" name="option" value="A"><$tl.Sin_OptA></radio>
			<input type="radio" name="option" value="B"><$tl.Sin_OptB></radio>
			<input type="radio" name="option" value="C"><$tl.Sin_OptC></radio>
			<input type="radio" name="option" value="D"><$tl.Sin_OptD></radio>
			<strong style="display: none; color: #D30000;" id="answ" value="<$tl.Sin_Answ>"><$tl.Sin_Answ></strong>
		</div>
		<div>
			<input type="submit" name="" value="下一题">
		</div>
		<!-- </foreach> -->
	</form>
</body>
</html>
<script src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js">
</script>
<script type="text/javascript">
	$('#single').click(function(){
		if($('input:checked').val() != $('#answ').val()){
			$('input:checked').att('class','false');
		}
		$('input[value="$('#answ').val()"]').att('class','true');
		$('#answ').show();
	});
</script>