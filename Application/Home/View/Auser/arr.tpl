<include file='Admin/main'/>
<include file='Auser/sidebar'/>
<div class="right">
	<div class='tr pb10'>
		<button type="button" class="pure-button pure-button-primary" onclick="popup('/Auser/addArrangement','500px','230px')">新建</button>
	</div>
	<table class='bordered'>
		<thead>
			<tr>
				<th>课程</th>
				<th>班级</th>
				<th>授课教师</th>
				<th>创建时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<volist name="data" id="l">
				<tr>
					<td><{$l.sub_name}></td>
					<td><{$l.cla_name}></td>
					<td><{$l.tea_name}></td>
					<td><{$l.arr_time}></td>
					<td><a href="javascript:;" onclick="popup('/Auser/editArrangement?arr_id=<{$l.arr_id}>','500px','230px')">编辑</a>/<a onclick="deletes(this)" url='/Auser/deleteArrangement?arr_id=<{$l.arr_id}>' href="javascript:;">删除</a></td>
				</tr>
			</volist>
		</tbody>
	</table>

	<div id='page'>
		<{$show}>
	</div>
</div>
<include file='Index/footer'/>