<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="maincss.css">
		<script type="text/javascript">
function checksubmit() {
	if (document.loginform.userid.value == "") {
		alert("用户名不能为空，请重新输入!");
		document.loginform.userid.focus();
		return false;
	}
	if (document.loginform.password.value == "") {
		alert("密码不能为空，请重新输入!");
		document.loginform.password.focus();
		return false;
	}
	return true;
}
</script>
</head>
<body>
		<form name=loginform action=cust/login.jsp?op=login method=post>
			<table width=100% border=0 bgcolor=#f6f6f6 class=td>
				<tr>
					<td colspan=2>
						<img src=img/login_r1.jpg width=158 height=43 />
					</td>
				</tr>
				<tr>
					<td width=25%>用户名</td>
					<td width=75%><input name=userid type=text class=formtext size=15>
					</td>
				</tr>
				<tr>
					<td width=25%>密码</td>
					<td width=75%>
						<input name=password type=password class=formtext size=15>
					</td>
				</tr>
				<tr>
					<td colspan=2>
						<input name=loginbutton type=submit value=登陆
							onclick="return checksubmit();">
						<a href=cust/registerform.jsp>新用户注册</a>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>