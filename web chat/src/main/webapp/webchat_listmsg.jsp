<%--显示聊天内容页面webchat_listmsg.jsp--%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Web聊天--显示聊天内容</title></head>
<body>
<%
	response.setHeader("refresh","1");
	String msgs =(String) application.getAttribute("msgs");
	if (application.getAttribute("msgs")==null)
		out.print("聊天程序启动");
	else
		out.print(msgs);

%>
</body>
</html>