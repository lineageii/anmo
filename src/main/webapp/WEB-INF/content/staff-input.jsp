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
	<li><a href="${ctx}/staff.anmo">技师魅影</a></li>
	<li>${name}</li>
</ul>

<div id="topicsArea">
<h2>技师一周出勤表</h2>
<div>
<table id="weekwork">
	<tbody>
		<tr>
			<s:iterator value="weekWorkList">
				<th><fmt:formatDate value="${day}" pattern="M/d" /></th>
			</s:iterator>
		</tr>
		<tr>
			<s:iterator value="weekWorkList">
				<td>${workTimeMap[starttime]}-${workTimeMap[endtime]} <br />
				${workStatusMap[status]}</td>
			</s:iterator>
		</tr>
	</tbody>
</table>
</div>
</div>
<!-- weekwork end --> <!-- staff pic start -->
<div id="ladysDayArea">
<h2>技师魅影</h2>
<div id="pickUpArea">
<div id="slideImg">
<div id="slideBox">
<ul style="width: 2400px;">
	<!--拡大表示用-->
	<s:iterator value="uploadList">
		<li><a href="${ctx}/upload/${sysname}"
			rel="&lt;span&gt;&lt;strong&gt;${name}&lt;/strong&gt;&lt;/span&gt;"><img
			src="${ctx}/upload/${sysname}" height="110" border="0"></a>
		<p>${name}</p>
		</li>
	</s:iterator>
</ul>
</div>
<p id="slideBack"><img
	src="${ctx}/template/spa/images/staff/slide_back.gif" width="19"
	height="19" alt="back"></p>
<p id="slideNext" style="display: block;"><img
	src="${ctx}/template/spa/images/staff/slide_next.gif" width="19"
	height="19" alt="next"></p>
</div>
</div>
</div>
<!-- topicsArea end --> <!-- staff pic end -->

<div id="comment"> 
<div id="ladysDayArea">
<h2>顾客点评</h2>

<div class="jumpPage1" style="display:<c:if test="${empty commentPage.result}">none</c:if>;">第${commentPage.pageNo}页, 共${commentPage.totalPages}页 <a
	href="javascript:jumpPage(1)">首页</a> <s:if test="commentPage.hasPre">
	<a href="javascript:jumpPage(${commentPage.prePage})">上一页</a>
</s:if> <s:if test="commentPage.hasNext">
	<a href="javascript:jumpPage(${commentPage.nextPage})">下一页</a>
</s:if> <a href="javascript:jumpPage(${commentPage.totalPages})">末页</a></div>
<s:iterator value="commentPage.result">
	<table class="normal">
		<tbody>
		<tr>
			<th>外貌:3 技术:3 态度:3</th>
		</tr>
		<tr>
			<td>${customer.name}的点评:<br/>&nbsp;&nbsp;&nbsp;&nbsp;${comment}</td>
		</tr>
		<tr>
			<td>${technician.name}的回复:<br/>&nbsp;&nbsp;&nbsp;&nbsp;${reply}</td>
		</tr>
		</tbody>
	</table>
</s:iterator></div>
<form id="mainForm" action="staff!input.anmo#comment" method="post">
<input type="hidden" name="id" id="id" value="${id}"/>
<input type="hidden" name="commentPage.pageNo"id="pageNo" value="${commentPage.pageNo}" /> 
<input type="hidden" name="commentPage.orderBy" id="orderBy" value="${commentPage.orderBy}" />
<input type="hidden" name="commentPage.order" id="order" value="${commentPage.order}" />
<div class="jumpPage1" style="display:<c:if test="${empty commentPage.result}">none</c:if>;">第${commentPage.pageNo}页, 共${commentPage.totalPages}页 <a
	href="javascript:jumpPage(1)">首页</a> <s:if test="commentPage.hasPre">
	<a href="javascript:jumpPage(${commentPage.prePage})">上一页</a>
</s:if> <s:if test="commentPage.hasNext">
	<a href="javascript:jumpPage(${commentPage.nextPage})">下一页</a>
</s:if> <a href="javascript:jumpPage(${commentPage.totalPages})">末页</a></div>
</form>
</div>
<!-- ladysDayArea end -->
<div class="contentsIn"></div>
<!-- /.contentsIn --></div>

<%@ include file="/common/sub.jsp" %>
<!-- /#sub --> <!-- Pager start --> <!-- Pager end // --></div>
<!-- /#main-sub --></div>
<!-- /#contents -->

<div id="footer"></div>
<!-- /#footer --></div>
</body>
</html>
