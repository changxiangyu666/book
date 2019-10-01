<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
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
		<table width="100%" cellpadding=0 cellspacing=0 bgcolor=#f6f6f6>
			<tr>
				<td>
					<img src="img/lanmu_r3.jpg" width=158 height=43 />
				</td>
			</tr>
			<tr>
				<td>
					<marquee direction="up" height=90 width=174 onmouseout=this.start()
						onmouseover=this.stop() scrollamount=1 scrolldelay=1
						style="padding: 0px 0px;">
						<table class=td>
							<tr>
								<td>
									&nbsp;&nbsp;&nbsp;&nbsp; 欢迎来到网上书店系统，我们将为您提供最好的服务！
									<br />
									&nbsp;&nbsp;&nbsp;&nbsp; 如果您有任何问题，请与我们你的工作人员联系,谢谢！
									<br />
								</td>
							</tr>
						</table>
					</marquee>
				</td>
			</tr>
		</table>
	</body>
</html>