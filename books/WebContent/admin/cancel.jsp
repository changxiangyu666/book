<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		session.removeAttribute("admin");

		response.sendRedirect("index.jsp");
%>
