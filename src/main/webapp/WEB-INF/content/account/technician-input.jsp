<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>新增技师页面</title>
	<%@ include file="/common/meta.jsp" %>
	<link href="${ctx}/css/yui.css" type="text/css" rel="stylesheet"/>
	<link href="${ctx}/css/style.css" type="text/css" rel="stylesheet"/>
</head>

<body>
<div id="doc3">
<form id="inputForm" action="technician!save.anmo" method="post">
<input type="hidden" name="id" value="${id}"/>
<div class="field"><label>姓名</label><input id="name" name="name" value="${name}" type="text" size="10"/></div>
<div class="field"><label>性别</label><s:radio name="gender" list="#{'men':'男','women':'女'}" listKey="key" listValue="value" theme="simple"/></div>
<div class="field"><label>出生年</label><input id="birthyear" name="birthyear" value="${birthyear}" type="text" size="10"/>
<label>出生月</label><input id="birthmonth" name="birthmonth" value="${birthmonth}" type="text" size="10"/>
<label>出生日</label><input id="birthday" name="birthday"  value="${birthday}" type="text" size="10"/></div>
<div class="field"><label>胸围</label><input id="bust" name="bust" value="${bust}" type="text" size="10"/>
<label>腰围</label><input id="waistline" name="waistline" value="${waistline}" type="text" size="10"/>
<label>臀围</label><input id="hip" name="hip" value="${hip}" type="text" size="10"/></div>
<div class="field"><label>身高</label><input id="height" name="height" value="${height}" type="text" size="10"/></div>
<div class="field"><label>体重</label><input id="weight" name="weight" value="${weight}" type="text" size="10"/></div>
<div class="field"><label>籍贯</label><s:select id="birthplace" name="birthplace" list="@org.springside.examples.miniweb.common.PulldownUtil@getProvinceMap()" listKey="key" listValue="value" theme="simple"/></div>
<s:checkboxlist name="checkedLanguages" list="#{'jp':'日语','en':'英语'}" listKey="key" listValue="value" theme="simple"/>
<div><s:file name="pic" label="照片" /></div>
<div><s:file name="pic" label="照片" /></div>
<br>
<div id="contact">联系方式</div>
<div class="field"><label>手机</label><input id="mobileno" name="mobileno" value="${mobileno}" type="text" size="10"/></div>
<div class="field"><label>QQ</label><input id="qq" name="qq" value="${qq}" type="text" size="10"/></div>
<div class="field"><label>MSN</label><input id="msn" name="msn" value="${msn}" type="text" size="10"/></div>
<div class="field"><label>地址</label><input id="address" name="address" value="${address}" type="text" size="10"/></div>

<div><input type="submit"value="保存" /></div>
</form>
<%@ include file="/common/footer.jsp" %>
</div>
</body>
</html>