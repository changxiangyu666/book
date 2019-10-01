<%@ page language="java" import="java.util.*,java.sql.*,bean.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	DBJavaBean db = new DBJavaBean();
	ResultSet rs = null;
	String s_userid = request.getParameter("userid");
	String s_password = request.getParameter("password");
	String s_username = request.getParameter("username");
	String s_gender = request.getParameter("gender");
	String s_address = request.getParameter("address");
	String s_phone = request.getParameter("phone");
	String s_email = request.getParameter("email");
	String s_postcode = request.getParameter("postcode");
	String s_sql = "insert into userinfo(userid,password,username,gender,address,phone,postcode,email,state) values('"
			+ s_userid+ "','"+ s_password+ "','"+ s_username+ "','"+ s_gender+ "','"
			+ s_address+ "','"+ s_phone+ "','"+ s_postcode+ "','"+ s_email+ "','0')";
	if(!db.updateResultSet(s_sql)){
		String temp="对不起，您注册的用户名已被占用，注册失败，返回重新注册！";
		temp=java.net.URLEncoder.encode(temp.toString(),"UTF-8");
		String s_src="img/sorry.jpeg";
		String s_href="javascript:history.go(-1);";
		response.sendRedirect("message.jsp?message="+temp+"&src="+s_src+"&href="+s_href);
	}else{
		String temp="恭喜，注册成功，请记住您的用户名和密码！现在就去登陆！";
		temp=java.net.URLEncoder.encode(temp.toString(),"UTF-8");
		String s_src="img/welcome.gif";
		String s_href="cust/index.jsp";
		response.sendRedirect("message.jsp?message="+temp+"&src="+s_src+"&href="+s_href);
	}
	
%>
