<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>出错啦！！！</title>
	<script type="text/javascript" src="__JS__/jquery-1.12.1.js"></script>
	<script>
		var nn = 3;
		function num()
		{
			if(nn==0){
				window.history.go(-1)
			}
			document.getElementById("nuber").innerHTML = nn;
			nn --;
		}
		function SetNum()
		{
			setInterval("num()",1000);
		}	
	</script>
</head>
<body onLoad="SetNum();">
	<p style="color: red; font-size: 24px;">出错啦！！！
	<span id="nuber" style="color: blue;">4</span>秒后返回...
	</p>
</body>
</html>