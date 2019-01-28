<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html class="ie6"> <![endif]-->
<!--[if IE 7 ]>    <html class="ie7"> <![endif]-->
<!--[if IE 8 ]>    <html class="ie8"> <![endif]-->
<!--[if IE 9 ]>    <html class="ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html lang="en" class=""><!--<![endif]-->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="">
    <meta name="author" content="">

	<title>商品主页</title>
	
	<script>

	function validateModify(){
		var new_psw = document.frmNewPassword.password.value;
		if((new_psw == "") || (new_psw == "输入您的新密码")){
			alert("请输入新密码后再确认修改！");
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
		<header class="header-section container-fluid no-padding">
		
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
			
			<!-- Menu Block -->
			<div class="container-fluid no-padding menu-block">
				<!-- Container -->
				<div class="container">
					<!-- nav -->
					<nav class="navbar navbar-default ow-navigation">
						<div class="navbar-header">
							<button aria-controls="navbar" aria-expanded="false" data-target="#navbar" data-toggle="collapse" class="navbar-toggle collapsed" type="button">
								<span class="sr-only">导航</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
							<a href="index.jsp" class="navbar-brand">Shang <span>Xin</span></a>
						</div>
						<!-- Menu Icon -->
						<div class="menu-icon">
						
							<ul class="cart">
									<li>
										<a aria-expanded="true" aria-haspopup="true" data-toggle="dropdown" id="user" class="btn dropdown-toggle" href="#"><li><a href="#" title="充值"><i class="icon icon-User"></i></a></li></a>
										<ul class="dropdown-menu no-padding">
											<li class="mini_cart_item">
												<a href="#" class="shop-thumbnail">
													<img alt="poster_2_up" class="attachment-shop_thumbnail" src="images/product-wishlist-1.jpg">欢迎，<%=user%>
												</a>
												<span class="quantity">您的余额为:<span><%=r.getDouble(4)%></span></span>
											</li>
											<li class="button">
												<a href="recharge.jsp">立即充值</a>
											</li>
										</ul>
									</li>	
							</ul>
							
							<ul class="cart">
								<li>
									<a aria-expanded="true" aria-haspopup="true" data-toggle="dropdown" id="psw" class="btn dropdown-toggle" href="#"><li><a href="#" title="修改密码"><i class="icon icon-Key"></i></a></li></a>
									<ul class="dropdown-menu no-padding">
									<form action="CheckNewPassword.jsp" method="post" name="frmNewPassword">
									<tr>
										<td><input type="text" name="password" value="输入您的新密码"
											maxlength="20" onfocus="if(this.value == '输入您的新密码') this.value =''" autocomplete="off"></td>
									</tr>
									</tr>
									<tr>
										<td><input type="submit" value="修改密码"  onclick="return validateModify()"></td>
									</tr>
									</form>
									</ul>
								</li>	
							</ul>

						</div><!-- Menu Icon /- -->

						<div class="navbar-collapse collapse navbar-right" id="navbar">
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

		<main>
			<!-- Slider Section 1 -->
			<div id="home-revslider" class="slider-section container-fluid no-padding">
				<!-- START REVOLUTION SLIDER 5.0 -->
				<div class="rev_slider_wrapper">
					<div id="home-slider1" class="rev_slider" data-version="5.0">
						<ul>
							<li data-transition="zoomout" data-slotamount="default"  data-easein="easeInOut" data-easeout="easeInOut" data-masterspeed="2000" data-rotate="0"  data-fstransition="fade" data-fsmasterspeed="1500" data-fsslotamount="7">
								<img src="images/slider-1.jpg" alt="slider" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="10" class="rev-slidebg" data-no-retina>
								<div class="tp-caption NotGeneric-Title tp-resizeme rs-parallaxlevel-0" id="slide-layer-1" 
									data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']" 
									data-y="['middle','middle','middle','middle']" data-voffset="['-200','-130','-110','-80']" 
									data-fontsize="['38','30','25','16']"
									data-lineheight="['24','24','24','24']"
									data-width="none"
									data-height="none"
									data-whitespace="nowrap"
									data-transform_idle="o:1;"
									data-transform_in="y:-50px;opacity:0;s:1000;e:Power4.easeOut;" 
									data-transform_out="opacity:0;s:3000;e:Power4.easeIn;s:3000;e:Power4.easeIn;"
									data-mask_in="x:0px;y:0px;s:inherit;e:inherit;" 
									data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"  
									data-start="1000" 
									data-splitin="chars" 
									data-splitout="none" 
									data-responsive_offset="on"
									data-elementdelay="0.05" 
									style="z-index: 5; white-space: nowrap; letter-spacing: 3.04px; color:#333; font-weight: 700; font-family: 'Montserrat', sans-serif; text-transform: uppercase;">good things in life never change
								</div>
								<div class="tp-caption NotGeneric-Title tp-resizeme rs-parallaxlevel-0" id="slide-layer-2" 
									data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']" 
									data-y="['middle','middle','middle','middle']" data-voffset="['-135','-80','-60','-50']" 
									data-fontsize="['18','18','18','14']"
									data-lineheight="['26','26','26','26']"
									data-width="['750','750','738','450']"
									data-height="none"
									data-whitespace="nowrap"
									data-transform_idle="o:1;"
									data-transform_in="x:[105%];z:0;rX:45deg;rY:0deg;rZ:90deg;sX:1;sY:1;skX:0;skY:0;s:2000;e:Power4.easeInOut;" 
									data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;" 
									data-mask_in="x:0px;y:0px;s:inherit;e:inherit;" 
									data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;" 
									data-start="1000" 
									data-splitin="chars" 
									data-splitout="none" 
									data-responsive_offset="on"
									data-elementdelay="0.05" 
									style="z-index: 5; white-space: nowrap; letter-spacing: 1.5px; color:#777; font-weight: normal; font-family: 'Lato', sans-serif;">依然很有用，真不该闲着。何必弃置角落，暗无天日。
								</div>
								<div class="tp-caption NotGeneric-Title tp-resizeme rs-parallaxlevel-0" id="slide-layer-3" 
									data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']" 
									data-y="['middle','middle','middle','middle']" data-voffset="['-110','-50','-35','-30']" 
									data-fontsize="['18','18','18','14']"
									data-lineheight="['26','26','26','26']"
									data-height="none"
									data-whitespace="nowrap"
									data-transform_idle="o:1;"
									data-transform_in="x:[105%];z:0;rX:45deg;rY:0deg;rZ:90deg;sX:1;sY:1;skX:0;skY:0;s:2000;e:Power4.easeInOut;" 
									data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;" 
									data-mask_in="x:0px;y:0px;s:inherit;e:inherit;" 
									data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;" 
									data-start="1000" 
									data-splitin="chars" 
									data-splitout="none" 
									data-responsive_offset="on"
									data-elementdelay="0.05" 
									style="z-index: 5; white-space: nowrap; letter-spacing: 1.5px; color:#777; font-weight: normal; font-family: 'Lato', sans-serif;">东西是旧的，但有它陪伴的日子是新的。
								</div>
								<div class="tp-caption NotGeneric-Button rev-btn  rs-parallaxlevel-0" id="slide-layer-4" 
									data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']" 
									data-y="['middle','middle','middle','middle']" data-voffset="['-30','20','40','30']" 
									data-fontsize="['14','14','14','12']"
									data-lineheight="['24','24','24','24']"
									data-width="none"
									data-height="none"
									data-whitespace="nowrap"
									data-transform_idle="o:1;"
									data-transform_hover="o:1;rX:0;rY:0;rZ:0;z:0;s:100;e:Power1.easeInOut;"
									data-style_hover="c:rgb(255, 255, 255);bg:rgba(182, 121, 95);"
									data-transform_in="x:[-100%];z:0;rX:0deg;rY:0deg;rZ:0deg;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2500;e:Power3.easeInOut;" 
									data-transform_out="auto:auto;s:1000;e:Power2.easeInOut;" 
									data-start="2000" 
									data-splitin="none" 
									data-splitout="none" 
									data-actions='[{"event":"click","action":"scrollbelow","offset":"0px"}]'
									data-responsive_offset="on" 
									data-responsive="off"
									style="z-index: 10; padding:8px 38px; letter-spacing:0.56px; color: #b6795f; border-color: #b6795f; font-family: 'Montserrat', sans-serif; text-transform:uppercase; background-color:transparent; white-space: nowrap;outline:none;box-shadow:none;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;">Shop Now
								</div>
							</li>
							
							<li data-transition="zoomout" data-slotamount="default"  data-easein="easeInOut" data-easeout="easeInOut" data-masterspeed="2000" data-rotate="0"  data-fstransition="fade" data-fsmasterspeed="1500" data-fsslotamount="7">
								<img src="images/slider-1.jpg" alt="slider" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="10" class="rev-slidebg" data-no-retina>
								<div class="tp-caption NotGeneric-Title tp-resizeme rs-parallaxlevel-0" id="slide-layer-5" 
									data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']" 
									data-y="['middle','middle','middle','middle']" data-voffset="['-200','-130','-110','-80']" 
									data-fontsize="['38','30','25','16']"
									data-lineheight="['24','24','24','24']"
									data-width="none"
									data-height="none"
									data-whitespace="nowrap"
									data-transform_idle="o:1;"
									data-transform_in="y:-50px;opacity:0;s:1000;e:Power4.easeOut;" 
									data-transform_out="opacity:0;s:3000;e:Power4.easeIn;s:3000;e:Power4.easeIn;"
									data-mask_in="x:0px;y:0px;s:inherit;e:inherit;" 
									data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"  
									data-start="1000" 
									data-splitin="chars" 
									data-splitout="none" 
									data-responsive_offset="on"
									data-elementdelay="0.05" 
									style="z-index: 5; white-space: nowrap; letter-spacing: 3.04px; color:#333; font-weight: 700; font-family: 'Montserrat', sans-serif; text-transform: uppercase;">good things in life never change
								</div>
								<div class="tp-caption NotGeneric-Title tp-resizeme rs-parallaxlevel-0" id="slide-layer-6" 
									data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']" 
									data-y="['middle','middle','middle','middle']" data-voffset="['-135','-80','-60','-50']" 
									data-fontsize="['18','18','18','14']"
									data-lineheight="['26','26','26','26']"
									data-width="['750','750','738','450']"
									data-height="none"
									data-whitespace="nowrap"
									data-transform_idle="o:1;"
									data-transform_in="x:[105%];z:0;rX:45deg;rY:0deg;rZ:90deg;sX:1;sY:1;skX:0;skY:0;s:2000;e:Power4.easeInOut;" 
									data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;" 
									data-mask_in="x:0px;y:0px;s:inherit;e:inherit;" 
									data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;" 
									data-start="1000" 
									data-splitin="chars" 
									data-splitout="none" 
									data-responsive_offset="on"
									data-elementdelay="0.05" 
									style="z-index: 5; white-space: nowrap; letter-spacing: 1.5px; color:#777; font-weight: normal; font-family: 'Lato', sans-serif;">依然很有用，真不该闲着。何必弃置角落，暗无天日。
								</div>
								<div class="tp-caption NotGeneric-Title tp-resizeme rs-parallaxlevel-0" id="slide-layer-7" 
									data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']" 
									data-y="['middle','middle','middle','middle']" data-voffset="['-110','-50','-35','-30']" 
									data-fontsize="['18','18','18','14']"
									data-lineheight="['26','26','26','26']"
									data-height="none"
									data-whitespace="nowrap"
									data-transform_idle="o:1;"
									data-transform_in="x:[105%];z:0;rX:45deg;rY:0deg;rZ:90deg;sX:1;sY:1;skX:0;skY:0;s:2000;e:Power4.easeInOut;" 
									data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;" 
									data-mask_in="x:0px;y:0px;s:inherit;e:inherit;" 
									data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;" 
									data-start="1000" 
									data-splitin="chars" 
									data-splitout="none" 
									data-responsive_offset="on"
									data-elementdelay="0.05" 
									style="z-index: 5; white-space: nowrap; letter-spacing: 1.5px; color:#777; font-weight: normal; font-family: 'Lato', sans-serif;">东西是旧的，但有它陪伴的日子是新的。
								</div>
								<div class="tp-caption NotGeneric-Button rev-btn  rs-parallaxlevel-0" id="slide-layer-8" 
									data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']" 
									data-y="['middle','middle','middle','middle']" data-voffset="['-30','20','40','30']" 
									data-fontsize="['14','14','14','12']"
									data-lineheight="['24','24','24','24']"
									data-width="none"
									data-height="none"
									data-whitespace="nowrap"
									data-transform_idle="o:1;"
									data-transform_hover="o:1;rX:0;rY:0;rZ:0;z:0;s:100;e:Power1.easeInOut;"
									data-style_hover="c:rgb(255, 255, 255);bg:rgba(182, 121, 95);"
									data-transform_in="x:[-100%];z:0;rX:0deg;rY:0deg;rZ:0deg;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2500;e:Power3.easeInOut;" 
									data-transform_out="auto:auto;s:1000;e:Power2.easeInOut;" 
									data-start="2000" 
									data-splitin="none" 
									data-splitout="none" 
									data-actions='[{"event":"click","action":"scrollbelow","offset":"0px"}]'
									data-responsive_offset="on" 
									data-responsive="off"
									style="z-index: 10; padding:8px 38px; letter-spacing:0.56px; color: #b6795f; border-color: #b6795f; font-family: 'Montserrat', sans-serif; text-transform:uppercase; background-color:transparent; white-space: nowrap;outline:none;box-shadow:none;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;">Shop Now
								</div>
							</li>
						</ul>
					</div><!-- END REVOLUTION SLIDER -->
				</div><!-- END OF SLIDER WRAPPER -->
				<div class="goto-next"><a href="#category-section"><i class="icon icon-Mouse bounce"></i></a></div>
			</div><!-- Slider Section 1 /- -->
			<!-- Services Section -->
			<div class="services-section container-fluid">
				<!-- Container -->
				<div class="container">
					<div class="col-md-4 col-sm-6 col-xs-6">
						<div class="srv-box">
							<i class="icon icon-Truck"></i><h5>Free delivery</h5><i class="icon icon-Dollar"></i>
							<span class="icon_close"></span>
						</div>
					</div>
					<div class="col-md-4 col-sm-6 col-xs-6">
						<div class="srv-box">
							<i class="icon icon-Goto"></i><h5>Money Back</h5><i class="icon icon-Dollars"></i>
						</div>
					</div>
					<div class="col-md-4 col-sm-6 col-xs-6">
						<div class="srv-box">
							<i class="icon icon-Headset"></i><h5>24/7 support</h5><i class="icon icon-Timer"></i>
						</div>
					</div>
				</div><!-- Container /- -->
			</div><!-- Services Section /- -->
			
			<!-- Category Section -->
			<div id="category-section" class="category-section container-fluid no-padding">
				<div class="category-carousel">
					<div class="col-md-12 col-sm-12 col-xs-12 no-padding">
						<div class="category-box layout-1">
							<img src="images/category-1.jpg" alt="category" />
							<div class="category-content">
								<p>草稿箱里那句话，你帮我删了吧</p>
								<h5>数码</h5>
								<a href="#" title="Shop Now">Shop Now</a>
							</div>
						</div>
					</div>
					<div class="col-md-12 col-sm-12 col-xs-12 no-padding">
						<div class="category-box layout-2">
							<img src="images/cz2.jpg" alt="category" />
							<div class="category-content">
								<p>以前想总有自己的空间，以后想见面也难</p>
								<h5>居家</h5>
								<a href="#" title="Shop Now">Shop Now</a>
							</div>
						</div>
					</div>
					<div class="col-md-12 col-sm-12 col-xs-12 no-padding">
						<div class="category-box layout-3">
							<img src="images/cz4.jpg" alt="category" />
							<div class="category-content">
								<p>学妹我带走了，吉他留给你</p>
								<h5>玩具乐器</h5>
								<a href="#" title="Shop Now">Shop Now</a>
							</div>
						</div>
					</div>
					<div class="col-md-12 col-sm-12 col-xs-12 no-padding">
						<div class="category-box layout-3 layout-4">
							<img src="images/cz5.jpg" alt="category" />
							<div class="category-content">
							<br><br><br><br>
								<p>健身卡还没到期，但学生证到期了</p>
								<h5>运动</h5>
								<a href="#" title="Shop Now">Shop Now</a>
							</div>
						</div>
					</div>
				</div>
			</div><!-- Category Section /- -->
			
			<!-- Search Box -->
					<div class="search-box">
						<span><i class="icon_close"></i></span>
						<form><input type="text" class="form-control" placeholder="Enter a keyword and press enter..." /></form>
			</div><!-- Search Box /- -->
			
			<!-- Product Section -->
			<div id="product-section" class="product-section container-fluid no-padding">
				<!-- Container -->
				<div class="container">
					<div class="row">
						<!-- Section Header -->
						<div class="section-header">
							<h3>商品目录</h3>
							<p>在这里你可以淘到心怡的二手物品</p>
							<img src="images/section-seprator.png" alt="section-seprator" />
						</div><!-- Section Header /- -->
						<ul id="filters" class="products-categories no-left-padding">
							<li><a data-filter="*" class="active" href="#">所有种类</a></li>
							<li><a data-filter=".娱乐用品" href="#">娱乐用品</a></li>
							<li><a data-filter=".生活用品" href="#">生活用品</a></li>
							<li><a data-filter=".电子产品" href="#">电子产品</a></li>
							<li><a data-filter=".服饰箱包" href="#">服饰箱包</a></li>
							<li><a data-filter=".家居家电" href="#">家居家电</a></li>
							<li><a data-filter=".运动美妆" href="#">运动美妆</a></li>
							<li><a data-filter=".其他" href="#">更多类型<i class="fa fa-angle-down"></i></a></li>
						</ul>

						<!-- Products -->
						<ul class="products">
							<!-- Product -->
							<!--可以通过改变商品TYPE的值来进行筛选-->
							<%

									String s="select * from product_message";
									
									ResultSet rs=stmt.executeQuery(s);
									
									while(rs.next())
									
									{		
										
									String temp =  String.valueOf(rs.getInt(1));
							%>
							<li class="product <%=rs.getString(4) %>">
								<a href="ProductInfo.jsp?id=<%=temp%>">
									<img src="<%=rs.getString(10) %>" alt="Product" />
									<h5><%=rs.getString(2) %></h5>
									<span class="price">$<%=rs.getDouble(3) %></span>
									<span >剩余数量：<%=rs.getInt(8) %></span>
								</a>
								<a href="CheckCart.jsp?id=<%=temp%>" class="addto-cart" title="Add To Cart">加入购物车</a>
							</li><!-- Product /- -->
							<%
		
								}
								
								rs.close();
								
								stmt.close();
								
								con.close();
						
						    %>
							
							
						</ul><!-- Products /- -->
					</div><!-- Row /- -->
					<nav class="ow-pagination">
						<ul class="pager">
							<li class="number"><a href="#">S</a></li>
							<li class="load-more"><a href="#">Load More</a></li>
							<li class="previous"><a href="#"><i class="fa fa-angle-right"></i></a></li>
							<li class="next"><a href="#"><i class="fa fa-angle-left"></i></a></li>
						</ul>
					</nav>
				</div><!-- Container /- -->
			</div><!-- Product Section /- -->
			
			<!-- Collection Section1 -->
			<div id="collection" class="collection-section collection-section1 container-fluid no-padding">
				<div class="collection-carousel">
					<div class="col-md-12 col-sm-12 col-xs-12 no-padding">
						<div class="collection-box layout1">
							<img src="images/collection-3.jpg" alt="collection" />
							<div class="collection-content">
								<h5>服饰</h5>
								<p>一闲一换，置换你我时尚</p>
								<a href="#" title="Shop Now">shop Now</a>
							</div>
						</div>
					</div>
					<div class="col-md-12 col-sm-12 col-xs-12 no-padding">
						<div class="collection-box layout1 layout2">
							<img src="images/collection-7.jpg" alt="collection" />
							<div class="collection-content">
								<h5>彩妆</h5>
								<p>你和她都很美</p>
								<a href="#" title="Shop Now">shop Now</a>
							</div>
						</div>
					</div>
					<div class="col-md-12 col-sm-12 col-xs-12 no-padding">
						<div class="collection-box layout1 layout1">
							<img src="images/collection-6.jpg" alt="collection" />
							<div class="collection-content">
								<h5>书籍</h5>
								<p>知识共享，欢乐无量</p>
								<a href="#" title="Shop Now">shop Now</a>
							</div>
						</div>
					</div>
				</div>
			</div><!-- Collection Section1 -->
			
			<!-- Clients -->
			<div class="clients container-fluid">
				<!-- Container -->
				<div class="container">
					<div class="clients-carousel">
						<div class="col-md-12 item"><a href="#" title="client"><img src="images/client-1.png" alt="client-1"></a></div>
						<div class="col-md-12 item"><a href="#" title="client"><img src="images/client-2.png" alt="client-2"></a></div>
						<div class="col-md-12 item"><a href="#" title="client"><img src="images/client-3.png" alt="client-3"></a></div>
						<div class="col-md-12 item"><a href="#" title="client"><img src="images/client-4.png" alt="client-4"></a></div>
						<div class="col-md-12 item"><a href="#" title="client"><img src="images/client-5.png" alt="client-5"></a></div>
						
						<div class="col-md-12 item"><a href="#" title="client"><img src="images/client-1.png" alt="client-1"></a></div>
						<div class="col-md-12 item"><a href="#" title="client"><img src="images/client-2.png" alt="client-2"></a></div>
						<div class="col-md-12 item"><a href="#" title="client"><img src="images/client-3.png" alt="client-3"></a></div>
						<div class="col-md-12 item"><a href="#" title="client"><img src="images/client-4.png" alt="client-4"></a></div>
						<div class="col-md-12 item"><a href="#" title="client"><img src="images/client-5.png" alt="client-5"></a></div>
					</div>
				</div><!-- Container /- -->
			</div><!-- Clients /- -->
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
	<script type="text/javascript" src="revolution/js/extensions/revolution.extension.actions.min.js"></script>

	<!-- Library - Theme JS -->
	<script src="js/functions.js"></script>
	
</body>
</html>
<%-- 			
			
			
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


  <br/>
  
<table align="center" width="50%" border=1>

<tr><th style="font-size: 16px">名称</th><th style="font-size: 16px">价格</th><th style="font-size: 16px">类型</th><th style="font-size: 16px">地区</th><th style="font-size: 16px">剩余数量</th><th style="font-size: 16px">操作</th>

<%

		String s="select * from product_message";
		
		ResultSet rs=stmt.executeQuery(s);
		
		while(rs.next())
		
		{		
			
		String temp =  String.valueOf(rs.getInt(1));
%>
		<tr>
		<td><%=rs.getString(2)%></td>
		<td><%=rs.getString(3)%></td>
		<td><%=rs.getString(4)%></td>
		<td><%=rs.getString(7)%></td>
		<td><%=rs.getString(8)%></td>
		<pre><td colspan="2"><a href="CheckCart.jsp?id=<%=temp%>">加入购物车</a>        <a href="Check_buynow_index.jsp?id=<%=temp%>">现在购买</a> </td></pre>
		</tr>
<%
		
		}
		
		rs.close();
		
		stmt.close();
		
		con.close();

 %>

</table> --%>

 
