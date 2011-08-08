<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>新增技师页面</title>
	<%@ include file="/common/meta.jsp" %>
	<link href="${ctx}/css/yui.css" type="text/css" rel="stylesheet"/>
	<link href="${ctx}/css/style.css" type="text/css" rel="stylesheet"/>
	<link href="${ctx}/template/spa/css/jquery.lightbox-0.5.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/template/spa/js/jquery.js"></script>
<script type="text/javascript"
	src="${ctx}/template/spa/js/jquery.lightbox-0.5.js"></script>
	<sx:head parseContent="true" extraLocales="UTF-8" /> 
<script type="text/javascript">
	function onClickSubmit(){
		var files = $('input[type="file"]');
		
		$.each(files, function(i,element){
			//alert(i + ':'+ element.value);
		});
		$("#inputForm").submit();
	}
	
	// 删除图片
	function removeimg(uploadid){
		var result = $.ajax({
			  url: "${ctx}/account/upload!delete.anmo?id=" + uploadid,
			  async: false
			}).responseText;
		window.location.reload(true);
		//window.location.href = "technician!input.anmo?id=${id}";
	}
</script>

</head>

<script type="text/javascript">
	function cleartime(obj){
		var starttime = $(obj).next().next();
		var endtime = $(starttime).next().next().next();
		if($(obj).val() == 'rest'){
			$(starttime).val('');
			$(starttime).attr("disabled",true);
			$(endtime).val('');
			$(endtime).attr("disabled",true);
		} else {
			$(starttime).attr("disabled",false);
			$(endtime).attr("disabled",false);
		}
	}
	
	function hideTr(obj){
		$(obj).parent().parent().hide();
		$(obj).next().val('1');
	}
</script>
<body>
<div id="doc3">
<form id="inputForm" action="technician!save.anmo" method="post" enctype="multipart/form-data">
<input type="hidden" name="id" value="${id}"/>
<div class="field"><label>员工编号</label><input id="empno" name="empno" value="${empno}" type="text" size="10"/></div>
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
<div class="field"><label>籍贯</label><s:select id="birthplace" name="birthplace" list="provinceMap" listKey="key" listValue="value" theme="simple"/></div>
<s:checkboxlist name="checkedLanguages" list="#{'jp':'日语','en':'英语'}" listKey="key" listValue="value" theme="simple"/>
<div class="field"><label>爱好</label><input type="text" name="hobby" value="${hobby}" /></div>
<div class="field"><label>梦想</label><input type="text" name="dream" value="${dream}" /></div>
<c:if test="${empty uploadList}">
	<div><s:file name="uploadFile[0].upload" label="照片" /></div>
	<div><s:file name="uploadFile[1].upload" label="照片" /></div>
</c:if>
<c:if test="${not empty uploadList}">
	<s:iterator value="uploadList" status="status">
		<div><s:file name="uploadFile[%{#status.index}].upload" label="照片" />
		<input type="hidden" name="uploadFile[${status.index}].uploadid" value="${id}"/></div>
		<div><img src="${ctx}/upload/${sysname}" height="200px"/></div>
		<div><a href="#" onclick="removeimg(${id})" >删除</a></div>
	</s:iterator>
</c:if>
<br>
<div id="contact">联系方式</div>
<div class="field"><label>手机</label><input id="mobileno" name="mobileno" value="${mobileno}" type="text" size="10"/></div>
<div class="field"><label>QQ</label><input id="qq" name="qq" value="${qq}" type="text" size="10"/></div>
<div class="field"><label>MSN</label><input id="msn" name="msn" value="${msn}" type="text" size="10"/></div>
<div class="field"><label>地址</label><input id="address" name="address" value="${address}" type="text" size="10"/></div>

<div class="weekwork">
	<table>
		<tr>
			<th><s:text name="week1"/></th>
			<th><s:text name="week2"/></th>
			<th><s:text name="week3"/></th>
			<th><s:text name="week4"/></th>
			<th><s:text name="week5"/></th>
			<th><s:text name="week6"/></th>
			<th><s:text name="week7"/></th>
		</tr>
		<tr>
			<s:iterator value="weekWorkList" status="stat">
				<td align="center">
				<input name="weekWorkList[${stat.index}].weekno" type="hidden" value="${weekno}"/>
				<select name="weekWorkList[${stat.index}].status" onchange="cleartime(this)">
					<s:iterator value="workStatusMap" var="option">
						<option value="${option.key}" <c:if test="${option.key==status}">selected</c:if>>
							${option.value}
						</option>
					</s:iterator>
				</select>
				<br/>
				<select name="weekWorkList[${stat.index}].starttime" <c:if test="${''==starttime}">disabled</c:if>>
					<option value="" ></option>
					<s:iterator value="workTimeMap" var="option">
						<option value="${option.key}" <c:if test="${option.key==starttime}">selected</c:if>>
							${option.value}
						</option>
					</s:iterator>
				</select>
				<br/>
				~
				<br/>
				<select name="weekWorkList[${stat.index}].endtime" <c:if test="${''==endtime}">disabled</c:if>>
					<option value=""></option>
					<s:iterator value="workTimeMap" var="option">
						<option value="${option.key}" <c:if test="${option.key==endtime}">selected</c:if>>
							${option.value}
						</option>
					</s:iterator>
				</select>
				</td>
			</s:iterator>
		</tr>
	</table>
</div> <!-- weekwork end -->
<div><input type="button"value="保存" onclick="onClickSubmit()"/></div>
</form>
<%@ include file="/common/footer.jsp" %>
</div>
</body>
</html>