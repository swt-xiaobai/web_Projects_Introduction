<%-- Web聊天主页webchat_page.jsp--%>

<!-- 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Web聊天---主页</title>
</head>
		<frameset rows="70%,*"></frameset>
		<frame src="webchat listmsg.jsp">
		<frame src="webchat_sendmsg.jsp">
	</frameset>
</html>

 -->
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Web聊天---主页</title>
    <style>
        body { height: 100vh; margin: 0; text-align:center}
        .main { display: flex; flex-direction: column; height: 100%; }
        .chat-area { flex: 1; overflow: auto; }
        .di{position:fixed;
        	bottom:0;
        	text-align:center;
        	width:100%
        }
    </style>
</head>
<body>
	<div class = "di">

	            <jsp:include page="webchat_sendmsg.jsp" /> <!-- 包含子页面内容 -->
     </div>
  
    <div class="main">
        <div class="chat-area">
            <jsp:include page="webchat_listmsg.jsp" /> <!-- 包含子页面内容 -->
        </div>
    </div>
 
    
    
</body>
</html>
 