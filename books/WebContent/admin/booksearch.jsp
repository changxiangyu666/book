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
	String s_pubdate2 = "";
	String s_price = "";
	String s_price2 = "";
	String s_quantity = "";
	String s_quantity2 = "";
	String s_place = "";
	String s_type = "";
	String op = request.getParameter("op");
	{
		if (op != null && op.equals("search")) {
			s_bookid = request.getParameter("bookid");
			s_bookname = request.getParameter("bookname");
			s_author = request.getParameter("author");
			s_publisherid = request.getParameter("publisherid");
			s_pubdate = request.getParameter("pubdate");
			s_pubdate2 = request.getParameter("pubdate2");
			s_price = request.getParameter("price");
			s_price2 = request.getParameter("price2");
			s_quantity = request.getParameter("quantity");
			s_quantity2 = request.getParameter("quantity2");
			s_place = request.getParameter("place");
			s_type = request.getParameter("type");
			String s_where = "";
			if (!s_bookid.equals(""))
				s_where += " and bookid like'%" + s_bookid + "%' ";
			if (!s_bookname.equals(""))
				s_where += " and bookname like'%" + s_bookname + "%' ";
			if (!s_author.equals(""))
				s_where += " and author like'%" + s_author + "%' ";
			if (!s_publisherid.equals(""))
				s_where += " and book.publisherid ='" + s_publisherid
						+ "' ";
			if (!s_pubdate.equals(""))
				s_where += " and pubdate >='" + s_pubdate + "' ";
			if (!s_pubdate2.equals(""))
				s_where += " and pubdate <='" + s_pubdate2 + "' ";
			if (!s_price.equals(""))
				s_where += " and price >='" + s_price + "' ";
			if (!s_price2.equals(""))
				s_where += " and price <='" + s_price2 + "' ";
			if (!s_quantity.equals(""))
				s_where += " and quantity >='" + s_quantity + "' ";
			if (!s_quantity2.equals(""))
				s_where += " and quantity <='" + s_quantity2 + "' ";
			if (!s_place.equals(""))
				s_where += " and place like '%" + s_place + "%' ";
			if (!s_type.equals(""))
				s_where += " and type ='" + s_type + "' ";
			session.setAttribute("s_where", s_where);
			response.sendRedirect("booklist.jsp?op=show&currentpage=1");
		}
	}
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
		<form name="form" action="admin/booksearch.jsp?op=search" method="post">
			<table align="center" width="750" border="0" cellspacing="1" cellpadding="1">
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
											<option value="">
												所有出版社
											</option>
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
										<input name="pubdate" type="text" size="12" value="">
										至
										<input name="pubdate2" type="text" size="12" value="">
										(格式:2004-09-01)
									</td>
								</tr>
								<tr>
									<td>
										价格
									</td>
									<td>
										<input name="price" type="text" size="5" value="0.00">
										至
										<input name="price2" type="text" size="5" value="1000.00">
									</td>
								</tr>
								<tr>
									<td>
										库存数量
									</td>
									<td>
										<input name="quantity" type="text" size="5" value="">
										至
										<input name="quantity2" type="text" size="5" value="">
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
											<option value="">
												所有类别
											</option>
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
									<td colspan="2">
										<div align="center">
											<input type="submit" value=" 查询 ">
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
						<div align="center">
							<jsp:include page="bottom.jsp" />
						</div>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>