<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<title>Mini-Web 帐号管理</title>
	<%@ include file="/common/meta.jsp" %>
	<link href="${ctx}/css/yui.css" type="text/css" rel="stylesheet"/>
	<link href="${ctx}/css/style.css" type="text/css" rel="stylesheet"/>
	<link href="${ctx}/js/validate/jquery.validate.css" type="text/css" rel="stylesheet"/>
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/jquery.validate.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/messages_cn.js" type="text/javascript"></script>
	<sx:head parseContent="true" extraLocales="UTF-8" /> 
	<script>
		$(document).ready(function() {
			//聚焦第一个输入框
			$("#loginName").focus();
			//为inputForm注册validate函数
			$("#inputForm").validate({
				rules: {
					loginName: {
						required: true,
						remote: "user!checkLoginName.anmo?oldLoginName=" + encodeURIComponent('${loginName}')
					},
					name: "required",
					password: {
						required: true,
						minlength:3
					},
					passwordConfirm: {
						equalTo:"#password"
					},
					email:"email",
					checkedRoleIds:"required"
				},
				messages: {
					loginName: {
						remote: "用户登录名已存在"
					},
					passwordConfirm: {
						equalTo: "输入与上面相同的密码"
					}
				}
			});
		});
		
		function cleartime(obj){
			if($(obj).val() == 'rest'){
				$("#starttime").val('');
				$("#starttime").attr("disabled",true);
				$("#endtime").val('');
				$("#endtime").attr("disabled",true);
			} else {
				$("#starttime").attr("disabled",false);
				$("#endtime").attr("disabled",false);
			}
		}
		
	</script>
	
</head>

<body>
<div id="doc3">
<%@ include file="/common/header.jsp" %>
<div id="bd">
	<div id="yui-main">
	<div class="yui-b">
	<h2><s:if test="id == null">创建</s:if><s:else>修改</s:else>订单</h2>
	<form id="inputForm" action="order!save.anmo" method="post">
		<input type="hidden" name="id" value="${id}"/>
		<table class="noborder">
			<tr>
				<td>订单编号:</td>
				<td>${orderno}</td>
			</tr>
			<tr>
				<td>订单日期:</td>
				<td>
				<s:if test="id == null"><sx:datetimepicker name="eventdate" displayFormat="yyyy-MM-dd" value="%{'today'}" language="utf-8"/></s:if>
				<s:else><sx:datetimepicker name="orderdate" displayFormat="yyyy-MM-dd" value="orderdate" language="utf-8"/></s:else>
				</td>
			</tr>
			<tr>
				<td>顾客姓名:</td>
				<td><input type="text" name="customer.name" value="${customer.name}" /> </td>
			</tr>
			<tr>
				<td>顾客手机:</td>
				<td><input type="text" name="customer.phoneno" value="${customer.phoneno}" /></td>
			</tr>
			<tr>
				<td>顾客QQ:</td>
				<td><input type="text" name="customer.qq" value="${customer.qq}" /></td>
			</tr>
			<tr>
				<td>联系地址:</td>
				<td><input type="text" name="contactAddress" value="${contactAddress}" /></td>
			</tr>
			<tr>
				<td>联系人<:</td>
				<td><input type="text" name="contactName" value="${contactName}" /></td>
			</tr>
			<tr>
				<td>联系人电话:</td>
				<td><input type="text" name="contactPhoneNo" value="${contactPhoneNo}" /></td>
			</tr>
			<tr>
				<td>备注:</td>
				<td><input type="text" name="remark" value="${remark}" /></td>
			</tr>
			<tr>
				<td>状态:</td>
				<td><input type="text" name="status" value="${status}" /></td>
			</tr>
			<tr>
				<td colspan="2">
					
						<input class="button" type="submit" value="提交"/>&nbsp;

					<input class="button" type="button" value="返回" onclick="history.back()"/>
				</td>
			</tr>
		</table>
	</form>
	</div>
	</div>
</div>
<%@ include file="/common/footer.jsp" %>
</div>
</body>
</html>
