<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="maincss.css">
</head>
<body>
		<form name="searchform" action="cust/search.jsp" method="post">
			<!-- 为了保持与booksearchform.jsp具有相同的控件数目，增加4个隐藏的控件，控件值均为空串。 -->
			<input name="bookid" type="hidden" />
			<input name="pricemin" type="hidden" />
			<input name="pricemax" type="hidden" />
			<input name="type" type="hidden" />
			<!-- 不加上面4个控件，search.jsp会报错，原因是无法找到这几个控件名。 -->
			<table width="100%" cellpadding=1 cellspacing=1 bgcolor=#f6f6f6	class=td>
				<tr>
					<td colspan=2>
						<img src="img/search_r1.jpg" width=158 height=43 />
					</td>
				</tr>
				<tr>
					<td>书名</td>
					<td>
						<input name="bookname" type="text" class="formtext" size=15 />
					</td>
				</tr>
				<tr>
					<td>作者</td>
					<td>
						<input name="author" type="text" class="formtext" size=15 />
					</td>
				</tr>
				<tr>
					<td>出版社</td>
					<td>
						<input name="publisher" type="text" class="formtext" size=15 />
					</td>
				</tr>
				<tr>
					<td>
						<input name="submit" type="submit" value="查找" />
					</td>
					<td>
						<a href="cust/booksearchform.jsp">高级搜索</a>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>