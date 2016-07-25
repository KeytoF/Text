<include file='Admin/main'/>
<include file='Atext/sidebar'/>

<div class='right'>
    <div class='tr pb10'>
        <select name="1" class='h34'>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
        </select>
        <input class="pure-button pure-button-primary" type="button" name="123123" value="搜索">
        <button type="button" class="pure-button pure-button-primary" onclick="popup('/Adata/addData','500px','200px')">新建</button>
    </div>
    <table class='bordered'>
        <thead>
            <tr>
                <th>标题</th>
                <th>提交者</th>
                <th>提交时间</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td style="text-align: left"><a href="<{$dl.URL}>"><{$dl.Title}></a><br/></td>
                <td><{$dl.UserName}></td>
                <td><{$dl.Dtime}></td>
                <td><a href="<{$dl.URL}>">打开</a>/<a href="javascript:;">下载</a></td>
            </tr>
            <volist name="dataList" id="dl">
                <tr>
                    <td style="text-align: left"><a href="<{$dl.URL}>"><{$dl.Title}></a><br/></td>
                    <td><{$dl.UserName}></td>
                    <td><{$dl.Dtime}></td>
                    <td><a href="<{$dl.URL}>">打开</a>/<a href="javascript:;">下载</a></td>
                </tr>
            </volist>
        </tbody>
    </table>

    <div id='page'>
        <{$show}>
    </div>
</div>

<include file='Index/footer'/>
