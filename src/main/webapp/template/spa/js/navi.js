var ctx= "";

	var headerSpa = '\
		<div id="headerIn">\
		<p><a href="/"><img src="/template/spa/images/logo.gif" width="214" height="77" alt="+G spa | 迦季养生馆 LOGO" /></a></p>\
		<ul id="hNavHead">\
		<li><img src="/template/spa/images/footer_dial.gif" width="287" height="16" alt="上门预约电话  13052090702" /></a></li>\
		</ul>\
		<ul id="hNavFoot">\
		<li id="hnav_home"><a href=' + ctx+ '/ ><img src="/template/spa/images/head/hnav_home.gif" height="20" alt="首页" /></a></li>\
		<li id="hnav_staff"><a href=' + ctx+ '/staff.anmo><img src="/template/spa/images/head/hnav_staff.gif" height="20" alt="技师魅影" /></a></li>\
		<li id="hnav_service"><a href=' + ctx + '/service/ ><img src="/template/spa/images/head/hnav_service.gif"height="20" alt="服务项目" /></a></li>\
		<li id="hnav_order"><a href=' + ctx+'/order/ ><img src="/template/spa/images/head/hnav_order.gif" height="20" alt="网上预约" /></a></li>\
		<li id="hnav_comment"><a href=' + ctx+'/comment.anmo><img src="/template/spa/images/head/hnav_comment.gif" height="20" alt="顾客点评" /></a></li>\
		<li id="hnav_store"><a href=' + ctx+'/store.anmo><img src="/template/spa/images/head/hnav_store.gif"  height="20" alt="附近店铺" /></a></li>\
		<li id="hnav_job"><a href=' + ctx+'/job/ ><img src="/template/spa/images/head/hnav_job.gif" height="20" alt="招聘信息" /></a></li>\
		<li id="hnav_flow"><a href=' + ctx+'/flow/ ><img src="/template/spa/images/head/hnav_flow.gif" height="20" alt="服务流程" /></a></li>\
		<li id="hnav_help"><a href=' + ctx+'/help/ ><img src="/template/spa/images/head/hnav_help.gif" height="20" alt="帮助" /></a></li>\
		</ul>\
		</div>\
	';

	var footer = '\
		<div id="footerIn">\
		<dl>\
		<dd><a href="/" target="_blank">首页</a></dd>\
		<dd><a href="/contact/" target="_blank">联系我们</a></dd>\
		</dl>\
		<p><img src="/template/spa/images/footer_dial.gif" width="287" height="16" alt="上门预约电话  13052090702" /></p>\
		<div id="copyright">Copyright&copy;上海塞依信息 All right reserved.</div>\
		</div>\
	';

	
$(function(){
	bodyID = $('body').attr('id');
	if(bodyID == 'spa'){
		$('#header').html(headerSpa);
	}else{
		$('#header').html(header);
	}
	$('#footer').html(footer);
	
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


