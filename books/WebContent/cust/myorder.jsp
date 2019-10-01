<%@ page language="java" import="java.util.*,java.sql.*,bean.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
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
	String s_sql = "select count(*) from orderform where userid='"+ s_userid + "' ";
	rs = db.selectResultSet(s_sql);
	rs.next();
	int i_count = rs.getInt(1);
	int i_pagenum = 5;//每页订单数量
	int i_totalpage = 0;//总页数
	int i_currentpage = 1;//当前页数
	i_totalpage = i_count / i_pagenum;
	if (i_count % i_pagenum != 0) {//如果有余数，则加一页
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
//*********************************************************************************************		
	if(i_count==0){
		String temp = "对不起，您还未下过单。返回！";
		temp = java.net.URLEncoder.encode(temp.toString(), "UTF-8");
		String s_src = "img/sorry.jpeg";
		String s_href = "javascript:history.go(-1);";
		response.sendRedirect("message.jsp?message=" + temp+"&src="+s_src+"&href="+s_href);
	}else{
		response.sendRedirect("myorderform.jsp?count="+i_count+"&totalpage="+i_totalpage+"&pagenum="+i_pagenum+"&currentpage="+i_currentpage);
    }
%>
