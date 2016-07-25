<include file='Admin/main'/>
<include file='Auser/sidebar'/>
<div class="right">
	<div class='tr pb10'>
		<form action="/Auser/admin.html" method="post" accept-charset="utf-8">
			姓名<input type="text" name='tea_name' class='h32 w70'>
			<input class="pure-button pure-button-primary" type="submit" value="搜索">
			<button type="button" class="pure-button pure-button-primary" onclick="popup('/Auser/addAdmin','500px','230px')">新建</button>
		</form>
	</div>
	<table class='bordered'>
		<thead>
			<tr>
				<th>编号</th>
				<th>姓名</th>
				<th>创建时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<volist name="data" id="l">
				<tr>
					<td><{$l.tea_numb}></td>
					<td><{$l.tea_name}></td>
					<td><{$l.tea_time}></td>
					<td><a href="javascript:;" onclick="popup('/Auser/editAdmin?tea_id=<{$l.tea_id}>','500px','230px')">编辑</a>/<a onclick="deletes(this)" url='/Auser/deleteAdmin?tea_id=<{$l.tea_id}>' href="javascript:;">删除</a></td>
				</tr>
			</volist>
		</tbody>
	</table>

	<div id='page'>
		<{$show}>
	</div>
</div>
<include file='Index/footer'/>