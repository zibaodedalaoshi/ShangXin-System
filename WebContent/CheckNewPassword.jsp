<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新密码检测</title>
</head>
<body>
	<%
	Object user = session.getAttribute("user");
	String password = new String(request.getParameter("password").getBytes("ISO8859_1"),"utf-8");
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
    while(r.next()){//将所有记录重新写入，但其实只改变了密码
    ps.setInt(1,r.getInt(1));
    ps.setString(2, r.getString(2));
    ps.setString(3, password);
    ps.setDouble(4, r.getDouble(4));
    ps.setString(5, r.getString(5));
    ps.setString(6, r.getString(6));
    ps.setString(7, r.getString(7));
    int i = ps.executeUpdate();//更新操作
    if(i > 0)
    {
    	out.println("<script language='javascript'>alert('修改成功！');window.location.href='index.jsp';</script>");
    }
    else
    {
    	out.println("<script language='javascript'>alert('修改失败！');window.location.href='index.jsp';</script>");
    } 
    }
	%>
</body>

</html>