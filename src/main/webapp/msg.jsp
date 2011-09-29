<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title></title>
<script type="text/javascript" src="${ctx}/template/spa/js/jquery.js"></script>
<script type="text/javascript">
	function onClickSendMsg(){
		$('#msg').append('<li>' + $('#sendTxt').val() + '</li>');
		$.ajax({
			   type: "POST",
			   url: "http://localhost:8080/msg/msg.anmo",
			   data: "cid=" + $('#cid').val() + "&kfid=" + $('#kfid').val() + "&msg=" + $('#sendTxt').val(),
			   success: function(msg){
			   }
			 });
		
	}
	
	function initPage(){
		//$('#cid').val(Math.random());
		sendMsgAjax();
	}
	
	function sendMsgAjax(){
		$.ajax({
			   type: "POST",
			   url: "http://localhost:8080/msg/msg.anmo",
			   data: "cid=" + $('#cid').val() + "&kfid=" + $('#kfid').val(),
			   success: function(msg){
			     if(msg.length > 0) {
			    	 $('#msg').append('<li>' + msg + '</li>');
			     }
			     sendMsgAjax();
			   }
			 });
	}

</script>
</head>


<body onload="initPage()">
<ul id="msg">
</ul>
<input type="text" id="kfid" value="63090585"/>
<input type="text" id="sendTxt" />
<input type="hidden" id="cid" value="123" />
<input type="button" id="sendBtn" onclick="onClickSendMsg()" value="发送"/>
</body>
</html>