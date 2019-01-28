<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet"  type="text/css"  href="css/main.css"/>
<title>密码修改</title>

</head>
<body>
<div id="page-wrapper">
			<!-- Header -->
				<div id="header-wrapper">
					<header id="header" class="container">

						<!-- Logo -->
							<div id="logo">
								<h1><a href="index.jsp">ShangXin</a></h1>
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
		 			    Statement stmt=con.createStatement();
		 			    String sql = "select * from user_message where ACCOUNT='"+user+"' ";
		 				ResultSet r = stmt.executeQuery(sql);			
						if(r.next()){
							out.println("欢迎"+user+",您的余额为:"+r.getDouble(4));
							String str = r.getString(3);
						}
					    
					   %>

						<!-- Nav -->
							<nav id="nav">
								<ul>
									<li><a href="index.jsp">商品主页</a></li>
									<li><a href="cart.jsp">购物车</a></li>
									<li><a href="order.jsp">个人订单</a></li>
									<li class="current"><a href="psw_modify.jsp">修改密码</a></li>
									<form action="#" method="post">
									<button type="submit" formaction="logout.jsp">退出登录</button>
									<button type="submit" formaction="submit_order.jsp">上架商品</button>
									<button type="submit" formaction="recharge.jsp">充值中心</button>
									</form>				
								</ul>
							</nav>
					</header>
  </div>
  
  <center>
  <br><br><br><br>
  
		<font face="楷体" size="6" color="#000"></font>
		<form action="CheckNewPassword.jsp" method="post">
			<table width="50" height="60" border="5" bordercolor="#A0A0A0">
			<tr><th>输入新密码：</th></tr>
				<tr>
					<td><input type="text" name="password" value="输入您的密码"
						maxlength="20" onfocus="if(this.value == '输入您的密码') this.value =''"></td>
				</tr>
				</tr>

				<tr>
					<td colspan="2" align="center"><input type="submit" value="修  改"  onclick="return validateModify()"> <input type="reset" value="重  置"></td>
				</tr>
	</center>

</body>
</html>