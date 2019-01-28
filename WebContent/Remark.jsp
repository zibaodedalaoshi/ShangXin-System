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
<title>查看评论</title>

<script>
	function addCheck() {//判断是否有输入，若没有按照要求输入则提醒
		var name = document.frmOrder.name.value;
		var point = document.frmOrder.point.value;
		var remark = document.frmOrder.remark.value;
		var productID = document.frmOrder.productID.value;
		if ((point == "") || (point == "填写评分")) {
			alert("请填写评分!");
			return false;
		} 
		if ((remark == "") || (type == "填写评论")) {
			alert("请填写评论!");
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
						<h3>商品评论</h3>
						<p>our vision is to be Earth's most customer centric company</p>
					</div>
					<ol class="breadcrumb">
						<li><a href="index.jsp" title="Home">主页</a></li>							
						<li class="active">商品评论</li>
					</ol>
				</div><!-- Container /- -->
			</div><!-- Page Banner /- -->
			
			<div class="section-header">
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
       						<thead>
									<tr>
										<th class="product-name">商品名称:</th>
										<th class="product-unit-price">商品价格:</th>
										<th class="product-remove">购买数量:</th>
										<th class="product-remove">评分:</th>
										<th class="product-remove">评语:</th>
										<th class="product-remove">评分人:</th>
										<th class="product-remove">评分日期:</th>
									</tr>
							</thead>	
								<%
								String ID = new String(request.getParameter("id").getBytes("ISO8859_1"),"utf-8");
								String sr="select * from product_remark where PRODUCTID='"+ID+"'";
								ResultSet rsr=stmt.executeQuery(sr);
								while(rsr.next())
		 
		                        {  %>
		                        	<tbody>
									<tr class="cart_item">
										<td data-title="Product Name" class="product-name"><a href="#"><%=rsr.getString(2) %></a></td>
										<td data-title="Unit Price" class="product-unit-price"><a href="#"><%=rsr.getDouble(3) %></a></td>
										<td data-title="Total" class="product-subtotal"><%=rsr.getInt(6) %></td>
										<td data-title="Total" class="product-subtotal"><%=rsr.getString(4) %></td>
										<td data-title="Total" class="product-subtotal"><%=rsr.getString(5) %></td>
										<td data-title="Total" class="product-subtotal"><%=rsr.getString(10) %></td>
										<td data-title="Total" class="product-subtotal"><%=rsr.getString(7) %></td>
									
									<%
		
     
								}
								rsr.close();
									
								%>	

								</tbody>
							</table>
						</form>
					</div><!-- Cart Table /- -->
				</div><!-- Container /- -->
			</div><!-- Cart /- -->
			
        	
			
			
        </main>
        
    						<!-- Section Header -->
        <div class="section-header">
                <h3>提交评论</h3>
                <p>在这里你可以对该商品发表你的售后体验</p>
                <img src="images/section-seprator.png" alt="section-seprator" />
        </div><!-- Section Header /- -->

        <!-- Checkout -->
        <div class="container-fluid no-left-padding no-right-padding woocommerce-checkout">
                <!-- Container -->
                <div class="container">
                    <!-- Billing -->
                    <div class="checkout-form">
                    
                        <form action="CheckRemark.jsp" method="post" name="frmOrder">
                            <div>
                                <div class="billing-field">
                             <% 	
                                String ss2="select * from personal_order where PRODUCTID='"+ID+"' AND BUYER_ACCOUNT='"+user+"'";
                                ResultSet rssa=stmt.executeQuery(ss2);
		                        while(rssa.next())
		                   		 
		                        {  
			                %>
                                    <div class="form-group">
                                    <input type="hidden" name="name" value=<%=rssa.getString(2) %> >
                                    </div>
                                    <div class="form-group">
                                    <input type="hidden" name="price" value=<%=rssa.getDouble(3) %> >
                                    </div>
                                    <div class="form-group">
                                    <input type="hidden" name="pID" value=<%=rssa.getInt(9) %> >
                                    </div>
                                    <div class="form-group">
                                    <input type="hidden" name="submittime" value=<%=rssa.getString(5) %> >
                                    </div>
                                    <div class="form-group">
                                    <input type="hidden" name="buytime" value=<%=rssa.getString(4) %> >
                                    </div>
                                    <div class="form-group">
                                    <input type="hidden" name="submitter" value=<%=rssa.getString(6) %> >
                                    </div>
                                    <div class="form-group">
                                    <input type="hidden" name="buy_amounts" value=<%=rssa.getInt(8) %> >
                                    </div>
                                <%
		                             }
		                        %> 
                                 <div class="form-group">
                                        <input class="form-control" type="text" name="remark" value="留下你的想法"
										maxlength="200" autocomplete="off"
										onfocus="if(this.value == '留下你的想法') this.value =''">
                                    </div>
                                    <div class="col-md-12 form-group">
                                            <label>选择评分</label>
                                            <div class="select">
                                                <select class="form-control" name="point">
                                                    <option value="1">1分</option>
                                                    <option value="2">2分</option>
                                                    <option value="3">3分</option>
													<option value="4">4分</option>
													<option value="5">5分</option>
                                                </select>
                                            </div>
                                        </div>
                                 <div class="place-order">
                                        <input type="submit" value="提  交" onclick="return addCheck()">
                                    </div>
                                </div>
                            </div>
              <%
              rssa.close();
              %>
                            
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

