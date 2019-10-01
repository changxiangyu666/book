<%@ page language="java" import="bean.*,java.sql.*,java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    //设置相对路径--------------------------------
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() 
	             + ":" + request.getServerPort()+ path + "/";
    String s_userid=(String)session.getAttribute("userid");
    if(s_userid==null){
      response.sendRedirect("index.jsp");
      return;
    }

    DBJavaBean db=new DBJavaBean();
    ResultSet rs = null;
    String s_orderid=request.getParameter("orderid");
    String s_sql="select * from orderform where orderid="+s_orderid;
    rs=db.selectResultSet(s_sql);
    rs.next();
    String s_payment=rs.getString("payment");
    String s_receiver=rs.getString("receiver");
    String s_deliver=rs.getString("deliver");
    String s_address=rs.getString("address");
    String s_phone=rs.getString("phone");
    String s_postcode=rs.getString("postcode");
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
		<table width=750 border=0 align="center" cellspacing=0 cellpadding=0 class=td>
			<tr height=30>
				<td colspan=6 align="center">
					您已经成功下单,下面是您这次订单的详细信息，请您尽快付款，我们的工作人员会及时与您联系发货。
				</td>
			</tr>
			<tr height=30>
				<td colspan=6><hr size=3 /></td>
			</tr>
			<tr height=30>
				<td colspan=6 align="left">订单号：<%=s_orderid%></td>
			</tr>
			<tr height=30>
				<td colspan=3>收货人：<%=s_receiver%>&nbsp;&nbsp;</td>
				<td colspan=3>地址：<%=s_address%>&nbsp;&nbsp;</td>
			</tr>
			<tr height=30>
				<td colspan=3>邮编：<%=s_postcode%>&nbsp;&nbsp;</td>
				<td colspan=3>联系电话：<%=s_phone%>&nbsp;&nbsp;</td>
			</tr>
			<tr height=30>
				<td colspan=6><hr size=3 /></td>
			</tr>
			<%
           int i_totalnum=0;
           double d_totalamount=0.0;
           Collection c_cart=(Collection)session.getAttribute("cart");
           c_cart=(Collection)session.getAttribute("cart");
           if(c_cart!=null && c_cart.size()>0){//车里有商品
           %>
			<tr height=30>
				<td>书号</td>
				<td>书名</td>
				<td>出版社</td>
				<td>单价</td>
				<td>数量（本）</td>
				<td>合计</td>
			</tr>
			<%
           Iterator it=null;
           it=c_cart.iterator();
           while(it.hasNext()){
              cartBean cbean=(cartBean)(it.next());
              i_totalnum+=cbean.ordernum;
              d_totalamount+=cbean.subtotal;
           %>
			<tr height=30>
				<td><%=cbean.bookid%></td>
				<td><%=cbean.bookname%></td>
				<td><%=cbean.publishername%></td>
				<td>￥<%=cbean.unitprice%></td>
				<td><%=cbean.ordernum%></td>
				<td>￥<%=cbean.subtotal%></td>
			</tr>
			<%
           }//endwhile
           session.removeAttribute("cart");
           %>
			<tr height=30>
				<td colspan=4 align="right">合计</td>
				<td><%=i_totalnum %>(本)</td>
				<td colspan=2>￥<%=d_totalamount %>(元)</td>
			</tr>
			<tr height=30>
				<td colspan=6 align="left">谢谢您的支持！</td>
			</tr>
			<%}//endif %>
		</table>
		<jsp:include page="bottom.jsp" />
	</body>
</html>