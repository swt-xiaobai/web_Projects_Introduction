<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="title" value="新用户注册"/>
<c:set var="webroot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>${title}</title>
</head>
<body><div id="content">
	<h1>${title}</h1>
	<div class="operation">填写注册信息↓：<span class="mess"id="stuAddMess">
	<font color="blue">${requestScope.stuAddMess}</font></span></div>
	<div class="ft">
	<form method="post" action="${webroot}/registerDo.jsp">
		<table>
		<tr><td class="label">用户名：</td>
		<td colspan="2"><input type="text" name="username" id="username"value="${requestScope.username}"/></td>
		<td class="hint">*用户名为英文字母、下划线或数字组合，长度为6-20位</td>
		</tr>
		<tr><td class="label">密码：</td>
		<td colspan="2"><input type="password" name="password" id="password"value="${requestScope.password}"/></td>
		<td class="hint">*密码为英文字母、下划线或数字组合，长度为6-20位</td>
		</tr>
		<tr><td class="label">确认密码：</td>
		<td colspan="2"><input type="password" name="confirmpass"id="confirmpass" value="${requestScope.confirmpass}"/></td>
		<td class="hint">*两次输入的密码要一致</td></tr>
		<tr><td class="label">验证码：</td>
		<td><input style="width: 65px;" type="text" name="code"id="code"value="${requestScope.code}"/></td>
		<td><img src="registerCode.jsp" id="imagecode" title="点击可更换"onclick="this.src+='?tm='+ Math.random();"/></td>
		<td class="hint">*看不清？点击验证码图片可更换</td></tr>
		<tr><td colspan="3">
		<input type="submit" value="注册"class="button"id="submit"/>
		<input type="reset" value="重置"class="button" id="reset"/>
		</td></tr>
		</table>
	</form>
	</div></div>
</body>
</html>