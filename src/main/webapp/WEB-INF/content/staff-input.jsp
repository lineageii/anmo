<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="keywords"
	content="上海上门按摩,上海上门SPA,上海酒店按摩,上海酒店SPA,shanghai hotel massage,shanghai home massage,大学生按摩" />
<meta name="description" content="JIAG SPA 提供上海上门按摩，上海酒店SPA，shanghai hotel massage等高端服务。高薪聘请大学生，模特，空姐等众多美女技师为顾客服务。" />
<title>+G spa | 迦季养生馆 | 技师魅影</title>
<link href="${ctx}/template/spa/css/spa.css" rel="stylesheet"
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
<body id="spa" class="zone">
<div id="container">

<div id="header"></div>
<!-- /#header -->

<div id="contents">
<div id="layerBg"></div>

<div id="main-sub">

<div id="main">
<ul id="topicPath">
	<li><a href="${ctx}/">首页</a></li>
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
			<td>${customer.name}的点评:<br/><div style="margin-left: 10px;">${comment}</div></td>
		</tr>
		<tr>
			<td>${technician.name}的回复:<br/><div style="margin-left: 10px;">${reply}</div></td>
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
