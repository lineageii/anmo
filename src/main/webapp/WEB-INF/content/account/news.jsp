<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.springside.modules.security.springsecurity.SpringSecurityUtils" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>新闻管理</title>
	<%@ include file="/common/meta.jsp" %>
	<link href="${ctx}/css/yui.css" type="text/css" rel="stylesheet"/>
	<link href="${ctx}/css/style.css" type="text/css" rel="stylesheet"/>
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/table.js" type="text/javascript"></script>
</head>

<body>
<div id="doc3">
<%@ include file="/common/header.jsp" %>
<div id="bd">
	<div id="yui-main">
	<div class="yui-b">
	<s:form id="mainForm" action="news" method="get">
		<input type="hidden" name="page.pageNo" id="pageNo" value="${page.pageNo}"/>
		<input type="hidden" name="page.orderBy" id="orderBy" value="${page.orderBy}"/>
		<input type="hidden" name="page.order" id="order" value="${page.order}"/>

		<div id="message"><s:actionmessage theme="custom" cssClass="success"/></div>
		<div id="filter">
			<input type="button" value="搜索" onclick="search();"/>
		</div>
		<div id="content">
			<table id="contentTable">
				<tr>
				<th>No.</th>
				<th>Title</th>
				<th>内容</th>
				<th>创建时间</th>
				<th>操作</th>
				</tr>
			<s:iterator value="page.result">
				<tr>
					<td rowspan="2">${id}</td>
					<td>新闻标题</td>
					<td>${title}</td>
					<td rowspan="2"><fmt:formatDate value="${createdate}" type="both" /></td>
					<td rowspan="2">&nbsp;
							<security:authorize ifAnyGranted="ROLE_修改用户">
								<a href="news!input.anmo?id=${id}">修改</a>&nbsp;
								<a href="news!delete.anmo?id=${id}">删除</a>
							</security:authorize>
						</td>
				</tr>
				<tr>
					<td>新闻内容</td>
					<td><textarea rows="6" cols="80" readonly>${content}</textarea>  </td>
				</tr>
				</s:iterator>
			</table>
		</div>

		<div>
			第${page.pageNo}页, 共${page.totalPages}页
			<a href="javascript:jumpPage(1)">首页</a>
			<s:if test="page.hasPre"><a href="javascript:jumpPage(${page.prePage})">上一页</a></s:if>
			<s:if test="page.hasNext"><a href="javascript:jumpPage(${page.nextPage})">下一页</a></s:if>
			<a href="javascript:jumpPage(${page.totalPages})">末页</a>

			<security:authorize ifAnyGranted="ROLE_修改用户">
				<a href="news!input.anmo">新增新闻</a>
			</security:authorize>
		</div>
	</s:form>
	</div>
	</div>
</div>
<%@ include file="/common/footer.jsp" %>
</div>
</body>
</html>
