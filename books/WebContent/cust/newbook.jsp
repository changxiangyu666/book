<%@ page language="java" import="java.util.*,java.sql.*,bean.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	/* //链接数据库mysql
	request.setCharacterEncoding("GB2312");
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection(
			"jdbc:odbc:bookshoplk", "sa", "sa");
	Statement stmt = con.createStatement(
			ResultSet.TYPE_SCROLL_INSENSITIVE,
			ResultSet.CONCUR_READ_ONLY);
	ResultSet rs = null;
	//链接数据库mysql */
	DBJavaBean db = new DBJavaBean();
	ResultSet rs = null;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<base href="<%=basePath%>">
		<title>My JSP 'index.jsp' starting page</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="maincss.css">
		<script language=javascript>
function setVariables() {
	imgwidth = 50;
	imgheight = 50;
	if (navigator.appName == "Netscape") {
		horz = ".left";
		vert = ".top";
		docStyle = "document.";
		styleDoc = "";
		innerW = "window.innerWidth";
		innerH = "window.innerHeight";
		offsetX = "window.pageXOffset";
		offsetY = "window.pageYOffset";
	} else {
		horz = ".pixelLeft";
		vert = ".pixelTop";
		docStyle = "";
		styleDoc = ".style";
		innerW = "document.body.clientWidth";
		innerH = "document.body.clientHeight";
		offsetX = "document.body.scrollLeft";
		offsetY = "document.body.scrollTop";
	}
}
function checkLocation() {
	objectXY = "branding";
	var availableX = eval(innerW);
	var availableY = eval(innerH);
	var currentX = eval(offsetX);
	var currentY = eval(offsetY);
	x = availableX - (imgwidth + 60) + currentX;
	y = availableY - (imgheight + 40) + currentY - 300;
	evalMove();
	setTimeout("checkLocation()", 10);
}
function evalMove() {
	eval(docStyle + objectXY + styleDoc + horz + "=" + x);
	eval(docStyle + objectXY + styleDoc + vert + "=" + y);
}
</script>
</head>
<body onload="setVariables(); checkLocation();">
		<div id="branding" style="position: absolute; visibility: show; left: 685px; top: 181px;">
			<table width="10" bgcolor="#ffffff">
				<tr>
					<td>
						<p align="center">
							
					</td>
				</tr>
			</table>
		</div>

		<jsp:include page="top.jsp"></jsp:include>
		<table width=750 border=0 align="center" cellspacing=0 cellpadding=0
			class=td>
			<tr height=400>
				<td width=25% align="center">
					<jsp:include page="declare.jsp"/><br />
					<jsp:include page="loginform.jsp"/><br />
					<jsp:include page="searchform.jsp"/><br />
				</td>
				<td width=75% valign="top">
					<!---------------------------新书列表begin---------------------------------->
					<table width=100% border=0 cellspacing=0 cellpadding=0 class=td>
						<tr>
							<td colspan=2>
								<img src="img/lanmu_r2.jpg" width=85 height=29 />
							</td>
						</tr>
						<%
					
						//	i_num = 2;//i_num行数
							String s_select = "select * from book left join publisher on book.publisherid=publisher.publisherid where type=1 ";
							rs=db.selectResultSet(s_select);
							while ( rs.next()) {
								//i_num--;
								String s_bookid = rs.getString("bookid");
								String s_bookname = rs.getString("bookname");
								String s_author = rs.getString("author");
								String s_pubdate = rs.getString("pubdate").substring(0,10);
								String s_price = rs.getString("price");
								String s_content = rs.getString("content");
								String s_picture = rs.getString("picture");
								String s_publishername = rs.getString("name");
						%>
						<tr>
							<!-- 第1行begin -->
							<td width=50%>
								<!-- 第1列begin -->
								<table width=100% border=0 cellspacing=0 cellpadding=0 class=td>
									<tr>
										<td width=30%>
											<a href="cust/bookdetail.jsp?bookid=<%=s_bookid%>"> <img
													src="img/<%=s_picture%>" width=65 height=90 border=0 /> </a>
										</td>
										<td width=70%>
											<table border=0 cellspacing=0 cellpadding=0 class=td>
												<tr>
													<td width=25%>
														书名
													</td>
													<td>
														&nbsp;&nbsp;<%=s_bookname%></td>
												</tr>
												<tr>
													<td width=25%>
														作者
													</td>
													<td>
														&nbsp;&nbsp;<%=s_author%></td>
												</tr>
												<tr>
													<td width=25%>
														出版社
													</td>
													<td>
														&nbsp;&nbsp;<%=s_publishername%></td>
												</tr>
												<tr>
													<td width=25%>
														出版日期
													</td>
													<td>
														&nbsp;&nbsp;<%=s_pubdate%></td>
												</tr>
												<tr>
													<td width=25%>
														定价
													</td>
													<td>
														&nbsp;&nbsp;￥<%=s_price%></td>
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
								        s_author = rs.getString("author");
								        s_pubdate = rs.getString("pubdate").substring(0,10);
								        s_price = rs.getString("price");
								        s_content = rs.getString("content");
								        s_picture = rs.getString("picture");
								        s_publishername = rs.getString("name");
							%>

							<td width=50%>
								<!-- 第2列begin -->
								<table width=100% border=0 cellspacing=0 cellpadding=0 class=td>
									<tr>
										<td width=30%>
											<a href="cust/bookdetail.jsp?bookid=<%=s_bookid%>"> <img
													src="img/<%=s_picture%>" width=65 height=90 border=0 /> </a>
										</td>
										<td width=70%>
											<table border=0 cellspacing=0 cellpadding=0 class=td>
												<tr>
													<td width=25%>
														书名
													</td>
													<td>
														&nbsp;&nbsp;<%=s_bookname%></td>
												</tr>
												<tr>
													<td width=25%>
														作者
													</td>
													<td>
														&nbsp;&nbsp;<%=s_author%></td>
												</tr>
												<tr>
													<td width=25%>
														出版社
													</td>
													<td>
														&nbsp;&nbsp;<%=s_publishername%></td>
												</tr>
												<tr>
													<td width=25%>
														出版日期
													</td>
													<td>
														&nbsp;&nbsp;<%=s_pubdate%></td>
												</tr>
												<tr>
													<td width=25%>
														定价
													</td>
													<td>
														&nbsp;&nbsp;￥<%=s_price%></td>
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
							<%
								}//endif
							%>

						</tr>
						<!-- 第1行end -->
						<%
							}//endwhile
						%>
						
					</table>





					<!---------------------------新书列表end----------------------------------->



				</td>
			</tr>
		</table>
		<jsp:include page="bottom.jsp"></jsp:include>
	</body>
</html>