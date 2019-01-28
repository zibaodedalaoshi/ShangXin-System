<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>购物车</title>




<!-- Standard Favicon -->
	<link rel="icon" type="image/x-icon" href="images//favicon.ico" />
	
	<!-- For iPhone 4 Retina display: -->
	<link rel="apple-touch-icon-precomposed" href="images//apple-touch-icon-114x114-precomposed.png">
	
	<!-- For iPad: -->
	<link rel="apple-touch-icon-precomposed" href="images//apple-touch-icon-72x72-precomposed.png">
	
	<!-- For iPhone: -->
	<link rel="apple-touch-icon-precomposed" href="images//apple-touch-icon-57x57-precomposed.png">	
	
	<!-- Library - Google Font Familys -->
	<link href="https://fonts.googleapis.com/css?family=Arizonia|Crimson+Text:400,400i,600,600i,700,700i|Lato:100,100i,300,300i,400,400i,700,700i,900,900i|Montserrat:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
	
	<link rel="stylesheet" type="text/css" href="revolution/css/settings.css">
 
	<!-- RS5.0 Layers and Navigation Styles -->
	<link rel="stylesheet" type="text/css" href="revolution/css/layers.css">
	<link rel="stylesheet" type="text/css" href="revolution/css/navigation.css">
	
	<!-- Library - Bootstrap v3.3.5 -->
    <link rel="stylesheet" type="text/css" href="libraries/lib.css">
	
	<!-- Custom - Common CSS -->
	<link rel="stylesheet" type="text/css" href="css/plugins.css">			
	<link rel="stylesheet" type="text/css" href="css/navigation-menu.css">
	<link rel="stylesheet" type="text/css" href="css/shortcode.css">
	<link rel="stylesheet" type="text/css" href="style.css">
	

<!--[if lt IE 9]>
<script src="js/html5/respond.min.js"></script>
<![endif]-->
 
</head>


