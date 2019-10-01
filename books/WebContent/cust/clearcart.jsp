<%@ page language="java" import="java.util.*,java.sql.*,bean.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Collection c_cart=(Collection)session.getAttribute("cart");
	if(c_cart!=null){
		c_cart.clear();
	}else{
		c_cart=new Vector();
		session.setAttribute("cart",c_cart);
	}
	response.sendRedirect("shoppingcart.jsp");
 %>