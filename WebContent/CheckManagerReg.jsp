<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员登录检测</title>
</head>
<body>
	
	<%		
		String username = new String(request.getParameter("username").getBytes("ISO8859_1"),"utf-8");
	        String password = new String(request.getParameter("password").getBytes("ISO8859_1"),"utf-8");//取得从Login.jsp提交过来的数据
	      //连接数据库的基本操作
	        Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://127.0.0.1:3306/shangxin?serverTimezone=GMT%2B8";
		String usename = "root";
		String psw= "root";
		Connection conn = DriverManager.getConnection(url, usename, psw);
		if(conn != null){
			String sql = "select * from manager_message where ACCOUNT='"+username+"' and PASSWORD='"+ password + "'";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);			
				if(rs.next()){
					  out.println("<script language='javascript'>alert('登录成功！');window.location.href='ManagerIndex.jsp';</script>");
					   session.setAttribute("user", username);
					   session.setMaxInactiveInterval(600);
					//response.sendRedirect("index.jsp");
				}else{	
					 out.println("<script language='javascript'>alert('登录失败！');window.location.href='Login.jsp';</script>");
	               // response.sendRedirect("Login.jsp");//密码不对返回到登陆    	                  
				}
			}									
	
	%>


</body>
</html>