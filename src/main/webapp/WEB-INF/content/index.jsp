<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@ include file="/common/meta.jsp"%>
<title>+G spa | 迦季养生馆</title>
<link href="${ctx}/template/spa/css/spa.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/template/spa/css/jquery.lightbox-0.5.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/template/spa/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/template/spa/js/jquery.lightbox-0.5.js"></script>
<script type="text/javascript" src="${ctx}/template/spa/js/jq-lib.js"></script>
</head>


<body id="spa" class="top">
<div id="container"><%@ include file="/common/home_header.jsp"%> <!-- /#header -->
<div id="contents">
<div id="layerBg"></div>
<div id="main-sub">
<div id="mainImg">
<div id="slide"><a href="#" id="this_a"><img id="this_pic" alt="" /></a>
<ul id="pic_list">
	<li><a href="#"><img src="${ctx}/images/index/spa2.jpg" alt="上海按摩" /></a></li>
	<li><a href="#"><img src="${ctx}/images/index/spa1.jpg" alt="上海上门按摩" /></a></li>
	<li><a href="#"><img src="${ctx}/images/index/spa3.jpg" alt="上海spa" /></a></li>
	<li><a href="#"><img src="${ctx}/images/index/spa6.jpg" alt="shanghai massage" /></a></li>
	<li><a href="#"><img src="${ctx}/images/index/spa5.jpg" alt="上海酒店按摩" /></a></li>
</ul>
<span id="transparence"></span></div>

<ul id="right_ul">
	<li><img src="${ctx}/template/spa/images/main_nav_ttl.gif" width="220" height="33" alt="网站导航" /></li>
	<li><a href="${ctx}/sitemap/"><img src="${ctx}/template/spa/images/main_nav_map.gif" width="90" height="33" alt="网站地图" /> </a></li>
	<li><a href="${ctx}/staff.anmo"><img src="${ctx}/template/spa/images/main_nav_spa.gif" width="310" height="51" alt="技师魅影" /> </a></li>
	<li><a href="${ctx}/service/"><img src="${ctx}/template/spa/images/main_nav_healing.gif" width="310" height="53" alt="服务项目" /> </a></li>
	<li><a href="${ctx}/order/"><img src="${ctx}/template/spa/images/main_nav_relaxation.gif" width="310" height="53" alt="网上预约" /> </a></li>
	<li><a href="${ctx}/comment.anmo"><img src="${ctx}/template/spa/images/main_nav_treatment.gif" width="310" height="52" alt="顾客点评" /> </a></li>
	<li><a href="${ctx}/store.anmo"><img src="${ctx}/template/spa/images/main_nav_restaurant.gif" width="310" height="51" alt="附近的店铺" /> </a></li>
	<li><a href="${ctx}/job/"><img src="${ctx}/template/spa/images/main_nav_info.gif" width="157" height="37" alt="招聘信息" /> </a></li>
	<li><a href="${ctx}/flow/"><img src="${ctx}/template/spa/images/main_nav_firsttime.gif" width="153" height="37" alt="服务流程" /> </a></li>
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
		<%@ include file="/WEB-INF/include/stafflist.jsp"%>
	</s:iterator>
</ul>
<p class="more"><a href="${ctx}/staff.anmo">查看更多...</a></p>

</div>

</div>
<!-- /#spaTopLeft -->
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


		</dl>
		<p><c:if test="${empty technician.uploadList}">
			<img src="${ctx}/staff_imges/nopic.jpg" width="80" border="0" />
		</c:if> <c:if test="${not empty technician.uploadList}">
			<img src="${ctx}/upload/small/${technician.uploadList[0].sysname}" width="80" border="0" />
		</c:if></p>
		</li>
	</s:iterator>
</ul>
</div>
<p class="more"><a href="${ctx}/comment.anmo">查看更多...</a></p>
</div>
<!-- /#spaTopRight --></div>
<!-- /#main-sub --></div>
<!-- /#contents --> <%@ include file="/common/home_footer.jsp"%> <!-- /#footer --></div>
</body>
</html>
