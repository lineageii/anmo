<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="keywords" content="ラクーア,laqua,東京ドーム,東京ドームシティ,ミーツポート,温泉,日帰り温泉,スパ,アジアンリゾート,都会,リゾート,極上,贅沢,東京,後楽園,水道橋,ビューティー,リラックス,女性,レディース,レディースデイ,水曜日,健康,ランスパ,ランニング,ジョギング,マラソン,エステ,アロマ,マッサージ,ヘッドスパ,タイ式,大浴場,宴会,手ぶら,こだわり,安心,安全,アミューズメント,夜景,観覧車,ジェットコースター,噴水,水,夜景,買い物,食事,飲み会,レストラン,ショッピングモール,ショッピングセンター,ショップリスト,セール" />
<meta name="description" content="東京・後楽園、東京ドームに併設されたスパ施設を中心とした水がテーマの総合アミューズメント施設「LaQua」の公式ページ。都会の真ん中で夜景を楽しみながらお湯を楽しみ、極上の癒しが手に入るスパ・ラクーアをはじめ、併設されたショッピングセンターでは有名ブランドのショッピングやレストランで食事が楽しめます。お得なプラン、セール、キャンペーンやイベントのご案内など情報が満載。" /><title>Spa | LaQua</title>
<link href="${ctx}/template/spa/css/spa.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/template/spa/css/jquery.lightbox-0.5.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/template/spa/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/template/spa/js/jquery.lightbox-0.5.js"></script>
<script type="text/javascript" src="${ctx}/template/spa/js/jq-lib.js"></script>
<script type="text/javascript" src="${ctx}/template/spa/js/navi.js"></script>
</head>


<body id="spa" class="top">
<div id="container">
<div id="header"></div><!-- /#header -->
<div id="contents">
	<div id="layerBg"></div>

	<div id="main-sub">
		<div id="mainImg">
			<p><img src="${ctx}/template/spa/images/main_img.jpg" width="574" height="330" alt="SPA LAQUA ～癒しを極めた6つの空間～" /></p>
			<ul>
				<li><img src="${ctx}/template/spa/images/main_nav_ttl.gif" width="220" height="33" alt="施設案内" /></li>
				<li><a href="/map/spa_s.html"><img src="${ctx}/template/spa/images/main_nav_map.gif" width="90" height="33" alt="フロアマップ" /></a></li>
				<li><a href="${ctx}/staff.anmo"><img src="${ctx}/template/spa/images/main_nav_spa.gif" width="310" height="51" alt="技师魅影" /></a></li>
				<li><a href="${ctx}/service.html"><img src="${ctx}/template/spa/images/main_nav_healing.gif" width="310" height="53" alt="服务项目" /></a></li>
				<li><a href="${ctx}/order.anmo"><img src="${ctx}/template/spa/images/main_nav_relaxation.gif" width="310" height="53" alt="网上预约" /></a></li>
				<li><a href="${ctx}/comment.anmo"><img src="${ctx}/template/spa/images/main_nav_treatment.gif" width="310" height="52" alt="顾客点评" /></a></li>
				<li><a href="${ctx}/store.anmo"><img src="${ctx}/template/spa/images/main_nav_restaurant.gif" width="310" height="51" alt="附近的店铺" /></a></li>
				<li><a href="${ctx}/price.anmo"><img src="${ctx}/template/spa/images/main_nav_info.gif" width="157" height="37" alt="收费标准" /></a></li>
				<li><a href="${ctx}/flow.html"><img src="${ctx}/template/spa/images/main_nav_firsttime.gif" width="153" height="37" alt="服务流程" /></a></li>
			</ul>
		</div>
		<div id="spaTopLeft">
			<ul id="topicPath">
				<li><a href="${ctx}">首页</a></li>
			</ul>
			
			<div id="spaNews">
				<h1><img src="${ctx}/template/spa/images/ttl_news.gif" width="549" height="32" alt="Spa News" /></h1>
				<ul id="spaNewsList">
					<s:iterator value="newsPage.result">
					<li>
						<dl>
							<dt><a href="${ctx}/news!input.anmo?id=${id}" target="_self">${title}</a></dt>
						</dl>
					</li>
					</s:iterator>
				</ul>
				<p class="more"><a href="${ctx}/news.anmo">查看更多...</a></p>
				<h1><img src="${ctx}/template/spa/images/ttl_news.gif" width="549" height="32" alt="Spa News" /></h1>
				<ul id="tbList1">
					<s:iterator value="staffPage.result">
					<%@ include file="/WEB-INF/include/stafflist.jsp" %>
					</s:iterator>
				</ul>
				<p class="more"><a href="${ctx}/staff.anmo">查看更多...</a></p>
				
			</div>
			
		</div><!-- /#spaTopLeft -->
		<div id="spaTopRight">

			<h2><img src="${ctx}/template/spa/images/ttl_topics.gif" width="310" height="51" alt="Topics" /></h2>
			<div id="spaTopicsList">
				<ul>
					<s:iterator value="commentPage.result">
					<li>
						<dl>
							<dd class="TenpoLink">${customer.name}的点评</dd>
							<dt><a href="${ctx}/comment!input.anmo?id=${id}">${fn:substring(comment,0,28)}...</a></dt>
							<dd class="TenpoLink">技师${technician.name}的回复</dd>
							<dd>${fn:substring(reply,0,40)}...</dd>
							

						</dl><p>
							<c:if test="${empty technician.uploadList}">
								<img src="${ctx}/staff_imges/nopic.jpg" width="80" border="0"/>
							</c:if> 
							<c:if test="${not empty technician.uploadList}">
								<img src="${ctx}/upload/${technician.uploadList[0].sysname}" width="80" border="0"/>
							</c:if>
						</p>

					</li>
					</s:iterator>
				</ul>
			</div>
			<p class="more"><a href="/topicslist?mode=spa">查看更多...</a></p>
		</div><!-- /#spaTopRight -->

	</div><!-- /#main-sub -->

</div><!-- /#contents -->
<!--
<a href="/topicslist?mode=spa">Topicsをもっと見る</a>
<p><a href="/ladysdaylist?mode=spa">Lady's Day</a></p>
-->

<div id="footer"></div><!-- /#footer -->

</div></body>
</html>
