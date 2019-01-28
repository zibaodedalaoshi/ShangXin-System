<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*,java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新评论检测</title>
</head>
<body>
	<%
	Object user = session.getAttribute("user");
	int id = (int) (Math.random()*1000000);
	String remark = new String(request.getParameter("remark").getBytes("ISO8859_1"),"utf-8");
	String price = new String(request.getParameter("price").getBytes("ISO8859_1"),"utf-8");
	String pID = new String(request.getParameter("pID").getBytes("ISO8859_1"),"utf-8");
    String point = new String(request.getParameter("point").getBytes("ISO8859_1"),"utf-8");
    String name = new String(request.getParameter("name").getBytes("ISO8859_1"),"utf-8");
    String date = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
    String sub_date = new String(request.getParameter("submittime").getBytes("ISO8859_1"),"utf-8");
    String trade_date = new String(request.getParameter("buytime").getBytes("ISO8859_1"),"utf-8");
    String amounts = new String(request.getParameter("buy_amounts").getBytes("ISO8859_1"),"utf-8");
    String seller = new String(request.getParameter("submitter").getBytes("ISO8859_1"),"utf-8");
    Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://127.0.0.1:3306/shangxin?serverTimezone=GMT%2B8";
	String usename = "root";
	String psw= "root";  
    Connection conn = DriverManager.getConnection(url,usename,psw);//得到连接  
    PreparedStatement pStmt = conn.prepareStatement("select * from product_remark where ID = '" + id + "'");
    ResultSet rs = pStmt.executeQuery();  			
	  if(rs.next()){  
          out.println("<script language='javascript'>alert('请勿重复提交评论！');window.location.href='Remark.jsp';</script>");  
      }else{  
          PreparedStatement tmt = conn.prepareStatement("Insert into product_remark values('" + id + "','" + name + "','" + price + "','" + point + "','" + remark + "','" + amounts + "','" + date + "','" + trade_date + "','" + sub_date+ "','" + user + "','" + seller + "','" + pID + "')");  
          int rst = tmt.executeUpdate(); 

              if (rst != 0){  
                    out.println("<script language='javascript'>alert('评论提交成功！');window.location.href='index.jsp';</script>");    
              }else{  
                 out.println("<script language='javascript'>alert('评论提交失败！');window.location.href='order.jsp';</script>");    
              }    
      }	
	  

	%>
</body>

</html>