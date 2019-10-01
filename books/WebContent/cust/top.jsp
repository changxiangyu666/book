<%@ page language="java" import="java.util.*,java.text.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
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
		<table width=750 border=0 align=center class=td cellspacing=0 cellpadding=0 >
			<tr>
				<td colspan=13 height=59 background=img/top_r0.jpg></td>
			</tr>
			<tr>
				<td colspan=3 bgcolor=#f1f1f1>
					<img src=img/top_r2.jpg />
				</td>
				<td colspan=10 bgcolor=#f1f1f1 align=right>
					<%
						Calendar now = Calendar.getInstance();
						SimpleDateFormat formatnow = new SimpleDateFormat(
								"yyyy'年'MM'月'dd'日'");
						String s_today = formatnow.format(now.getTime());
					%>
					今天是<%=s_today%>，欢迎光临！
				</td>
			</tr>
			<tr>
				<td align=center>
					<a href=cust/index.jsp><img src=img/indexbutton.jpg border=0 /></a>
				</td>
				<td align=center>
					<a href=cust/excellent.jsp><img src=img/jingpinbn.jpg border=0 /></a>
				</td>
				<td align=center>
					<a href=cust/newbook.jsp><img src=img/newbookbn.jpg border=0 /></a>
				</td>
				<td align=center>
					<a href=cust/booksearchform.jsp><img src=img/findbn.jpg border=0 /></a>
				</td>
				<td align=center>
					<a href=cust/myorder.jsp><img src=img/mybn.jpg border=0 /> </a>
				</td>
				<td align=center>
					<a href=cust/shoppingcart.jsp><img src=img/buybn.jpg border=0 /></a>
				</td>
				<td align=center>
					<a href=cust/leavewords.jsp><img src=img/liuyanbn.jpg border=0 /></a>
				</td>
			</tr>
			<tr bgcolor=#676767 height=4>
				<td colspan=13></td>
			</tr>
			<tr bgcolor=#fc7500 height=20>
				<td colspan=13></td>
			</tr>
		</table>
	</body>
</html>