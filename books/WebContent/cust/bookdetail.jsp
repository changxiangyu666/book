<%@ page language="java" import="java.util.*,java.sql.*,bean.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
    //使用DBJavaBean链接数据库mysql
    DBJavaBean db=new DBJavaBean();
    //声明结果集rs
    ResultSet rs = null;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>">
		<title>My JSP 'index.jsp' starting page</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="maincss.css">
</head>
<body>
		<jsp:include page="top.jsp"></jsp:include>
		<table width=750 border=0 align="center" cellspacing=0 cellpadding=0
			class=td>
			<tr height=400>
				<td width=25% align="center">
					<jsp:include page="declare.jsp"></jsp:include><br />
					<jsp:include page="login.jsp"></jsp:include><br />
					<jsp:include page="searchform.jsp"></jsp:include><br />
				</td>
				<td width=75% valign="top">
                   <%
                   String s_bookid=request.getParameter("bookid");
                   String s_sql="select * from book left join publisher on book.publisherid=publisher.publisherid where bookid='"+s_bookid+"'";
                   rs=db.selectResultSet(s_sql);
                   rs.next();
                   String s_bookname=rs.getString("bookname");
                   String s_authorname=rs.getString("author");
                   String s_pubdate=rs.getString("pubdate").substring(0,10);
                   String s_price=rs.getString("price");
                   String s_content=rs.getString("content");
                   String s_quantity=rs.getString("quantity");
                   String s_picture=rs.getString("picture");
                   String s_publishername=rs.getString("name");
                   %>
                   
                   <table width=100% border=0 cellpadding=0 cellspacing=0 class=td>
                         <tr>
                            <td height=30></td>
                         </tr>
                         <tr>
                           <td  width=30% rowspan=8>
                             <img src="img/<%=s_picture%>" height=212 width=150/>
                           </td>
                           <td colspan=2><%=s_bookname %></td>
                         </tr>
                         <tr>
                            <td colspan=2><%=s_authorname%>&nbsp;&nbsp;著</td>
                         </tr>
                         <tr>
                            <td colspan=2>图书规格</td>
                         </tr>
                         <tr>
                            <td colspan=2><%=s_publishername%></td>
                         </tr>
                         <tr>
                            <td colspan=2><%=s_pubdate%>&nbsp;&nbsp;出版</td>
                         </tr>
                         <tr>
                            <td colspan=2>书号：<%=s_bookid%></td>
                         </tr>
                         <tr>
                            <td colspan=2>定价：￥<%=s_price%></td>
                         </tr>
                         <tr>
                            <td colspan=2><a href="cust/addtocart.jsp?bookid=<%=s_bookid%>">放入购物车</a></td>
                         </tr>
                         <tr>
                            <td colspan=3>内容简介</td>
                         </tr>
                         <tr>
                            <td colspan=3><%=s_content%></td>
                         </tr>
                      </table>
				</td>
			</tr>
		</table>
		<jsp:include page="bottom.jsp"></jsp:include>
	</body>
</html>