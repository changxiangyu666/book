<%@ page language="java" import="java.util.*,java.sql.*,bean.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
    request.setCharacterEncoding("UTF-8");
	//使用DBJavaBean链接数据库mysql
    DBJavaBean db=new DBJavaBean();
    //声明结果集rs
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
		<script type="text/javascript">
function checksubmit() {
	
	if (document.orderform.username.value == "") {
		alert("请输入收货人姓名！");
		document.orderform.username.focus();
		return false;
	}
	if (document.orderform.address.value == "") {
		alert("请输入收货人地址！");
		document.orderform.address.focus();
		return false;
	}
	if (document.orderform.postcode.value == "") {
		alert("请输入收货人邮编！");
		document.orderform.postcode.focus();
		return false;
	}
	if (document.orderform.phone.value == "") {
		alert("请输入收货人联系电话！");
		document.orderform.phone.focus();
		return false;
	}

 return true;
}

</script>
</head>
<body>
		<jsp:include page="top.jsp"></jsp:include>
		<table width=750 border=0 align="center" cellspacing=0 cellpadding=0
			class=td>
			<tr height=400>
				<td valign="top">
					<div align="center">
						<form name="orderform" action="cust/order.jsp"	method="post">
							<table width="80%" border="0" cellpadding="1" cellspacing="1"
								class="td">
                                <% 
                                 String s_userid=(String)session.getAttribute("userid");
                                 if(s_userid!=null){
                                 String s_select = "select * from userinfo where userid='"+s_userid+"'";
							     rs=db.selectResultSet(s_select);
                                 rs.next();
	                             String  s_username=rs.getString("username");
	                             String  s_address=rs.getString("address");
	                             String  s_phone=rs.getString("phone");
	                             String  s_postcode=rs.getString("postcode");
	                          %>
 								<tr>
									<td>
										<div align="right">
											收货人姓名
										</div>
									</td>
									<td>
										<div align="left">
											<input name="username" type="text" size="20" value="<%=s_username %>">
											<font color="red">*</font>
										</div>
									</td>
								</tr>
								
								<tr>
									<td>
										<div align="right">
											收货人住址
										</div>
									</td>
									<td>
										<div align="left">
											<input name="address" type="text" size="20" value="<%=s_address %>">
											<font color="red">*</font>(请您提供尽可能详细的地址)
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div align="right">
											收货人邮编
										</div>
									</td>
									<td>
										<div align="left">
											<input name="postcode" type="text" size="20" value="<%=s_postcode %>">
											<font color="red">*</font>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div align="right">
											收货人联系电话
										</div>
									</td>
									<td>
										<div align="left">
											<input name="phone" type="text" size="20" value="<%=s_phone %>">
											<font color="red">*</font>
										</div>
									</td>
								</tr>
								<tr>
								   <td align="right">付费方式：</td>
								   <td>
								      <select name=payment>
								        <option value="邮局汇款">邮局汇款</option>
								        <option value="银行转账">银行转账</option>
								        <option value="货到付款">货到付款</option>
								      </select>
								   </td>
								</tr>
								<tr>
								   <td align="right">送货方式：</td>
								   <td>
								      <select name=deliver>
								        <option value="圆通">圆通</option>
								        <option value="EMS">EMS</option>
								        <option value="顺丰">顺丰</option>
								      </select>
								   </td>
								</tr>
								
								<tr>
									<td colspan=2>
										<div >
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<input name="submit" type="submit" value="我要下订单 "
												onclick="return checksubmit();">
											&nbsp;&nbsp;
											<input name="reset" type="reset" value="重新填写 ">
										</div>
									</td>
								</tr>
                                <%}else{ %>
                                <tr>
									<td colspan="2">
										身份验证：<br/>
										
										您还没有登录,您的购书车信息我们会为您保留:<br/>
										1.如果您是我们的会员请您回到<a href="cust/index.jsp">首页登陆</a>;<br/>
										2.如果您是新用户,请您先<a href="cust/register.jsp">注册</a>;
									</td>
								</tr>
                                <%} %>

							</table>
						</form>
					</div>


				</td>
			</tr>
		</table>
		<jsp:include page="bottom.jsp"></jsp:include>
	</body>
</html>