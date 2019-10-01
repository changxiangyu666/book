<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//设置相对路径--------------------------------
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
	if (document.passwordeditform.password.value == "") {
		alert("请输入密码！");
		document.passwordeditform.password.focus();
		return false;
	}
	if (document.passwordeditform.password2.value == "") {
		alert("请输入验证密码！");
		document.passwordeditform.password2.focus();
		return false;
	}
	if (document.passwordeditform.password2.value != document.passwordeditform.password.value) {
		alert("验证密码错误！");
		document.passwordeditform.password2.value = "";
		document.passwordeditform.password2.focus();
		return false;
	}
	return true;
}
</script>
</head>
<%
	String s_userid=(String)session.getAttribute("userid");
	if(s_userid==null)response.sendRedirect("index.jsp");
	 %>
<body>
		<jsp:include page="top.jsp"/>
		<form name=passwordeditform action=cust/passwordedit.jsp method=post >
		<table width=750 border="0" cellpadding="1" cellspacing="1" class="td" align="center">
			<tr>
				<td width="40%" align="right">用户名</td>
				<td align="left"><%=s_userid%></td>
			</tr>
			<tr>
				<td align="right">密码</td>
				<td align="left">
					<input name="password" type="password" size="20"><font color="red">*</font>
				</td>
			</tr>
			<tr>
				<td align="right">验证密码</td>
				<td align="left">
					<input name="password2" type="password" size="20"><font color="red">*</font>
				</td>
			</tr>
			<tr>
				<td colspan=2 align="center">
					<input name="submit" type="submit" value="修改密码" onclick="return checksubmit();">
					<input name="reset" type="reset" value="重新填写 ">
				</td>
			</tr>
			<tr height=250 >
			</tr>
		</table>
		</form>
		<jsp:include page="bottom.jsp" />
	</body>
</html>