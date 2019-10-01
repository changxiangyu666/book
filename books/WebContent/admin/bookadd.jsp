<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,java.sql.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setCharacterEncoding("UTF-8");
	Class.forName("com.mysql.cj.jdbc.Driver");
	// 2.获取数据的连接对象
	Connection con = DriverManager
			.getConnection("jdbc:mysql://localhost:3306/bookshop?serverTimezone=Asia/Shanghai", "root", "123456");
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
	String s_bookid = "";
	String s_bookname = "";
	String s_author = "";
	String s_publisherid = "";
	String s_pubdate = "";
	String s_price = "";
	String s_quantity = "";
	String s_place = "";
	String s_type = "";
	String s_content = "";
	String op = request.getParameter("op");
			if (op != null && op.equals("add")) {
			s_bookid = request.getParameter("bookid");
			s_bookname = request.getParameter("bookname");
			s_author = request.getParameter("author");
			s_publisherid = request.getParameter("publisherid");
			s_pubdate = request.getParameter("pubdate");
			s_price = request.getParameter("price");
			s_quantity = request.getParameter("quantity");
			s_place = request.getParameter("place");
			s_type = request.getParameter("type");
			s_content = request.getParameter("content");
			s_content = s_content.replaceAll("\n", "<br>");
			s_content = s_content.replaceAll(" ", "&nbsp;");
			String s_sql = "insert into  book(bookid,bookname,author,publisherid,pubdate,price,quantity,place,type,content) "
					+ "values('"
					+ s_bookid
					+ "','"
					+ s_bookname
					+ "','"
					+ s_author
					+ "','"
					+ s_publisherid
					+ "','"
					+ s_pubdate
					+ "','"
					+ s_price
					+ "','"
					+ s_quantity
					+ "','"
					+ s_place
					+ "','"
					+ s_type
					+ "','"
					+ s_content + "')";
			try {
				stmt.executeUpdate(s_sql);
			} catch (Exception e) {
				response.sendRedirect("../error.jsp?error=新建图书出错:"
						+ e.getMessage());
			}
			response.sendRedirect("booklist.jsp");
		}//if

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>">
		<title>My JSP 'index.jsp' starting page</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="maincss.css">
</head>
<body>
	<form name="form" action="admin/bookadd.jsp?op=add" method="post">
		<table  align="center" width="750" border="0" cellspacing="1" cellpadding="1">
			<tr>
				<td>
					<jsp:include page="top.jsp" />
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">
						<table width="80%" border="0" cellpadding="1" cellspacing="1"
							class="td">

							<tr>
								<td width="20%">
									书号
								</td>
								<td>
									<input name="bookid" type="text" size="25">
								</td>
							</tr>
							<tr>
								<td>
									书名
								</td>
								<td>
									<input name="bookname" type="text" size="25">
								</td>
							</tr>
							<tr>
								<td>
									作者
								</td>
								<td>
									<input name="author" type="text" size="25">
								</td>
							</tr>
							<tr>
								<td>
									出版社
								</td>
								<td>
									<select name="publisherid">
										<%
											ResultSet rs2 = stmt.executeQuery("select * from publisher ");
											while (rs2.next()) {
										%>
										<option value="<%=rs2.getString("publisherid")%>"><%=rs2.getString("name")%></option>
										<%
											}
										%>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									出版日期
								</td>
								<td>
									<input name="pubdate" type="text" size="25" value="2004-07-27">
								</td>
							</tr>
							<tr>
								<td>
									价格
								</td>
								<td>
									<input name="price" type="text" size="25" value="0.00">
								</td>
							</tr>
							<tr>
								<td>
									库存数量
								</td>
								<td>
									<input name="quantity" type="text" size="25" value="0">
								</td>
							</tr>
							<tr>
								<td>
									存储位置
								</td>
								<td>
									<input name="place" type="text" size="25">
								</td>
							</tr>
							<tr>
								<td>
									类别
								</td>
								<td>
									<select name="type">
										<option value="0">
											普通
										</option>
										<option value="1">
											新书
										</option>
										<option value="2">
											精品
										</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									内容简介
								</td>
								<td>
									<textarea name="content" cols="70" rows="10"></textarea>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div align="center">
										<input type="submit" value=" 新建 ">
										&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</div>
								</td>
							</tr>

						</table>

					</div>
				</td>
			</tr>
			<tr>
				<td>
					<jsp:include page="bottom.jsp" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>