<%@ page language="java" import="java.util.*,java.sql.*,bean.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	//使用DBJavaBean链接数据库mysql
	DBJavaBean db = new DBJavaBean();
	//声明结果集rs
	ResultSet rs = null;
	//--------------------------------------------------------------------------
	request.setCharacterEncoding("UTF-8");//请求编码
	String s_where = (String) session.getAttribute("s_where");
	if (s_where == null)
		s_where = "";
	String s_bookid;
	String s_bookname;
	String s_authorname;
	String s_publishername;
	String s_price = "";
	String s_pubdate = "";
	String s_quantity = "";
	String s_content = "";
	String s_picture = "";
	//--------------------------------------------------------------------------
	int i_totalnum = 0;//结果总数
	int i_pagenum = 5;//每页书数量
	int i_totalpage = 0;//总页数
	int i_currentpage = 1;//当前页数
	//-------------------------------------------------------------------------
	String s_sql = "select count(bookid) from book left join publisher on book.publisherid=publisher.publisherid where bookid is not null " + s_where;
	rs = db.selectResultSet(s_sql);
	if(rs.next()){
		i_totalnum = rs.getInt(1);
		i_totalpage = i_totalnum / i_pagenum;
		if (i_totalnum % i_pagenum != 0) {//如果有余数，则加一页
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
	}
	
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
			<%
				if (i_totalnum != 0) {
			%>
			<tr>
				<td colspan=6 align="center" height=30>
					书目搜索结果
				</td>
			</tr>

			<tr>
				<td colspan=3>
					您要查询的图书共计<%=i_totalnum%>本，分<%=i_totalpage%>页显示，每页显示<%=i_pagenum%>本
				</td>
				<td colspan=3>
					<div align="right">

						第<%=i_currentpage%>页&nbsp;
						<!---------------------首页--------------------------->
						<%
							if (i_currentpage > 1) {
						%>
						<a href="cust/booklist.jsp?op=fistpage">首页</a>
						<%
							} else {
						%>
						首页&nbsp;
						<%
							}
						%>
						<!-------------------上一页--------------------------->
						<%
							if (i_currentpage > 1) {
						%>
						<a
							href="cust/booklist.jsp?op=previous&currentpage=<%=i_currentpage%>">上一页</a>
						<%
							} else {
						%>
						上一页&nbsp;
						<%
							}
						%>
						<!-------------------下一页--------------------------->
						<%
							if (i_currentpage != i_totalpage) {
						%>
						<a href="cust/booklist.jsp?op=next&currentpage=<%=i_currentpage%>">下一页</a>
						<%
							} else {
						%>
						下一页&nbsp;
						<%
							}
						%>
						<!-------------------末页--------------------------->
						<%
							if (i_currentpage != i_totalpage) {
						%>
						<a href="cust/booklist.jsp?op=lastpage">末页</a>
						<%
							} else {
						%>
						末页&nbsp;
						<%
							}
						%>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan=6>
					<hr size=2 noshade="noshade" color=#a39480 />
				</td>
			</tr>
			<tr>
				<td width=5%>
					序号
				</td>
				<td width=26%>
					书号
				</td>
				<td width=35%>
					书名
				</td>
				<td width=10%>
					单价
				</td>
				<td width=14%>
					购买
				</td>
				<td width=10%>
					详细信息
				</td>
			</tr>
			<tr>
				<td colspan=6>
					<hr size=1 noshade="noshade" color=#a39480 />
				</td>
			</tr>
			<%
				s_sql = "select * from book left join publisher on book.publisherid=publisher.publisherid where bookid is not null "
							+ s_where + "order by bookid";
					rs = db.selectResultSet(s_sql);
					//翻页时显示记录的逻辑
					if (i_currentpage > i_totalpage) {
						i_currentpage = i_totalpage;
					}
					int i_position = (i_currentpage - 1) * i_pagenum;
					if (i_position == 0) {
						rs.beforeFirst();
					} else {
						rs.absolute(i_position);
					}
					//翻页时显示记录的逻辑
					for (int i = 0; i < i_pagenum; i++) {
						if (!rs.isLast()) {
							rs.next();
							s_bookid = rs.getString("bookid");
							s_bookname = rs.getString("bookname");
							s_authorname = rs.getString("author");
							s_price = rs.getString("price");
							s_quantity = rs.getString("quantity");
							s_publishername = rs.getString("name");
			%>
			<tr height=30>
				<td><%=i + 1 + (i_currentpage - 1) * i_pagenum%></td>
				<td><%=s_bookid%></td>
				<td><%=s_bookname%></td>
				<td>
					￥<%=s_price%></td>
				<td>
					<a href="cust/addtocart.jsp?bookid=<%=s_bookid%>">放入购物车</a>
				</td>
				<td>
					<a
						href="cust/booklist.jsp?op=show&currentpage=<%=i_currentpage%>&detailid=<%=s_bookid%>">查看</a>
				</td>
			</tr>
			<%
				}//endif
					}//endfor
			%>
			<%
				String s_detailid = request.getParameter("detailid");
					if (s_detailid == null) {//如果成立，则显示当前页第1本书的详情。
						//---------------------------------------
						s_sql = "select * from book left join publisher on book.publisherid=publisher.publisherid where bookid is not null "
								+ s_where + "order by bookid";
						rs = db.selectResultSet(s_sql);
						//翻页时显示记录的逻辑
						if (i_currentpage > i_totalpage) {
							i_currentpage = i_totalpage;
						}
						i_position = (i_currentpage - 1) * i_pagenum;
						if (i_position == 0) {
							rs.beforeFirst();
						} else {
							rs.absolute(i_position);
						}
						//---------------------------------------
					} else {//否则，则显示s_detailid这本书的详情。
						s_sql = "select * from book left join publisher on book.publisherid=publisher.publisherid where bookid='" + s_detailid + "'";
						rs.close();
						rs = db.selectResultSet(s_sql);
					}//endelse
					rs.next();
					s_bookid = rs.getString("bookid");
					s_bookname = rs.getString("bookname");
					s_authorname = rs.getString("author");
					s_pubdate = rs.getString("pubdate").substring(0, 10);
					s_price = rs.getString("price");
					s_content = rs.getString("content");
					s_quantity = rs.getString("quantity");
					s_picture = rs.getString("picture");
					s_publishername = rs.getString("name");
			%>
			<tr>
				<td colspan=6>
					<hr size=2 noshade="noshade" color=#a39480 />
				</td>
			</tr>
			<tr>
				<td colspan=6>
					<table width=100% border=0 cellpadding=0 cellspacing=0 class=td>
						<tr>
							<td width=30% rowspan=8>
								<img src="img/<%=s_picture%>" height=212 width=150 />
							</td>
							<td colspan=2><%=s_bookname%></td>
						</tr>
						<tr>
							<td colspan=2><%=s_authorname%>&nbsp;&nbsp;著
							</td>
						</tr>
						<tr>
							<td colspan=2>
								图书规格
							</td>
						</tr>
						<tr>
							<td colspan=2><%=s_publishername%></td>
						</tr>
						<tr>
							<td colspan=2><%=s_pubdate%>&nbsp;&nbsp;出版
							</td>
						</tr>
						<tr>
							<td colspan=2>
								书号：<%=s_bookid%></td>
						</tr>
						<tr>
							<td colspan=2>
								定价：￥<%=s_price%></td>
						</tr>
						<tr>
							<td colspan=2>
								<a href="cust/addtocart.jsp?bookid=<%=s_bookid%>">放入购物车</a>
							</td>
						</tr>
						<tr>
							<td colspan=3>
								内容简介
							</td>
						</tr>
						<tr>
							<td colspan=3><%=s_content%></td>
						</tr>
					</table>
				</td>
			</tr>
			<%
				} else {
					String temp = "对不起，您搜索的图书不存在，请重新搜索。返回！";
			        temp = java.net.URLEncoder.encode(temp.toString(), "UTF-8");
					String s_src = "img/sorry.jpeg";
					String s_href = "javascript:history.go(-1);";
					response.sendRedirect("message.jsp?message=" + temp+"&src="+s_src+"&href="+s_href);
				}
			%>
		</table>
		<jsp:include page="bottom.jsp" />
	</body>
</html>