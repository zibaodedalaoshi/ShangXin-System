<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>管理员登录</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/mainm.css">
<!--===============================================================================================-->
</head>

<script >
	function validateLogin() {
		var userName = document.frmLogin.username.value;
		var password = document.frmLogin.password.value;
		if ((userName == "")) {
			alert("请输入账号名!");
			return false;
		}
		if ((password == "") ) {
			alert("请输入密码!");
			return false;
		}
	}
</script >
	
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					<img src="images/img-01.png" alt="IMG">
				</div>

				<form class="login100-form validate-form" action="CheckManagerReg.jsp" method="post" name="frmLogin">
					<span class="login100-form-title">
						管理员登录
					</span>

					<div class="wrap-input100 validate-input">
						<input class="input100" type="text" name="username" placeholder="Username" autocomplete="off">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input">
						<input class="input100" type="password" name="password" placeholder="Password">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					
					<div class="container-login100-form-btn">
						<button class="login100-form-btn" type="submit" onclick="return validateLogin()">
							登录
						</button>
					</div>

					<div class="text-center p-t-12">
						<span class="txt1">
						</span>
						<a class="txt2">
						</a>
					</div>

					<div class="text-center p-t-136">
						<a class="txt2" href="Login_Signup.jsp">
							返回用户登录
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	

	
<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>
















































<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>登录界面</title>
<meta charset="UTF-8">

<script >
	function validateLogin() {
		var userName = document.frmLogin.username.value;
		var password = document.frmLogin.password.value;
		if ((userName == "") || (userName == "输入您的用户名")) {
			alert("请输入用户名!");
			return false;
		}
		if ((password == "") || (password == "输入您的密码")) {
			alert("请输入密码!");
			return false;
		}
	}
	</script >
</head>

 <body>
	<center>
		<font face="楷体" size="6" color="#000">管理员登录界面</font>
		<form action="CheckManagerReg.jsp" method="post" name="frmLogin">
			<table width="300" height="180" border="5" bordercolor="#A0A0A0">
				<tr>
					<th>用户名：</th>
					<td><input type="text" name="username" value="输入您的管理员账号"
						maxlength="16" autocomplete="off"
						onfocus="if(this.value == '输入您的管理员账号') this.value =''"></td>
				</tr>
				<tr>
					<th>密  码：</th>
					<td><input type="text" name="password" value="输入您的管理员密码" autocomplete="off"
						maxlength="20" onfocus="if(this.value == '输入您的管理员密码') this.value =''"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="登录"
						onclick="return validateLogin()"></td>
				</tr>
			</table>
		</form>
	</center>
</body>




</html>
 --%>




















