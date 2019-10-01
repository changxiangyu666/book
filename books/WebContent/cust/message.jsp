<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() 
					+ ":" + request.getServerPort()	+ path + "/";
	String s_message = request.getParameter("message");
	//s_message = new String(s_message.getBytes("ISO-8859-1"),"UTF-8")是设置URL传参编码的！
	s_message = new String(s_message.getBytes("ISO-8859-1"),"UTF-8");
	String s_src = request.getParameter("src");
	String s_href = request.getParameter("href");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<base href="<%=basePath%>">
		<link rel="stylesheet" type="text/css" href="maincss.css">
</head>
<body>
		<jsp:include page="top.jsp" />
		<table width=750 border=0 align="center" cellspacing=0 cellpadding=0 class=td>
			<tr height=400>
				<td width=100% align="center">
					<img src=<%=s_src %> /><br />
					<a href=<%=s_href %> > <%=s_message%> </a>
				</td>
			</tr>
		</table>
	  <jsp:include page="bottom.jsp" />
	</body>
</html>