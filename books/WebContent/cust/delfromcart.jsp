<%@ page language="java" import="java.util.*,java.sql.*,bean.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String s_bookid=request.getParameter("bookid");
	Collection c_cart=(Collection)session.getAttribute("cart");
	Iterator it=null;
	if(c_cart==null){
		c_cart=new Vector();
		session.setAttribute("cart",c_cart);
	}else{
		it=c_cart.iterator();
		while(it.hasNext()){
			cartBean cb=(cartBean)(it.next());
			if(cb.bookid.equals(s_bookid)){
				c_cart.remove(cb);
				break;
			}
		}
	}
	response.sendRedirect("shoppingcart.jsp");
%>