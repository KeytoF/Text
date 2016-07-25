<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title></title>
	<style type="text/css" media="screen">
		#page {width: 100.5%; text-align: right; padding: 10px 0; clear: both; }
		#page a, #page .current{font-size: 14px; font-family: Arial; margin: 0 2px; }
		#page a, #page .current{border: 1px solid #5FA623; background: #fff; padding: 2px 6px; text-decoration: none; }
		#page .current, .page a:hover{background: #7ab63f; color: #fff; }
		.rows{font-size: 14px; font-family: Arial; margin: 0 2px; }
	</style>
</head>
<body>
	<div style="text-align: center">
		<table style="width: 100% font-family: Arial;">
			<thead>
				<tr>
					<td style="width: 85%; text-align: left;">标题</td>
					<td>操作</td>
				</tr>
			</thead>
			<tbody>
				<volist name="dataList" id="dl">
					<tr>
						<td style="width: 85%; text-align: left"><a href="<{$dl.URL}>"><{$dl.Title}></a><br/></td>
						<td><a href="javascript:;">打开</a>/<a href="javascript:;">下载</a></td>
					</tr>
				</volist>
			</tbody>
		</table>
	</div>
	<div id='page'>
		<{$show}>
	</div>
</body>
</html>