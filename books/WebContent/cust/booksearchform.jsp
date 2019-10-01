<%@ page language="java" import="java.util.*,java.sql.*,bean.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
		<table width=750 border=0 align="center" cellspacing=0 cellpadding=0 class=td>
			<tr height=400>
				<td width=25% valign="top">
					<table width="100%" border="0" cellpadding="2" cellspacing="2"
						class="td">
						<tr>
							<td>
								〖检索说明〗
							</td>
						</tr>
						<tr>
							<td>
								1、检索范围为出版并已上网的图书；
							</td>
						</tr>
						<tr>
							<td>
								2、选择要检索的图书类别，在相应的“□”处打上勾为选中；
							</td>
						</tr>
						<tr>
							<td>
								3、各检索条件之间为逻辑“与”的关系，即选择检索条件越多，条件越苛刻。
							</td>
						</tr>
						<tr>
							<td>
								4、填写的字符中不要包括这些字符：“'”、“%”、“[”、“]”，系统会自动过滤掉！
							</td>
						</tr>
					</table>
     			</td>
				<td width=75% valign="top">
					<form name="search" action="cust/search.jsp"
						method="post">
						<table width="100%" border="0" cellpadding="2" cellspacing="2"
							class="td">
							<tr>
								<td colspan="2">
									<hr size="1" noshade width="100%">
								</td>
							</tr>
							<tr>
								<td width="50%">
									<div align="center">
										书号
									</div>
								</td>
								<td width="50%">
									<input name="bookid" type="text" size="21" value="ISBN ">
								</td>
							</tr>
							<tr>
								<td width="50%">
									<div align="center">
										书名
									</div>
								</td>
								<td width="50%">
									<input name="bookname" type="text" size="21">
								</td>
							</tr>
							<tr>
								<td>
									<div align="center">
										作者
									</div>
								</td>
								<td>
									<input name="author" type="text" size="21">
								</td>
							</tr>
							<tr>
								<td>
									<div align="center">
										书价
									</div>
								</td>
								<td>
									<input name="pricemin" type="text" size="6" value="0.00">
									至
									<input name="pricemax" type="text" size="7" value="1000.00">
								</td>
							</tr>
							<tr>
								<td>
									<div align="center">
										出版社
									</div>
								</td>
								<td>
									<input name="publisher" type="text" size="21">
								</td>
							</tr>
							<tr>
								<td>
									<div align="center">
										类别
									</div>
								</td>
								<td>
									<select name="type">
										<option value="">
											所有图书
										</option>
										<option value="1">
											新书
										</option>
										<option value="2">
											精品图书
										</option>
									</select>
								</td>
							</tr>
							<tr height=50 >
								<td>
									<div align="right">
										<input type="submit" name="Submit" value=" 搜索 ">
										&nbsp;&nbsp;
									</div>
								</td>
								<td>
									<div align="left">
										&nbsp;&nbsp;
										<input type="reset" name="Reset" value=" 重置 ">
									</div>
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
		<jsp:include page="bottom.jsp" />
	</body>
</html>