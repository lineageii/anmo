<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="keywords" content="ラクーア,laqua,東京ドーム,東京ドームシティ,ミーツポート,温泉,日帰り温泉,スパ,アジアンリゾート,都会,リゾート,極上,贅沢,東京,後楽園,水道橋,ビューティー,リラックス,女性,レディース,レディースデイ,水曜日,健康,ランスパ,ランニング,ジョギング,マラソン,エステ,アロマ,マッサージ,ヘッドスパ,タイ式,大浴場,宴会,手ぶら,こだわり,安心,安全,アミューズメント,夜景,観覧車,ジェットコースター,噴水,水,夜景,買い物,食事,飲み会,レストラン,ショッピングモール,ショッピングセンター,ショップリスト,セール" />
<meta name="description" content="東京・後楽園、東京ドームに併設されたスパ施設を中心とした水がテーマの総合アミューズメント施設「LaQua」の公式ページ。都会の真ん中で夜景を楽しみながらお湯を楽しみ、極上の癒しが手に入るスパ・ラクーアをはじめ、併設されたショッピングセンターでは有名ブランドのショッピングやレストランで食事が楽しめます。お得なプラン、セール、キャンペーンやイベントのご案内など情報が満載。" /><title>Spa | LaQua</title>
<link href="${ctx}/template/spa/css/spa.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/template/spa/css/jquery.lightbox-0.5.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/template/spa/js/jquery.js"></script>

<script type="text/javascript" src="${ctx}/template/spa/js/jquery.lightbox-0.5.js"></script>
<script type="text/javascript" src="${ctx}/template/spa/js/jq-lib.js"></script>
<script type="text/javascript" src="${ctx}/template/spa/js/navi.js"></script>
</head>


