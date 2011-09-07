<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@ include file="/common/meta.jsp"%>
<title>服务项目| 迦季养生馆|+G spa</title>
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

<body id="spa" class="healing">
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
						<li>服务项目</li>
					</ul>

					<div id="menuArea">
						<h2>服务项目</h2>
						<table class="longTbl">
							<tbody>
								<tr>
									<th>服务类别</th>
									<th>技师一位</th>
									<th>技师两位</th>
								</tr>
								<tr>
									<th>标准按摩<br/><br/>(可选项目)<br/>中式推拿<br/>泰式按摩</th>
									<td>300元/1小时+路费<br/>350元/1.5小时+路费<br/><span>400</span>元/2小时+路费<br/>600元/3小时+路费</td>
									<td>600元/1小时+路费<br/>600元/1.5小时+路费<br/><span>600</span>元/2小时+路费<br/>1000元/3小时+路费</td>
								</tr>
								<tr>
									<th>精油按摩<br/><br/>(所有项目任意组合)</th>
									<td>400元/1小时+路费<br/>500元/1.5小时+路费<br/><span>600</span>元/2小时+路费<br/>1000元/3小时+路费</td>
									<td>700元/1小时+路费<br/>800元/1.5小时+路费<br/><span>800</span>元/2小时+路费<br/>1200元/3小时+路费</td>
								</tr>
								<tr>
									<th>制服诱惑<br/><br/>(所有项目任意组合)</th>
									<td>400元/1小时+路费<br/>500元/1.5小时+路费<br/><span>600</span>元/2小时+路费<br/>1000元/3小时+路费</td>
									<td>700元/1小时+路费<br/>800元/1.5小时+路费<br/><span>800</span>元/2小时+路费<br/>1200元/3小时+路费</td>
								</tr>
							</tbody>
						</table>

						<ul id="dPickUp" class="commodity">
							<li>
								<p>
									<img
										src="${ctx}/images/service/china_massage/china_massage1.jpg"
										width="214" border="0" />
								</p>
								<dl>
									<dt>◆中式推拿</dt>
									<dd class="lead"></dd>
									<dd class="body">
									</dd>
								</dl></li>
						</ul>
						<div id="pickUpArea" class="pickUpArea">
							<div id="slideImg" class="slideImg">
								<div id="slideBox" class="slideBox">
									<ul style="width: 900px;">
										<!--拡大表示用-->
										<li><a href="${ctx}/images/service/china_massage/china_massage0.jpg"
											rel="&lt;span&gt;&lt;strong&gt;一次性衣服&lt;/strong&gt;&lt;/span&gt;"><img
												src="${ctx}/images/service/china_massage/china_massage0.jpg"
												height="110" border="0"/>
										</a>
											<p>一次性衣服</p></li>
										<li><a href="${ctx}/images/service/china_massage/china_massage1.jpg"
											rel="&lt;span&gt;&lt;strong&gt;背部按摩&lt;/strong&gt;&lt;/span&gt;"><img
												src="${ctx}/images/service/china_massage/china_massage1.jpg"
												height="110" border="0"/>
										</a>
											<p>背部按摩</p></li>
										<li><a href="${ctx}/images/service/china_massage/china_massage2.jpg"
											rel="&lt;span&gt;&lt;strong&gt;臀部按摩&lt;/strong&gt;&lt;/span&gt;"><img
												src="${ctx}/images/service/china_massage/china_massage2.jpg"
												height="110" border="0"/>
										</a>
											<p>臀部按摩</p></li>
										<li><a href="${ctx}/images/service/china_massage/china_massage3.jpg"
											rel="&lt;span&gt;&lt;strong&gt;头部按摩&lt;/strong&gt;&lt;/span&gt;"><img
												src="${ctx}/images/service/china_massage/china_massage3.jpg" height="110"
												border="0"/>
										</a>
											<p>头部按摩</p></li>
										<li><a href="${ctx}/images/service/china_massage/china_massage4.jpg"
											rel="&lt;span&gt;&lt;strong&gt;关节伸展&lt;/strong&gt;&lt;/span&gt;"><img
												src="${ctx}/images/service/china_massage/china_massage4.jpg" height="110"
												border="0"/>
										</a>
											<p>关节伸展</p></li>
									</ul>
								</div>
								<p id="slideBack" class="slideBack">
									<img src="${ctx}/template/spa/images/staff/slide_back.gif"
										width="19" height="19" alt="back"/>
								</p>
								<p id="slideNext" class="slideNext" style="display: block;">
									<img src="${ctx}/template/spa/images/staff/slide_next.gif"
										width="19" height="19" alt="next"/>
								</p>
							</div>
						</div>


						<ul id="dPickUp" class="commodity">
							<li>
								<p>
									<img src="${ctx}/images/service/tai/049a-214x321.jpg"
										width="214" border="0" />
								</p>
								<dl>
									<dt>◆泰式按摩</dt>
									<dd class="lead"></dd>
									<dd class="body">
									</dd>
								</dl></li>
						</ul>
						<div id="pickUpArea" class="pickUpArea">
							<div id="slideImg_tai" class="slideImg">
								<div id="slideBox_tai" class="slideBox">
									<ul style="width: 900px;">
										<!--拡大表示用-->
										<li><a href="${ctx}/images/service/tai/049a-214x321.jpg"
											rel="&lt;span&gt;&lt;strong&gt;泰式按摩&lt;/strong&gt;&lt;/span&gt;"><img
												src="${ctx}/images/service/tai/049a-214x321.jpg"
												height="110" border="0"/>
										</a>
											<p>泰式按摩</p></li>
										<li><a href="${ctx}/images/service/tai/063a-214x321.jpg"
											rel="&lt;span&gt;&lt;strong&gt;泰式按摩&lt;/strong&gt;&lt;/span&gt;"><img
												src="${ctx}/images/service/tai/063a-214x321.jpg"
												height="110" border="0"/>
										</a>
											<p>泰式按摩</p></li>
										<li><a href="${ctx}/images/service/tai/072a-306x459.jpg"
											rel="&lt;span&gt;&lt;strong&gt;泰式按摩&lt;/strong&gt;&lt;/span&gt;"><img
												src="${ctx}/images/service/tai/072a-306x459.jpg"
												height="110" border="0"/>
										</a>
											<p>泰式按摩</p></li>
										<li><a href="${ctx}/images/service/tai/113-214x142.jpg"
											rel="&lt;span&gt;&lt;strong&gt;泰式按摩&lt;/strong&gt;&lt;/span&gt;"><img
												src="${ctx}/images/service/tai/113-214x142.jpg" height="110"
												border="0"/>
										</a>
											<p>泰式按摩</p></li>
										<li><a href="${ctx}/images/service/tai/119-214x142.jpg"
											rel="&lt;span&gt;&lt;strong&gt;泰式按摩&lt;/strong&gt;&lt;/span&gt;"><img
												src="${ctx}/images/service/tai/119-214x142.jpg" height="110"
												border="0"/>
										</a>
											<p>泰式按摩</p></li>
										<li><a href="${ctx}/images/service/tai/tai.jpg"
											rel="&lt;span&gt;&lt;strong&gt;泰式按摩&lt;/strong&gt;&lt;/span&gt;"><img
												src="${ctx}/images/service/tai/tai.jpg" height="110"
												border="0"/>
										</a>
											<p>泰式按摩</p></li>
									</ul>
								</div>
								<p id="slideBack_tai" class="slideBack">
									<img src="${ctx}/template/spa/images/staff/slide_back.gif"
										width="19" height="19" alt="back"/>
								</p>
								<p id="slideNext_tai" class="slideNext" style="display: block;">
									<img src="${ctx}/template/spa/images/staff/slide_next.gif"
										width="19" height="19" alt="next"/>
								</p>
							</div>
						</div>
						<ul id="dPickUp" class="commodity">
							<li>
								<p>
									<img
										src="${ctx}/images/service/jykb/i02_color_deep-214x319.jpg"
										width="214" border="0" />
								</p>
								<dl>
									<dt>◆精油开背</dt>
									<dd class="lead"></dd>
									<dd class="body">
									</dd>
								</dl></li>
						</ul>
						<div id="pickUpArea" class="pickUpArea">
							<div id="slideImg_jykb" class="slideImg">
								<div id="slideBox_jykb" class="slideBox">
									<ul style="width: 900px;">
										<!--拡大表示用-->
										<li><a
											href="${ctx}/images/service/jykb/i01_chakura-214x143.jpg"
											rel="&lt;span&gt;&lt;strong&gt;精油开背&lt;/strong&gt;&lt;/span&gt;"><img
												src="${ctx}/images/service/jykb/i01_chakura-214x143.jpg"
												height="110" border="0"/>
										</a>
											<p>精油开背</p></li>
										<li><a
											href="${ctx}/images/service/jykb/i02_color_deep-214x319.jpg"
											rel="&lt;span&gt;&lt;strong&gt;精油开背&lt;/strong&gt;&lt;/span&gt;"><img
												src="${ctx}/images/service/jykb/i02_color_deep-214x319.jpg"
												height="110" border="0"/>
										</a>
											<p>精油开背</p></li>
										<li><a
											href="${ctx}/images/service/jykb/i02_cuna_cuna-214x142.jpg"
											rel="&lt;span&gt;&lt;strong&gt;精油开背&lt;/strong&gt;&lt;/span&gt;"><img
												src="${ctx}/images/service/jykb/i02_cuna_cuna-214x142.jpg"
												height="110" border="0"/>
										</a>
											<p>精油开背</p></li>
										<li><a
											href="${ctx}/images/service/jykb/i03_face_treatment-214x142.jpg"
											rel="&lt;span&gt;&lt;strong&gt;精油开背&lt;/strong&gt;&lt;/span&gt;"><img
												src="${ctx}/images/service/jykb/i03_face_treatment-214x142.jpg"
												height="110" border="0"/>
										</a>
											<p>精油开背</p></li>
									</ul>
								</div>
								<p id="slideBack_jykb" class="slideBack">
									<img src="${ctx}/template/spa/images/staff/slide_back.gif"
										width="19" height="19" alt="back"/>
								</p>
								<p id="slideNext_jykb" class="slideNext" style="display: block;">
									<img src="${ctx}/template/spa/images/staff/slide_next.gif"
										width="19" height="19" alt="next"/>
								</p>
							</div>
						</div>
						<ul id="dPickUp" class="commodity">
							<li>
								<p>
									<img src="${ctx}/images/service/lomi/i05_hot_stone-214x321.jpg"
										width="214" border="0" />
								</p>
								<dl>
									<dt>◆Lomi Lomi夏威夷式精石SPA</dt>
									<dd class="lead"></dd>
									<dd class="body">
									</dd>
								</dl></li>
						</ul>
						<div id="pickUpArea" class="pickUpArea">
							<div id="slideImg_lomi" class="slideImg">
								<div id="slideBox_lomi" class="slideBox">
									<ul style="width: 900px;">
										<!--拡大表示用-->
										<li><a
											href="${ctx}/images/service/lomi/i01_hawai_romiromi-214x142.jpg"
											rel="&lt;span&gt;&lt;strong&gt;Lomi Lomi夏威夷式精石SPA&lt;/strong&gt;&lt;/span&gt;"><img
												src="${ctx}/images/service/lomi/i01_hawai_romiromi-214x142.jpg"
												height="110" border="0"/>
										</a>
											<p>Lomi Lomi</p></li>
										<li><a
											href="${ctx}/images/service/lomi/i02_30min-214x321.jpg"
											rel="&lt;span&gt;&lt;strong&gt;Lomi Lomi夏威夷式精石SPA&lt;/strong&gt;&lt;/span&gt;"><img
												src="${ctx}/images/service/lomi/i02_30min-214x321.jpg"
												height="110" border="0"/>
										</a>
											<p>Lomi Lomi</p></li>
										<li><a
											href="${ctx}/images/service/lomi/i03_super_detocs-214x142.jpg"
											rel="&lt;span&gt;&lt;strong&gt;Lomi Lomi夏威夷式精石SPA&lt;/strong&gt;&lt;/span&gt;"><img
												src="${ctx}/images/service/lomi/i03_super_detocs-214x142.jpg"
												height="110" border="0"/>
										</a>
											<p>Lomi Lomi</p></li>
										<li><a
											href="${ctx}/images/service/lomi/i04_bihaku-214x142.jpg"
											rel="&lt;span&gt;&lt;strong&gt;Lomi Lomi夏威夷式精石SPA&lt;/strong&gt;&lt;/span&gt;"><img
												src="${ctx}/images/service/lomi/i04_bihaku-214x142.jpg"
												height="110" border="0"/>
										</a>
											<p>Lomi Lomi</p></li>
										<li><a
											href="${ctx}/images/service/lomi/i05_hot_stone-214x321.jpg"
											rel="&lt;span&gt;&lt;strong&gt;Lomi Lomi夏威夷式精石SPA&lt;/strong&gt;&lt;/span&gt;"><img
												src="${ctx}/images/service/lomi/i05_hot_stone-214x321.jpg"
												height="110" border="0"/>
										</a>
											<p>Lomi Lomi</p></li>
									</ul>
								</div>
								<p id="slideBack_lomi" class="slideBack">
									<img src="${ctx}/template/spa/images/staff/slide_back.gif"
										width="19" height="19" alt="back"/>
								</p>
								<p id="slideNext_lomi" class="slideNext" style="display: block;">
									<img src="${ctx}/template/spa/images/staff/slide_next.gif"
										width="19" height="19" alt="next"/>
								</p>
							</div>
						</div>

						<ul id="dPickUp" class="commodity">
							<li>
								<p>
									<img
										src="${ctx}/images/service/zfyh/jingcha.jpg"
										width="214" border="0" />
								</p>
								<dl>
									<dt>◆制服诱惑</dt>
									<dd class="lead"></dd>
									<dd class="body">
									</dd>
								</dl></li>
						</ul>
						<div id="pickUpArea" class="pickUpArea">
							<div id="slideImg_zifu" class="slideImg">
								<div id="slideBox_zifu" class="slideBox">
									<ul style="width: 900px;">
										<!--拡大表示用-->
										<li><a
											href="${ctx}/images/service/zfyh/shuishou.jpg"
											rel="&lt;span&gt;&lt;strong&gt;水手服&lt;/strong&gt;&lt;/span&gt;"><img
												src="${ctx}/images/service/zfyh/shuishou.jpg"
												height="110" border="0"/>
										</a>
											<p>水手服</p></li>
										
										<li><a
											href="${ctx}/images/service/zfyh/nvpu.jpg"
											rel="&lt;span&gt;&lt;strong&gt;女仆装&lt;/strong&gt;&lt;/span&gt;"><img
												src="${ctx}/images/service/zfyh/nvpu.jpg"
												height="110" border="0"/>
										</a>
											<p>女仆装</p></li>
										<li><a
											href="${ctx}/images/service/zfyh/jingcha.jpg"
											rel="&lt;span&gt;&lt;strong&gt;警察服&lt;/strong&gt;&lt;/span&gt;"><img
												src="${ctx}/images/service/zfyh/jingcha.jpg"
												height="110" border="0"/>
										</a>
											<p>警察服</p></li>
										<li><a
											href="${ctx}/images/service/zfyh/hushi.jpg"
											rel="&lt;span&gt;&lt;strong&gt;护士装&lt;/strong&gt;&lt;/span&gt;">
											<img src="${ctx}/images/service/zfyh/hushi.jpg" 
												height="110" border="0"/>
										</a>
											<p>护士装</p></li>
										<li><a
											href="${ctx}/images/service/zfyh/qipao.jpg"
											rel="&lt;span&gt;&lt;strong&gt;旗袍&lt;/strong&gt;&lt;/span&gt;"><img
												src="${ctx}/images/service/zfyh/qipao.jpg"
												height="110" border="0"/>
										</a>
											<p>旗袍</p></li>
									</ul>
								</div>
						<p id="slideBack_zifu" class="slideBack">
									<img src="${ctx}/template/spa/images/staff/slide_back.gif"
										width="19" height="19" alt="back"/>
								</p>
								<p id="slideNext_zifu" class="slideNext" style="display: block;">
									<img src="${ctx}/template/spa/images/staff/slide_next.gif"
										width="19" height="19" alt="next"/>
								</p>
							</div>
						</div>
						<!--サムネイル用 END-->
					</div>

					<div id="pageTop" class="pageTop">
						<img src="${ctx}/template/spa/images/pagetop.gif" width="54"
							height="12" alt="Page Top" />
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
