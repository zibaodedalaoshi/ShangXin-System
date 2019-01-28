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
<title>个人订单</title>

<script type="text/javascript">
	function addCheck() {//判断是否有输入，若没有按照要求输入则提醒
		var name = document.frmOrder.name.value;
		var introduction = document.frmOrder.introduction.value;
		var price = document.frmOrder.price.value;
		var region = document.frmOrder.region.value;
		var amount = document.frmOrder.amount.value;
		if ((name == "") || (name == "输入商品名称")) {
			alert("请输入商品名!");
			return false;
		}
		if ((price == "") || (price == "输入该商品出售的价格")) {
			alert("请输入商品价格!");
			return false;
		} 
		if ((introduction == "") || (introduction == "认真写商品介绍更有几率卖出去哦")) {
			alert("请输入商品介绍!");
			return false;
		}
		if ((region == "") || (region == "输入您所在的地区")) {
			alert("请输入您所在的地区!");
			return false;
		}
		if ((amount == "") || (amount == "输入该商品的出售数量")) {
			alert("请输入商品数量!");
			return false;
		}
		if (parseFloat(amount).toString() == "NaN") {
			alert("提交数量应为数字!");
			return false;
		}
		if(parseFloat(amount)<0){
			alert("无法提交负数物品!");
			return false;
		}
		if(isInteger(amount)==false){
			alert("提交物品数量应为整数!");
			return false;
		}
	}

