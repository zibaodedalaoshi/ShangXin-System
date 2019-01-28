<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>充值检测</title>
</head>
<body>
	<%
	Object user = session.getAttribute("user");
	String balance = new String(request.getParameter("balance").getBytes("ISO8859_1"),"utf-8");
	String password = new String(request.getParameter("psw").getBytes("ISO8859_1"),"utf-8");
    Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://127.0.0.1:3306/shangxin?serverTimezone=GMT%2B8";
	String usename = "root";
	String psw= "root";  
    Connection conn = DriverManager.getConnection(url,usename,psw);//得到连接  
    String sql="Update user_message set ID=?,ACCOUNT=?,PASSWORD=?,BALANCE=?,CITY=?,PHONENUMBER=?,ADDRESS=? where ACCOUNT='"+user+"' ";
    String sql2 = "select * from user_message where ACCOUNT='"+user+"' ";
    Statement stmt=conn.createStatement();
    ResultSet r = stmt.executeQuery(sql2);

    PreparedStatement ps = conn.prepareStatement(sql);
    while(r.next()){//将所有记录重新写入
    	if(password.equals(r.getString(3))){//判断密码是否一致
    		double b = Double.parseDouble(balance)+r.getDouble(4);//金额相加，视为充值
    	    ps.setInt(1,r.getInt(1));
    	    ps.setString(2, r.getString(2));
    	    ps.setString(3, r.getString(3));
    	    ps.setDouble(4, b);
    	    ps.setString(5, r.getString(5));
    	    ps.setString(6, r.getString(6));
    	    ps.setString(7, r.getString(7));
    	    int i = ps.executeUpdate();//更新操作
    	    if(i > 0)
    	    {
    	    	out.println("<script language='javascript'>alert('充值成功！');window.location.href='index.jsp';</script>");
    	    }
    	    else
    	    {
    	    	out.println("<script language='javascript'>alert('充值失败！');window.location.href='recharge.jsp';</script>");
    	    } 
    	}
    	else{
    			out.println("<script language='javascript'>alert('充值失败，密码有误！');window.location.href='recharge.jsp';</script>");
    	}
    
    }
	%>
</body>

</html>