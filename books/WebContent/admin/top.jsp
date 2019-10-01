<%@ page language="java" import="java.util.*,java.text.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	Calendar now = Calendar.getInstance();//建立日期实例now
	SimpleDateFormat formatnow = new SimpleDateFormat(//建立日期格式化实例formatnow
			"yyyy'年'MM'月'dd'日'");
	String s_today = formatnow.format(now.getTime());//建立日期串s_today
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
		<table width=750 border=0 align="center" cellspacing=0 cellpadding=0
			class=td>
			<tr>
				<td height=59 background="img/top_r0.jpg" colspan=13></td>
			</tr>
			<tr>
				<td bgcolor=#f1f1f1 colspan=11>
					<img src="img/top_r2.jpg" />
					今天是<%=s_today%>，欢迎光临！
					<a href="admin/login.jsp?op=exit">注销</a>
				</td>
			</tr>
			<tr>
				<td align="center">
					<a href="admin/booklist.jsp"><img src="img/adin_r1.gif"
							border=0 /> </a>
				</td>
				<td align="center">
					<a href="admin/userinfolist.jsp"><img src="img/adin_r2.gif"
							border=0 /> </a>
				</td>
				<td align="center">
					<a href="admin/orderlist.jsp"><img src="img/adin_r3.gif"
							border=0 /> </a>
				</td>
				<td align="center">
					<a href="admin/noteslist.jsp"><img src="img/adin_r4.gif"
							border=0 /> </a>
				</td>
				<td align="center">
					<a href="admin/employeelist.jsp"><img src="img/adin_r5.gif"
							border=0 /> </a>
				</td>
				<td align="center">
					<a href="admin/publisherlist.jsp"><img src="img/adin_r6.gif"
							border=0 /> </a>
				</td>
			</tr>
			<tr bgcolor=#676767 height=5>
				<td colspan=13></td>
			</tr>
			<tr bgcolor=#fc7500 height=20>
				<td colspan=13></td>
			</tr>
		</table>
	</body>
</html>