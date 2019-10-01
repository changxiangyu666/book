<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../maincss.css" rel="stylesheet" type="text/css">
</head>
<body>
<div align="center">
	<table width="750" border="0" cellspacing="1" cellpadding="1">
		<tr>
			<td>
				<div align="center">
					<jsp:include page="top.jsp"></jsp:include>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div align="center">
					<table width="100%" border="0" cellpadding="0" cellspacing="0"
						class="td">
						<tr>
							<td>
								出错了!
							</td>
						</tr>
						<tr>
							<td>
								<hr size="1" noshade width="100%">
							</td>
						</tr>
						<tr>
							<td>
								超时或没有登录,不能查看当前页面!请先
								<a href="index.jsp">登录</a>.
							</td>
						</tr>
					</table>


				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div align="center">
					<jsp:include page="bottom.jsp" />
				</div>
			</td>
		</tr>
	</table>
</div>

</body>
</html>