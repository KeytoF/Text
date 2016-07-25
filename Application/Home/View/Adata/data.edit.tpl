<div>
	<form id='form' action='/Adata/updateData' method="post" class='pure-form pure-form-aligned' enctype="multipart/form-data">
	<input type="hidden" name="dat_id" value="<{$Sdata.dat_id}>">
	<input type="hidden" name="dat_url" value="<{$Sdata.dat_url}>">
		<fieldset>
			<!-- <fieldset class='pure-group'> -->
			<div class="pure-control-group">
				<label for="dat_name">名称</label>
				<input id="dat_name" name='dat_name' type="text" required value='<{$Sdata.dat_name}>'>
				<label id="firstname-error" class="error tip" for="dat_name"></label>
			</div>
			<div class="pure-control-group">
				<label for="dat_numb">编号</label>
				<input id="dat_numb" name='dat_numb' type="text" required value='<{$Sdata.dat_numb}>' maxlength='8'>
				<label id="firstname-error" class="error tip" for="dat_numb"></label>
			</div>
			<div class="pure-control-group">
				<label for='sub_id'>课程</label>
				<select class='w167' id="sub_id" name='sub_id' autofocus>
					<volist name='data' id='l'>
						<if condition="$l['sub_id'] eq $Sdata['sub_id']">
							<option value="<{$l.sub_id}>" selected><{$l.sub_name}></option>
							<else/>
							<option value="<{$l.sub_id}>"><{$l.sub_name}></option>
						</if>
					</volist>
				</select>
				<label id="firstname-error" class="error tip" for="sub_id"></label>
			</div>
			<div class="pure-control-group">
				<label for="dat_file">文件</label>
				<input type="file" id="dat_file" name='dat_file' />
			</div>
			<div class='tc mb10'>
				<label id="firstname-error" class="tip" style="" for="dat_file">如需重新上传文件则选择</label>
			</div>
			<!-- </fieldset> -->
			<div class='tc'>
				<button type="submit" class="pure-button pure-button-primary">Submit</button>
			</div>
		</fieldset>
	</form>
</div>
<script>
	var form = $('#form')

	$(form).validate({
		rules: {
			dat_name: {
				required: true,
				rangelength: [1,20]
			},
			dat_numb: {
				required: true,
				digits: true,
				rangelength: [8,8],
				remote: {
					url: "/Public/checkSameEdit",
					type: "post",
					data: {
						dat_numb: function() {
							return $("#dat_numb").val();
						},
						sub_id: function() {
							return $("#sub_id").val();
						},
						database: function() {
							return 'Data';
						},
						dat_id: function() {
							return "neq,"+<{$Sdata.dat_id}>;
						},
						name: function() {
							return 'dat_id';
						},
						dat_sign: function() {
							return 0;
						}
					}
				}

			}
		},
		messages: {
			dat_name: {
				required: "请输入名称",
				rangelength: "名称的长度不能超过20位"
			},
			dat_numb: {
				required: "请输入编号",
				digits: "编号必须为整数",
				rangelength: "编号长度必须为8位",
				remote: '重复啦'
			}
		}
	});

	// // 模块化
	// $(form).submit(function() {
	// 	data = $(this).serialize()
	// 	bool = $(this).valid()
	// 	url = $(this).attr('action')
	// 	if(bool==true){
	// 		$.post(url,data,function(s){
	// 			if(s=='succ'){
	// 				succ()
	// 			}else{
	// 				error()
	// 			}
	// 		});
	// 	}
	// 	return false;
	// });
	// function succ(){
	// 	layer.msg('成功', {
	// 		icon: 1,
	// 		time: 2000 
	// 	}, function(){
	// 		location = location
	// 	})
	// }
	// function error(){
	// 	layer.msg('失败', {
	// 		icon: 2,
	// 		time: 2000 
	// 	}, function(){
	// 	})
	// }
</script>