<body id="spa" class="top">
<div id="container">
<div id="header"></div><!-- /#header -->
<div id="contents">
	<div id="layerBg"></div>

	<div id="main-sub">

		<div id="mainImg">
			<p><img src="${ctx}/template/spa/images/main_img.jpg" width="574" height="330" alt="SPA LAQUA ～癒しを極めた6つの空間～" /></p>
			<ul>
				<li><img src="${ctx}/template/spa/images/main_nav_ttl.gif" width="220" height="33" alt="施設案内" /></li>
				<li><a href="/map/spa_s.html"><img src="${ctx}/template/spa/images/main_nav_map.gif" width="90" height="33" alt="フロアマップ" /></a></li>
				<li><a href="/spa_s/spazone.html"><img src="${ctx}/template/spa/images/main_nav_spa.gif" width="310" height="51" alt="SPA ZONE スパゾーン" /></a></li>
				<li><a href="/spa_s/healing.html"><img src="${ctx}/template/spa/images/main_nav_healing.gif" width="310" height="53" alt="HEALING BADEN ヒーリング バーデ" /></a></li>
				<li><a href="/spa_s/relaxation.html"><img src="${ctx}/template/spa/images/main_nav_relaxation.gif" width="310" height="53" alt="RELAXATION リラクゼーション" /></a></li>
				<li><a href="/tblist"><img src="${ctx}/template/spa/images/main_nav_treatment.gif" width="310" height="52" alt="TREATMENT &amp; BEAUTY トリートメント＆ビューティー" /></a></li>

				<li><a href="/sparlist"><img src="${ctx}/template/spa/images/main_nav_restaurant.gif" width="310" height="51" alt="RESTAURANT レストラン" /></a></li>
				<li><a href="/spa_s/sguide.html"><img src="${ctx}/template/spa/images/main_nav_info.gif" width="157" height="37" alt="営業案内" /></a></li>
				<li><a href="/spa_s/first.html"><img src="${ctx}/template/spa/images/main_nav_firsttime.gif" width="153" height="37" alt="はじめての方へ" /></a></li>
			</ul>
		</div>
		
		<div id="spaTopLeft">
			<ul id="topicPath">
				<li><a href="/">TOP</a></li>

				<li>Spa LaQua</li>
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
				<p class="more"><a href="http://www.laqua.jp/newslist?mode=spa_news">スパ ニュースをもっと見る</a></p>
				<ul id="topBanners">
					<li><a href="/spa_s/sticking.html"><img src="${ctx}/template/spa/images/about.gif" width="551" height="157" alt="スパ ラクーアのこだわり" /></a></li>
				</ul>
			</div>
			
		</div><!-- /#spaTopLeft -->
		<div id="spaTopRight">

			<h2><img src="${ctx}/template/spa/images/ttl_topics.gif" width="310" height="51" alt="Topics" /></h2>
			<div id="spaTopicsList">
				<ul>
					<li>
						<dl>
							<dt><a href="/tenpo/lanikai">夏直前！ハワイアンビューティーフェア 6/1～7/31</a></dt>
							<dd>ラニカイが贈るスペシャルメニューがこの夏復活！！</dd>
							<dd class="TenpoLink">ラニカイ<br /><b>（ハワイアンロミロミ）</b></dd>

						</dl>
																				<p><img src="http://www.laqua.jp/wp-content/uploads/2011/05/resize_0001-80x80.jpg" width="80" height="80" border="0" /></p>

											</li>
					<li>
						<dl>
							<dt><a href="/tenpo/dining-takenawa">５月　料理長のおすすめ</a></dt>
							<dd>初夏におすすめ　豚肉と根菜の煮物　\560</dd>

							<dd class="TenpoLink">酣(TAKENAWA）<br /><b>（和食ダイニング）</b></dd>
						</dl>
																				<p><img src="http://www.laqua.jp/wp-content/uploads/2011/05/resize_0002-80x80.jpg" width="80" height="80" border="0" /></p>

											</li>
					<li>
						<dl>
							<dt><a href="/tenpo/dining-takenawa">５月　料理長のおすすめ</a></dt>

							<dd>初夏におすすめ　辛味大根冷やしそば　\680</dd>
							<dd class="TenpoLink">酣(TAKENAWA）<br /><b>（和食ダイニング）</b></dd>
						</dl>
																				<p><img src="http://www.laqua.jp/wp-content/uploads/2011/05/resize_001-80x80.jpg" width="80" height="80" border="0" /></p>

											</li>
					<li>
						<dl>

							<dt><a href="/tenpo/dining-takenawa">【入館料込み￥3,500の大人気ランチプラン♪】</a></dt>
							<dd>初夏の彩り御膳　</dd>
							<dd class="TenpoLink">酣(TAKENAWA）<br /><b>（和食ダイニング）</b></dd>
						</dl>
																				<p><img src="http://www.laqua.jp/wp-content/uploads/2011/05/resize_000-80x80.jpg" width="80" height="80" border="0" /></p>

											</li>

					<li>
						<dl>
							<dt><a href="/tenpo/lotus_moon">【入館料込み￥3,500の大人気ランチプラン♪】</a></dt>
							<dd>ラクーア８周年記念♪8種類のアジアン御膳　</dd>
							<dd class="TenpoLink">ロータスムーン<br /><b>（アジアンエスニックレストラン）</b></dd>
						</dl>
																				<p><img src="http://www.laqua.jp/wp-content/uploads/2011/04/resize_0002-80x80.jpg" width="80" height="80" border="0" /></p>

											</li>
				</ul>
			</div>
			<p class="more"><a href="/topicslist?mode=spa">Topicsをもっと見る</a></p>
			<p id="spaTopLadys"><a href="/ladysdaylist?mode=spa"><img src="${ctx}/template/spa/images/ladysday.gif" width="304" height="70" alt="毎週水曜女性限定レディースデー" /></a></p>
		</div><!-- /#spaTopRight -->

	</div><!-- /#main-sub -->

</div><!-- /#contents -->
<!--
<a href="/topicslist?mode=spa">Topicsをもっと見る</a>
<p><a href="/ladysdaylist?mode=spa">Lady's Day</a></p>
-->

<div id="footer"></div><!-- /#footer -->

</div></body>
</html>