<body data-offset="200" data-spy="scroll" data-target=".ow-navigation">
	<div class="main-container">
		<!-- Loader -->
		<div id="site-loader" class="load-complete">
			<div class="loader">
				<div class="loader-inner ball-clip-rotate">
					<div></div>
				</div>
			</div>
		</div><!-- Loader /- -->	
		
		<!-- Header -->
		<header class="header-section header-section-1 container-fluid no-padding">
			<!-- Top Header -->
			<div class="top-header top-header1 container-fluid no-padding">
				<!-- Container -->
				<div class="container">
					<div class="col-md-7 col-sm-7 col-xs-7 dropdown-bar">
					</div>
					<!-- Social -->
				</div><!-- Container /- -->
			</div><!-- Top Header /- -->
			
			
			<!-- Menu Block -->
			<div class="container-fluid no-padding menu-block">
				<!-- Container -->
				<div class="container">
					<!-- nav -->
					<nav class="navbar navbar-default ow-navigation">
						<div class="navbar-header">
							<button aria-controls="navbar" aria-expanded="false" data-target="#navbar" data-toggle="collapse" class="navbar-toggle collapsed" type="button">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<div class="navbar-collapse collapse" id="navbar">
							<ul class="nav navbar-nav">
								<li><a href="index.jsp">商品主页</a></li>
								<li><a href="cart.jsp">购物车</a></li>
								<li><a href="order.jsp">个人订单</a></li>
								<li><a href="logout.jsp">退出登录</a></li>
							</ul>
						</div><!--/.nav-collapse -->
					</nav><!-- nav /- -->
				</div><!-- Container /- -->
			</div><!-- Menu Block /- -->
		</header><!-- Header /- -->
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
            r.next();
		 %>
		<main>
			<!-- Page Banner -->
			<div class="page-banner container-fluid no-padding">
				<!-- Container -->
				<div class="container">
					<div class="banner-content">
						<h3>购物车</h3>
						<p>our vision is to be Earth's most customer centric company</p>
					</div>
					<ol class="breadcrumb">
						<li><a href="index.html" title="Home">商品主页</a></li>							
						<li class="active">购物车</li>
					</ol>
				</div><!-- Container /- -->
			</div><!-- Page Banner /- -->
			
        	<div class="section-header">
               <h3>购物车</h3>
               <img src="images/section-seprator.png" alt="section-seprator" />
       		</div><!-- Section Header /- -->
			<!-- Cart -->
			<div class="woocommerce-cart container-fluid no-left-padding no-right-padding">
				<!-- Container -->
				<div class="container">
					<!-- Cart Table -->
					<div class="col-md-12 col-sm-12 col-xs-12 cart-table">
						<form name="fcart">
							<table class="table table-bordered table-responsive">
								<thead>
									<tr>
										<th class="product-name">商品名称</th>
										<th class="product-unit-price">商品单价</th>
										<th class="product-quantity">剩余数量</th>
										<th class="product-quantity">卖家名称</th>
										<th class="product-remove">购买数量</th>
										<th class="product-remove">购买价格</th>
										<th class="product-remove">立即购买</th>
									</tr>
								</thead>
								
								
								
								 <script>
								 var quan = new Array();
								 var sum = new Array();
                                 var price = new Array();
								</script>
								
								
								
								<%
								String s="select * from personal_cart where CLIENT='"+user+"' ";
								
								ResultSet rs=stmt.executeQuery(s);
								                  
                                int i = 0;
								while(rs.next()){	
							    String temp =  String.valueOf(rs.getInt(7));

                         
							    %>
                                <script>
                                   price[<%=i%>] = <%=rs.getDouble(3)%>;
                                </script>
                                
								<tbody>
									<tr class="cart_item">
										<td data-title="Product Name" class="product-name"><%=rs.getString(2) %></td>
										<td data-title="Unit Price" class="product-unit-price"><%=rs.getDouble(3) %></td>
										<td data-title="Total" class="product-subtotal"><%=rs.getString(4) %></td>
										<td data-title="Total" class="product-subtotal"><%=rs.getString(5) %></td>
										<td data-title="Quantity" class="product-quantity">
											<div class="prd-quantity" data-title="Quantity">
												<input name="quantity" value="" class="qty" type="text" id="quan[<%=i%>]" >
											</div>
										</td>
										<td id="sum[<%=i%>]">0</td>
										<td data-title="Total" class="product-subtotal"><a href="Check_buynow_index.jsp?id=<%=temp%>"><i class="icon icon-Dollar"></i></a></td>
									</tr>
									<script type="text/javascript">
									function getMul(){
										var input = document.getElementbyId("quan[<%=i%>]");
										input.onkeyup = testChange('sum[<%=i%>]','quan[<%=i%>]',<%=i%>);
									}
									
									</script>
								  <%
								  i++;
								}
							
								  %>
								  
								  <script type="text/javascript">
									function testChange(sum,quan,j){
										document.getElementById(sum).innerHTML = document.getElementById(quan).innerHTML*price[j];
									}
									window.onload=testChange;
									</script>
									<tr>
										<td class="action" colspan="7">
											<a href="cart.jsp" title="update">更新数据</a>
										</td>
									</tr>
								</tbody>
							</table>
						</form>
					</div><!-- Cart Table /- -->
				</div><!-- Container /- -->
			</div><!-- Cart /- -->
			
			
        </main>
        


        
		
	
	<!-- JQuery v1.12.4 -->
	<script src="js/jquery.min.js"></script>

	<!-- Library - Js -->
	<script src="libraries/lib.js"></script>
	
	<script src="libraries/jquery.countdown.min.js"></script>
	
	<!-- RS5.0 Core JS Files -->
	<script type="text/javascript" src="revolution/js/jquery.themepunch.tools.min.js?rev=5.0"></script>
	<script type="text/javascript" src="revolution/js/jquery.themepunch.revolution.min.js?rev=5.0"></script>
	<script type="text/javascript" src="revolution/js/extensions/revolution.extension.video.min.js"></script>
	<script type="text/javascript" src="revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
	<script type="text/javascript" src="revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
	<script type="text/javascript" src="revolution/js/extensions/revolution.extension.navigation.min.js"></script>
	
	<!-- Library - Google Map API -->
	<!---<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDW40y4kdsjsz714OVTvrw7woVCpD8EbLE"></script>--->

	<!-- Library - Theme JS -->
	<script src="js/functions.js"></script>
	
</body>

<%-- <body>
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
						}
					    r.close();
					   %>

						<!-- Nav -->
							<nav id="nav">
								<ul>
									<li><a href="index.jsp">商品主页</a></li>
									<li class="current"><a href="cart.jsp">购物车</a></li>
									<li><a href="order.jsp">个人订单</a></li>
									<li><a href="psw_modify.jsp">修改密码</a></li>
									<form action="#" method="post">
									<button type="submit" formaction="logout.jsp">退出登录</button>
									<button type="submit" formaction="submit_order.jsp">提交订单</button>
									<button type="submit" formaction="recharge.jsp">充值中心</button>
									</form>
									
								</ul>
							</nav>
					</header>
  </div>
    <br/>
  
<table align="center" width="50%" border=1>

<tr><th style="font-size: 16px">名称</th><th style="font-size: 16px">价格</th><th style="font-size: 16px">剩余数量</th><th style="font-size: 16px">卖家</th><th style="font-size: 16px">操作</th>

<%

		String s="select * from personal_cart where CLIENT='"+user+"' ";
		
		ResultSet rs=stmt.executeQuery(s);
		
		while(rs.next())
		
		{		
	    String temp =  String.valueOf(rs.getInt(7));	

%>
		<tr>
		<td><%=rs.getString(2)%></td>
		<td><%=rs.getString(3)%></td>
		<td><%=rs.getString(4)%></td>
		<td><%=rs.getString(5)%></td>
		<td><a href="Check_buynow_index.jsp?id=<%=temp%>">现在购买</a></td>
<%
		
		}
		
		rs.close();
		
		stmt.close();
		
		con.close();

 %>

</table>
  

</body> --%>
</html>