<include file='Index/main'/>
<include file='Index/sidebar'/>

<div class='right'>
    <div class='tr pb10'>
        <select name="1" class='h34'>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
        </select>
        <input class="pure-button pure-button-primary" type="button" name="123123" value="搜索">
        <button type="button" class="pure-button pure-button-primary" onclick="popup('/Adata/addData','500px','300px')">新建</button>
    </div>
    <table class='bordered'>
        <thead>
            <tr>
                <th>编号</th>
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
                    <if condition="$l['dat_url'] neq ''">
                        <td><a href="/Uploads/<{$l.dat_url}>">下载</a></td>
                        <else/>
                        <td><a href="javascript:;">无法下载</a></td>
                    </if>
                    <!-- <td><a href="javascript:;"onclick="popup('/Adata/editData?dat_id=<{$l.dat_id}>','500px','300px')">编辑</a>/<a href="/Uploads/<{$l.dat_url}>">下载</a></td> -->
                </tr>
            </volist>
        </tbody>
    </table>

    <div id='page'>
        <{$show}>
    </div>
</div>

<include file='Index/footer'/>
