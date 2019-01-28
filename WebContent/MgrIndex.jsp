<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet"  type="text/css"  href="css/main.css"/>
<title>商品主页</title>
</head>
<body>
<div id="page-wrapper">
			<!-- Header -->
				<div id="header-wrapper">
					<header id="header" class="container">

						<!-- Logo -->
							<div id="logo">
								<h1><a href="MgrIndex.jsp">ShangXin</a></h1>
							</div>
					   <%
					    
					    Object Manager = session.getAttribute("Manager");
						Class.forName("com.mysql.jdbc.Driver");
				        String url = "jdbc:mysql://127.0.0.1:3306/shangxin?serverTimezone=GMT%2B8";
					    String usename = "root";
		  			    String psw= "123";
		 			    Connection con = DriverManager.getConnection(url, usename, psw);
		 			    Statement stmt=con.createStatement();
						out.println("欢迎管理员！");

					   %>

						<!-- Nav -->
							<nav id="nav">
								<ul>
									<li class="current"><a href="index.jsp">商品主页</a></li>
									<form action="#" method="post">
									<button type="submit" formaction="logout.jsp">退出登录</button>
									<button type="submit" formaction="submit_order.jsp">提交订单</button>
									</form>

								</ul>
							</nav>
					</header>
  </div>
</div>
  <br/>
  
<table align="center" width="50%" border=1>

<tr><th style="font-size: 16px">名称</th><th style="font-size: 16px">价格</th><th style="font-size: 16px">类型</th><th style="font-size: 16px">地区</th><th style="font-size: 16px">剩余数量</th><th style="font-size: 16px">操作</th>

<%

		String s="select * from product_message";
		
		ResultSet rs=stmt.executeQuery(s);
		
		while(rs.next())
		
		{
		
		out.println("<tr><td>"+rs.getString(2)+"</td><td>"+rs.getDouble(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(10)+"</td><td>"+rs.getString(11)+"</td><td><a href='add_cart.jsp'>下架该商品</a></td>");
		
		}
		
		rs.close();
		
		stmt.close();
		
		con.close();

 %>

</table>

  
  
</body>
</html>
