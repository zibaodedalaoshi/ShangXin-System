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
<title>商品详情</title>


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
						<h3>商品详情</h3>
						<p>our vision is to be Earth's most customer centric company</p>
					</div>
					<ol class="breadcrumb">
						<li><a href="index.jsp" title="Home">主页</a></li>							
						<li class="active">商品详情</li>
					</ol>
				</div><!-- Container /- -->
			</div><!-- Page Banner /- -->
			
							<%
								String ID = new String(request.getParameter("id").getBytes("ISO8859_1"),"utf-8");
								String ss="select * from product_message where ID='"+ID+"'";
		                        ResultSet rs1=stmt.executeQuery(ss);
		                		
		                        while(rs1.next())
		 
		                        { 
		                        	int temp = rs1.getInt(1);
							%>
							
		<!-- Checkout -->
        <div class="container-fluid no-left-padding no-right-padding woocommerce-checkout">
                <!-- Container -->
                <div class="container">
                    <!-- Billing -->
                    <div class="checkout-form">
                        <form action="Check_buynow_index.jsp" method="post" name="bbb">
                            <div class="col-md-6 col-sm-12 col-xs-12">
                                <h3>商品详细信息</h3>
                                <div class="billing-field">
                                    <div class="col-md-12 form-group">
                                        <label>商品名称</label>
                                        <h3><%=rs1.getString(2)%></h3>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label>商品介绍</label>
                                        <h3><%=rs1.getString(9)%></h3>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label>商品单价</label>
                                        <h3>￥<%=rs1.getDouble(3)%></h3>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label>上架用户</label>
                                        <h3><%=rs1.getString(5)%></h3>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label>剩余数量</label>
                                        <h3><%=rs1.getInt(8)%></h3>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label>请输入要购买的数量</label>
                                        <input  class="form-control" value="" type="text" name="amounts" autocomplete="off">
                                    </div>
                                    <div class="col-md-12 form-group">
                                    <input type="hidden" value=<%=rs1.getInt(1) %> name="p_id"><!-- 传ID -->
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-md-6 col-sm-12 col-xs-12">
                                <h3>商品购买</h3>
                                <div class="shipping-fields">
                                    <div class="checkout-payment">
                                   
                                        <ul>
                                            <li>
                                                <input value="确认支付" checked="" type="radio">
                                                <label>确认支付</label>
                                                <div class="payment_box">
                                                    <p>请仔细确认您的购买请求. </p>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="place-order">
                                        <input type="submit" value="立即购买 " onclick="return addCheck()">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div><!-- Billing /- -->
                </div><!-- Container /- -->
            </div><!-- Checkout /- -->		
			<script>
			
			function isInteger(obj) {
				 return obj%1 === 0
				}

			function addCheck(){
				var amounts= document.bbb.amounts.value;
				if (parseFloat(amounts).toString() == "NaN") {
					alert("购买数量应为数字!");
					return false;
				}
				if(parseFloat(amounts)<0){
					alert("无法购买负数物品!");
					return false;
				}
				if(isInteger(amounts)==false){
					alert("购买物品数量应为整数!");
					return false;
				}
				if(amounts>(<%=rs1.getInt(8)%>)){
					alert("购买失败，余额不足，请及时充值!");
					return false;
				}
				
			}
			
			
			
			</script>				
											
			<%
			      } 
			%>
			
			
						<!-- Testimonial Section -->
			<div class="testimonial-section container-fluid">
				<!-- Container -->
				<div class="container">
					<!-- Section Header -->
					<div class="section-header">
						<h3>好评如潮</h3>
						<p>快来看看用户们怎么说：</p>
						<img src="images/section-seprator.png" alt="section-seprator" />
					</div><!-- Section Header /- -->
					<!-- Main Carousel -->
					<div id="main-carousel1" class="carousel slide carousel-fade" data-ride="carousel">
						<ol class="carousel-indicators">
					<%
							
								String sr="select * from product_remark where productID='"+ID+"'";
								ResultSet rsr=stmt.executeQuery(sr);
								while(rsr.next())
								{
					 %>
							<li data-target="#main-carousel1" data-slide-to="0" class="active"></li>
						</ol>
						<div role="listbox" class="carousel-inner">
							
							<div class="item active">
								<div class="testimonial-content">
									<i class="fa fa-quote-left" aria-hidden="true"></i>
									<p> <%=rsr.getString(5)%> </p>
									<img src="images/testi.jpg" alt="testi" />
									<span class="star">
										<% 
										   for(int i=0;i<rsr.getInt(4);i++){
										     %>
										<i class="fa fa-star"></i>
										<%
										   } 
										  for(int i=0;i<5-rsr.getInt(4);i++){
										 %>
										<i class="fa fa-star-o"></i>
										<%  
										  } 
										  %>
									</span>
									<h3><%=rsr.getString(10)%></h3>
									<h5><%=rsr.getString(7)%></h5>
								</div>
							</div>

							<%
								}
								rsr.close();
								stmt.close();	
						%>

						</div>
					</div><!-- Main Carousel /-  -->
				</div><!-- Container /- -->
			</div><!-- Testimonial Section /- -->
			
			
			
