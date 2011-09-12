<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@ include file="/common/meta.jsp"%>
<title>招聘信息| 迦季养生馆|+G spa</title>
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

<body id="spa" class="guide">
	<div id="container">
		<div id="header"></div>
		<!-- /#header -->
		<div id="contents">
			<div id="layerBg"></div>
			<div id="main-sub">
				<div id="main">

					<ul id="topicPath">
						<li><a href="${ctx}/">首页</a>
						</li>
						<li>招聘信息</li>
					</ul>

					<div id="menuArea">
						<h2>招聘信息</h2>
						<table class="longTbl">
							<tbody>
								<tr>
									<th>职位</th>
									<td>女技师</td>
								</tr>
								<tr>
									<th>薪酬</th>
									<td>分成比例50%，日收入不低于600元，当日结算</td>
								</tr>
								<tr>
									<th>工作内容</th>
									<td>为客户提供优质的SPA服务（本公司仅提供正规服务）</td>
								</tr>
								<tr>
									<th>招聘要求</th>
									<td>身高 160以上，年满18岁，相貌端正，形象气质佳，身材比例好，亲和力强，有服务意识，沟通能力强。<br/><br/>在校学生，高学历，从事过空姐，模特等行业工作优先考虑。</td>
								</tr>
							</tbody>
						</table>

				</div>

				</div>
				<!-- /#main -->
				<%@ include file="/common/sub.jsp"%>
				<!-- /#sub -->
			</div>
			<!-- /#main-sub -->
		</div>
		<!-- /#contents -->


		<div id="footer"></div>
		<!-- /#footer -->
	</div>
</body>
</html>
