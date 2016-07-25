// var w_width,w_height,
// 	l_width,l_height,
// 	m_height;

// function win() {
// 	w_width=$(window).width(); 
// 	w_height=$(window).height();
// 	l_height=$('.left').height();
// 	l_width=$('.left').width();
// 	m_height=$('.mcd-menu').height();
// 	if(w_height>m_height){
// 		$('.left').css({'height':(w_height-80)+'px'});
// 	}else{
// 		$('html').css({'height':(m_height+80)+'px'});
// 		$('body').css({'height':(m_height+80)+'px'});
// 	}
// 	$('.topmenu').css({'width':(w_width-150)+'px'});
// 	// $('.iframe').css({'height':(w_height-80)+'px'});
// 	$('.right').css({'width':(w_width-l_width-1-20)+'px','height':(w_height-80-20)+'px'});
// 	// $('.iframe_two').css({'width':(w_width-152)+'px','height':(w_height)+'px'});
// 	$('.menu').css({'width':((w_width-160)/5)+'px'});
// }

// $(window).resize(function() {
// 	win();
// });

// $(function(){
// win();
// });