<%@ page language="java" import="java.sql.*,java.util.*,bean.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setCharacterEncoding("gb2312");
	//使用DBJavaBean链接数据库mysql
	DBJavaBean db = new DBJavaBean();
	//声明结果集rs
	ResultSet rs = null;
	//------------------------------------------------------------
	String s_userid = (String) session.getAttribute("userid");
	//------------------------------------------------------------
	int i_totalnum = 0;//结果总数
	int i_pagenum = 5;//每页书数量
	int i_totalpage = 0;//总页数
	int i_currentpage = 1;//当前页数
	String s_createid = "";
	String s_subject = "";
	String s_date1 = "";
	String s_context = "";
	String s_date2 = "";
	String s_employeeid = "";
	String s_advice = "";
	//-------------------------------------------------------
	rs = db.selectResultSet("select count(*) from notes ");
	rs.next();
	i_totalnum = rs.getInt(1);
	i_totalpage = i_totalnum / i_pagenum;
	if (i_totalnum % i_pagenum != 0) {//如果有余数，则加一页
		i_totalpage++;
	}
	String op = request.getParameter("op");

	if (op != null && op.equals("show")) {//前页为show
		String s_currentpage = request.getParameter("currentpage");
		i_currentpage = Integer.parseInt(s_currentpage);
	}
	if (op != null && op.equals("previous")) {//先前，前一页
		String s_currentpage = request.getParameter("currentpage");
		i_currentpage = Integer.parseInt(s_currentpage) - 1;
	}
	if (op != null && op.equals("next")) {//下一页
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
<title>Insert title here</title>
<base href="<%=basePath%>">
		<link rel="stylesheet" type="text/css" href="maincss.css">
		<script type="text/javascript">
function checksubmit() {
	if (document.form.subject.value == "") {
		alert("请您输入留言主题！");
		document.form.subject.focus();
		return false;
	}
	if (document.form.context.value == "") {
		alert("请您输入留言内容！");
		document.form.context.focus();
		return false;
	}
	if (document.form.context.value.length >= 100) {
		alert("您收入的内容长度超过100个字！");
		document.form.context.focus();
		return false;
	}
	return true;
}
</script>
</head>
<body>
		<jsp:include page="top.jsp" />
		<form name=form action=cust/leavewords2.jsp method=post>
			<table width=750 border=0 align="center" cellspacing=0 cellpadding=0
				class=td>
				<tr>
					<td class=diy colspan=6 align="center">
						用户留言
					</td>
				</tr>
				<tr>
					<td colspan=6>
						<hr size=3 color=red />
					</td>
				</tr>
				<tr>
					<td colspan=3>
						用户留言共计<%=i_totalnum%>条，分<%=i_totalpage%>页显示，每页显示<%=i_pagenum%>条
					</td>
					<td colspan=3>
						<div align="right">

							第<%=i_currentpage%>页&nbsp;
							<!---------------------首页--------------------------->
							<%
								if (i_currentpage > 1) {
							%>
							<a href="cust/leavewords.jsp?op=fistpage">首页</a>
							<%
								} else {
							%>
							首页&nbsp;
							<%
								}
							%>
							<!-------------------上一页--------------------------->
							<%
								if (i_currentpage > 1) {
							%>
							<a
								href="cust/leavewords.jsp?op=previous&currentpage=<%=i_currentpage%>">上一页</a>
							<%
								} else {
							%>
							上一页&nbsp;
							<%
								}
							%>
							<!-------------------下一页--------------------------->
							<%
								if (i_currentpage != i_totalpage) {
							%>
							<a
								href="cust/leavewords.jsp?op=next&currentpage=<%=i_currentpage%>">下一页</a>
							<%
								} else {
							%>
							下一页&nbsp;
							<%
								}
							%>
							<!-------------------末页--------------------------->
							<%
								if (i_currentpage != i_totalpage) {
							%>
							<a href="cust/leavewords.jsp?op=lastpage">末页</a>
							<%
								} else {
							%>
							末页&nbsp;
							<%
								}
							%>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan=6>
						<hr size=1 noshade="noshade" color=red />
					</td>
				</tr>
				<tr>
					<td width=10%>
						留言日期
					</td>
					<td width=10%>
						留言人
					</td>
					<td width=15%>
						主题
					</td>
					<td width=25%>
						内容
					</td>
					<td width=10%>
						处理日期
					</td>
					<td width=30%>
						处理意见
					</td>
				</tr>
				<tr>
					<td colspan=6>
						<hr size=1 noshade="noshade" color=red />
					</td>
				</tr>
				<%
					rs = db.selectResultSet("select * from notes order by date1 desc");
					//翻页时显示记录的逻辑-----------------------
					if (i_currentpage > i_totalpage) {
						i_currentpage = i_totalpage;
					}
					int i_position = (i_currentpage - 1) * i_pagenum;
					if (i_position == 0) {
						rs.beforeFirst();
					} else {
						rs.absolute(i_position);
					}
					//翻页时显示记录的逻辑-------------------------
					for (int i = 1; i <= i_pagenum; i++) {
						if (!rs.isLast()) {
							rs.next();
							s_createid = (rs.getString("userid") != null ? rs
									.getString("userid") : "");
							s_subject = (rs.getString("subject") != null ? rs
									.getString("subject") : "");
							s_date1 = (rs.getString("date1") != null ? rs.getString(
									"date1").substring(0, 10) : "");
							s_context = (rs.getString("context") != null ? rs
									.getString("context") : "");
							s_employeeid = (rs.getString("employeeid") != null ? rs
									.getString("employeeid") : "");
							s_date2 = (rs.getString("date2") != null ? rs.getString(
									"date2").substring(0, 10) : "未处理");
							s_advice = (rs.getString("advice") != null ? rs
									.getString("advice") : "[请等待工作人员处理]");
				%>
				<tr height=30>
					<td><%=s_date1%></td>
					<td><%=s_createid%></td>
					<td><%=s_subject%></td>
					<td><%=s_context%></td>
					<td><%=s_date2%></td>
					<td><%=s_advice%></td>
				</tr>
				<%
					}
				}
				%>
				<%
					if (s_userid != null) {
				%>
				<tr>
					<td colspan=6>
						<hr size=1 noshade="noshade" color=red />
					</td>
				</tr>
				<tr>
					<td align="center">
						主题
					</td>
					<td colspan=5>
						<input type=text name=subject size=25 />
					</td>
				</tr>

				<tr>
					<td align="center">
						留言
					</td>
					<td colspan=5>
						<textarea name=context cols=70 rows=10></textarea>
					</td>
				</tr>
				<tr>
					<Td>
						&nbsp;
					</Td>
				</tr>
				<tr>
					<td colspan=6 align="center">
						<input name=submit type="submit" value=留言
							onclick="return checksubmit();" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" value=重置 />
					</td>
				</tr>
				<%
					} else {
				%>
				<tr>
					<td colspan=6>
						<hr size=1 noshade="noshade" color=red />
					</td>
				</tr>
				<tr>
					<td colspan=6 align="center">
						您还没有登录，不能发表留言！请
						<a href="cust/index.jsp">登录</a>
					</td>
				</tr>
				<%
					}
				%>
			</table>
		</form>
		<jsp:include page="bottom.jsp" />
	</body>
</html>