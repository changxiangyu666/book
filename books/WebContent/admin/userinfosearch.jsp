<%@ page contentType="text/html; charset=UTF-8" errorPage="../error.jsp"%>
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
	String s_userid = "";
	String s_username = "";
	String s_gender = "";
	String s_address = "";
	String s_email = "";
	String s_phone = "";
	String s_postcode = "";
	String s_state = "";

	String op = request.getParameter("op");
	{
		if (op != null && op.equals("search")) {
			s_userid = request.getParameter("userid");
			s_username = request.getParameter("username");
			s_gender = request.getParameter("gender");
			s_address = request.getParameter("address");
			s_email = request.getParameter("email");
			s_phone = request.getParameter("phone");
			s_postcode = request.getParameter("postcode");
			s_state = request.getParameter("state");

			String s_where = "";

			if (!s_userid.equals(""))
				s_where += " and userid like'%" + s_userid + "%' ";
			if (!s_username.equals(""))
				s_where += " and username like'%" + s_username + "%' ";
			if (!s_gender.equals(""))
				s_where += " and gender like'%" + s_gender + "%' ";
			if (!s_address.equals(""))
				s_where += " and address like'%" + s_address + "%' ";
			if (!s_email.equals(""))
				s_where += " and email like'%" + s_email + "%' ";
			if (!s_phone.equals(""))
				s_where += " and phone like'%" + s_phone + "%' ";
			if (!s_postcode.equals(""))
				s_where += " and postcode like'%" + s_postcode + "%' ";
			if (!s_state.equals(""))
				s_where += " and state like'%" + s_state + "%' ";

			session.setAttribute("s_where", s_where);
			response
					.sendRedirect("userinfolist.jsp?op=show&currentpage=1");
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
			<form name="form" action="admin/userinfosearch.jsp?op=search" method="post">
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
										<td width="20%">
											用户名
										</td>
										<td>
											<input name="userid" type="text" size="25">
										</td>
									</tr>
									<tr>
										<td>
											姓名
										</td>
										<td>
											<input name="username" type="text" size="25">
										</td>
									</tr>
									<tr>
										<td>
											性别
										</td>
										<td>
											<select name="gender">
												<option value="">
													所有
												</option>
												<option value="男">
													男
												</option>
												<option value="女">
													女
												</option>
											</select>
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
											邮编
										</td>
										<td>
											<input name="postcode" type="text" size="25">
										</td>
									</tr>
									<tr>
										<td>
											状态
										</td>
										<td>
											<select name="state">
												<option value="">
													所有
												</option>
												<option value="0">
													未激活
												</option>
												<option value="1">
													激活
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
		</div>
	</body>
</html>