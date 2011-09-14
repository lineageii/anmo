<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@ include file="/common/meta.jsp"%>
<title>网上预约 | 迦季养生馆 | +G spa</title>
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
<script type="text/javascript">

</script>
</head>
<body id="spa" class="treatment">
<div id="container">

<%@ include file="/common/home_header.jsp" %>
<!-- /#header -->

<div id="contents">
<div id="layerBg"></div>

<div id="main-sub">

<div id="main">
<ul id="topicPath">
	<li><a href="${ctx}/">首页</a></li>
	<li>网上预约</li>
</ul>


<div id="comment"> 
<div id="topicsArea">
<h2>网上预约</h2>

<div id="mycomment">
<form action="${ctx}/order!save.anmo" method="post">
<table>
<tr><td>预约技师:</td><td><s:select name="technician.id" list="staffList" listKey="id" listValue="name" theme="simple"/></td></tr>
<tr><td>顾客电话:</td><td><input type="text" id="phoneno" onblur="searchCustomer(this)"/><input type="hidden" id="customerid" name="customer.id" /></td></tr>
<tr><td>顾客留言:</td><td><textarea name="comment" rows="3"></textarea></td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="    网上预约    "/></td></tr>
</table>
</form>
</div><!-- mycomment end -->
</div>
</div>
<!-- ladysDayArea end -->
<div class="contentsIn"></div>
<!-- /.contentsIn --></div>

<%@ include file="/common/sub.jsp" %>
<!-- /#sub --> <!-- Pager start --> <!-- Pager end // --></div>
<!-- /#main-sub --></div>
<!-- /#contents -->

<%@ include file="/common/home_footer.jsp" %>
<!-- /#footer --></div>
</body>
</html>
