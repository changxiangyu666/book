<%@ page contentType="text/html; charset=UTF-8"
	errorPage="../error.jsp"%>
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
	String s_name = "";
	String s_linkman = "";
	String s_address = "";
	String s_email = "";
	String s_phone = "";
	String s_website = "";

	String op = request.getParameter("op");
	{
		if (op != null && op.equals("search")) {
			s_name = request.getParameter("name");
			s_linkman = request.getParameter("linkman");
			s_address = request.getParameter("address");
			s_email = request.getParameter("email");
			s_phone = request.getParameter("phone");
			s_website = request.getParameter("website");

			String s_where = "";

			if (!s_name.equals(""))
				s_where += " and name like'%" + s_name + "%' ";

			if (!s_linkman.equals(""))
				s_where += " and linkman like'%" + s_linkman + "%' ";

			if (!s_address.equals(""))
				s_where += " and address like'%" + s_address + "%' ";

			if (!s_email.equals(""))
				s_where += " and email like'%" + s_email + "%' ";

			if (!s_phone.equals(""))
				s_where += " and phone like'%" + s_phone + "%' ";

			if (!s_website.equals(""))
				s_where += " and website like'%" + s_website + "%' ";

			session.setAttribute("s_where", s_where);
			response
					.sendRedirect("publisherlist.jsp?op=show&currentpage=1");
		}

	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
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
		<div align="center">
			<form name="form" action="admin/publishersearch.jsp?op=search"
				method="post">
				<table width="750" border="0" cellspacing="1" cellpadding="1">
					<tr>
						<td>
							<div align="center">
								<jsp:include page="top.jsp"></jsp:include>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div align="center">
								<table width="80%" border="0" cellpadding="1" cellspacing="1"
									class="td">

									<tr>
										<td>
											出版社名
										</td>
										<td>
											<input name="name" type="text" size="25">
										</td>
									</tr>
									<tr>
										<td>
											联系人
										</td>
										<td>
											<input name="linkman" type="text" size="25">
										</td>
									</tr>

									<tr>
										<td>
											联系地址
										</td>
										<td>
											<input name="address" type="text" size="25">
										</td>
									</tr>
									<tr>
										<td>
											E-mail
										</td>
										<td>
											<input name="email" type="text" size="25">
										</td>
									</tr>
									<tr>
										<td>
											电话
										</td>
										<td>
											<input name="phone" type="text" size="25">
										</td>
									</tr>
									<tr>
										<td>
											网址
										</td>
										<td>
											<input name="website" type="text" size="25">
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
		</div>
	</body>
</html>