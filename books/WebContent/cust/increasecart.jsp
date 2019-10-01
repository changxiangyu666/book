<%@ page language="java" import="java.util.*,java.sql.*,bean.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	//使用DBJavaBean链接数据库mysql
	DBJavaBean db=new DBJavaBean();
	//声明结果集rs
	ResultSet rs = null;
	String s_bookid=request.getParameter("bookid");
	//获取s_bookid对应书的库存数量
	String s_sql = "select quantity from book where bookid='"+ s_bookid + "' ";
	rs = db.selectResultSet(s_sql);
	rs.next();
	int book_quantity = rs.getInt("quantity");
	Collection c_cart=(Collection)session.getAttribute("cart");
	Iterator it=null;
	if(c_cart==null){
		c_cart=new Vector();
		session.setAttribute("cart",c_cart);
	}else{
		it=c_cart.iterator();
		while(it.hasNext()){
			cartBean cb=(cartBean)(it.next());			
			if(cb.ordernum>=book_quantity){
				break;
			}
			if(cb.bookid.equals(s_bookid)){
				cb.ordernum++;
				cb.subtotal+=cb.unitprice;
				break;
			}
			
		}
	}
	response.sendRedirect("shoppingcart.jsp");
%>