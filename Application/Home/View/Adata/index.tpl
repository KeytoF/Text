<include file='Admin/main'/>
<include file='Adata/sidebar'/>

<div class='right'>
    <div class='tr pb10'>
        <form action="/Adata/index.html" method="post" accept-charset="utf-8">
            课程名称<input type="text" name='sub_name' class='h32 w70'>
            <input class="pure-button pure-button-primary" type="submit" value="搜索">
            <button type="button" class="pure-button pure-button-primary" onclick="popup('/Adata/addData','500px','300px')">新建</button>
        </form>
    </div>
    <table class='bordered'>
        <thead>
            <tr>
                <th>编号(4位课程+8位编号)</th>
                <th>名称</th>
                <th>课程</th>
                <th>提交者</th>
                <th>提交时间</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
            <volist name="data" id="l">
                <tr>
                    <td><{$l.dat_numb}></td>
                    <td><{$l.dat_name}></td>
                    <td><{$l.sub_name}></td>
                    <td><{$l.tea_name}></td>
                    <td><{$l.dat_time}></td>
                    <td>
                        <if condition="$l['dat_url'] neq ''">
                            <a href="/Uploads/<{$l.dat_url}>">下载</a>/
                            <else/>
                            <a href="javascript:;">无法下载</a>/
                        </if>
                        <a href="javascript:;"onclick="popup('/Adata/editData?dat_id=<{$l.dat_id}>','500px','300px')">编辑</a>/<a onclick="deletes(this)" url='/Adata/deleteData?gra_id=<{$l.dat_id}>' href="javascript:;">删除</a>
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
