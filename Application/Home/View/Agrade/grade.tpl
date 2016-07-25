<include file='Admin/main'/>
<include file='Agrade/sidebar'/>

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
            <volist name='data' id='l'> 
                <tr>
                    <td style="text-align: left"><{$l.pap_numb}><br/></td>
                    <td><{$l.stu_numb}></td>
                    <td><{$l.stu_name}></td>
                    <td><{$l.sub_name}></td>
                    <td><{$l.gra_grac}></td>
                    <td><{$l.gra_time}></td>
                    <if condition="$l['gra_siga'] eq 0">
                        <td><a href="javascript:;" onclick="popup('/Agrade/editGrade?gra_id=<{$l.gra_id}>','500px','600px')">编辑</a>/<a onclick="deletes(this)" url='/Agrade/deleteGrade?gra_id=<{$l.gra_id}>' href="javascript:;">删除</a></td>
                        <else/>
                        <td><a onclick="deletes(this)" url='/Agrade/deleteGrade?gra_id=<{$l.gra_id}>' href="javascript:;">删除</a></td>
                    </if>
                </tr>
            </volist>
        </tbody>
    </table>

    <div id='page'>
        <{$show}>
    </div>
</div>

<include file='Index/footer'/>
