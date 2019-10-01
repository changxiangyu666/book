<%@ page language="java" import="java.util.*,java.sql.*,bean.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
request.setCharacterEncoding("UTF-8");
DBJavaBean db=new DBJavaBean();
ResultSet rs=null;
String s_userid=(String)session.getAttribute("userid");
String s_subject=request.getParameter("subject");
String s_context=request.getParameter("context");
String s_sql="insert into notes(userid,subject,date1,context) values('"+s_userid+"','"+s_subject+"',now(),'"+s_context+"')";
db.updateResultSet(s_sql);
response.sendRedirect("leavewords.jsp");
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>