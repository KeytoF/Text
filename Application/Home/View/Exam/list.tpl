<include file='Index/main'/>
<include file='Index/sidebar'/>
<div class="right">
	<div class='tr pb10'>
		<!-- <select name="1" class='h34'>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
		</select> -->
		<!-- <input class="pure-button pure-button-primary" type="button" value="搜索">
		<button type="button" class="pure-button pure-button-primary" onclick="popup('/Atext/addAnswer','500px','250px')">新建</button> -->
	</div>

	<table class='bordered'>
		<thead>
			<tr>
				<th>编号</th>
				<th>创建者</th>
				<th>课程</th>
				<th>创建时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<volist name="data" id="l">
				<tr>
					<td><{$l.pap_numb}></td>
					<td><{$l.tea_name}></td>
					<td><{$l.sub_name}></td>
					<td><{$l.pap_time}></td>
					<td><a href="/Exam/exam.html?pap_id=<{$l.pap_id}>&id=<{$id}>">考试</a></td>
				</tr>
			</volist>
		</tbody>
	</table>
</div>
<include file='Index/footer'/>