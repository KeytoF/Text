<include file='Admin/main'/>
<include file='Auser/sidebar'/>
<div class="right">
	<div class='tr pb10'>
		<form action="/Auser/major.html" method="post" accept-charset="utf-8">
			专业名称<input type="text" name='maj_name' class='h32 w70'>
			<input class="pure-button pure-button-primary" type="submit" value="搜索">
			<button type="button" class="pure-button pure-button-primary" onclick="popup('/Auser/addMajor','500px','250px')">新建</button>
		</form>
	</div>
	<table class='bordered'>
		<thead>
			<tr>
				<th>编号</th>
				<th>院系</th>
				<th>名称</th>
				<th>创建时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<volist name="data" id="l">
				<tr>
					<td><{$l.maj_numb}></td>
					<td><{$l.fac_name}></td>
					<td><{$l.maj_name}></td>
					<td><{$l.maj_time}></td>
					<td><a href="javascript:;" onclick="popup('/Auser/editMajor?maj_id=<{$l.maj_id}>','500px','200px')">编辑</a>/<a onclick="deletes(this)" url='/Auser/deleteMajor?maj_id=<{$l.maj_id}>' href="javascript:;">删除</a></td>
				</tr>
			</volist>
		</tbody>
	</table>

	<div id='page'>
		<{$show}>
	</div>
</div>
<include file='Index/footer'/>