<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
<meta name="keywords"
	content="上海上门按摩,上海上门SPA,上海酒店按摩,上海酒店SPA,shanghai hotel massage,shanghai home massage,大学生按摩" />
<meta name="description" content="JIAG SPA 提供上海上门按摩，上海酒店SPA，shanghai hotel massage等高端服务。高薪聘请大学生，模特，空姐等众多美女技师为顾客服务。" />
<title>+G spa | 迦季养生馆 | News</title>
<link href="${ctx}/template/spa/css/spa.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/template/spa/css/jquery.lightbox-0.5.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/template/spa/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/template/spa/js/jquery.lightbox-0.5.js"></script>
<script type="text/javascript" src="${ctx}/template/spa/js/jq-lib.js"></script>
<script type="text/javascript" src="${ctx}/template/spa/js/navi.js"></script>
</head> 
<body id="spa" class="news"><div id="container"> 
<!-- スパ --> 
<div id="header"></div><!-- /#header --> 
	<div id="contents"> 
		<div id="layerBg"></div> 
		<div id="main-sub"> 
			<div id="main"> 
				<ul id="topicPath"> 
					<li><a href="${ctx}/">首页</a></li> 
					<li><a href="${ctx}/news.anmo">NEWS</a></li> 
					<li>${title}</li> 
				</ul> 
				<div id="pageTitle"> 
					<h1><img src="${ctx}/template/spa/images/news/ttl.gif" width="270" height="41" alt="SPA NEWS スパ ニュース" /></h1> 
				</div> 
				<div class="contentsIn"> 
				<div id="newsDetail"> 
 
						<h1 class="new"> 
				
		
							${title }</h1> 
					<div id="imgLength"> 
						
						<div class="txt"> 
							${content }
						</div> 
					</div> 
				</div> 
 
						<div id="pageTop" class="pageTop"><img src="${ctx}/template/spa/images/pagetop.gif" width="54" height="12" alt="Page Top" /></div> 
			</div><!-- /contentsIn --> 
			
		</div><!-- /#main --> 
 
	<%@ include file="/common/sub.jsp" %>
<!--	<h1>SPA NEWS</h1> --> 
	</div><!-- /#main-sub --> 
</div><!-- /#contents --> 
 
<div id="footer"></div><!-- /#footer --> 
 
</div></body> 
</html> 