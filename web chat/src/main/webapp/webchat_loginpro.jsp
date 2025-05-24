<%--用户登录处理webchat_loginpro.jsp--%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Web聊天--用户登录处理</title></head>
<body><%
	request.setCharacterEncoding("UTF-8");
	String usrname = request.getParameter("usrname");//获取用户名
	if(usrname.trim().length()==0){ //判断用户名是否为空
		request.setAttribute("loginmsg","请输入用户名");
	request.getRequestDispatcher("webchat_login.jsp").forward(request,response);
	
	return;
	}
	String users;
	if (application.getAttribute("users")==null)
		users="";
	else
		users=(String)application.getAttribute("users");
	if (users!=""){
		if (users.indexOf(usrname)==-1)//当前已登录用户不包含usrname
			{
			users=users+','+usrname;
			application.setAttribute("users",users);
			
			//将当前用户加入在线用户中
			}
		else{
			request.setAttribute("loginmsg","用户"+usrname+"已登录，请输入其他用户名");
			request.getRequestDispatcher("webchat_login.jsp").forward(request,response);
			return;
		}
		}
	else{
	application.setAttribute("users",usrname);
	}
	session.setAttribute("user", usrname);
	response.sendRedirect("webchat_page.jsp");
	%>
</body>
</html>