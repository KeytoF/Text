<include file='Index/main'/>
<link rel="stylesheet" type="text/css" href="__CSS__/content.css">

<div id='content'>
	<div id="con1">
		<h6>用户信息</h6>
		<ul>
			<li><span>用户名：</span><{$Sdata.stu_name}></li>
			<li><span>学号：</span><{$Sdata.stu_numb}></li>
			<li><span>院系：</span><{$Sdata.fac_name}></li>
			<li><span>专业：</span><{$Sdata.maj_name}></li>
			<li><span>班级：</span><{$Sdata.cla_name}></li>
		</ul>
	</div>
	<div id="con2">
		<h6>成绩信息</h6>
		<ul>
			<li><span>课程</span>&nbsp;总分</li>
			<volist name='Gdata' id='g' key='ks'>
			<if condition="$ks elt 5">
					<li><span><{$g.sub_name}></span>&nbsp;<{$g.gra_grad}></li>
				</if>
			</volist>
		</ul>
	</div>
</div>