<%--  			<div class="section-header">
               <h3>评论区</h3>
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
								
								<%

		                        ResultSet rss=stmt.executeQuery(ss);
		
		                        while(rss.next())
		 
		                        {  %>
        						<thead>
									<tr>
										<th class="product-name">商品名称:<%=rss.getString(2) %></th>
										<th class="product-unit-price">商品价格:<%=rss.getDouble(3) %></th>
										<th class="product-quantity">上架时间:<%=rss.getString(6) %></th>
										<th class="product-remove">上架数量:<%=rss.getString(8) %></th>
										<th class="product-remove">评分</th>
										<th class="product-remove">顾客</th>
										<th class="product-remove">日期</th>
									</tr>
								</thead>
									<%
		
     
								}
								rss.close();
								
								// String sr="select * from product_remark where productID='"+ID+"'";
							//	ResultSet rsr=stmt.executeQuery(sr);
								while(rsr.next())
								{
									 %>
									<tbody>
									<tr>
										<td colspan="4">
											<%=rsr.getString(4)%>
										</td>
										<td><%=rsr.getInt(3)%></td>
										<td><%=rsr.getString(7)%></td>
										<td><%=rsr.getString(5)%></td>
									</tr>
									<%
								}
								rsr.close();
								stmt.close();	
								%>	

								</tbody>
							</table>
						</form>
					</div><!-- Cart Table /- -->
				</div><!-- Container /- -->
			</div><!-- Cart /- -->
			
       --%> 	
			
			
        </main>
        
                            
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













	
</body>
<%--<body>
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
		 			    Statement stmt_remark = con.createStatement();
		 			    Statement stmt = con.createStatement();
		 			    String sql = "select * from user_message where ACCOUNT='"+user+"' ";
		 				ResultSet r = stmt.executeQuery(sql);			
						if(r.next()){
							out.println("欢迎"+user+",您的余额为:"+r.getDouble(4));
						}
					    r.close();
					  

						<!-- Nav -->
							<nav id="nav">
								<ul>
									<li><a href="index.jsp">商品主页</a></li>
									<li class="current"><a href="cart.jsp">购物车</a></li>
									<li><a href="order.jsp">个人订单</a></li>
									<li><a href="psw_modify.jsp">修改密码</a></li>
									<form action="#" method="post">
									<button type="submit" formaction="logout.jsp">退出登录</button>
									<button type="submit" formaction="submit_order.jsp">上架商品</button>
									<button type="submit" formaction="recharge.jsp">充值中心</button>
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
<center>
    <br><br>
		<form action="CheckRemark.jsp" method="post" name="frmOrder">
			<table width="300" height="300" border="5" bordercolor="#A0A0A0">
				<tr>
					<th>商品名：</th>
					<td><input type="text" name="name" value="<%=rs_product.getString(2)%>"></td>
				</tr>
			    <tr>
					<th>商品ID：</th>
					<td><input type="text" name="productID" value="<%=rs_product.getString(1)%>"></td>
				</tr>
				<tr>
					<th>你的评分：</th>
					<td><input type="text" name="point" value="填写评分"
						maxlength="20"
						onfocus="if(this.value == '填写评分') this.value =''"></td>
				</tr>
				<tr>
					<th>你的评论：</th>
					<td><input type="text" name="remark" value="填写评论"
						maxlength="200"
						onfocus="if(this.value == '填写评论') this.value =''"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="提  交" onclick="return addCheck()"> <input type="reset" value="重  置"></td>
				</tr>
			</table>
		</form>
	</center>
<% 	
        rs_remark.close();
        rs_product.close();
		stmt.close();
		stmt_remark.close();
		con.close();
 %>
</table>
</body> --%>
</html>

