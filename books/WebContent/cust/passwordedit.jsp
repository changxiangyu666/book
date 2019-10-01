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
if(s_userid==null)response.sendRedirect("index.jsp");
String s_password=request.getParameter("password");
String s_sql="update userinfo set password='"+s_password+"' where userid='"+s_userid+"' ";
try{
	db.updateResultSet(s_sql);
	String temp="尊敬的用户“"+s_userid+"”,您的密码修改成功，返回首页！";
	temp=java.net.URLEncoder.encode(temp.toString(),"UTF-8");
	String s_src="img/welcome.gif";
	String s_href="cust/index.jsp";
	response.sendRedirect("message.jsp?message="+temp+"&src="+s_src+"&href="+s_href);
	
}catch(Exception e){
	String temp="尊敬的用户“"+s_userid+"”,您的密码修改失败，返回！";
	temp=java.net.URLEncoder.encode(temp.toString(),"UTF-8");
	String s_src="img/sorry.jpeg";
	String s_href="javascript:history.go(-1);";
	response.sendRedirect("message.jsp?message="+temp+"&src="+s_src+"&href="+s_href);
}

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