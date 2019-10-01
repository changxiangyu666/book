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
	String s_employeeid = "";
	String s_name = "";
	String s_password = "";
	String s_gender = "";
	String s_address = "";
	String s_email = "";
	String s_phone = "";
	String s_task = "";
	String op = request.getParameter("op");
	{
		if (op != null && op.equals("add")) {
			s_employeeid = request.getParameter("employeeid");
			s_name = request.getParameter("name");
			s_password = request.getParameter("password");
			s_gender = request.getParameter("gender");
			s_address = request.getParameter("address");
			s_email = request.getParameter("email");
			s_phone = request.getParameter("phone");
			s_task = request.getParameter("task");

			String s_sql = "insert into  employee(employeeid,name,password,gender,address,email,phone,task) "
					+ "values('"
					+ s_employeeid
					+ "','"
					+ s_name
					+ "','"
					+ s_password
					+ "','"
					+ s_gender
					+ "','"
					+ s_address
					+ "','"
					+ s_email
					+ "','"
					+ s_phone
					+ "','" + s_task + "')";
			try {
				stmt.executeUpdate(s_sql);
			} catch (Exception e) {
				response.sendRedirect("../error.jsp?error=新建职工出错:"
						+ e.getMessage());
			}
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
			<form name="form" action="admin/employeeadd.jsp?op=add" method="post">
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
										<td>
											<input name="employeeid" type="text" size="25">
										</td>
									</tr>
									<tr>
										<td>
											姓名
										</td>
										<td>
											<input name="name" type="text" size="25">
										</td>
									</tr>
									<tr>
										<td>
											密码
										</td>
										<td>
											<input name="password" type="text" size="25">
										</td>
									</tr>
									<tr>
										<td>
											性别
										</td>
										<td>
											<select name="gender">
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
											工作任务
										</td>
										<td>
											<input name="task" type="text" size="25">
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