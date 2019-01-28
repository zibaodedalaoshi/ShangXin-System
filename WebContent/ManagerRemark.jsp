<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet"  type="text/css"  href="css/main.css"/>
<title>商品评论</title>

</head>
<body>
<div id="page-wrapper">
			<!-- Header -->
				<div id="header-wrapper">
					<header id="header" class="container">

						<!-- Logo -->
							<div id="logo">
								<h1><a href="ManagerIndex.jsp">ShangXin</a></h1>
							</div>
					   <%
					    if(session.getAttribute("user") == null)
					    {
					    	out.println("<script>alert('请先登陆');window.location.href='Login_Signup.jsp'</script>");
					    	return;
					    }
					    Object user = session.getAttribute("user");
						Class.forName("com.mysql.jdbc.Driver");
				        String url = "jdbc:mysql://127.0.0.1:3306/shangxin?serverTimezone=GMT%2B8";
					    String usename = "root";
		  			    String psw= "root";
		 			    Connection con = DriverManager.getConnection(url, usename, psw);
		 			    Statement stmt_remark = con.createStatement();
		 			    Statement stmt = con.createStatement();
		 			    out.println("欢迎管理员");
					   %>

						<!-- Nav -->
							<nav id="nav">
								<ul>
									<li><a href="ManagerIndex.jsp">商品主页</a></li>
									<form action="#" method="post">
									<button type="submit" formaction="logout.jsp">退出登录</button>
									</form>
									
								</ul>
							</nav>
					</header>
  </div>
    <br/>
  
<%

        String ID = new String(request.getParameter("id").getBytes("ISO8859_1"),"utf-8");
        System.out.println(ID);
        //int ID = Integer.parseInt(sID);
        String s_remark ="select * from product_remark where PRODUCTID='" +ID+ "'";
        String s_product ="select * from product_message where ID='" +ID+ "'";
		
        ResultSet rs_remark = stmt_remark.executeQuery(s_remark);
        ResultSet rs_product = stmt.executeQuery(s_product);
        rs_product.next();
        
%>		
<table align="center" width="50%" border=1>
<tr><th style="font-size: 16px"><%=rs_product.getString(2)%></th><th style="font-size: 16px">评分</th><th style="font-size: 16px">评论</th><th style="font-size: 16px">时间</th>

<%
        	while(rs_remark.next()){	
%>
		<tr>
		<td></td>
		<td><%=rs_remark.getString(3)%></td>
		<td><%=rs_remark.getString(4)%></td>
		<td><%=rs_remark.getString(5)%></td>
		</tr>
<%
       }
   
%>

<% 	
        rs_remark.close();
        rs_product.close();
		stmt.close();
		stmt_remark.close();
		con.close();
 %>
</table>
</body>
</html>