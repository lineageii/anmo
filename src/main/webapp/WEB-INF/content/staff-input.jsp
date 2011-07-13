<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="keywords"
	content="ラクーア,laqua,東京ドーム,東京ドームシティ,ミーツポート,温泉,日帰り温泉,スパ,アジアンリゾート,都会,リゾート,極上,贅沢,東京,後楽園,水道橋,ビューティー,リラックス,女性,レディース,レディースデイ,水曜日,健康,ランスパ,ランニング,ジョギング,マラソン,エステ,アロマ,マッサージ,ヘッドスパ,タイ式,大浴場,宴会,手ぶら,こだわり,安心,安全,アミューズメント,夜景,観覧車,ジェットコースター,噴水,水,夜景,買い物,食事,飲み会,レストラン,ショッピングモール,ショッピングセンター,ショップリスト,セール" />
<meta name="description"
	content="東京・後楽園、東京ドームに併設されたスパ施設を中心とした水がテーマの総合アミューズメント施設「LaQua」の公式ページ。都会の真ん中で夜景を楽しみながらお湯を楽しみ、極上の癒しが手に入るスパ・ラクーアをはじめ、併設されたショッピングセンターでは有名ブランドのショッピングやレストランで食事が楽しめます。お得なプラン、セール、キャンペーンやイベントのご案内など情報が満載。" />
<title>RESTAURANT - Spa | LaQua</title>
<link href="${ctx}/template/spa/css/spa.css" rel="stylesheet"
	type="text/css" />
<link href="${ctx}/template/spa/css/module.css" rel="stylesheet"
	type="text/css" />
<link href="${ctx}/template/spa/css/jquery.lightbox-0.5.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/template/spa/js/jquery.js"></script>
<script type="text/javascript"
	src="${ctx}/template/spa/js/jquery.lightbox-0.5.js"></script>

<script type="text/javascript" src="${ctx}/template/spa/js/jq-lib.js"></script>
<script type="text/javascript" src="${ctx}/template/spa/js/navi.js"></script>
</head>
<body id="spa" class="treatment">
<div id="container">

<div id="header"></div>
<!-- /#header -->

<div id="contents">
<div id="layerBg"></div>

<div id="main-sub">

<div id="main">
<ul id="topicPath">
	<li><a href="/">首页</a></li>
	<li>技师介绍</li>
</ul>
<div class="weekwork">
	<table >
		<tr>
			<s:iterator value="weekWorkList" status="stat" var="weekWork">
				<td align="center">
				<fmt:formatDate value="${weekWork.day}" pattern="M/d" />
				</td>
			</s:iterator>
		</tr>
		<tr>
			<s:iterator value="weekWorkList" status="stat" var="weekWork">
				<td align="center">
				${workStatusMap[weekWork.status]}
				<br/>
				${workTimeMap[weekWork.starttime]}-${workTimeMap[weekWork.endtime]}
				</td>
			</s:iterator>
		</tr>
	</table>
</div> <!-- weekwork end -->

<div id="comment">
		<input type="hidden" name="commentPage.pageNo" id="pageNo" value="${commentPage.pageNo}"/>
		<input type="hidden" name="commentPage.orderBy" id="orderBy" value="${commentPage.orderBy}"/>
		<input type="hidden" name="commentPage.order" id="order" value="${commentPage.order}"/>
		
		<s:iterator value="commentPage.result" >
		<table>
			<tr>
				<th>
					顾客姓名:${customer.name} 顾客电话:${customer.phoneno}
				</th>
			</tr>
			<tr>
				<td>
					${comment}
				</td>
			</tr>
			<tr>
				<td>
					${reply}
				</td>
			</tr>
		</table>
		</s:iterator>
</div>
<div>
			第${commentPage.pageNo}页, 共${commentPage.totalPages}页
			<a href="javascript:jumpPage(1)">首页</a>
			<s:if test="commentPage.hasPre"><a href="javascript:jumpPage(${commentPage.prePage})">上一页</a></s:if>
			<s:if test="commentPage.hasNext"><a href="javascript:jumpPage(${commentPage.nextPage})">下一页</a></s:if>
			<a href="javascript:jumpPage(${commentPage.totalPages})">末页</a>
