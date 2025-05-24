<%-- Web聊天消息发送窗□webchat_sendmsg.jsp--%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*,java.util.Date,java.text.SimpleDateFormat"%>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Web聊天--消息发送窗口</title></head>
<body>
<form action="" method="post"><%=session.getAttribute("user")%>  发言:
	<input type="text" name="message" size="40"><br><br>
	<input type="submit"value="发言">
	<input type="button" value="退出" onclick="parent.location.href='webchat_logout.jsp'">
</form>
<%
	String msgs=(String)application.getAttribute("msgs");//获取全部消息
	String user=(String)session.getAttribute("user");//获取当前用户
	SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String S=df.format(new Date());
	request.setCharacterEncoding("UTF-8");
	String message = request.getParameter("message");//获取当前用户发送的消息
	if (application.getAttribute("msgs")!=null){
	//当前用户刚上线尚未发消息
	//已有用户发消息
		if (request.getParameter("message")==null){
			//提示该用户上线
			msgs=msgs+"<br>"+user+":上线（"+S+")";
		}
		else{
			//显示该用户的消息
			msgs=msgs+"<br>"+user+"说："+message+"("+S+")";
		}
	}
	else{
		//尚未有用户发消息
		//当前用户刚上线尚未发消息
		if (request.getParameter("message")==null)
			msgs=user+":上线（"+S+")";
		else
			msgs="<br>";
	}
	application.setAttribute("msgs",msgs);//更新消息内容
	System.out.println(message);
%>
</body>
</html>