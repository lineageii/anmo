<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page import="org.springside.modules.security.springsecurity.SpringSecurityUtils" %>
<%@ include file="/common/taglibs.jsp" %>
<div id="hd">
	<div id="title">
		<h1>后台管理</h1>
	</div>
	<div id="menu">
		<ul>
			<li><a href="${ctx}/account/user.anmo">帐号</a></li>
			<li><a href="${ctx}/account/role.anmo">角色</a></li>
			<li><a href="${ctx}/account/technician.anmo">技师</a></li>
			<li><a href="${ctx}/account/workevent.anmo">出勤请假</a></li>
			<li><a href="${ctx}/account/order.anmo">订单</a></li>
			<li><a href="${ctx}/account/customer.anmo">顾客</a></li>
			<li><a href="${ctx}/account/news.anmo">新闻</a></li>
			<li><a href="${ctx}/account/comment.anmo">留言</a></li>
			<li><a href="${ctx}/j_spring_security_logout">退出登录</a></li>
		</ul>
	</div>
</div>