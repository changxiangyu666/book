<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() 
	             + ":" + request.getServerPort()+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<base href="<%=basePath%>">
		<link rel="stylesheet" type="text/css" href="maincss.css">
		<script type="text/javascript">
function checksubmit() {
	if (document.registerform.userid.value == "") {
		alert("请输入用户名！");
		document.registerform.userid.focus();
		return false;
	}
    if (document.registerform.password.value == "") {
		alert("请输入密码！");
		document.registerform.password.focus();
		return false;
	}
	if (document.registerform.password2.value == "") {
		alert("请输入验证密码！");
		document.registerform.password2.focus();
		return false;
	}
	if (document.registerform.password2.value != document.registerform.password.value) {
		alert("验证密码错误！");
		document.registerform.password2.value = "";
		document.registerform.password2.focus();
		return false;
	}
	if (document.registerform.username.value == "") {
		alert("请输入真实姓名！");
		document.registerform.username.focus();
		return false;
	}
	if (document.registerform.address.value == "") {
		alert("请输入地址！");
		document.registerform.address.focus();
		return false;
	}
	if (document.registerform.postcode.value == "") {
		alert("请输入邮编！");
		document.registerform.postcode.focus();
		return false;
	}
	if (document.registerform.phone.value == "") {
		alert("请输入联系电话！");
		document.registerform.phone.focus();
		return false;
	}
    
	return true;
}
function checkuserid() {
	if (document.registerform.userid.value == "") {
		alert("请输入用户名！");
		document.registerform.userid.focus();
	} else {

		var s_userid = document.registerform.userid.value;
		window.location.href = "checkuserid.jsp?userid=" + s_userid;
	}
}
</script>
</head>
<body>
		<jsp:include page="top.jsp" />
		  <form name=registerform action="cust/register.jsp" method="post">
			<table width=750 border="0" cellpadding="2" cellspacing="2"	class="td" align="center">
				<tr>
					<td colspan="2">
						&nbsp;&nbsp;以下资料请如实填写，以保证正确发货。这些资料未经客户允许将只用于处理客户的订货信息，对外严格保密。（带
						<font color="red">*</font>号的为必填项，其它的可以不填）
					</td>
				</tr>
				<tr>
					<td width="40%" align="right">用户名</td>
					<td>
						<input name="userid" type="text" size="20">
						<font color="red">*</font>(请
						<input type="button" value=检测 onclick="return  checkuserid();" />
						您的用户名是否有效)
					</td>
				</tr>
				<tr>
					<td align="right">密码</td>
					<td>
						<input name="password" type="password" size="20">
						<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td align="right">验证密码</td>
					<td>
						<input name="password2" type="password" size="20">
						<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td align="right">真实姓名</td>
					<td>
						<input name="username" type="text" size="20">
						<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td align="right">性别</td>
					<td>
						<select name="gender">
							<option value="男">男</option>
							<option value="女">女</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right">住址</td>
					<td>
						<input name="address" type="text" size="20">
						<font color="red">*</font>(请您提供尽可能详细的地址)
					</td>
				</tr>
				<tr>
					<td align="right">邮编</td>
					<td>
						<input name="postcode" type="text" size="20">
						<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td align="right">联系电话</td>
					<td>
						<input name="phone" type="text" size="20">
						<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td align="right">E-mail</td>
					<td>
						<input name="email" type="text" size="20">
					</td>
				</tr>
				<tr>
					<td align="center" colspan=2>
						<input name="submit" type="submit" value="注册新用户 "
						onclick="return checksubmit();">
						<input name="reset" type="reset" value="重新填写 ">
					</td>
				</tr>
				<tr height=100>
				</tr>
			</table>
		  </form>
		<jsp:include page="bottom.jsp" />
	</body>
</html>