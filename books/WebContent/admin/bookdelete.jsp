<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*"%>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
// 2.获取数据的连接对象
Connection con = DriverManager
		.getConnection("jdbc:mysql://localhost:3306/bookshop?serverTimezone=Asia/Shanghai", "root", "123456");
	Statement stmt = con.createStatement(
			ResultSet.TYPE_SCROLL_INSENSITIVE,
			ResultSet.CONCUR_READ_ONLY);
	ResultSet rs = null;
	String s_admin = (String) session.getAttribute("admin");
	if (s_admin == null) {
		response.sendRedirect("checklogin.jsp");
	}
	String s_currentpage = request.getParameter("currentpage");
	String s_bookid = request.getParameter("bookid");
	stmt.executeUpdate("delete from book where bookid='" + s_bookid
			+ "'");
	response.sendRedirect("booklist.jsp?op=show&currentpage="
			+ s_currentpage);
%>