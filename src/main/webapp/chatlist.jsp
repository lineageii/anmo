<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<script type="text/javascript">
function selectMethod(qq){
	var url;
	if(confirm('是否通过QQ临时会话咨询?\n\n确定:QQ临时会话咨询\n取消:匿名咨询')){
		url = 'http://wpa.qq.com/msgrd?v=3&amp;uin='+qq+'&amp;websiteName=(www.91abap.com)&amp;Menu=yes';
	}else{
		url = 'http://localhost:8080/msg.jsp';
	}
	window.open(url);
}
</script>
<body bgcolor="#FFF4D3">
<table>
	<tbody>
		<tr>
			<td align="left" >
			<a
				onclick="selectMethod(1222222)"
				style="font-size: 12px; color: 666666; text-decoration: none;"
				title="SAP培训 ABAP培训 BW培训"><img
					src="http://wpa.qq.com/pa?p=2:63090585:45" border="0">&nbsp;</a><br>
				<a
				href="http://wpa.qq.com/msgrd?v=3&amp;uin=1992261863&amp;websiteName=(www.91abap.com)&amp;Menu=yes"
				style="font-size: 12px; color: 666666; text-decoration: none;"
				title="SAP培训 ABAP培训 BW培训"><img
					src="http://wpa.qq.com/pa?p=2:1992261863:45" border="0">&nbsp;</a><br>
			</td>
		</tr>
	</tbody>
</table>
</body>
</html>