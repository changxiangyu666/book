<%@ page language="java" import="java.util.*,java.sql.*,bean.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//设置相对路径--------------------------------
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() 
	             + ":" + request.getServerPort()+ path + "/";
	//省明一个连接数据库实例db,结果集rs.
	DBJavaBean db = new DBJavaBean();
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
		<table width=750 border=0 align="center" cellspacing=0 cellpadding=0
			class=td>
			<tr height=400>
				<td width=25% align="center">
					<jsp:include page="declare.jsp" /><br/>
					<%
					 String s_page =(String)session.getAttribute("page");
					 if(s_page==null)
					 	s_page="loginform.jsp";
					%>
					<jsp:include page="<%=s_page %>" /><br/>
					<jsp:include page="searchform.jsp" /><br/>
				</td>
				<td width=75% valign="top">
					<!---------------------------精品书列表begin--------------------------------->
					<table width=100% cellspacing=0 cellpadding=0 class=td>
						<tr>
							<td colspan=2><img src="img/lanmu_r1.jpg" width=85 height=29 /></td>
						</tr>
						<%
							int i_num = 2;//i_num行数
							String s_select = "select * from book left join publisher on book.publisherid=publisher.publisherid where type=2 ";
							rs = db.selectResultSet(s_select);
							while (i_num > 0 && rs.next()) {
								i_num--;
								String s_bookid = rs.getString("bookid");
								String s_bookname = rs.getString("bookname");
								if(s_bookname.length()>10) 
									s_bookname =s_bookname.substring(0, 10);
								String s_author = rs.getString("author");
								String s_pubdate = rs.getString("pubdate").substring(0, 10);
								String s_price = rs.getString("price");
								String s_content = rs.getString("content");
								String s_picture = rs.getString("picture");
								String s_publishername = rs.getString("name");
						%>
						<tr>
							<!-- 第1行begin -->
							<td width=50%>
								<!-- 第1列begin -->
								<table width=100% cellspacing=0 cellpadding=0 class=td>
									<tr>
										<td width=30%>
											<a href="cust/bookdetail.jsp?bookid=<%=s_bookid%>">
											<img src="img/<%=s_picture%>" width=65 height=90 border=0 /> </a>
										</td>
										<td width=70%>
											<table cellspacing=1 cellpadding=1 class=td>
												<tr>
													<td width=25%>书名</td>
													<td>&nbsp;&nbsp;<%=s_bookname%></td>
												</tr>
												<tr>
													<td width=25%>作者</td>
													<td>&nbsp;&nbsp;<%=s_author%></td>
												</tr>
												<tr>
													<td width=25%>出版社</td>
													<td>&nbsp;&nbsp;<%=s_publishername%></td>
												</tr>
												<tr>
													<td width=25%>出版日期</td>
													<td>&nbsp;&nbsp;<%=s_pubdate%></td>
												</tr>
												<tr>
													<td width=25%>定价</td>
													<td>&nbsp;&nbsp;￥<%=s_price%></td>
												</tr>
											</table>

										</td>
									</tr>
									<tr>
										<td colspan=2>
											<a href="cust/addtocart.jsp?bookid=<%=s_bookid%>">放入购物车</a>
											&nbsp; &nbsp;
											<a href="cust/bookdetail.jsp?bookid=<%=s_bookid%>">查看详情</a>
										</td>
									</tr>
								</table>
							</td>
							<!-- 第1列end -->
							<%
								if (!rs.isLast()) {//当前记录不是最后一条记录
										rs.next();
										s_bookid = rs.getString("bookid");
										s_bookname = rs.getString("bookname");
										if(s_bookname.length()>10) 
											s_bookname =s_bookname.substring(0, 10);
										s_author = rs.getString("author");
										s_pubdate = rs.getString("pubdate").substring(0, 10);
										s_price = rs.getString("price");
										s_content = rs.getString("content");
										s_picture = rs.getString("picture");
										s_publishername = rs.getString("name");
							%>
							<td width=50%>
								<!-- 第2列begin -->
								<table width=100% cellspacing=0 cellpadding=0 class=td>
									<tr>
										<td width=30%>
											<a href="cust/bookdetail.jsp?bookid=<%=s_bookid%>"> <img
													src="img/<%=s_picture%>" width=65 height=90 border=0 /> </a>
										</td>
										<td width=70%>
											<table cellspacing=1 cellpadding=1 class=td>
												<tr>
													<td width=25%>书名</td>
													<td>&nbsp;&nbsp;<%=s_bookname%></td>
												</tr>
												<tr>
													<td width=25%>作者</td>
													<td>&nbsp;&nbsp;<%=s_author%></td>
												</tr>
												<tr>
													<td width=25%>出版社</td>
													<td>&nbsp;&nbsp;<%=s_publishername%></td>
												</tr>
												<tr>
													<td width=25%>出版日期</td>
													<td>&nbsp;&nbsp;<%=s_pubdate%></td>
												</tr>
												<tr>
													<td width=25%>定价</td>
													<td>&nbsp;&nbsp;￥<%=s_price%></td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td colspan=2>
											<a href="cust/addtocart.jsp?bookid=<%=s_bookid%>">放入购物车</a>
											&nbsp; &nbsp;
											<a href="cust/bookdetail.jsp?bookid=<%=s_bookid%>">查看详情</a>
										</td>
									</tr>
								</table>
							</td>
							<!-- 第2列end -->
							<%}//endif%>
						</tr>
						<!-- 第1行end -->
						<%}//endwhile%>
						<tr align="right">
							<td colspan=2><a href="cust/excellent.jsp">更多精品</a></td>
						</tr>
					</table>
						<!---------------------------新书列表begin--------------------------------->
					<table width=100% cellspacing=0 cellpadding=0 class=td>
						<tr>
							<td colspan=2><img src="img/lanmu_r2.jpg" width=85 height=29 /></td>
						</tr>
						<%
							 i_num = 2;//i_num行数
							 s_select = "select * from book left join publisher on book.publisherid=publisher.publisherid where type=1 ";
							rs = db.selectResultSet(s_select);
							while (i_num > 0 && rs.next()) {
								i_num--;
								String s_bookid = rs.getString("bookid");
								String s_bookname = rs.getString("bookname");
								if(s_bookname.length()>10) 
									s_bookname =s_bookname.substring(0, 10);
								String s_author = rs.getString("author");
								String s_pubdate = rs.getString("pubdate").substring(0, 10);
								String s_price = rs.getString("price");
								String s_content = rs.getString("content");
								String s_picture = rs.getString("picture");
								String s_publishername = rs.getString("name");
						%>
						<tr>
							<!-- 第1行begin -->
							<td width=50%>
								<!-- 第1列begin -->
								<table width=100% cellspacing=0 cellpadding=0 class=td>
									<tr>
										<td width=30%>
											<a href="cust/bookdetail.jsp?bookid=<%=s_bookid%>">
											<img src="img/<%=s_picture%>" width=65 height=90 border=0 /> </a>
										</td>
										<td width=70%>
											<table cellspacing=1 cellpadding=1 class=td>
												<tr>
													<td width=25%>书名</td>
													<td>&nbsp;&nbsp;<%=s_bookname%></td>
												</tr>
												<tr>
													<td width=25%>作者</td>
													<td>&nbsp;&nbsp;<%=s_author%></td>
												</tr>
												<tr>
													<td width=25%>出版社</td>
													<td>&nbsp;&nbsp;<%=s_publishername%></td>
												</tr>
												<tr>
													<td width=25%>出版日期</td>
													<td>&nbsp;&nbsp;<%=s_pubdate%></td>
												</tr>
												<tr>
													<td width=25%>定价</td>
													<td>&nbsp;&nbsp;￥<%=s_price%></td>
												</tr>
											</table>

										</td>
									</tr>
									<tr>
										<td colspan=2>
											<a href="cust/addtocart.jsp?bookid=<%=s_bookid%>">放入购物车</a>
											&nbsp; &nbsp;
											<a href="cust/bookdetail.jsp?bookid=<%=s_bookid%>">查看详情</a>
										</td>
									</tr>
								</table>
							</td>
							<!-- 第1列end -->
							<%
								if (!rs.isLast()) {//当前记录不是最后一条记录
										rs.next();
										s_bookid = rs.getString("bookid");
										s_bookname = rs.getString("bookname");
										if(s_bookname.length()>10) 
											s_bookname =s_bookname.substring(0, 10);
										s_author = rs.getString("author");
										s_pubdate = rs.getString("pubdate").substring(0, 10);
										s_price = rs.getString("price");
										s_content = rs.getString("content");
										s_picture = rs.getString("picture");
										s_publishername = rs.getString("name");
							%>
							<td width=50%>
								<!-- 第2列begin -->
								<table width=100% cellspacing=0 cellpadding=0 class=td>
									<tr>
										<td width=30%>
											<a href="cust/bookdetail.jsp?bookid=<%=s_bookid%>"> <img
													src="img/<%=s_picture%>" width=65 height=90 border=0 /> </a>
										</td>
										<td width=70%>
											<table cellspacing=1 cellpadding=1 class=td>
												<tr>
													<td width=25%>书名</td>
													<td>&nbsp;&nbsp;<%=s_bookname%></td>
												</tr>
												<tr>
													<td width=25%>作者</td>
													<td>&nbsp;&nbsp;<%=s_author%></td>
												</tr>
												<tr>
													<td width=25%>出版社</td>
													<td>&nbsp;&nbsp;<%=s_publishername%></td>
												</tr>
												<tr>
													<td width=25%>出版日期</td>
													<td>&nbsp;&nbsp;<%=s_pubdate%></td>
												</tr>
												<tr>
													<td width=25%>定价</td>
													<td>&nbsp;&nbsp;￥<%=s_price%></td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td colspan=2>
											<a href="cust/addtocart.jsp?bookid=<%=s_bookid%>">放入购物车</a>
											&nbsp; &nbsp;
											<a href="cust/bookdetail.jsp?bookid=<%=s_bookid%>">查看详情</a>
										</td>
									</tr>
								</table>
							</td>
							<!-- 第2列end -->
							<%}//endif%>
						</tr>
						<!-- 第1行end -->
						<%}//endwhile%>
						<tr align="right">
							<td colspan=2><a href="cust/excellent.jsp">更多新书</a></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	  <jsp:include page="bottom.jsp" />
	</body>
</html>