<include file='Admin/main'/>
<include file='Auser/sidebar'/>
<!-- 侧栏隐藏效果 -->
<style type="text/css" media="screen">
	.hidden{
		/*float: left;*/
		width: 0px !important;
		transition-property:width;
		transition-duration:1s;
		transition-timing-function:linear;
		transition-delay:0s;
	}
</style>
<script>
	$(function(){
		$('#hidden').click(function(){
			alert(1231);
			$('.left').attr('class','left hidden');
		});
	});
</script>
<!-- <div class='left'>
	<nav class='left'>
		<div class="pure-menu pure-menu-open">
			<a id='hiddens' class='hiddens' href="javascript:;">隐藏</a>
			<ul class='pure-menu-items'>
				<li><a href="#">Flickr</a></li>
				<li><a href="#">Messenger</a></li>
				<li><a href="#">Sports</a></li>
				<li><a href="#">Finance</a></li>
				<li class="pure-menu-heading">More Sites!</li>
			</ul>
		</div>
	</nav>
</div>

<div class='right'>
	<div>
		<button type="button">1321123132313</button>
	</div>
</div> -->

<div class="right">
	<div class='tr pb10'>
		<form action="/Auser/user.html" method="post" accept-charset="utf-8">
			姓名<input type="text" name='stu_name' class='h32 w70'>
			<input class="pure-button pure-button-primary" type="submit" value="搜索">
			<button type="button" class="pure-button pure-button-primary" onclick="popup('/Auser/addUser','500px','300px')">新建</button>
		</form>
	</div>
	<table class='bordered'>
		<thead>
			<tr>
				<th>学号</th>
				<th>姓名</th>
				<th>院系</th>
				<th>专业</th>
				<th>班级</th>
				<th>创建时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<volist name="list" id="l">
				<tr>
					<td><{$l.stu_numb}></td>
					<td><{$l.stu_name}></td>
					<td><{$l.fac_name}></td>
					<td><{$l.maj_name}></td> 
					<td><{$l.cla_name}></td>
					<td><{$l.stu_time}></td>
					<td><a href="javascript:;" onclick="popup('/Auser/editUser?stu_id=<{$l.stu_id}>','500px','280px')">编辑</a>/<a onclick="deletes(this)" url='/Auser/deleteUser?stu_id=<{$l.stu_id}>' href="javascript:;">删除</a></td>
				</tr>
			</volist>
		</tbody>
	</table>

	<div id='page'>
		<{$show}>
	</div>
</div>
<include file='Index/footer'/>