<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.springside.modules.security.springsecurity.SpringSecurityUtils" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Mini-Web 帐号管理</title>
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
	<s:form id="mainForm" action="order" method="get">
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
					<th><a href="javascript:sort('id','asc')">订单编号</a></th>
					<th><a href="javascript:sort('orderdate','asc')">订单日期</a></th>
					<th>顾客姓名</th>
					<th>顾客手机</th>
					<th>顾客QQ</th>
					<th>联系地址</th>
					<th>联系人</th>
					<th>联系人电话</th>
					<th>备注</th>
					<th>状态</th>
					<th>操作</th>
				</tr>

				<s:iterator value="page.result">
					<tr>
						<td>${orderno}&nbsp;</td>
						<td><fmt:formatDate value="${orderdate}" type="date" />&nbsp;</td>
						<td>${customer.name}&nbsp;</td>
						<td>${customer.phoneno}&nbsp;</td>
						<td>${customer.qq}&nbsp;</td>
						<td>${contactAddress}&nbsp;</td>
						<td>${contactName}&nbsp;</td>
						<td>${contactPhoneNo}&nbsp;</td>
						<td>${remark}&nbsp;</td>
						<td>${status}&nbsp;</td>
						<td>&nbsp;
							<security:authorize ifAnyGranted="ROLE_修改用户">
								<a href="order!input.anmo?id=${id}">修改</a>&nbsp;
								<a href="order!delete.anmo?id=${id}">删除</a>
							</security:authorize>
						</td>
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
				<a href="order!input.anmo">新增订单</a>
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
