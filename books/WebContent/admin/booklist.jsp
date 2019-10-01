<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
	String s_where = (String) session.getAttribute("s_where");
	if (s_where == null)
		s_where = "";
	int i_totalnum = 0; //总记录数
	int i_pagenum = 5; //一页显示的记录数码
	int i_totalpage = 0; //总页数 
	int i_currentpage = 1; //当前页
	String op = request.getParameter("op");
	if (op == null) {
		s_where = "";
		session.setAttribute("s_where", s_where);
	}

	rs = stmt.executeQuery("select count(*) from book where bookid is not null "
					+ s_where);
	rs.next();
	i_totalnum = rs.getInt(1);
	i_totalpage = i_totalnum / i_pagenum;
	if (i_totalnum % i_pagenum != 0)
		i_totalpage++;
	if (op != null && op.equals("show")) {
		String s_currentpage = request.getParameter("currentpage");
		i_currentpage = Integer.parseInt(s_currentpage);
	}
	if (op != null && op.equals("previous")) {
		String s_currentpage = request.getParameter("currentpage");
		i_currentpage = Integer.parseInt(s_currentpage) - 1;
	}
	if (op != null && op.equals("next")) {
		String s_currentpage = request.getParameter("currentpage");
		i_currentpage = Integer.parseInt(s_currentpage) + 1;
	}
	if (op != null && op.equals("firstpage")) {
		i_currentpage = 1;
	}
	if (op != null && op.equals("lastpage")) {
		i_currentpage = i_totalpage;
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
		<table align="center" width="750"  border="0" cellspacing="0" cellpadding="0">
				<tr valign="top">
					<td>
						<jsp:include page="top.jsp"></jsp:include>
					</td>
				</tr>
				<tr height=20><td></td></tr>
				<tr>
					<td>
						<table width="100%" border="0" cellpadding="0" cellspacing="0"
								class="td">
								<tr>
									<td colspan="2" align="left">
										<a href="admin/bookadd.jsp">新建</a>&nbsp;&nbsp;&nbsp;&nbsp;
										<a href="admin/booksearch.jsp">查询</a>&nbsp;&nbsp;&nbsp;&nbsp;
									</td>
									<td colspan="7" align="right">
										共<%=i_totalpage%>页 第<%=i_currentpage%>页&nbsp;
										<%
											if (i_currentpage > 1) {
										%>
										<a href="admin/booklist.jsp?op=firstpage">首页</a>
										<%
											} else {
										%>首页<%
											}
										%>
										&nbsp;
										<%
											if (i_currentpage > 1) {
										%>
										<a
											href="admin/booklist.jsp?op=previous&currentpage=<%=i_currentpage%>">上一页</a>
										<%
											} else {
										%>上一页<%
											}
										%>
										&nbsp;
										<%
											if (i_currentpage != i_totalpage) {
										%>
										<a href="admin/booklist.jsp?op=next&currentpage=<%=i_currentpage%>">下一页</a>
										<%
											} else {
										%>下一页<%
											}
										%>

										&nbsp;
										<%
											if (i_currentpage != i_totalpage) {
										%>
										<a href="admin/booklist.jsp?op=lastpage">末页</a>
										<%
											} else {
										%>末页<%
											}
										%>

									</td>
								</tr>
								<tr>
									<td colspan="9">
										<hr size="2" color=red>
									</td>
								</tr>
								<%
									if (i_totalnum > 0) {
								%>
								<tr>
									<td>
										书号
									</td>
									<td>
										书名
									</td>
									<td>
										作者
									</td>
									<td>
										出版社
									</td>
									<td>
										价格
									</td>
									<td>
										库存
									</td>
									<td>
										存储位置
									</td>
									<td>
										类别
									</td>
									<td>
										操作
									</td>
								</tr>
								<tr>
									<td colspan="9">
										<hr size="1" color=red>
									</td>
								</tr>
								<%
									rs = stmt
												.executeQuery("select * from book  left join publisher on book.publisherid=publisher.publisherid where bookid is not null "
														+ s_where + " order by bookid ");
										if (i_currentpage > i_totalpage)
											i_currentpage = i_totalpage;

										int i_position = (i_currentpage - 1) * i_pagenum;
										if (i_position == 0)
											rs.beforeFirst();
										else
											rs.absolute(i_position);

										for (int i = 0; i < i_pagenum; i++) {

											if (!rs.isLast()) {
												rs.next();
												String s_bookid = (rs.getString("bookid") != null ? rs
														.getString("bookid") : "");
												String s_bookname = (rs.getString("bookname") != null ? rs
														.getString("bookname")
														: "");
												String s_author = (rs.getString("author") != null ? rs
														.getString("author") : "");
												String s_price = (rs.getString("price") != null ? rs
														.getString("price") : "");
												String s_type = (rs.getString("type") != null ? rs
														.getString("type") : "");
												String s_quantity = (rs.getString("quantity") != null ? rs
														.getString("quantity")
														: "");
												String s_place = (rs.getString("place") != null ? rs
														.getString("place") : "");
												String s_publisherid = (rs.getString("name") != null ? rs
														.getString("name")
														: "");
												if (s_type.equals("0"))
													s_type = "普通";
												if (s_type.equals("1"))
													s_type = "新书";
												if (s_type.equals("2"))
													s_type = "精品";
								%>
								<tr>
									<td>
										<a href="admin/bookedit.jsp?op=show&bookid=<%=s_bookid%>"><%=s_bookid%></a>
									</td>
									<td><%=s_bookname%></td>
									<td><%=s_author%></td>
									<td><%=s_publisherid%></td>
									<td>
										￥<%=s_price%></td>
									<td align="center">
										<%=s_quantity%>
									</td>
									<td><%=s_place%></td>
									<td><%=s_type%></td>
									<td>
										<a
											href="admin/bookdelete.jsp?op=delete&bookid=<%=s_bookid%>&currentpage=<%=i_currentpage%>">删除</a>
									</td>
								</tr>
								<tr>
									<td colspan="9">
										<hr size="1" color=red>
									</td>
								</tr>
								<%
									}//if
										}//for
								%>

								<%
									} else {
								%>
								<tr>
									<td colspan="9">
										没有图书信息.
									</td>
								</tr>
								<%
									}
								%>
					    </table>
					</td>
				</tr>
				<tr height=80><td></td></tr>
				<tr valign="bottom">
					<td>
						<jsp:include page="bottom.jsp" />
					</td>
				</tr>
		 </table>
    </body>
</html>