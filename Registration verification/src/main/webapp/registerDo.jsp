<%@page language="java" contentType="text/html; charset=utf-8"
pageEncoding="UTF-8"%>

<%@page import="jakarta.servlet.http.HttpSession"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="title" value="新用户注册"/>
<c:set var="webroot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>${title}</title></head>
<body>
	<%
	//HttpSession session = request.getSession();
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String confirmpass = request.getParameter("confirmpass");
	String code = request.getParameter("code");
	String regip = request.getRemoteAddr();
	String mess = validateForm(username, password, confirmpass,code);
	if (!"".equals(mess)){
		request.setAttribute("stuAddMess",mess);
		request.getRequestDispatcher("register.jsp").forward(request,response);
	}else {
		String sessioncode = session.getAttribute("sessioncode").toString();
	if (!code.equals(sessioncode)){
		request.setAttribute("stuAddMess","*验证码错误！");
		request.getRequestDispatcher("register.jsp").forward(request, response);
	}else {
		request.setAttribute("stuAddMess","*注册成功，请登录！");
		request.setAttribute("username", username);
		request.setAttribute("password", password);
		request.setAttribute("confirmpass", confirmpass);
		request.setAttribute("code",code);
		
		request.getRequestDispatcher("register.jsp").forward(request, response);
	}
		}%>
	<%!
	String validateForm(String username,String password,String confirmpass, String code){
	if (username == null || !username.matches("\\w{6,20}")){
		return"*用户名不合法！";
	}else if (password == null || !password.matches("\\w{6,20}")){
		return "*密码不合法！";
	}else if (!password.equals(confirmpass)){
		return"*两次输入的密码不一致，请重新输入！";
	}else if (code == null ||!code.matches("\\d{4}")){
		return"*验证码错误！";}
	return"";
	}%>
</body>
</html>