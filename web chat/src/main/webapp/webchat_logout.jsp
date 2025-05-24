<%--用户退出页面webchat_loginout.jsp--%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Web聊天--用户退出</title></head><body>
	<% String users =(String)application.getAttribute("users");
	String username =(String)session.getAttribute("user");
	String s[] = users.split(",");
	String newusers="";//保存移除当前用户后的全部用户
	//从application对象users属性中移除当前用户
	if (!s[0].equals(username))
		newusers=s[0];
		for (int i=1;i<s.length;i++){
			if (!s[i].equals(username)){
				if (newusers!="")
					newusers=newusers+","+s[i];
				else
					newusers=s[i];
			}
	}
	
	application.setAttribute("users", newusers);
	session.invalidate();//注销当前用户会话
	%>
<jsp:forward page="webchat_login.jsp"/>
</body></html>