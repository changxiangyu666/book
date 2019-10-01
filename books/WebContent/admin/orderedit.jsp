<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*,java.sql.*"%>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
// 2.获取数据的连接对象
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookshop?serverTimezone=Asia/Shanghai", "root", "123456");
	Statement stmt = con.createStatement(
			ResultSet.TYPE_SCROLL_INSENSITIVE,
			ResultSet.CONCUR_READ_ONLY);
	ResultSet rs = null;
    //-----为确保后台信息管理安全，切换页面都需要验证身份--------------------------
	String s_admin = (String) session.getAttribute("admin");
	if (s_admin == null) {
		String temp = "对不起，您还没有登录，不能使用此模块！";
		temp = java.net.URLEncoder.encode(temp.toString(), "UTF-8");
		response.sendRedirect("error.jsp?errormessage=" + temp);
	}
	//-------------------------------------------------------------------
	String s_currentpage = request.getParameter("currentpage");
	String s_orderid = request.getParameter("orderid");
	String s_state = request.getParameter("state");
	stmt.executeUpdate("update orderform set state='" + s_state
			+ "' where orderid='" + s_orderid + "'");
	rs = stmt.executeQuery("select * from orderdetail where orderid='"
			+ s_orderid + "' ");
	while (rs.next()) {
		String s_bookid = rs.getString("bookid");
		int i_ordernum = rs.getInt("ordernum");
		Statement stmt2 = con.createStatement(
				ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_READ_ONLY);
		stmt2.executeUpdate("update book set quantity=quantity-"
				+ i_ordernum + " where bookid='" + s_bookid + "'");
	}
	response.sendRedirect("orderlist.jsp?op=show&currentpage="
			+ s_currentpage);
%>