var theInt = null;
var curclicked = 0;

$(function() {
	$('#transparence').css('opacity', '0.4');
	$('#pic_list img').css({
		'opacity' : '0.6'
	});
	$('#pic_list img:eq(0)').css({
		'top' : '0',
		'opacity' : '1'
	});
	$('#pic_list a').click(function() {
		return false
	});
	t(0);
	$('#pic_list img').mouseover(function() {
		if ($('#this_pic').attr('src') == $(this).attr('src'))
			return;
		t($('#pic_list img').index($(this)));
	});
});

t = function(i) {
	clearInterval(theInt);
	if (typeof i != 'undefined')
		curclicked = i;
	$('#this_pic').fadeOut(0).fadeIn(500).attr('src',
			$('#pic_list img').eq(i).attr('src'));
	$('#this_a').attr('href',
			$('#pic_list img').eq(i).parents('a').attr('href'));
	$('#this_a').attr('title',
			$('#pic_list img').eq(i).parents('a').attr('title'));
	$('#pic_list img').eq(i).parents('li').nextAll('li').find('img')
			.animate({
				top : 18,
				opacity : 0.6
			}, 500);
	$('#pic_list img').eq(i).parents('li').prevAll('li').find('img')
			.animate({
				top : 18,
				opacity : 0.6
			}, 500);
	$('#pic_list img').eq(i).animate({
		top : 0
	}, 500).css('opacity', '1');
	theInt = setInterval(function() {
		i++;
		if (i > $('#pic_list img').length - 1) {
			i = 0
		}
		;
		$('#this_pic').fadeOut(0).fadeIn(500).attr('src',
				$('#pic_list img').eq(i).attr('src'));
		$('#this_a').attr('href',
				$('#pic_list img').eq(i).parents('a').attr('href'));
		$('#this_a').attr('title',
				$('#pic_list img').eq(i).parents('a').attr('title'));
		$('#pic_list img').eq(i).parents('li').nextAll('li').find('img')
				.animate({
					top : 18,
					opacity : 0.6
				}, 500);
		$('#pic_list img').eq(i).parents('li').prevAll('li').find('img')
				.animate({
					top : 18,
					opacity : 0.6
				}, 500);
		$('#pic_list img').eq(i).animate({
			top : 0
		}, 500).css('opacity', '1');
	}, 3000)
}
	
$(function(){
	bodyID = $('body').attr('id');
	$('a.popup').click(function(){
		xHref = $(this).attr('href').split('#')[0];
		if($(this).attr('href').indexOf("#w") != -1){
			xWidth = Number($(this).attr('href').split('#')[1].split('w')[1].split('h')[0]);
			xHeight = Number($(this).attr('href').split('#')[1].split('h')[1]);
		}else{
			xWidth =760;
			xHeight = 600;
		}
		window.open(xHref,'SubWin','resizable=yes,scrollbars=yes,menubar=no,directories=no,status=no,location=no,width='+xWidth+',height='+xHeight+'');
		return false;
	});
});


