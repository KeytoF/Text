<include file='Admin/main'/>
<include file='Apaper/sidebar'/>

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
            <volist name='Sdata' id='l'> 
                <tr>
                    <td style="text-align: left"><{$l.pap_numb}><br/></td>
                    <td><{$l.tea_name}></td>
                    <td><{$l.sub_name}></td>
                    <td><{$l.sco_numb}></td>
                    <td><{$l.pap_time}></td>
                    <td>
                        <a href="javascript:;" onclick="popup('/Apaper/check?pap_id=<{$l.pap_id}>','100%','100%')">查看試卷</a>/<a href="javascript:;" onclick="popup('/Apaper/editPaper?pap_id=<{$l.pap_id}>','500px','300px')">编辑</a>/<a onclick="deletes(this)" url='/Apaper/deletePaper?pap_id=<{$l.pap_id}>' href="javascript:;">删除</a>/
                        <if condition="$l['pap_star'] eq 0">
                            <a href="javascript:;" url='/Apaper/startPaper.html?pap_id=<{$l.pap_id}>' onclick="popup('/Apaper/editPaperClass?pap_id=<{$l.pap_id}>','500px','200px')">开始考试</a>
                            <else/>
                            <a href="javascript:;" url='/Apaper/endPaper.html?pap_id=<{$l.pap_id}>' onclick='end(this)'>关闭考试</a>
                        </if>
                    </td>
                </tr>
            </volist>
        </tbody>
    </table>

    <div id='page'>
        <{$show}>
    </div>
</div>

<include file='Index/footer'/>
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
