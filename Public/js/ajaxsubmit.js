// 模块化
$(form).submit(function() {
	data = $(this).serialize()
	bool = $(this).valid()
	url = $(this).attr('action')
	if(bool==true){
		console.log(data);
		$.post(url,data,function(s){
			if(s=='succ'){
				succ()
			}else{
				error()
			}
		});
	}
	return false;
});
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