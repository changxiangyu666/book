<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>">

		<title>My JSP 'index.jsp' starting page</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
</head>
<body background=img/5-1.jpg>
		<table align=center>
			<tr>
				<td colspan=2>
					<img src=img/5.jpg border=0 />
				</td>
			</tr>
			<tr>
				<td align=center>
					<a href=cust/index.jsp><img src=img/5-2.jpg border=0 /> </a>
				</td>
				<td align=center>
					<a href=admin/index.jsp><img src=img/5-3.jpg border=0 /> </a>
				</td>
			</tr>
		</table>
	</body>
</html>