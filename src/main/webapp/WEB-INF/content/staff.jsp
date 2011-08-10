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
	<li><a href="${ctx}">首页</a></li>
	<li>技师魅影</li>
</ul>
<ul id="tbList">
	<s:iterator value="page.result">
	<%@ include file="/WEB-INF/include/stafflist.jsp" %>
	</s:iterator>
</ul>
<div class="jumpPage">
<s:form id="mainForm" action="staff" method="post">
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

<%@ include file="/common/sub.jsp" %>

<!-- /#sub --> <!-- Pager start --> <!-- Pager end // --></div>
<!-- /#main-sub --></div>
<!-- /#contents -->

<div id="footer"></div>
<!-- /#footer --></div>
</body>
</html>
