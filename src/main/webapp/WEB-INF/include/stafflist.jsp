<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<li>
<table>
	<tr>
		<th>
		<div class="StaffListPic"><a
			href="${ctx}/staff!input.anmo?id=${id}"> <c:if
			test="${empty uploadList}">
			<img src="${ctx}/staff_imges/nopic.jpg" height="160" />
		</c:if> <c:if test="${not empty uploadList}">
			<img src="${ctx}/upload/${uploadList[0].sysname}" height="160" />
		</c:if> </a></div>
		</th>
		<td class="txt">
		<table class="floor5F">
			<tr>
				<td>
				<dl>
					<dt><a href="${ctx}/staff!input.anmo?id=${id}">${name}</a></dt>
					<dd><s:text name="height" />:${height }cm</dd>
					<dd>体重:${weight }kg</dd>
					<dd>年龄:${thisyear - birthyear}岁</dd>
					<dd>三围:${bust} ${waistline} ${hip}</dd>
					<dd>籍贯:${provinceMap[birthplace]}</dd>
					<dd>语言: <c:forTokens items="${languages}" delims=","
						var="language">
						<c:out value="${languagesMap[language]}" />
					</c:forTokens></dd>
					<dd>爱好:${hobby}</dd>
					<dd>梦想:${dream}</dd>
					<dd>顾客留言数:<font color="red"><b>11</b></font>条</dd>
				</dl>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</li>