<include file='Admin/main'/>
<include file='Apaper/sidebar'/>

<div class='right'>
    <div class='tr pb10'>
        <button type="button" class="pure-button pure-button-primary" onclick="popup('/Apaper/addScore','500px','580px')">新建</button>
    </div>
    <table class='bordered'>
        <thead>
            <tr>
                <th>分值表号</th>
                <th>提交者</th>
                <th>提交时间</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
        <volist name='Sdata' id='l'> 
            <tr>
                <td style="text-align: left"><{$l.sco_numb}><br/></td>
                <td><{$l.tea_name}></td>
                <td><{$l.sco_time}></td>
                <td><a href="javascript:;" onclick="popup('/Apaper/editScore?sco_id=<{$l.sco_id}>','500px','350px')">编辑</a>/<a onclick="deletes(this)" url='/Apaper/deleteScore?sco_id=<{$l.sco_id}>' href="javascript:;">删除</a></td>
            </tr>
            </volist>
        </tbody>
    </table>

    <div id='page'>
        <{$show}>
    </div>
</div>

<include file='Index/footer'/>
