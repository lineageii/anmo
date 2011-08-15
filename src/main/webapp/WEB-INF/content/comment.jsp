<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
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
<script type="text/javascript">
function searchCustomer(obj){
	
	if($(obj).val() != "") {
		$.get("comment!searchCustomerJsonByPhoneno.anmo?phoneno=" + $(obj).val(),
				{},
				function(response){
					if(response == null) {
						alert('no fount customer');
					} else {
						$("#customerid").val(response.id);
					}
				});
		
	}
}
</script>
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
	<li><a href="${ctx}/">首页</a></li>
	<li>顾客点评</li>
</ul>


<div id="comment"> 
<div id="topicsArea">
<h2>顾客点评</h2>

<div id="mycomment">
<form action="${ctx}/comment!save.anmo" method="post">
<table>
<tr><td>选择技师:</td><td><s:select name="technician.id" list="staffList" listKey="id" listValue="name" theme="simple"/></td></tr>
<tr><td>顾客电话:</td><td><input type="text" id="phoneno" onblur="searchCustomer(this)"/><input type="hidden" id="customerid" name="customer.id" /></td></tr>
<tr><td>顾客留言:</td><td><textarea name="comment" rows="3"></textarea></td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="发表留言"/></td></tr>
</table>
</form>
</div><!-- mycomment end -->


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
			<td rowspan="2" width="100px">
			<a href="${ctx}/staff!input.anmo?id=${technician.id}">
			<c:if test="${empty technician.uploadList}">
				<img src="${ctx}/staff_imges/nopic.jpg" width="100"/>
			</c:if>
			<c:if test="${not empty technician.uploadList}">
				<img src="${ctx}/upload/${technician.uploadList[0].sysname}" width="100"/>
			</c:if>
			</a><br/><div style="margin-left:30px">${technician.name}</div></td>
			<td>${customer.name}对<a href="${ctx}/staff!input.anmo?id=${technician.id}">${technician.name}</a>的点评:<br/><div style="margin-left: 10px;">${comment}</div></td>
		</tr>
		<tr>
			<td>技师的回复:<br/><div style="margin-left: 10px;">${reply}</div></td>
		</tr>
		</tbody>
	</table>
</s:iterator>
</div>
<form id="mainForm" action="comment.anmo" method="post">
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
