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
		String sql = "select * from product_message where ID='"+id+"'";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);			
		if(rs.next()){
			int pe_id = (int) (Math.random()*1000000);
			String name = rs.getString(2);
			int price = rs.getInt(3);
			String Submitter = rs.getString(5);
			int amount = rs.getInt(8);
			String sql2 = "select * from personal_cart where PRODUCTID='"+id+"' AND CLIENT='"+user+"'";
			ResultSet rs2 = stmt.executeQuery(sql2);
			if(rs2.next()){
				out.println("<script language='javascript'>alert('加入购物车失败,请勿重复添加该商品！');window.location.href='index.jsp';</script>");;
			}
			else{
			if(!Submitter.equals(user) ){
			PreparedStatement tmt = conn.prepareStatement("Insert into personal_cart values('" + pe_id + "','" + name + "','" + price + "','" + amount + "','" + Submitter + "','" + user + "','" + id + "')");  
            int rst = tmt.executeUpdate();  
              if (rst != 0){  
                    out.println("<script language='javascript'>alert('加入购物车成功！');window.location.href='index.jsp';</script>");    
              }else{  
                 out.println("<script language='javascript'>alert('加入购物车失败！');window.location.href='index.jsp';</script>");    
              }  
			}
			else{
				out.println("<script language='javascript'>alert('加入购物车失败,该商品是您自己提交的！');window.location.href='index.jsp';</script>");;
			}
			}
	}	
		
	
	%>

</body>
</html>