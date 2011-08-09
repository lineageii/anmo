<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="keywords"
	content="ラクーア,laqua,東京ドーム,東京ドームシティ,ミーツポート,温泉,日帰り温泉,スパ,アジアンリゾート,都会,リゾート,極上,贅沢,東京,後楽園,水道橋,ビューティー,リラックス,女性,レディース,レディースデイ,水曜日,健康,ランスパ,ランニング,ジョギング,マラソン,エステ,アロマ,マッサージ,ヘッドスパ,タイ式,大浴場,宴会,手ぶら,こだわり,安心,安全,アミューズメント,夜景,観覧車,ジェットコースター,噴水,水,夜景,買い物,食事,飲み会,レストラン,ショッピングモール,ショッピングセンター,ショップリスト,セール" />
<meta name="description"
	content="東京・後楽園、東京ドームに併設されたスパ施設を中心とした水がテーマの総合アミューズメント施設「LaQua」の公式ページ。都会の真ん中で夜景を楽しみながらお湯を楽しみ、極上の癒しが手に入るスパ・ラクーアをはじめ、併設されたショッピングセンターでは有名ブランドのショッピングやレストランで食事が楽しめます。お得なプラン、セール、キャンペーンやイベントのご案内など情報が満載。" />
<title>RESTAURANT - Spa | LaQua</title>
<link href="${ctx}/template/spa/css/spa.css" rel="stylesheet"
	type="text/css" />
<link href="${ctx}/template/spa/css/module.css" rel="stylesheet"
	type="text/css" />
<link href="${ctx}/template/spa/css/jquery.lightbox-0.5.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/template/spa/js/jquery.js"></script>
<script type="text/javascript"
	src="${ctx}/template/spa/js/jquery.lightbox-0.5.js"></script>

<script type="text/javascript" src="${ctx}/template/spa/js/jq-lib.js"></script>
<script type="text/javascript" src="${ctx}/template/spa/js/navi.js"></script>
<script src="${ctx}/js/table.js" type="text/javascript"></script>
</head>
<body id="spa" class="treatment">
<div id="container">

<div id="header"></div>
<!-- /#header -->

<div id="contents">
<div id="layerBg"></div>

<div id="main-sub">

<div id="main">
<ul id="topicPath">
	<li><a href="/">首页</a></li>
	<li>技师介绍</li>
</ul>
<ul id="tbList">
	<s:iterator value="page.result">
	<li>
	<table>
		<tr>

			<th>
			<div class="StaffListPic">
				<a href="${ctx}/staff!input.anmo?id=${id}">
				<c:if test="${empty uploadList}">
					<img src="${ctx}/staff_imges/nopic.jpg" height="160"/>
				</c:if>
				<c:if test="${not empty uploadList}">
					<img src="${ctx}/upload/${uploadList[0].sysname}" height="160"/>
				</c:if>
					
				</a>
			</div>
			</th>
			<td class="txt">
			<table class="floor5F">
				<tr>
					<td>
					<dl>
						<dt><a href="${ctx}/staff!input.anmo?id=${id}">${name}</a></dt>
						 
						<dd><s:text name="height"/>:${height }cm</dd>
						<dd>体重:${weight }kg</dd>
						<dd>年龄:${thisyear - birthyear}岁</dd>
						<dd>三围:${bust} ${waistline} ${hip}</dd>
						<dd>籍贯:${provinceMap[birthplace]} </dd>
						<dd>语言:
						<c:forTokens items="${languages}" delims="," var="language">
							<c:out value="${languagesMap[language]}"/>
						</c:forTokens></dd>
						<dd>爱好:${hobby}</dd>
						<dd>梦想:${dream}</dd>
						<dd>顾客留言数:<font color="red" ><b>11</b></font>条</dd>
					</dl>
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
	</li>
	</s:iterator>
</ul>
<div class="jumpPage">
<s:form id="mainForm" action="staff" method="get">
		<input type="hidden" name="page.pageNo" id="pageNo" value="${page.pageNo}"/>
		<input type="hidden" name="page.orderBy" id="orderBy" value="${page.orderBy}"/>
		<input type="hidden" name="page.order" id="order" value="${page.order}"/>
		<div>
			第${page.pageNo}页, 共${page.totalPages}页
			<a href="javascript:jumpPage(1)">首页</a>
			<s:if test="page.hasPre"><a href="javascript:jumpPage(${page.prePage})">上一页</a></s:if>
			<s:if test="page.hasNext"><a href="javascript:jumpPage(${page.nextPage})">下一页</a></s:if>
			<a href="javascript:jumpPage(${page.totalPages})">末页</a>
		</div>
</s:form>
</div>
<div class="contentsIn">
</div>
<!-- /.contentsIn --></div>

<div id="sub">
<ul>
	<li><a href="/spa"><img src="${ctx}/template/spa/images/snav_ttl.gif"
		width="185" height="60" alt="SPA LAQUA" /></a></li>
	<li id="snav-news"><a href="/newslist?mode=spa_news"><img
		src="${ctx}/template/spa/images/snav_news.gif" width="96" height="21"
		alt="Spa News" /></a></li>
	<li id="snav-map"><a href="/map/spa_s.html"><img
		src="${ctx}/template/spa/images/snav_map.gif" width="89" height="21" alt="フロアマップ" /></a></li>
	<li id="snav-zone"><a href="/spa_s/spazone.html"><img
		src="${ctx}/template/spa/images/snav_spa.gif" width="185" height="49"
		alt="SPA ZONE スパ ゾーン" /></a></li>
	<li id="snav-healing"><a href="/spa_s/healing.html"><img
		src="${ctx}/template/spa/images/snav_healing.gif" width="185" height="50"
		alt="HEALING BADEN ヒーリングバーデ" /></a></li>
	<li id="snav-relaxation"><a href="/spa_s/relaxation.html"><img
		src="${ctx}/template/spa/images/snav_relaxation.gif" width="185" height="50"
		alt="RELAXATION リラクゼーション" /></a></li>
	<li id="snav-treatment"><a href="/tblist"><img
		src="${ctx}/template/spa/images/snav_treatment.gif" width="185" height="50"
		alt="TREATMENT &amp; BEAUTY トリートメント＆ビューティー" /></a></li>

	<li id="snav-restaurant"><a href="/sparlist"><img
		src="${ctx}/template/spa/images/snav_restaurant.gif" width="185" height="50"
		alt="RESTAURANT レストラン" /></a></li>
	<li id="snav-guide"><a href="/spa_s/sguide.html"><img
		src="${ctx}/template/spa/images/snav_guide.gif" width="185" height="48"
		alt="営業案内" /></a></li>
	<li id="snav-first"><a href="/spa_s/first.html"><img
		src="${ctx}/template/spa/images/snav_firsttime.gif" width="185" height="48"
		alt="はじめての方へ" /></a></li>
	<li id="snav-sticking"><a href="/spa_s/sticking.html"><img
		src="${ctx}/template/spa/images/snav_sticking.gif" width="185" height="49"
		alt="スパ ラクーアのこだわり" /></a></li>
</ul>
</div>
<!-- /#sub --> <!-- Pager start --> <!-- Pager end // --></div>
<!-- /#main-sub --></div>
<!-- /#contents -->

<div id="footer"></div>
<!-- /#footer --></div>
</body>
</html>
