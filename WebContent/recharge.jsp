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
<title>充值中心</title>

<script type="text/javascript">
	function addCheck() {//判断输入是否符合要求
		var balance = document.frmRecharge.balance.value;
		var psw = document.frmRecharge.psw.value;
		var newpsw = document.frmRecharge.newpsw.value;

		if ((balance == "") || (balance == "请输入您要充值的金额")) {
			alert("请输入充值金额!");
			return false;
		}
		if (psw == "") {
			alert("请输入您的密码!");
			return false;
		} 
		if (newpsw == "")  {
			alert("请再次输入密码!");
			return false;
		}
		if (newpsw != psw) {
			alert("两次密码输入不一致!");
			return false;
		}
		if (parseFloat(balance).toString() == "NaN") {
			alert("充值金额应为数字!");
			return false;
		}
		if(parseFloat(balance)<0){
			alert("无法充值负数金额!");
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
						<h3>充值中心</h3>
						<p>our vision is to be Earth's most customer centric company</p>
					</div>
					<ol class="breadcrumb">
						<li><a href="index.html" title="Home">主页</a></li>							
						<li class="active">充值中心</li>
					</ol>
				</div><!-- Container /- -->
			</div><!-- Page Banner /- -->
			</main>
        
		<!-- Section Header -->
        <div class="section-header">
                <h3>充值中心</h3>
                <img src="images/section-seprator.png" alt="section-seprator" />
        </div><!-- Section Header /- -->

        <!-- Checkout -->
        <div class="container-fluid no-left-padding no-right-padding woocommerce-checkout">
                <!-- Container -->
                <div class="container">
                    <!-- Billing -->
                    <div class="checkout-form">
                        <form action="CheckRecharge.jsp" method="post" name="frmRecharge">
                            <div class="col-md-6 col-sm-12 col-xs-12">
                                <h3>充值服务</h3>
                                <div class="billing-field">
                                    <div class="col-md-12 form-group">
                                        <label>充值金额</label>
                                        <input class="form-control" type="text" name="balance" value="请输入您要充值的金额"
										maxlength="11" autocomplete="off"
										onfocus="if(this.value == '请输入您要充值的金额') this.value =''">
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label>请输入密码</label>
                                        <input class="form-control" type="password" name="psw" 
										maxlength="20" autocomplete="off">
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label>请再次输入密码</label>
                                        <input class="form-control" type="password" name="newpsw" 
										maxlength="20" autocomplete="off">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-12 col-xs-12">
                                <h3>充值确认</h3>
                                <div class="shipping-fields">
                                    <div class="checkout-payment">
                                        <ul>
                                            <li>
                                                <input value="检查订单" checked="" type="radio">
                                                <label>检查订单</label>
                                                <div class="payment_box">
                                                    <p>请确认您输入的信息准确无误. </p>
                                                </div>
                                            </li>
                                            <li>
												<input value="Paypal" type="radio" checked="">
												<label>支持支付方式 <img src="images/paypal.jpg" alt="Paypal"></label>
											</li>
                                        </ul>
                                    </div>
                                    <div class="place-order">
                                        <input type="submit" value="充  值" onclick="return addCheck()">
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









<%-- <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet"  type="text/css"  href="css/main.css"/>
<title>充值中心</title>

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
  
  <center>
  <br><br><br><br>
  
		<font face="楷体" size="6" color="#000"></font>
		<form action="CheckRecharge.jsp" method="post">
			<table width="50" height="60" border="5" bordercolor="#A0A0A0">
			<tr><th>输入充值金额：</th></tr>
				<tr>
					<td><input type="text" name="balance" value="输入金额"
						maxlength="20" onfocus="if(this.value == '输入金额') this.value =''"></td>
				</tr>
				</tr>

				<tr>
					<td colspan="2" align="center"><input type="submit" value="充  值"  onclick="return validateModify()"> </td>
				</tr>
				</table>
				</form>
	</center>

</body>
</html> --%>