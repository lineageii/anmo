
	var header = '\
		<div id="headerIn">\
		<p>\
			<img src="template/spa/images/logo.gif" width="214" height="77" alt="LaQua TOKYO DOME CITY" usemap="#logoMap" />\
			<map name="logoMap" id="logoMap">\
				<area shape="rect" coords="164,0,214,77" href="/pages/qa.html#q2" alt="" />\
				<area shape="rect" coords="0,0,164,77" href="/" alt="" />\
			</map>\
		</p>\
		<ul id="hNavHead">\
		<li id="hnav_privacy"><a href="/pages/privacy.html" class="popup"><img src="template/spa/images/hnav_privacy.gif" width="99" height="20" alt="個人情報保護" /></a></li>\
		<li id="hnav_use"><a href="/pages/kiyaku.html" class="popup"><img src="template/spa/images/hnav_use.gif" width="99" height="20" alt="サイト利用方法" /></a></li>\
		<li id="hnav_questionnaire"><a href="/questionnaire" class="popup"><img src="template/spa/images/hnav_questionnaire.gif" width="92" height="20" alt="アンケート" /></a></li>\
		<li id="hnav_sitemap"><a href="/pages/sitemap.html"><img src="template/spa/images/hnav_sitemap.gif" width="92" height="20" alt="サイトマップ" /></a></li>\
		<li id="hnav_english"><a href="/pages/en/index.html" class="popup"><img src="template/spa/images/hnav_english.gif" width="59" height="20" alt="English" /></a></li>\
		</ul>\
		<ul id="hNavFoot">\
		<li id="hnav_business"><a href="/pages/sguide.html"><img src="template/spa/images/hnav_business.gif" width="82" height="20" alt="営業時間" /></a></li>\
		<li id="hnav_access"><a href="/pages/access.html"><img src="template/spa/images/hnav_access.gif" width="85" height="20" alt="アクセス" /></a></li>\
		<li id="hnav_map"><a href="/map/index.html"><img src="template/spa/images/hnav_map.gif" width="97" height="20" alt="施設マップ" /></a></li>\
		<li id="hnav_mobile"><a href="/mobile"><img src="template/spa/images/hnav_mobile.gif" width="117" height="20" alt="モバイルラクーア" /></a></li>\
		<li id="hnav_staff"><a href="/recruit"><img src="template/spa/images/hnav_staff.gif" width="93" height="20" alt="スタッフ募集" /></a></li>\
		<li id="hnav_sponcer"><a href="/pages/sponsor.html" class="popup"><img src="template/spa/images/hnav_sponcer.gif" width="115" height="20" alt="スポンサーシップ" /></a></li>\
		<li id="hnav_qa"><a href="/pages/qa.html"><img src="template/spa/images/hnav_qa.gif" width="58" height="20" alt="Q＆A" /></a></li>\
		</ul>\
		</div>\
	';

	var headerSpa = '\
		<div id="headerIn">\
		<p><a href="/"><img src="template/spa/images/logo.gif" width="214" height="77" alt="LaQua TOKYO DOME CITY" /></a></p>\
		<ul id="hNavHead">\
		<li><img src="template/spa/images/footer_dial.gif" width="287" height="16" alt="東京ドームシティわくわくダイヤル 03-5800-9999" /></a></li>\
		</ul>\
		<ul id="hNavFoot">\
		<li id="hnav_business"><a href="/pages/sguide.html"><img src="template/spa/images/hnav_business.gif" width="82" height="20" alt="首页" /></a></li>\
		<li id="hnav_access"><a href="/pages/access.html"><img src="template/spa/images/hnav_access.gif" width="85" height="20" alt="アクセス" /></a></li>\
		<li id="hnav_map"><a href="/map/index.html"><img src="template/spa/images/hnav_map.gif" width="97" height="20" alt="施設マップ" /></a></li>\
		<li id="hnav_mobile"><a href="/mobile"><img src="template/spa/images/hnav_mobile.gif" width="117" height="20" alt="モバイルラクーア" /></a></li>\
		<li id="hnav_staff"><a href="/recruit"><img src="template/spa/images/hnav_staff.gif" width="93" height="20" alt="スタッフ募集" /></a></li>\
		<li id="hnav_sponcer"><a href="/pages/sponsor.html" class="popup"><img src="template/spa/images/hnav_sponcer.gif" width="115" height="20" alt="スポンサーシップ" /></a></li>\
		<li id="hnav_qa"><a href="/pages/qa.html#areaSpa"><img src="template/spa/images/hnav_qa.gif" width="58" height="20" alt="Q＆A" /></a></li>\
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


