<%@ page language="java" import="java.util.*,java.sql.*,bean.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	DBJavaBean db = new DBJavaBean();
	ResultSet rs = null;
	String option = request.getParameter("op");
	if (option != null &&option.equals("login")) {
		String s_userid = request.getParameter("userid");
		String s_password = request.getParameter("password");
		String s_sql = "select * from userinfo where userid='"+ s_userid + "' and password='"+ s_password +"'";
		rs = db.selectResultSet(s_sql);
		if(rs.next()) {
			session.setAttribute("userid",s_userid);
			session.setAttribute("page","loginsuccessform.jsp");
			String temp = "尊敬的用户”"+s_userid+"“,您好,欢迎光临!!!!";
			temp = java.net.URLEncoder.encode(temp.toString(),"UTF-8");
			String s_src = "img/welcome.gif";
			String s_href = "cust/index.jsp";
			response.sendRedirect("message.jsp?message=" + temp + "&src="+ s_src+"&href="+s_href);
			}else{
				String temp ="对不起，您输入的用户名或密码错误！返回！";
				temp = java.net.URLEncoder.encode(temp.toString(),"UTF-8");
				String s_src = "img/sorry.jpeg";
				String s_href = "javascript:history.go(-1);";
				response.sendRedirect("message.jsp?message=" + temp + "&src="+ s_src+"&href="+s_href);
				}
			}
			if (option != null && option.equals("exit")){
				session.removeAttribute("userid");
				session.removeAttribute("page");
				session.removeAttribute("cart");
				//session.removeAttribute("index.jsp");
				response.sendRedirect("index.jsp");
			}
												
%>