</div>
<table id="aboutReserve">
	<caption><img src="images/spa/tb/ttl_about_reserve.gif"
		width="658" height="17" alt="事前予約について" /></caption>

	<tr>
		<th><img src="images/spa/tb/txt_reserve_1.gif" width="153"
			height="169" alt="ご予約方法" /></th>
		<td><img src="images/spa/tb/txt_reserve_2.gif" />「予約」マークのついている店舗では､電話による事前予約を受け付けております。<br />
		<strong>TEL：03-3817-4173（音声ガイダンス）</strong><br />
		（電話予約受付時間12:00～22:00）
		<ul>
			<li><b>※</b>事前予約は、仮予約です。当日は、施術開始1時間前までにご入館の上、<br />

			店舗にて本予約をお願い致します。<br />
			本予約されない場合には、自動的にキャンセルとなりますのでご注意下さい。</li>
			<li><b>※</b>「ユーロフュージョンセラピー ユーロフィア」は施術希望日の一週間前より受付開始。<br />
			その他の店舗は施術希望の1ヶ月前より受付開始。</li>
			<li><b>※</b>「ユーロフュージョンセラピー ユーロフィア」は土日祝特定日の事前予約は不可。</li>

			<li><b>※</b>店舗により注意事項が異なります。電話予約時に詳細をご確認下さい。</li>
		</ul>
		</td>
	</tr>
</table>

<div class="contentsIn">
<div id="pageTop" class="pageTop"><img
	src="images/spa/pagetop.gif" width="54" height="12" alt="Page Top" /></div>
</div>
<!-- /.contentsIn --></div>

<div id="sub">
<ul>
	<li><a href="/spa"><img src="${ctx}/template/spa/images/snav_ttl.gif"
		width="185" height="60" alt="SPA LAQUA" /></a></li>
	<li id="snav-news"><a href="/newslist?mode=spa_news"><img
		src="${ctx}/template/spa/images/snav_news.gif" width="96" height="21"
		alt="Spa News" /></a></li>
	<li id="snav-map"><a href="/map/spa_s.html"><img
		src="${ctx}/template/spa/images/snav_map.gif" width="89" height="21" alt="フロアマップ" /></a></li>
	<li id="snav-zone"><a href="/spa_s/spazone.html"><img
		src="${ctx}/template/spa/images/snav_spa.gif" width="185" height="49"
		alt="SPA ZONE スパ ゾーン" /></a></li>
	<li id="snav-healing"><a href="/spa_s/healing.html"><img
		src="${ctx}/template/spa/images/snav_healing.gif" width="185" height="50"
		alt="HEALING BADEN ヒーリングバーデ" /></a></li>
	<li id="snav-relaxation"><a href="/spa_s/relaxation.html"><img
		src="${ctx}/template/spa/images/snav_relaxation.gif" width="185" height="50"
		alt="RELAXATION リラクゼーション" /></a></li>
	<li id="snav-treatment"><a href="/tblist"><img
		src="${ctx}/template/spa/images/snav_treatment.gif" width="185" height="50"
		alt="TREATMENT &amp; BEAUTY トリートメント＆ビューティー" /></a></li>

	<li id="snav-restaurant"><a href="/sparlist"><img
		src="${ctx}/template/spa/images/snav_restaurant.gif" width="185" height="50"
		alt="RESTAURANT レストラン" /></a></li>
	<li id="snav-guide"><a href="/spa_s/sguide.html"><img
		src="${ctx}/template/spa/images/snav_guide.gif" width="185" height="48"
		alt="営業案内" /></a></li>
	<li id="snav-first"><a href="/spa_s/first.html"><img
		src="${ctx}/template/spa/images/snav_firsttime.gif" width="185" height="48"
		alt="はじめての方へ" /></a></li>
	<li id="snav-sticking"><a href="/spa_s/sticking.html"><img
		src="${ctx}/template/spa/images/snav_sticking.gif" width="185" height="49"
		alt="スパ ラクーアのこだわり" /></a></li>
</ul>
</div>
<!-- /#sub --> <!-- Pager start --> <!-- Pager end // --></div>
<!-- /#main-sub --></div>
<!-- /#contents -->

<div id="footer"></div>
<!-- /#footer --></div>
</body>
</html>
