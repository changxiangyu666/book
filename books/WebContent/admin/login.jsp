<%@ page language="java" import="java.util.*,java.sql.*,bean.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	//使用DBJavaBean链接数据库mysql
	DBJavaBean db = new DBJavaBean();
	//声明结果集rs
	ResultSet rs = null;
    //获取loginform提交表单时，传递的OP变量值
	String s_op = request.getParameter("op");
	//op值为login则开始登陆
	if (s_op != null && s_op.equals("login")) {
		String s_employeeid = request.getParameter("employeeid");
		String s_password = request.getParameter("password");
		String s_sql = "select * from employee where employeeid='" + s_employeeid + "' and password='" + s_password + "' ";
		rs = db.selectResultSet(s_sql);
		//判断是否查询到结果
		if (rs.next()) {//用户合法
			session.setAttribute("admin", s_employeeid);
			response.sendRedirect("booklist.jsp");
		} else {//非法用户
			String temp = "对不起，您输入用户名或密码错误！返回！";
			temp = java.net.URLEncoder.encode(temp.toString(), "UTF-8");
			response.sendRedirect("error.jsp?errormessage=" + temp);
		}
	}
	//op值为exit则开始注销
	if (s_op != null && s_op.equals("exit")) {
		session.removeAttribute("admin");
		response.sendRedirect("index.jsp");
	}
%>