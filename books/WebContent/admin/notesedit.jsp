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
	String s_id = request.getParameter("id");
	String s_userid = "";
	String s_subject = "";
	String s_date1 = "";
	String s_context = "";
	String s_employeeid = "";
	String s_advice = "";

	String op = request.getParameter("op");
	{
		if (op != null && op.equals("show")) {
			rs = stmt.executeQuery("select * from notes where id='"
					+ s_id + "'");
			rs.next();
			s_userid =rs.getString("userid");
			s_subject =rs.getString("subject");
			s_date1 =rs.getString("date1").substring(0, 10);
			s_context = rs.getString("context");
			s_employeeid = rs.getString("employeeid");
			s_advice = rs.getString("advice");
		}
		if (op != null && op.equals("edit")) {
			s_advice = request.getParameter("advice");

			String s_sql = "update notes set " + " advice='" + s_advice
					+ "' " + ", employeeid='" + s_admin + "' "
					+ ", date2=now() " + "where id='" + s_id + "' ";

			stmt.executeUpdate(s_sql);
			response.sendRedirect("noteslist.jsp");
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
			<form name="form" action="admin/notesedit.jsp?op=edit" method="post">
				<table width="750" border="0" cellspacing="1" cellpadding="1">
					<tr>
						<td>
							<div align="center">
								<jsp:include page="top.jsp" />
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
										<td><%=s_date1%><input name="id" type="hidden"
												value="<%=s_id%>">
										</td>
									</tr>
									<tr>
										<td width="20%">
											用户名
										</td>
										<td><%=s_userid%></td>
									</tr>
									<tr>
										<td>
											主题
										</td>
										<td><%=s_subject%></td>
									</tr>
									<tr>
										<td>
											内容
										</td>
										<td><%=s_context%></td>
									</tr>
									<tr>
										<td>
											处理意见
										</td>
										<td>
											<textarea name="advice" cols="70" rows="10"><%=s_advice%></textarea>
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
