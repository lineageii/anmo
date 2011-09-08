<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@ include file="/common/meta.jsp"%>
<title>+G spa | 迦季养生馆</title>
<link href="${ctx}/template/spa/css/spa.css" rel="stylesheet"
	type="text/css" />
<link href="${ctx}/template/spa/css/jquery.lightbox-0.5.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/template/spa/js/jquery.js"></script>
<script type="text/javascript"
	src="${ctx}/template/spa/js/jquery.lightbox-0.5.js"></script>
<script type="text/javascript" src="${ctx}/template/spa/js/jq-lib.js"></script>
<script type="text/javascript" src="${ctx}/template/spa/js/navi.js"></script>
</head>


<body id="spa" class="top">
	<div id="container">
		<div id="header"></div>
		<!-- /#header -->
		<div id="contents">
			<div id="layerBg"></div>

			<div id="main-sub">
					<style type="text/css"> 
						#slide { position:absolute; width:574px; height:330px; margin:0px auto;}
						#pic_list { position:absolute; left:0; bottom:0; width:100%; list-style:none; overflow:hidden; z-index:2;}
						#pic_list li { float:right; width:80px; height:30px; padding-top:10px;}
						#pic_list li img { position:absolute; top:18px; width:60px; height:30px; margin:0 10px; border:1px solid #fff;}
						#this_pic { position:absolute; width:100%; height:100%; border:none;}
						#transparence { position:absolute; left:0; bottom:0; width:100%; height:15px; border-top:1px solid #fff; background:#000; z-index:1;} 					</style>
					<div id="mainImg">
					<div id="slide"> <a href="#" id="this_a"><img id="this_pic" alt="" /></a> 
					<ul id="pic_list"> 
						 <li>
								<a href="#"><img src="${ctx}/images/index/spa2.jpg" alt="夏威夷LOMILOMI按摩"/></a>
							</li><li>
								<a href="#"><img src="${ctx}/images/index/spa1.jpg" alt="夏威夷LOMILOMI按摩"/></a>
							</li><li>
								<a href="#"><img src="${ctx}/images/index/spa3.jpg" alt="夏威夷LOMILOMI按摩"/></a>
							</li><li>
								<a href="#"><img src="${ctx}/images/index/spa6.jpg" alt="夏威夷LOMILOMI按摩"/></a>
							</li><li>
								<a href="#"><img src="${ctx}/images/index/spa5.jpg" alt="夏威夷LOMILOMI按摩"/></a>
							</li>
					</ul> 
					<span id="transparence"></span> 
				</div> 
				
				<script type="text/javascript"> 
				var theInt = null;
				var curclicked = 0;
				 
				$(function(){
					$('#transparence').css('opacity','0.4');
					$('#pic_list img').css({'opacity':'0.6'});
					$('#pic_list img:eq(0)').css({'top':'0','opacity':'1'});
					$('#pic_list a').click(function(){return false});
					t(0);
					$('#pic_list img').mouseover(function(){
						if($('#this_pic').attr('src') == $(this).attr('src')) return;
						t($('#pic_list img').index($(this)));
					});
				});
				 
				t = function(i){
					clearInterval(theInt);
					if( typeof i != 'undefined' )
					curclicked = i;
						$('#this_pic').fadeOut(0).fadeIn(500).attr('src',$('#pic_list img').eq(i).attr('src'));
						$('#this_a').attr('href',$('#pic_list img').eq(i).parents('a').attr('href'));
						$('#this_a').attr('title',$('#pic_list img').eq(i).parents('a').attr('title'));
						$('#pic_list img').eq(i).parents('li').nextAll('li').find('img').animate({top:18,opacity:0.6},500);
						$('#pic_list img').eq(i).parents('li').prevAll('li').find('img').animate({top:18,opacity:0.6},500);
						$('#pic_list img').eq(i).animate({top:0},500).css('opacity','1');
					theInt = setInterval(function (){
						i++;
						if (i > $('#pic_list img').length - 1) {i = 0};
						$('#this_pic').fadeOut(0).fadeIn(500).attr('src',$('#pic_list img').eq(i).attr('src'));
						$('#this_a').attr('href',$('#pic_list img').eq(i).parents('a').attr('href'));
						$('#this_a').attr('title',$('#pic_list img').eq(i).parents('a').attr('title'));
						$('#pic_list img').eq(i).parents('li').nextAll('li').find('img').animate({top:18,opacity:0.6},500);
						$('#pic_list img').eq(i).parents('li').prevAll('li').find('img').animate({top:18,opacity:0.6},500);
						$('#pic_list img').eq(i).animate({top:0},500).css('opacity','1');
					},3000)
				}
				</script> 
					<ul id="right_ul">
						<li><img src="${ctx}/template/spa/images/main_nav_ttl.gif"
							width="220" height="33" alt="施設案内" />
						</li>
						<li><a href="/map/spa_s.html"><img
								src="${ctx}/template/spa/images/main_nav_map.gif" width="90"
								height="33" alt="フロアマップ" />
						</a>
						</li>
						<li><a href="${ctx}/staff.anmo"><img
								src="${ctx}/template/spa/images/main_nav_spa.gif" width="310"
								height="51" alt="技师魅影" />
						</a>
						</li>
						<li><a href="${ctx}/service.html"><img
								src="${ctx}/template/spa/images/main_nav_healing.gif"
								width="310" height="53" alt="服务项目" />
						</a>
						</li>
						<li><a href="${ctx}/order.anmo"><img
								src="${ctx}/template/spa/images/main_nav_relaxation.gif"
								width="310" height="53" alt="网上预约" />
						</a>
						</li>
						<li><a href="${ctx}/comment.anmo"><img
								src="${ctx}/template/spa/images/main_nav_treatment.gif"
								width="310" height="52" alt="顾客点评" />
						</a>
						</li>
						<li><a href="${ctx}/store.anmo"><img
								src="${ctx}/template/spa/images/main_nav_restaurant.gif"
								width="310" height="51" alt="附近的店铺" />
						</a>
						</li>
						<li><a href="${ctx}/price.anmo"><img
								src="${ctx}/template/spa/images/main_nav_info.gif" width="157"
								height="37" alt="收费标准" />
						</a>
						</li>
						<li><a href="${ctx}/flow.html"><img
								src="${ctx}/template/spa/images/main_nav_firsttime.gif"
								width="153" height="37" alt="服务流程" />
						</a>
						</li>
					</ul>
				</div>
				<div id="spaTopLeft">
					<ul id="topicPath">
						<li><a href="${ctx}">首页</a>
						</li>
					</ul>

					<div id="spaNews">
						<h1>
							<img src="${ctx}/template/spa/images/ttl_news.gif" width="549"
								height="32" alt="Spa News" />
						</h1>
						<ul id="spaNewsList">
							<s:iterator value="newsPage.result">
								<li>
									<dl>
										<dt>
											<a href="${ctx}/news!input.anmo?id=${id}" target="_self">${title}</a>
										</dt>
									</dl></li>
							</s:iterator>
						</ul>
						<p class="more">
							<a href="${ctx}/news.anmo">查看更多...</a>
						</p>
						<h1>
							<img src="${ctx}/template/spa/images/ttl_news.gif" width="549"
								height="32" alt="Spa News" />
						</h1>
						<ul id="tbList1">
							<s:iterator value="staffPage.result">
								<%@ include file="/WEB-INF/include/stafflist.jsp"%>
							</s:iterator>
						</ul>
						<p class="more">
							<a href="${ctx}/staff.anmo">查看更多...</a>
						</p>

					</div>

				</div>
				<!-- /#spaTopLeft -->
				<div id="spaTopRight">

					<h2>
						<img src="${ctx}/template/spa/images/ttl_topics.gif" width="310"
							height="51" alt="Topics" />
					</h2>
					<div id="spaTopicsList">
						<ul>
							<s:iterator value="commentPage.result">
								<li>
									<dl>
										<dd class="TenpoLink">${customer.name}的点评</dd>
										<dt>
											<a href="${ctx}/comment!input.anmo?id=${id}">${fn:substring(comment,0,28)}...</a>
										</dt>
										<dd class="TenpoLink">技师${technician.name}的回复</dd>
										<dd>${fn:substring(reply,0,40)}...</dd>


									</dl>
									<p>
										<c:if test="${empty technician.uploadList}">
											<img src="${ctx}/staff_imges/nopic.jpg" width="80" border="0" />
										</c:if>
										<c:if test="${not empty technician.uploadList}">
											<img src="${ctx}/upload/${technician.uploadList[0].sysname}"
												width="80" border="0" />
										</c:if>
									</p></li>
							</s:iterator>
						</ul>
					</div>
					<p class="more">
						<a href="${ctx}/comment.anmo">查看更多...</a>
					</p>
				</div>
				<!-- /#spaTopRight -->

			</div>
			<!-- /#main-sub -->

		</div>
		<!-- /#contents -->

		<div id="footer"></div>
		<!-- /#footer -->

	</div>
</body>
</html>
