<%@ page language="java" import="java.util.*,java.sql.*,bean.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//设置相对路径--------------------------------
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() 
	             + ":" + request.getServerPort()+ path + "/";
	request.setCharacterEncoding("UTF-8");
	DBJavaBean db = new DBJavaBean();
	ResultSet rs = null;
	String s_userid = (String) session.getAttribute("userid");
	if (s_userid == null)response.sendRedirect("index.jsp");
	String s_sql = "select * from userinfo where userid='"+ s_userid + "' ";
	rs = db.selectResultSet(s_sql);
	rs.next();
	String s_username = rs.getString("username");
	String s_gender = rs.getString("gender");
	String 	s_address = rs.getString("address");
	String 	s_email = rs.getString("email");
	String 	s_phone = rs.getString("phone");
	String 	s_postcode = rs.getString("postcode");
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

	if (document.updateform.username.value == "") {
		alert("请输入真实姓名！");
		document.updateform.username.focus();
		return false;
	}
	if (document.updateform.address.value == "") {
		alert("请输入地址！");
		document.updateform.address.focus();
		return false;
	}
	if (document.updateform.postcode.value == "") {
		alert("请输入邮编！");
		document.updateform.postcode.focus();
		return false;
	}
	if (document.updateform.phone.value == "") {
		alert("请输入联系电话！");
		document.updateform.phone.focus();
		return false;
	}
	return true;
}
</script>
</head>
<body>
		<jsp:include page="top.jsp" />
		<form name="updateform" action="cust/userinfoedit.jsp" method="post">
			<table width=750 border="0" cellpadding="1" cellspacing="1" class="td" align="center">
				<tr>
					<td colspan="2">
						&nbsp;&nbsp;以下资料请如实填写，以保证正确发货。这些资料未经客户允许将只用于处理客户的订货信息，对外严格保密。（带
						<font color="red">*</font>号的为必填项，其它的可以不填）
					</td>
				</tr>
				<tr>
					<td align="right" width=40%>用户名</td>
					<td align="left"><input name="userid" type="text" size="20" disabled
					value="<%=s_userid%>"></td>
				</tr>
				<tr>
					<td align="right">真实姓名</td>
					<td align="left"><input name="username" type="text" size="20" 
					value="<%=s_username%>"> <font color="red">*</font></td>
				</tr>
				<tr>
					<td align="right">性别</td>
					<td align="left">
						<select name="gender">
							<option value="男"<%=(s_gender.equals("男") ? " selected " : "")%>>
								男
							</option>
							<option value="女"<%=(s_gender.equals("女") ? " selected " : "")%>>
								女
							</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right">住址</td>
					<td align="left"><input name="address" type="text" size="20"
						value="<%=s_address%>"> <font color="red">*</font> (请您提供尽可能详细的地址)</td>
				</tr>
				<tr>
					<td align="right">邮编</td>
					<td align="left"><input name="postcode" type="text" size="20"
						value="<%=s_postcode%>"> <font color="red">*</font></td>
				</tr>
				<tr>
					<td align="right">联系电话</td>
					<td align="left">
						<input name="phone" type="text" size="20" value="<%=s_phone%>">
						<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td align="right">E-mail</td>
					<td align="left">
						<input name="email" type="text" size="20" value="<%=s_email%>">
					</td>
				</tr>
				<tr>
					<td colspan=2 align="center">
						<input name="submit" type="submit" value="修改个人信息 "
							onclick="return checksubmit();">
						<input name="reset" type="reset" value="重新填写 ">
					</td>
				</tr>
				<tr height=150>
				</tr>
			</table>
		</form>
		<jsp:include page="bottom.jsp" />
	</body>
</html>