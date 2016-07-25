//页面层-弹窗
function popup(url,width,height){
	$.get(url,function(data){
		layer.open({
			type: 1,
			closeBtn: 1,
			area: [width, height],
			shadeClose: true,
			content: data
		});
	});
}

//tab页面层-弹窗-3个
function tab(width,height,title_a,url_a,title_b,url_b,title_c,url_c){
	var data_a
	var data_b
	var data_c
	$.ajax({
		url: url_a,
		async: false,
		type: "POST",
		success: function (data) {
			data_a = data;
		}
	});
	$.ajax({
		url: url_b,
		async: false,
		type: "POST",
		success: function (data) {
			data_b = data;
		}
	});
	$.ajax({
		url: url_c,
		async: false,
		type: "POST",
		success: function (data) {
			data_c = data;
		}
	});
	layer.tab({
		area: [width, height],
		tab: [{
			title: title_a, 
			content: data_a
		}, {
			title: title_b, 
			content: data_b
		}, {
			title: title_c, 
			content: data_c
		}]
	});
}

function deletes(o){
	layer.confirm('确认删除此项么?', {icon: 3, title:'提示'}, function(index){
		url = $(o).attr('url');
		$.get($(o).attr('url'), function(s){
			if(s=='succ'){
				succ()
			}else{
				error()
			}
		});
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
		layer.close(index);
	})
}