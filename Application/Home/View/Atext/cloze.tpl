<include file='Admin/main'/>
<include file='Atext/sidebar'/>
<div class="right">
	<div class='tr pb10'>
		<form action="/Atext/cloze.html" method="post" accept-charset="utf-8">
			课程名称<input type="text" name='sub_name' class='h32 w70'>
			<input class="pure-button pure-button-primary" type="submit" value="搜索">
			<button type="button" class="pure-button pure-button-primary" onclick="popup('/Atext/addCloze','500px','340px')">新建</button>
		</form>
	</div>

	<table class='bordered'>
		<thead>
			<tr>
				<th>编号</th>
				<th>课程</th>
				<th>创建者</th>
				<th>问题</th>
				<th>答案</th>
				<th>创建时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<volist name="data" id="l">
				<tr>
					<td><{$l.clo_numb}></td>
					<td><{$l.sub_name}></td>
					<td><{$l.tea_name}></td>
					<td><{$l.clo_ques}></td>
					<td><{$l.clo_ansa}></td> 
					<td><{$l.clo_time}></td>
					<td><a href="javascript:;" onclick="popup('/Atext/editCloze?clo_id=<{$l.clo_id}>','500px','340px')">编辑</a>/<a onclick="deletes(this)" url='/Atext/deleteCloze?clo_id=<{$l.clo_id}>' href="javascript:;">删除</a></td>
				</tr>
			</volist>
		</tbody>
	</table>
</div>
<include file='Index/footer'/>