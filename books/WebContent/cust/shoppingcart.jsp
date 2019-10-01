<%@ page language="java" import="bean.*,java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//设置相对路径--------------------------------
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() 
	             + ":" + request.getServerPort()+ path + "/";
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
		<table width=750 border=0 align="center" cellspacing=1 cellpadding=1
			class=td>
			<tr>
				<td colspan=7 height=40 colspan=8 valign="middle" align="center"
					class=diy>
					购 物 车
				</td>
			</tr>
			<tr>
				<td colspan=7>
					<hr size=2 width=100% />
				</td>
			</tr>
			<%
				int i_totalnum=0;
				double d_totalamount=0.0;
				Collection c_cart=(Collection)session.getAttribute("cart");//购物车对象
				Iterator it=null;
				if (c_cart != null && c_cart.size() > 0) {//车里有商品
			%>
			<tr>
				<td>
					书号
				</td>
				<td>
					书名
				</td>
				<td>
					出版社
				</td>
				<td>
					单价
				</td>
				<td>
					数量（本）
				</td>
				<td>
					合计
				</td>
				<td>
					操作
				</td>
			</tr>
			<%
				it=c_cart.iterator();
				while(it.hasNext()){
					cartBean cbean=(cartBean)(it.next());
					i_totalnum+=cbean.ordernum;
					d_totalamount+=cbean.subtotal;
			%>
			<tr>
				<td height=19>
					<a href="cust/bookdetail.jsp?bookid=<%=cbean.bookid%>"><%=cbean.bookid%></a>
				</td>
				<td><%=cbean.bookname%></td>
				<td><%=cbean.publishername%></td>
				<td>
					￥<%=cbean.unitprice%></td>
				<td>
					<input type=text size=5 readonly value=<%=cbean.ordernum%> />
					&nbsp;
					<input type=button value="+"
						onclick="javascript:window.location.href='cust/increasecart.jsp?bookid=<%=cbean.bookid%>'" />
					<input type=button value="-"
						onclick="javascript:window.location.href='cust/decreasecart.jsp?bookid=<%=cbean.bookid%>'" />
				</td>
				<td>
					￥<%=cbean.subtotal%></td>
				<td>
					<a href="cust/delfromcart.jsp?bookid=<%=cbean.bookid%>">取消</a>
				</td>
			</tr>
			<%}//whileend%>
			<tr>
				<td colspan=4 align="right">
					合计
				</td>
				<td><%=i_totalnum%>(本)
				</td>
				<td colspan=2>
					￥<%=d_totalamount%>(元)
				</td>
			</tr>
			<tr>
				<td colspan=7 align="center">
					<input type="button" value="清空购物车"
						onclick="javascript:window.location.href='cust/clearcart.jsp'" />
					<input type="button" value="继 续 购 物"
						onclick="javascript:window.location.href='cust/index.jsp'" />
					<input type="button" value="去 收 银 台"
						onclick="javascript:window.location.href='cust/orderform.jsp'" />
				</td>
			</tr>
			<%} else {//车位空%>
			<tr>
				<td colspan=7 align="center">
					您的购物车为空！
				</td>
			</tr>
			<%}%>
		</table>
		<jsp:include page="bottom.jsp" />
	</body>
</html>