<include file='Admin/main'/>
<include file='Auser/sidebar'/>
<div class="right">
	<div class='tr pb10'>
		<form action="/Auser/classs.html" method="post" accept-charset="utf-8">
			班级名称<input type="text" name='cla_name' class='h32 w70'>
			<input class="pure-button pure-button-primary" type="submit" value="搜索">
			<button type="button" class="pure-button pure-button-primary" onclick="popup('/Auser/addClasss','500px','230px')">新建</button>
		</form>
	</div>
	<table class='bordered'>
		<thead>
			<tr>
				<th>编号</th>
				<th>院系</th>
				<th>专业</th>
				<th>名称</th>
				<th>创建时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<volist name="data" id="l">
				<tr>
					<td><{$l.cla_numb}></td>
					<td><{$l.fac_name}></td>
					<td><{$l.maj_name}></td>
					<td><{$l.cla_name}></td>
					<td><{$l.cla_time}></td>
					<td><a href="javascript:;" onclick="popup('/Auser/editClasss?cla_id=<{$l.cla_id}>','500px','200px')">编辑</a>/<a onclick="deletes(this)" url='/Auser/deleteClasss?cla_id=<{$l.cla_id}>' href="javascript:;">删除</a></td>
				</tr>
			</volist>
		</tbody>
	</table>

	<div id='page'>
		<{$show}>
	</div>
</div>
<include file='Index/footer'/>