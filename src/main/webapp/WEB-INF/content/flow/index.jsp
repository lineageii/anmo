<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html> 
<head> 
<%@ include file="/common/meta.jsp" %>
<title>服务流程 | 迦季养生馆 | +G spa</title>
<link href="${ctx}/template/spa/css/spa.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="${ctx}/template/spa/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/template/spa/js/jq-lib.js"></script>
<script type="text/javascript" src="${ctx}/template/spa/js/navi.js"></script>
<script src="${ctx}/js/table.js" type="text/javascript"></script>
</head> 
<body id="spa" class="first">
<div id="container">

<div id="header"></div>
<!-- /#header -->

<div id="contents">
<div id="layerBg"></div>

<div id="main-sub">

<div id="main">
<ul id="topicPath">
	<li><a href="${ctx}/">首页</a></li>
	<li>服务流程</li>
</ul>

<div id="topicsArea">
<h2>服务流程</h2>
<br/>
                <div id="firstStep"> 
                	<ul> 
                	  <li> 
                      	<dl> 
                      	  <dt><img src="${ctx}/images/flow/1.jpg" width="262" height="191" alt="" /></dt> 
                      	  <dd class="txt">1.顾客通过电话或者网站进行预约。</dd> 
                      	</dl> 
                      	<dl> 
                      	  <dt><img src="${ctx}/images/flow/2.jpg" width="260" height="191" alt="" /></dt> 
                      	  <dd class="txt">2.客服安排技师后，打电话与顾客确认。</dd> 
                      	</dl> 
                      </li> 
                	  <li> 
                      	<dl> 
                      	  <dt><img src="${ctx}/images/flow/3.jpg" width="260" height="176" alt="" /></dt> 
                      	  <dd class="txt">3.技师在半小时左右到达顾客住所。<br/>如顾客不满意可以更换技师，或支付技师往返车费服务结束。<br/>如顾客满意，技师开始服务。</dd> 
                      	</dl> 
                      	<dl> 
                      	  <dt><img src="${ctx}/images/flow/4.jpg" width="252" height="176" alt=""  /></dt> 
                      	  <dd class="txt">4.服务结束，客户付款。
                          </dd> 
                      	</dl> 
                      </li> 
                	</ul> 
                </div> 
                
                    <br/>
                    <ul id="rsvAtnt"> 
                      <li><b>※</b> 请通过客服预约，不要直接预约技师。</li> 
                      <li><b>※</b> 服务前后请确认自己的贵重物品。</li> 
                      <li><b>※</b> 不提供服务项目以外的服务。</li> 
                    </ul> 
			</div><!-- /.contentsIn --> 
			
		</div> <!-- /#main--> 
		<%@ include file="/common/sub.jsp" %><!-- /#sub --> 
	</div><!-- /#main-sub --> 
</div><!-- /#contents --> 
<div id="footer"></div><!-- /#footer --> 
 
</div></body> 
</html>