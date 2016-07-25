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
			<li><a href="/Apaper/paper.html" <?php if($active=='paper'): ?>class='active'<?php else: ?>class='a'<?php endif; ?><strong>试卷</strong></a></li>
			<li><a href="/Apaper/score.html" <?php if($active=='score'): ?>class='active'<?php else: ?>class='a'<?php endif; ?><strong>分值表</strong></a></li>
	</ul>
</nav>
</div>


<div class='right'>
    <div class='tr pb10'>
        <form action="/Apaper/paper.html" method="post" accept-charset="utf-8">
            <button type="button" class="pure-button pure-button-primary" onclick="popup('/Apaper/addPaperManual.html','500px','100px')">手动新建</button>
            课程名称<input type="text" name='sub_name' class='h32 w70'>
            <input class="pure-button pure-button-primary" type="submit" value="搜索">
            <button type="button" class="pure-button pure-button-primary" onclick="popup('/Apaper/addPaper','500px','270px')">新建</button>
        </form>
    </div>
    <table class='bordered'>
        <thead>
            <tr>
                <th>试卷号</th>
                <th>提交者</th>
                <th>课程</th>
                <th>分值表号</th>
                <th>提交时间</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
            <?php if(is_array($Sdata)): $i = 0; $__LIST__ = $Sdata;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$l): $mod = ($i % 2 );++$i;?><tr>
                    <td style="text-align: left"><?php echo ($l["pap_numb"]); ?><br/></td>
                    <td><?php echo ($l["tea_name"]); ?></td>
                    <td><?php echo ($l["sub_name"]); ?></td>
                    <td><?php echo ($l["sco_numb"]); ?></td>
                    <td><?php echo ($l["pap_time"]); ?></td>
                    <td>
                        <a href="javascript:;" onclick="popup('/Apaper/check?pap_id=<?php echo ($l["pap_id"]); ?>','100%','100%')">查看試卷</a>/<a href="javascript:;" onclick="popup('/Apaper/editPaper?pap_id=<?php echo ($l["pap_id"]); ?>','500px','300px')">编辑</a>/<a onclick="deletes(this)" url='/Apaper/deletePaper?pap_id=<?php echo ($l["pap_id"]); ?>' href="javascript:;">删除</a>/
                        <?php if($l['pap_star'] == 0): ?><a href="javascript:;" url='/Apaper/startPaper.html?pap_id=<?php echo ($l["pap_id"]); ?>' onclick="popup('/Apaper/editPaperClass?pap_id=<?php echo ($l["pap_id"]); ?>','500px','200px')">开始考试</a>
                            <?php else: ?>
                            <a href="javascript:;" url='/Apaper/endPaper.html?pap_id=<?php echo ($l["pap_id"]); ?>' onclick='end(this)'>关闭考试</a><?php endif; ?>
                    </td>
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
<script>
    function start(o){
        var url = $(o).attr('url');
        $.get(url, function(data){
            if(data=='succ'){
                succ();
            }else{
                error();
            }
        });
    }
    function end(o){
        var url = $(o).attr('url');
        $.get(url, function(data){
            if(data=='succ'){
                succ();
            }else{
                error();
            }
        });
    }
    function succ(){
        layer.msg('成功', {
            icon: 1,
            time: 2000 
        }, function(){
            location = location
        })
    }
    function error(){
        layer.msg('失败', {
            icon: 2,
            time: 2000 
        }, function(){
        })
    }
</script>