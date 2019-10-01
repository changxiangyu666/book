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
	String s_userid = "";
	String s_date1 = "";
	String s_date1end = "";
	String s_date2 = "";

	String op = request.getParameter("op");
	{

		if (op != null && op.equals("search")) {
			s_userid = request.getParameter("userid");
			s_date1 = request.getParameter("date1");
			s_date1end = request.getParameter("date1end");
			s_date2 = request.getParameter("date2");

			String s_where = "";

			if (!s_userid.equals(""))
				s_where += " and userid like'%" + s_userid + "%' ";

			if (!s_date1.equals(""))
				s_where += " and date1 >='" + s_date1 + "' ";
			if (!s_date1end.equals(""))
				s_where += " and date1 <='" + s_date1end + "' ";

			if (!s_date2.equals("") && s_date2.equals("已处理"))
				s_where += " and date2 is not null ";
			if (!s_date2.equals("") && s_date2.equals("未处理"))
				s_where += " and date2 is null ";

			session.setAttribute("s_where", s_where);
			response
					.sendRedirect("noteslist.jsp?op=show&currentpage=1");
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
			<form name="form" action="admin/notessearch.jsp?op=search" method="post">
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
											留言日期
										</td>
										<td>
											<input name="date1" type="text" size="12" value="">
											至
											<input name="date1end" type="text" size="12" value="">
											(格式:2004-09-01)
										</td>
									</tr>
									<tr>
										<td width="20%">
											留言人
										</td>
										<td>
											<input name="userid" type="text" size="20" value="">
										</td>
									</tr>
									<tr>
										<td>
											类型
										</td>
										<td>
											<select name="date2">
												<option value="">
													所有
												</option>
												<option value="已处理">
													已处理
												</option>
												<option value="未处理">
													未处理
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
								<jsp:include page="bottom.jsp"></jsp:include>
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>