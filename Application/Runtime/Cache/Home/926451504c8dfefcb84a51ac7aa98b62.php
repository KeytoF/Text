<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
	<title>在线考试-后台管理</title>
	<link rel="stylesheet" type="text/css" href="/Public/pure-release-0.5.0/grids-min.css">
	<link rel="stylesheet" type="text/css" href="/Public/pure-release-0.5.0/forms-min.css">
	<link rel="stylesheet" type="text/css" href="/Public/pure-release-0.5.0/tables-min.css">
	<link rel="stylesheet" type="text/css" href="/Public/pure-release-0.5.0/menus-min.css">
	<link rel="stylesheet" type="text/css" href="/Public/pure-release-0.5.0/buttons-min.css">
	<link rel="stylesheet" type="text/css" href="/Public/css/index.css">
	<link rel="stylesheet" type="text/css" href="/Public/css/public.css">
	<link rel="stylesheet" type="text/css" href="/Public/css/list.css">
	<link rel="stylesheet" type="text/css" href="/Public/css/sidebar.css">
	<link rel="stylesheet" type="text/css" href="/Public/css/page.css">
	<link rel="stylesheet" type="text/css" href="/Public/css/tip.css">
	<script src="/Public/js/jquery-1.12.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="/Public/js/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
	<script src="/Public/js/layer/layer.js"></script>
</head>
<body>
	<div class='div'>
		<div class='top'>
			<div class='logo'><img class='logoimage' src="/Public/image/logo.png"></div>
			<div class='topmenu'>
				<div class='divuser'>
					<div style="height: 14px">
						
					</div>
					<a href="/User/index/id/2.html"><?php echo ($user["username"]); ?></a>
					<a href="/Index/logout.html">退出登录</a>
					<!-- <a href="/Public/err">退出登录</a> -->
					<a href="/Index/index.html">前台</a>
				</div>
				<div class="time">
					<p id='s'></p>
				</div>
				<script>setInterval("s.innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);</script>
				<nav>
					<ul> 
						<li <?php if($menu['click']==Auser): ?>class="menu checkmenu"<?php else: ?>class="menu"<?php endif; ?>><a class='menu' id='user' href="/Auser/user.html">用户管理</a></li>
						<li <?php if($menu['click']==Atext): ?>class="menu checkmenu"<?php else: ?>class="menu"<?php endif; ?>><a class='menu' id='text' href="/Atext/single.html">题目管理</a></li>
						<li <?php if($menu['click']==Apaper): ?>class="menu checkmenu"<?php else: ?>class="menu"<?php endif; ?>><a class='menu' id='Paper' href="/Apaper/paper.html">试卷管理</a></li>
						<li <?php if($menu['click']==Adata): ?>class="menu checkmenu"<?php else: ?>class="menu"<?php endif; ?>><a class='menu' id='data' href="/Adata/index.html">资料管理</a></li>
						<li <?php if($menu['click']==Agrade): ?>class="menu checkmenu"<?php else: ?>class="menu"<?php endif; ?>><a class='menu' id='grade' href="/Agrade/grade.html">成绩管理</a></li>
					</ul>
				</nav>
			</div>
		</div>
<div class='left'>
<nav>
	<ul class="mcd-menu sidebar">
			<li><a href="/Agrade/grade.html" <?php if($active=='grade'): ?>class='active'<?php else: ?>class='a'<?php endif; ?><strong>成绩管理</strong></a></li>
	</ul>
</nav>
</div>


<div class='right'>
    <div class='tr pb10'>
    </div>
    <table class='bordered'>
        <thead>
            <tr>
                <th>试卷号</th>
                <th>学生号</th>
                <th>学生姓名</th>
                <th>课程名称</th>
                <th>系统分数</th>
                <th>提交时间</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
            <?php if(is_array($data)): $i = 0; $__LIST__ = $data;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$l): $mod = ($i % 2 );++$i;?><tr>
                    <td style="text-align: left"><?php echo ($l["pap_numb"]); ?><br/></td>
                    <td><?php echo ($l["stu_numb"]); ?></td>
                    <td><?php echo ($l["stu_name"]); ?></td>
                    <td><?php echo ($l["sub_name"]); ?></td>
                    <td><?php echo ($l["gra_grac"]); ?></td>
                    <td><?php echo ($l["gra_time"]); ?></td>
                    <?php if($l['gra_siga'] == 0): ?><td><a href="javascript:;" onclick="popup('/Agrade/editGrade?gra_id=<?php echo ($l["gra_id"]); ?>','500px','600px')">编辑</a>/<a onclick="deletes(this)" url='/Agrade/deleteGrade?gra_id=<?php echo ($l["gra_id"]); ?>' href="javascript:;">删除</a></td>
                        <?php else: ?>
                        <td><a onclick="deletes(this)" url='/Agrade/deleteGrade?gra_id=<?php echo ($l["gra_id"]); ?>' href="javascript:;">删除</a></td><?php endif; ?>
                </tr><?php endforeach; endif; else: echo "" ;endif; ?>
        </tbody>
    </table>

    <div id='page'>
        <?php echo ($show); ?>
    </div>
</div>

</body>
</html>
<script src="/Public/js/popup.js" type="text/javascript"></script>