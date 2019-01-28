<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*,java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新订单检测</title>
</head>
<body>
	<%
	Object submitter = session.getAttribute("user");
	int id = (int) (Math.random()*1000000);
	int id2 = (int) (Math.random()*1000000);
	String name = new String(request.getParameter("name").getBytes("ISO8859_1"),"utf-8");
	String introduction = new String(request.getParameter("introduction").getBytes("ISO8859_1"),"utf-8");
    String price = new String(request.getParameter("price").getBytes("ISO8859_1"),"utf-8");
    String type = new String(request.getParameter("type").getBytes("ISO8859_1"),"utf-8");
    String date = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
    String region = new String(request.getParameter("region").getBytes("ISO8859_1"),"utf-8");
    String amount = new String(request.getParameter("amount").getBytes("ISO8859_1"),"utf-8");
    Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://127.0.0.1:3306/shangxin?serverTimezone=GMT%2B8";
	String usename = "root";
	String psw= "root";  
    Connection conn = DriverManager.getConnection(url,usename,psw);//得到连接  
    PreparedStatement pStmt = conn.prepareStatement("select * from product_message where ID = '" + id + "'");
    ResultSet rs = pStmt.executeQuery();  			
	  if(rs.next()){  
          out.println("<script language='javascript'>alert('请勿重复提交商品！');window.location.href='submit_order.jsp';</script>");  
      }else{  
          PreparedStatement tmt = conn.prepareStatement("Insert into product_message values('" + id + "','" + name + "','" + price + "','" + type + "','" + submitter + "','" + date + "','" + region + "','" + amount + "','" + introduction + "')");  
          int rst = tmt.executeUpdate(); 

              if (rst != 0){  
                    out.println("<script language='javascript'>alert('上架商品成功！');window.location.href='index.jsp';</script>");    
              }else{  
                 out.println("<script language='javascript'>alert('上架商品失败！');window.location.href='submit_order.jsp';</script>");    
              }    
      }	
	  
	    PreparedStatement pStmt2 = conn.prepareStatement("select * from personal_order");
	    ResultSet rs2 = pStmt2.executeQuery();  			
	    rs2.next();  
	    PreparedStatement tmt2 = conn.prepareStatement("Insert into personal_order values('" + id2 + "','" + name + "','" + price + "','" + "" + "','" + date + "','" + submitter + "','" + "" + "','" + amount + "','" + id + "')");  
	    int rst2 = tmt2.executeUpdate(); 

	%>
</body>

</html>