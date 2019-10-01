<%@ page language="java" import="java.util.*,java.sql.*,bean.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	//使用DBJavaBean链接数据库mysql
    DBJavaBean db=new DBJavaBean();
    //声明结果集rs
    ResultSet rs = null;
	//------------------------------------
	String s_bookid = request.getParameter("bookid");
	String s_sql = "select * from book left join publisher on publisher.publisherid=book.publisherid where bookid='"+ s_bookid + "' ";
	rs = db.selectResultSet(s_sql);
	rs.next();
	String s_bookname = rs.getString("bookname");
	String s_authorname = rs.getString("author");
	String s_price = rs.getString("price");
	String s_publishername = rs.getString("name");
	//-----------------------------------------------------
	int i_ordernum = 1;
	double d_unitprice = Double.parseDouble(s_price);
	double d_subtotal = i_ordernum * d_unitprice;
	cartBean cbean = new cartBean();
	cbean.bookid = s_bookid;
	cbean.bookname = s_bookname;
	cbean.publishername = s_publishername;
	cbean.ordernum = i_ordernum;
	cbean.unitprice = d_unitprice;
	cbean.subtotal = d_subtotal;
	Collection c_cart = (Collection) session.getAttribute("cart");
	Iterator it = null;
	//-----------------------------------------------
	
	if(c_cart==null){
		c_cart=new Vector();
		c_cart.add(cbean);
		session.setAttribute("cart",c_cart);
	}else{
		String s_flag="false";
		it=c_cart.iterator();
		while(it.hasNext()){
			cartBean cb=(cartBean)(it.next());
			if(cb.bookid.equals(s_bookid)){
				cb.ordernum++;
				cb.subtotal += cb.unitprice;
				s_flag="true";
			}
		}
		if(s_flag.equals("false")){
			c_cart.add(cbean);
		}
	}
	response.sendRedirect("shoppingcart.jsp");
%>