<%@ page contentType="text/html; charset=UTF-8"%>
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
	String s_employeeid = request.getParameter("employeeid");
	String s_name = "";
	String s_password = "";
	String s_gender = "";
	String s_address = "";
	String s_email = "";
	String s_phone = "";
	String s_task = "";

	String op = request.getParameter("op");
	{
		if (op != null && op.equals("show")) {
			rs = stmt
					.executeQuery("select * from employee where employeeid='"
							+ s_employeeid + "'");
			rs.next();
			s_name = (rs.getString("name") != null ? rs
					.getString("name") : "");
			s_password = (rs.getString("password") != null ? rs
					.getString("password") : "");
			s_gender = (rs.getString("gender") != null ? rs
					.getString("gender") : "");
			s_address = (rs.getString("address") != null ? rs
					.getString("address") : "");
			s_email = (rs.getString("email") != null ? rs
					.getString("email") : "");
			s_phone = (rs.getString("phone") != null ? rs
					.getString("phone") : "");
			s_task = (rs.getString("task") != null ? rs
					.getString("task") : "");

		}
		if (op != null && op.equals("edit")) {
			s_name = request.getParameter("name");
			s_password = request.getParameter("password");
			s_gender = request.getParameter("gender");
			s_address = request.getParameter("address");
			s_email = request.getParameter("email");
			s_phone = request.getParameter("phone");
			s_task = request.getParameter("task");

			String s_sql = "update employee set " + "name='" + s_name
					+ "' " + ",password='" + s_password + "' "
					+ ",gender='" + s_gender + "' " + ",address='"
					+ s_address + "' " + ",email='" + s_email + "' "
					+ ",phone='" + s_phone + "' " + ",task='" + s_task
					+ "' " + "where employeeid='" + s_employeeid + "' ";

			stmt.executeUpdate(s_sql);
			response.sendRedirect("employeelist.jsp");
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
			<form name="form" action="admin/employeeedit.jsp?op=edit" method="post">
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
											职工帐号
										</td>
										<td><%=s_employeeid%><input name="employeeid"
												type="hidden" value="<%=s_employeeid%>">
										</td>
									</tr>
									<tr>
										<td>
											姓名
										</td>
										<td>
											<input name="name" type="text" size="25" value="<%=s_name%>">
										</td>
									</tr>
									<tr>
										<td>
											密码
										</td>
										<td>
											<input name="password" type="text" size="25"
												value="<%=s_password%>">
										</td>
									</tr>
									<tr>
										<td>
											性别
										</td>
										<td>
											<select name="gender">
												<option value="男"
													<%=(s_gender.equals("男") ? " selected " : "")%>>
													男
												</option>
												<option value="女"
													<%=(s_gender.equals("女") ? " selected " : "")%>>
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
											<input name="address" type="text" size="25"
												value="<%=s_address%>">
										</td>
									</tr>
									<tr>
										<td>
											E-mail
										</td>
										<td>
											<input name="email" type="text" size="25"
												value="<%=s_email%>">
										</td>
									</tr>
									<tr>
										<td>
											电话
										</td>
										<td>
											<input name="phone" type="text" size="25"
												value="<%=s_phone%>">
										</td>
									</tr>
									<tr>
										<td>
											工作任务
										</td>
										<td>
											<input name="task" type="text" size="25" value="<%=s_task%>">
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<div align="center">
												<input type="submit" value=" 修改 ">
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="reset" value=" 重置 ">
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