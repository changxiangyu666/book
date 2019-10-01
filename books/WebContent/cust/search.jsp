<%@ page language="java" import="java.util.*,java.sql.*,bean.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
DBJavaBean db=new DBJavaBean();
ResultSet rs=null;
request.setCharacterEncoding("UTF-8");
String s_bookid=request.getParameter("bookid");
String s_bookname=request.getParameter("bookname");
String s_authorname=request.getParameter("author");
String s_pricemin=request.getParameter("pricemin");
String s_pricemax=request.getParameter("pricemax");
String s_publishername=request.getParameter("publisher");
String s_type=request.getParameter("type");
String s_where="";
if(!s_bookid.equals(""))
	s_where+="and bookid like '%"+s_bookid+"%'";
if(!s_bookname.equals(""))
	s_where+="and bookname like '%"+s_bookname+"%'";
if(!s_authorname.equals(""))
	s_where+="and author like '%"+s_authorname+"%'";
if(!s_pricemin.equals(""))
	s_where+="and price>= '"+s_pricemin+"'";
if(!s_pricemax.equals(""))
	s_where+="and price<= '"+s_pricemax+"'";
if(!s_publishername.equals(""))
	s_where+="and name like '%"+s_publishername+"%'";
if(!s_type.equals(""))
	s_where+="and type= '"+s_type+"'";
session.setAttribute("s_where",s_where);
response.sendRedirect("booklist.jsp");
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