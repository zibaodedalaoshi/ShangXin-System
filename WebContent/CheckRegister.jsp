<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册检测</title>
</head>
<body>
	<%
	int id = (int) (Math.random()*1000000);
	String user = new String(request.getParameter("username").getBytes("ISO8859_1"),"utf-8");
    String pwd = new String(request.getParameter("password").getBytes("ISO8859_1"),"utf-8");
    int balance = 50;
    String city = new String(request.getParameter("city").getBytes("ISO8859_1"),"utf-8");
    String phone = new String(request.getParameter("phone").getBytes("ISO8859_1"),"utf-8");
    String address = new String(request.getParameter("address").getBytes("ISO8859_1"),"utf-8");
    Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://127.0.0.1:3306/shangxin?serverTimezone=GMT%2B8";
	String usename = "root";
	String psw= "root";  
    Connection conn = DriverManager.getConnection(url,usename,psw);//得到连接  
    PreparedStatement pStmt = conn.prepareStatement("select * from user_message where ACCOUNT = '" + user + "'");  
    ResultSet rs = pStmt.executeQuery();
	  if(rs.next()){  
          out.println("<script language='javascript'>alert('该用户已存在，请重新注册！');window.location.href='Registration.jsp';</script>");  
      }else{  
          PreparedStatement tmt = conn.prepareStatement("Insert into user_message values('" + id + "','" + user + "','" + pwd + "','" + balance + "','" + city + "','" + phone + "','" + address + "')");  
              int rst = tmt.executeUpdate();  
              if (rst != 0){  
                    out.println("<script language='javascript'>alert('用户注册成功！');window.location.href='Login_Signup.jsp';</script>");    
              }else{  
                 out.println("<script language='javascript'>alert('用户注册失败！');window.location.href='Login_Signup.jsp';</script>");    
              }  
      }	
	%>
</body>

</html>