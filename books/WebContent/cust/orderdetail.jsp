<%@ page language="java" import="java.util.*,java.sql.*,bean.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		//设置相对路径--------------------------------
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() 
	             + ":" + request.getServerPort()+ path + "/";
	request.setCharacterEncoding("UTF-8");
    DBJavaBean db=new DBJavaBean();
    ResultSet rs = null;
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
			<%
			String s_detailid = request.getParameter("detailid");
			rs = db.selectResultSet("select * from orderform where orderid='" + s_detailid + "' order by orderid desc ");
			while (rs.next()) {
				String s_orderid = rs.getString("orderid");
				String s_orderdate = rs.getString("orderdate").substring(0, 10);
				String s_receiver = rs.getString("receiver");
				String s_address = rs.getString("address");
				String s_state = rs.getString("state");
				if (s_state.equals("0"))s_state = "未處理";
				if (s_state.equals("1"))s_state = "已發貨";
				if (s_state.equals("2"))s_state = "完畢";
			%>
			<table width=750 border=0 cellpadding=1 cellspacing=1 class=td align="center" >
				<tr height=50 valign="bottom">
					<td colspan=6 align="center" class=diy>第<%=s_detailid%>订单明细</td>
				</tr>
				<tr>
					<td colspan=6><hr size=3 /></td>
				</tr>
				<tr>
					<td>订单编号: <%=s_orderid%></td>
					<td>收貨人: <%=s_receiver%></td>
					<td>日  期: <%=s_orderdate%></td>
					<td>地  址: <%=s_address%></td>
					<td>訂單狀態:<%=s_state%></td>
				</tr>
					<%}//endwhile	
					rs = db.selectResultSet("select * from orderdetail where orderid='" + s_detailid + "'");
					%>
				<tr>
					<td colspan=6><hr size=1 /></td>
				</tr>
				<tr>
					<td>书号</td>
					<td>书名</td>
					<td>出版社</td>
					<td>单价</td>
					<td>数量</td>
					<td>合计</td>
				</tr>
					<%
					int i_totalnum = 0;
					double d_totalamount = 0.0;
					while (rs.next()) {
						String s_bookid = rs.getString("bookid");
						String s_bookname = rs.getString("bookname");
						String s_publisername = rs.getString("publisher");
						double d_unitprice = rs.getDouble("unitprice");
						int i_ordernum = rs.getInt("ordernum");
						i_totalnum += i_ordernum;
						d_totalamount += d_unitprice * i_ordernum;
					%>
				<tr>
					<td colspan=6><hr size=1 /></td>
				</tr>
				<tr>
					<td>
						<a href="cust/bookdetail.jsp?bookid=<%=s_bookid%>"><%=s_bookid%></a>
					</td>
					<td><%=s_bookname%></td>
					<td><%=s_publisername%></td>
					<td><%=d_unitprice%></td>
					<td><%=i_ordernum%></td>
					<td><%=d_unitprice * i_ordernum%></td>
				</tr>
					<%}//endwhile%>
				<tr>
					<td colspan=6><hr size=1 /></td>
				</tr>
				<tr>
					<td colspan=4 align="right">合计</td>
					<td><%=i_totalnum%>（本）</td>
					<td><%=d_totalamount%>（元）</td>
				</tr>
				<tr>
					<td colspan=6><hr size=3 /></td>
				</tr>
				<tr align="center">
					<td colspan=6>
						<input type="button" value="返回" 
						onclick="javascript:window.location.href='myorder.jsp'" />
					</td>
				</tr>
				<tr height=100>
				</tr>
			</table>
		<jsp:include page="bottom.jsp" />
	</body>
</html>