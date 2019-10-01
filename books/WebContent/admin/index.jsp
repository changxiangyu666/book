<%@ page language="java" import="java.util.*,java.sql.*,bean.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<base href="<%=basePath%>">
		<link href="maincss.css" rel="stylesheet" type="text/css">
</head>
<body background="img/admin1.gif">
		<form name="loginform" action="admin/login.jsp?op=login" method="post">
			<table width=100 border=0 cellpadding="2" cellspacing="2" class="td"
				align=center>
				<tr height=100 >
				</tr>
				<tr>
					<td colspan="2">
						<img src="img/adin_r1.jpg" width=160 border=0>
					</td>
				</tr>
				<tr align=center>
					<td width="25%" align=left>
						用户名
					</td>
					<td>
						<input name="employeeid" type="text" size="15" class=td>
					</td>
				</tr>
				<tr align=center>
					<td width="25%" align=left>
						密码
					</td>
					<td>
						<input name="password" type="password" size="15" class=td>
					</td>
				</tr>
				<tr align="center">
					<td colspan=2>
						<input type="submit" value="登录 ">
						<input type="reset" value="重置" />
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>