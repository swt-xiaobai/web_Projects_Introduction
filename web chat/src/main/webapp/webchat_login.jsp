<%--用户登录页面webchat_login.jsp--%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Web聊天--登录页面</title>
<style type="text/css">
	#center{ text-align:center;
	}

</style>
</head>
<body>
	<%
	String loginmsg =(String)request.getAttribute("loginmsg");
	if (loginmsg == null){ loginmsg ="";}
	%>
	
	<div id="center"><h2><%=loginmsg%></h2></div><br>
	<form action="webchat_loginpro.jsp" method="post" name="logform">
	<div id="center">用户名：<input type="text"name="usrname"></div><br>
	<div id="center"><input type="submit" value="登录"></div>
	</form>
</body>
</html>