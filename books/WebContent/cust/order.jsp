<%@ page language="java" import="bean.*,java.sql.*,java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//验证用户身份-----------------------------------------------
	String s_userid=(String)session.getAttribute("userid");
    if(s_userid==null){//用户名为空，用户未登录
    	response.sendRedirect("index.jsp");
		return;
	}
	//生成连接数据库实例db,结果集实例rs-------------------------------
	request.setCharacterEncoding("UTF-8");
    DBJavaBean db=new DBJavaBean();
    ResultSet rs = null;
    //查询当前订单最大编号------------------------------------------
    String sql="select max(orderid) from orderform";
    rs=db.selectResultSet(sql);//调用查询方法selectResultSet
    rs.next();//指针下移，指向查询结果
    String s_orderid=rs.getString(1);//取结果集中的第1个字段
    int i_orderid = Integer.parseInt(s_orderid)+1;//当前订单号+1
    s_orderid=Integer.toString(i_orderid);//把整型数据转字符串
    //获取用户填写的订单信息---------------------------------
    String s_payment=request.getParameter("payment");
    String s_deliver=request.getParameter("deliver");
    String s_address=request.getParameter("address");
    String s_phone=request.getParameter("phone");
    String s_postcode=request.getParameter("postcode");
    String s_username=request.getParameter("username");
    //--------------------------------------------------
    int i_totalnum=0;//订单数量
    double d_totalamount=0.0;//订单总价  
    Iterator it=null;//迭代集
    Collection c_cart=(Collection)session.getAttribute("cart");
    if(c_cart==null){//购物车如果为空，则提示用户不能重复下单
        String temp = "用户您好，请您不要重复下单，返回！";
		temp = java.net.URLEncoder.encode(temp.toString(), "UTF-8");
		String s_src = "img/sorry.jpeg";
		String s_href = "javascript:history.go(-1);";
		response.sendRedirect("message.jsp?message=" + temp+"&src="+s_src+"&href="+s_href);
		return;
    }
    //购物车有商品，开始执行下单，将订单信息插入数据库
    try {
		it=c_cart.iterator();
    	while(it.hasNext()){
       		cartBean cbean=(cartBean)(it.next());
       		i_totalnum+=cbean.ordernum;
       		d_totalamount+=cbean.subtotal;
       		//orderdetail是订单详情表----合成一行-----------------------
       		sql="insert into orderdetail(orderid,bookid,bookname,publisher,unitprice,ordernum) values('"+s_orderid+"','"+cbean.bookid+"','"+cbean.bookname+"','"+cbean.publishername+"','"+cbean.unitprice+"','"+cbean.ordernum+"')";
       		//----------------------------------------------------
       		db.updateResultSet(sql);//执行更新数据库操作
    	}//endwhile
    	//--------------------合成一行-------------------------------
    	sql="insert into orderform(orderid,orderdate,userid,totalnum,totalamount,payment,deliver,receiver,address,phone,postcode,state) values('"+s_orderid+"',now(),'"+s_userid+"','"+i_totalnum+"','"+d_totalamount+"','"+s_payment+"','"+s_deliver+"','"+s_username+"','"+s_address+"','"+s_phone+"','"+s_postcode+"','0')";
    	//---------------------------------------------------------
    	db.updateResultSet(sql);
    	//--------------------合成一行--------------------------------
    	response.sendRedirect("ordersuccessform.jsp?orderid="+s_orderid+"&payment="+s_payment+"&deliver="+s_deliver+"&receiver="+s_username+"&address="+s_address+"&phone="+s_phone+"&postcode="+s_postcode);
    	//----------------------------------------------------------
	} catch (Exception e) {
		String temp = "尊敬的用户“"+s_userid+"”，您的密码修改失败，返回！";
		temp = java.net.URLEncoder.encode(temp.toString(), "UTF-8");
		String s_src = "img/sorry.jpeg";
		String s_href = "javascript:history.go(-1);";
		//-------------------合成一行-----------------------------
		response.sendRedirect("message.jsp?message=" + temp+"&src="+s_src+"&href="+s_href);
		//---------------------------------------------------------
	} 
%>