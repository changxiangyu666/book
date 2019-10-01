<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="maincss.css">
</head>
<%
	String s_userid=(String)session.getAttribute("userid");
	if(s_userid==null)response.sendRedirect("index.jsp");
	%>
	<body>
		<table width=100% border=0 bgcolor=#f6f6f6 class=td>
			<tr><td><%=s_userid %>，您好！欢迎光临网上书店...</td></tr>
			<tr><td><a href="cust/passwordeditform.jsp">修改登录密码</a></td></tr>
			<tr><td><a href="cust/userinfoeditform.jsp">维护个人信息</a></td></tr>
			<tr><td><a href="cust/myorder.jsp">查看历史订单</a></td></tr>
			<tr><td><a href="cust/shoppingcart.jsp">查看购物车</a></td></tr>
			<tr><td><a href="cust/leavewords.jsp">给管理员留言</a></td></tr>
			<tr><td><a href="cust/login.jsp?op=exit">注销退出</a></td></tr>
		</table>
	</body>
</html>