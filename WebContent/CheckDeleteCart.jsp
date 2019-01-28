<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加至购物车</title>
</head>
<body>

<%		
		Object user = session.getAttribute("user");
        String temp = request.getParameter("id");
		int id = Integer.parseInt(temp);
	      //连接数据库的基本操作
	    Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://127.0.0.1:3306/shangxin?serverTimezone=GMT%2B8";
		String usename = "root";
		String psw= "root";
		Connection conn = DriverManager.getConnection(url, usename, psw);
		if(conn != null){
			String sql = "select * from personal_cart where PRODUCTID='"+id+"' AND CLIENT='"+user+"' ";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);			
				if(rs.next()){
					
					PreparedStatement tmt = conn.prepareStatement("delete from personal_cart where PRODUCTID='" +id+ "' AND CLIENT='"+user+"' ");  
		            int rst = tmt.executeUpdate();  
		              if (rst != 0){  
		                    out.println("<script language='javascript'>alert('删除购物车成功！');window.location.href='cart.jsp';</script>");    
		              }
		              else{  
		                 out.println("<script language='javascript'>alert('删除购物车失败！');window.location.href='cart.jsp';</script>");    
		              }  
					
			}	
		}
	
	%>

</body>
</html>