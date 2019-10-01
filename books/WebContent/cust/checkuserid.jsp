<%@ page language="java" import="java.util.*,java.sql.*,bean.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	DBJavaBean db=new DBJavaBean();
	ResultSet rs = null;//声明结果集rs
	//********************************************************
	/*
	1.获取用户ID
	2.查询用户ID是否存在
	*/	
	String s_userid=request.getParameter("userid");
	s_userid=new String(s_userid.getBytes("ISO-8859-1"),"UTF-8");
	 String s_sql="select userid from userinfo where userid='"+s_userid+"'";
     rs=db.selectResultSet(s_sql);
         
        
	if(!rs.next()){
		String temp = "您注册的"+s_userid+"用户名可以注册！请继续注册。返回！";
		temp = java.net.URLEncoder.encode(temp.toString(), "UTF-8");
		String s_src="img/welcome.gif";
		String s_href="javascript:history.go(-1);";
		response.sendRedirect("message.jsp?message=" + temp +"&src=" + s_src + "&href="+s_href);
	}else{//查询有结果，用户名被占用。
	    String temp = "您注册的"+s_userid+"用户名被占用，请重新填写。返回！";
		temp = java.net.URLEncoder.encode(temp.toString(), "UTF-8");
		String s_src="img/sorry.jpeg";
		String s_href="javascript:history.go(-1);";
		response.sendRedirect("message.jsp?message=" + temp +"&src=" + s_src + "&href="+s_href);
	}
    %>