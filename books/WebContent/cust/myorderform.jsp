<%@ page language="java" import="java.util.*,java.sql.*,bean.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//设置相对路径--------------------------------
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() 
	             + ":" + request.getServerPort()+ path + "/";
	//*******************************************         
	request.setCharacterEncoding("UTF-8");
	DBJavaBean db = new DBJavaBean();
	ResultSet rs = null;
	String s_userid = (String) session.getAttribute("userid");
	if (s_userid == null) {
		String temp = "对不起，您还未登录，不能查看我的订单。返回！";
		temp = java.net.URLEncoder.encode(temp.toString(), "UTF-8");
		String s_src = "img/sorry.jpeg";
		String s_href = "javascript:history.go(-1);";
		response.sendRedirect("message.jsp?message=" + temp+"&src="+s_src+"&href="+s_href);
		return;
	}
 %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<base href="<%=basePath%>">
		<link rel="stylesheet" type="text/css" href="maincss.css">
</head>
<body>
		<jsp:include page="top.jsp" />
		<table width=750 border=0 align="center" cellspacing=1 cellpadding=1 class=td >
			<tr>
				<td height=40 colspan=8 valign="middle" align="center" class=diy >
					我 的 订 单</td>
			</tr>
			<%
			int i_count=Integer.parseInt(request.getParameter("count"));
			int i_totalpage=Integer.parseInt(request.getParameter("totalpage"));
			int i_pagenum=Integer.parseInt(request.getParameter("pagenum"));
			int i_currentpage=Integer.parseInt(request.getParameter("currentpage"));
			%>
			<tr>
				<td colspan=4  align="left">
					您的订单共计 <%=i_count%> 条，分 <%=i_totalpage%> 页显示，每页显示 <%=i_pagenum%> 条
				</td>
				<td colspan=4 align="right">
					   	第<%=i_currentpage%>页&nbsp;
						<!---------------------首页--------------------------->
						<%if (i_currentpage > 1) {%>
						<a href="cust/myorder.jsp?op=fistpage">首页</a>
						<%} else {%>
						首页&nbsp;
						<%}%>
						<!-------------------上一页--------------------------->
						<%if (i_currentpage > 1) {%>
						<a href="cust/myorder.jsp?op=previous&currentpage=<%=i_currentpage%>">上一页</a>
						<%} else {%>
						上一页&nbsp;
						<%}%>
						<!-------------------下一页--------------------------->
						<%if (i_currentpage != i_totalpage) {%>
						<a href="cust/myorder.jsp?op=next&currentpage=<%=i_currentpage%>">下一页</a>
						<%} else {%>
						下一页&nbsp;
						<%}%>
						<!-------------------末页--------------------------->
						<%if (i_currentpage != i_totalpage) {%>
						<a href="cust/myorder.jsp?op=lastpage">末页</a>
						<%} else {%>
						末页&nbsp;
						<%}%>
				</td>
			</tr>
			<tr>
				<td colspan=8><hr size=2 width=100% /></td>
			</tr>
			<tr>
				<td>序号</td>
				<td>订单号</td>
				<td>日期</td>
				<td>收货人</td>
				<td>地址</td>
				<td>图书总数</td>
				<td>总价</td>
				<td>订单状态</td>
			</tr>
			<tr>
				<td colspan=8><hr size=1 width=100% /></td>
			</tr>
			<%
				rs = db.selectResultSet("select * from orderform where userid='"
							+ s_userid + "' order by orderid desc ");
					//翻页时显示记录的逻辑---------------------
					if (i_currentpage > i_totalpage) {
						i_currentpage = i_totalpage;
					}
					int i_position = (i_currentpage - 1) * i_pagenum;
					if (i_position == 0) {
						rs.beforeFirst();
					} else {
						rs.absolute(i_position);
					}
					//翻页时显示记录的逻辑--------------------------
					for (int i = 0; i < i_pagenum; i++) {
						if (!rs.isLast()) {
							rs.next();
							String s_orderid = rs.getString("orderid");
							String s_orderdate = rs.getString("orderdate").substring(0, 10);
							String s_totalnum = rs.getString("totalnum");
							String s_totalamount = rs.getString("totalamount");
							String s_receiver = rs.getString("receiver");
							String s_address = rs.getString("address");
							String s_state = rs.getString("state");
							if (s_state.equals("0"))s_state = "未处理";
							if (s_state.equals("1"))s_state = "已发货";
							if (s_state.equals("2"))s_state = "完成";
			%>
			<tr height=10>
				<td><%=i + 1 + (i_currentpage - 1) * i_pagenum%></td>
				<td>
					<a href="cust/orderdetail.jsp?detailid=<%=s_orderid%>"><%=s_orderid%></a>
				</td>
				<td><%=s_orderdate%></td>
				<td><%=s_receiver%></td>
				<td><%=s_address%></td>
				<td><%=s_totalnum%></td>
				<td><%=s_totalamount%></td>
				<td><%=s_state%></td>
			</tr>
			<tr>
				<td colspan=8><hr size=1 color=#f6f6f6 /></td>
			</tr>
			<%}//if
			}//endfor%>
			<tr>
				<td colspan=8><hr size=2 width=100% /></td>
			</tr>
		</table>
		<jsp:include page="bottom.jsp" />
	</body>
</html>