</script>
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
						<h3>个人订单</h3>
						<p>our vision is to be Earth's most customer centric company</p>
					</div>
					<ol class="breadcrumb">
						<li><a href="index.jsp" title="Home">主页</a></li>							
						<li class="active">个人订单</li>
					</ol>
				</div><!-- Container /- -->
			</div><!-- Page Banner /- -->
			
			<div class="section-header">
               <h3>我上架的物品</h3>
               <img src="images/section-seprator.png" alt="section-seprator" />
       		</div><!-- Section Header /- -->
			<!-- Cart -->
			<div class="woocommerce-cart container-fluid no-left-padding no-right-padding">
				<!-- Container -->
				<div class="container">
					<!-- Cart Table -->
					<div class="col-md-12 col-sm-12 col-xs-12 cart-table">
						<form>
							<table class="table table-bordered table-responsive">
								<thead>
									<tr>
										<th class="product-name">商品名称</th>
										<th class="product-unit-price">商品价格</th>
										<th class="product-quantity">上架时间</th>
										<th class="product-remove">上架数量</th>
									</tr>
								</thead>
								<%
								String ss="select * from personal_order where SELLER_ACCOUNT='"+user+"' AND BUYER_ACCOUNT=' '";
		                        
		                        ResultSet rss=stmt.executeQuery(ss);
		
		                        while(rss.next())
		 
		                        {  %>
        
								<tbody>
									<tr class="cart_item">
										<td data-title="Product Name" class="product-name"><a href="#"><%=rss.getString(2) %></a></td>
										<td data-title="Unit Price" class="product-unit-price"><a href="#"><%=rss.getDouble(3) %></a></td>
										<td data-title="Total" class="product-subtotal"><%=rss.getString(5) %></td>
										<td data-title="Total" class="product-subtotal"><%=rss.getString(8) %></td>
									</tr>
									<%
		
     
								}
								
								rss.close();
								
						
									 %>
									<tr>
										<td class="action" colspan="7">
											<a href="order.jsp" title="update">更新数据</a>
										</td>
									</tr>
								</tbody>
							</table>
						</form>
					</div><!-- Cart Table /- -->
				</div><!-- Container /- -->
			</div><!-- Cart /- -->
			
        	<div class="section-header">
               <h3>我卖出的记录</h3>
               <img src="images/section-seprator.png" alt="section-seprator" />
       		</div><!-- Section Header /- -->
			<!-- Cart -->
			<div class="woocommerce-cart container-fluid no-left-padding no-right-padding">
				<!-- Container -->
				<div class="container">
					<!-- Cart Table -->
					<div class="col-md-12 col-sm-12 col-xs-12 cart-table">
						<form>
							<table class="table table-bordered table-responsive">
								<thead>
									<tr>
										<th class="product-name">商品名称</th>
										<th class="product-unit-price">商品价格</th>
										<th class="product-quantity">上架时间</th>
										<th class="product-quantity">交易时间</th>
										<th class="product-remove">买家</th>
										<th class="product-remove">卖出数量</th>
										<th class="product-remove">查看评论</th>
									</tr>
								</thead>
								<%
								String s="select * from personal_order where SELLER_ACCOUNT='"+user+"' AND BUYER_ACCOUNT<>' '";
		                        
		                        ResultSet rs=stmt.executeQuery(s);
		
		                        while(rs.next())
		 
		                        {  
		                        int temp = rs.getInt(9);
		                        %>
                                
								<tbody>
									<tr class="cart_item">
										<td data-title="Product Name" class="product-name"><a href="#"><%=rs.getString(2) %></a></td>
										<td data-title="Unit Price" class="product-unit-price"><a href="#"><%=rs.getDouble(3) %></a></td>
										<td data-title="Total" class="product-subtotal"><%=rs.getString(5) %></td>
										<td data-title="Total" class="product-subtotal"><%=rs.getString(4) %></td>
										<td data-title="Total" class="product-subtotal"><%=rs.getString(7) %></td>
										<td data-title="Total" class="product-subtotal"><%=rs.getString(8) %></td>
										<td data-title="Total" class="product-subtotal"><a href="ReadRemark.jsp?id=<%=temp%>"><i class="icon icon-Dollar"></i></a></td>
									</tr>
									<%
		
     
								}
								
								rs.close();
								
						
									 %>
									<tr>
										<td class="action" colspan="7">
											<a href="order.jsp" title="update">更新数据</a>
										</td>
									</tr>
								</tbody>
							</table>
						</form>
					</div><!-- Cart Table /- -->
				</div><!-- Container /- -->
			</div><!-- Cart /- -->
			
			
			<div class="section-header">
               <h3>我买到的宝贝</h3>
               <img src="images/section-seprator.png" alt="section-seprator" />
       		</div><!-- Section Header /- -->
			<!-- Cart -->
			<div class="woocommerce-cart container-fluid no-left-padding no-right-padding">
				<!-- Container -->
				<div class="container">
					<!-- Cart Table -->
					<div class="col-md-12 col-sm-12 col-xs-12 cart-table">
						<form>
							<table class="table table-bordered table-responsive">
								<thead>
									<tr>
										<th class="product-name">商品名称</th>
										<th class="product-unit-price">商品价格</th>
										<th class="product-quantity">上架时间</th>
										<th class="product-quantity">交易时间</th>
										<th class="product-remove">卖家</th>
										<th class="product-remove">商品数量</th>
										<th class="product-remove">提交评论</th>
									</tr>
								</thead>
								<%
								String s2="select * from personal_order where BUYER_ACCOUNT='"+user+"'" ;
								
		                        ResultSet rs2=stmt.executeQuery(s2);
		                        while(rs2.next())
		 
		                        {  
		                        
		                        	int temp = rs2.getInt(9);
		                        %>
        
								<tbody>
									<tr class="cart_item">
										<td data-title="Product Name" class="product-name"><a href="#"><%=rs2.getString(2) %></a></td>
										<td data-title="Unit Price" class="product-unit-price"><a href="#"><%=rs2.getDouble(3) %></a></td>
										<td data-title="Total" class="product-subtotal"><%=rs2.getString(5) %></td>
										<td data-title="Total" class="product-subtotal"><%=rs2.getString(4) %></td>
										<td data-title="Total" class="product-subtotal"><%=rs2.getString(6) %></td>
										<td data-title="Total" class="product-subtotal"><%=rs2.getString(8) %></td>
										<td data-title="Total" class="product-subtotal"><a href="Remark.jsp?id=<%=temp%>"><i class="icon icon-Dollar"></i></a></td>
									</tr>
									<%
		
     
								}
								
								rs2.close();
								
								stmt.close();
								
								con.close();
						
									 %>
									<tr>
										<td class="action" colspan="7">
											<a href="order.jsp" title="update">更新数据</a>
										</td>
									</tr>
								</tbody>
							</table>
						</form>
					</div><!-- Cart Table /- -->
				</div><!-- Container /- -->
			</div><!-- Cart /- -->
			
        </main>
        
    						<!-- Section Header -->
        <div class="section-header">
                <h3>提交新商品</h3>
                <p>在这里你可以挂出你的闲置物品</p>
                <img src="images/section-seprator.png" alt="section-seprator" />
        </div><!-- Section Header /- -->

        <!-- Checkout -->
        <div class="container-fluid no-left-padding no-right-padding woocommerce-checkout">
                <!-- Container -->
                <div class="container">
                    <!-- Billing -->
                    <div class="checkout-form">
                        <form action="CheckOrder.jsp" method="post" name="frmOrder">
                            <div class="col-md-6 col-sm-12 col-xs-12">
                                <h3>订单信息</h3>
                                <div class="billing-field">
                                    <div class="col-md-12 form-group">
                                        <label>商品名称</label>
                                        <input class="form-control" type="text" name="name" value="输入商品名称"
										maxlength="20" autocomplete="off"
										onfocus="if(this.value == '输入商品名称') this.value =''">
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label>商品介绍</label>
                                        <input class="form-control" type="text" name="introduction" value="认真写商品介绍更有几率卖出去哦"
										maxlength="200" autocomplete="off"
										onfocus="if(this.value == '认真写商品介绍更有几率卖出去哦') this.value =''">
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label>商品价格</label>
                                        <input class="form-control" type="text" name="price" value="输入该商品出售的价格"
										maxlength="20" autocomplete="off"
										onfocus="if(this.value == '输入该商品出售的价格') this.value =''">
                                    </div>
                                    <div class="col-md-12 form-group">
                                            <label>商品类型</label>
                                            <div class="select">
                                                <select class="form-control" name="type">
                                                    <option value="娱乐用品">娱乐用品</option>
                                                    <option value="生活用品">生活用品</option>
                                                    <option value="电子产品">电子产品</option>
													<option value="服饰箱包">服饰箱包</option>
													<option value="家居家电">家居家电</option>
													<option value="运动美妆">运动美妆</option>
													<option value="其他">其他</option>
                                                </select>
                                            </div>
                                        </div>
                                    <div class="col-md-12 form-group">
                                        <label>地区</label>
                                        <input class="form-control" type="text" name="region" value="输入您所在的地区"
										maxlength="11" autocomplete="off"
										onfocus="if(this.value == '输入您所在的地区') this.value =''">
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label>商品数量</label>
                                        <input class="form-control" type="text" name="amount" value="输入该商品的出售数量"
										maxlength="20" autocomplete="off"
										onfocus="if(this.value == '输入该商品的出售数量') this.value =''">
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-md-6 col-sm-12 col-xs-12">
                                <h3>订单提交</h3>
                                <div class="shipping-fields">
                                    <div class="checkout-payment">
                                        <ul>
                                            <li>
                                                <input value="检查订单" checked="" type="radio">
                                                <label>检查订单</label>
                                                <div class="payment_box">
                                                    <p>请确认您的提交信息准确无误. </p>
                                                    <p>如有特殊需要，请及时联系客服.</p>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="place-order">
                                        <input type="submit" value="提  交" onclick="return addCheck()">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div><!-- Billing /- -->
                </div><!-- Container /- -->
            </div><!-- Checkout /- -->

        
		
	
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
									<li><a href="cart.jsp">购物车</a></li>
									<li class="current"><a href="order.jsp">个人订单</a></li>
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

<tr><th style="font-size: 16px">名称</th><th style="font-size: 16px">价格</th><th style="font-size: 16px">交易时间</th><th style="font-size: 16px">提交时间</th><th style="font-size: 16px">卖家</th><th style="font-size: 16px">买家</th>

<%

		String s="select * from personal_order where SELLER_ACCOUNT='"+user+"' OR BUYER_ACCOUNT='"+user+"'";
		
		ResultSet rs=stmt.executeQuery(s);
		
		
		while(rs.next())
		
		{
        
	
		out.println("<tr><td>"+rs.getString(2)+"</td><td>"+rs.getDouble(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td>");
        
        
		}
		
		rs.close();
		
		stmt.close();
		
		con.close();

 %>
</body> --%>
</html>