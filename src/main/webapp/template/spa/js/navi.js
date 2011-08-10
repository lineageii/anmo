var ctx= "";

	var headerSpa = '\
		<div id="headerIn">\
		<p><a href="/"><img src="template/spa/images/logo.gif" width="214" height="77" alt="LaQua TOKYO DOME CITY" /></a></p>\
		<ul id="hNavHead">\
		<li><img src="template/spa/images/footer_dial.gif" width="287" height="16" alt="東京ドームシティわくわくダイヤル 03-5800-9999" /></a></li>\
		</ul>\
		<ul id="hNavFoot">\
		<li id="hnav_business"><a href=' + ctx+ ' ><img src="template/spa/images/hnav_business.gif" width="82" height="20" alt="首页" /></a></li>\
		<li id="hnav_access"><a href=' + ctx+ '/staff.anmo><img src="template/spa/images/hnav_access.gif" width="85" height="20" alt="技师魅影" /></a></li>\
		<li id="hnav_map"><a href=' + ctx + '/service.html><img src="template/spa/images/hnav_map.gif" width="97" height="20" alt="服务项目" /></a></li>\
		<li id="hnav_mobile"><a href=' + ctx+'/flow.html><img src="template/spa/images/hnav_mobile.gif" width="117" height="20" alt="服务流程" /></a></li>\
		<li id="hnav_staff"><a href=' + ctx+'/comment.anmo><img src="template/spa/images/hnav_staff.gif" width="93" height="20" alt="顾客点评" /></a></li>\
		<li id="hnav_sponcer"><a href=' + ctx+'/store.anmo><img src="template/spa/images/hnav_sponcer.gif" width="115" height="20" alt="附近店铺" /></a></li>\
		<li id="hnav_qa"><a href=' + ctx+'/help.html><img src="template/spa/images/hnav_qa.gif" width="58" height="20" alt="帮助" /></a></li>\
		</ul>\
		</div>\
	';

	var footer = '\
		<div id="footerIn">\
		<dl>\
		<dd><a href="http://www.tokyo-dome.co.jp/" target="_blank">首页</a></dd>\
		<dd><a href="http://www.tokyo-dome.jp/" target="_blank">公司信息</a></dd>\
		<dd><a href="http://www.tokyo-dome.co.jp/contact/" target="_blank">联系我们</a></dd>\
		</dl>\
		<p><img src="template/spa/images/footer_dial.gif" width="287" height="16" alt="東京ドームシティわくわくダイヤル 03-5800-9999" /></p>\
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


