<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="stylesheet"  type="text/css"  href="css/style.css"/>
<title>赏鑫用户登录与注册</title>
<script >
	function validateLogin() {
		var userName = document.frmLogin.username.value;
		var password = document.frmLogin.password.value;
		if ((userName == "")) {
			alert("请输入用户名!");
			return false;
		}
		if ((password == "")) {
			alert("请输入密码!");
			return false;
		}
	}
	
	function addCheck() {//判断是否有输入，若没有按照要求输入则提醒
		var username = document.frmReg.username.value;
		var password = document.frmReg.password.value;
		var city = document.frmReg.city.value;
		var phone = document.frmReg.phone.value;
		var address = document.frmReg.address.value;
		if ((username == "")) {
			alert("用户名不能为空!");
			return false;
		}
		if ((password == "")) {
			alert("密码不能为空!");
			return false;
		} 
		if ((city == "")) {
			alert("所在城市不能为空!");
			return false;
		}
		if ((phone == "")) {
			alert("电话号码不能为空!");
			return false;
		}
		if(phone.length != 11){
			alert("请输入11位电话号码!");
			return false;
		}
		if ((address == "")) {
			alert("地址不能为空!");
			return false;
		}
		if ((username == "root")) {
			alert("该用户名为管理员账号，请选择其他账号名登录!");
			return false;
		}
	}

	</script >
</head>
<body>

<script  src="https://code.jquery.com/jquery-3.1.1.min.js"  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="  crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" ></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<div class="body">
		<div class="veen">
			<div class="login-btn splits">
				<p>已经有账号了?</p>
				<button class="active">立即登录</button>
			</div>
			<div class="rgstr-btn splits">
				<p>没有账号?</p>
				<button>现在注册</button>
			</div>
			<div class="wrapper">
				<form id="login" tabindex="500" action="Check.jsp" method="post" name="frmLogin">
					<h3>登录</h3>
					<div class="mail">
						<input type="mail" name="username" autocomplete="off">
						<label>用户名</label>
					</div>
					<div class="passwd">
						<input type="password" name="password" autocomplete="off">
						<label>密码</label>
					</div>
					<div class="submit">
                        <button class="dark" type="submit" onclick="return validateLogin()">登录</button>
					</div>
				</form>
				<form id="register" tabindex="502" action="CheckRegister.jsp" method="post" name="frmReg">
					<h3>注册</h3>
					<div class="name">
						<input type="text" name="username" autocomplete="off">
						<label>用户名</label>
					</div>
					<div class="passwd">
						<input type="text" name="password" autocomplete="off">
						<label>密码</label>
					</div>
					<div class="city">
						<input type="text" name="city" autocomplete="off">
						<label>城市</label>
					</div>
					<div class="phone">
						<input type="text" name="phone" autocomplete="off">
						<label>电话号码</label>
					</div>
					<div class="address">
						<input type="text" name="address" autocomplete="off">
						<label>地址</label>
					</div>
					<div class="submit">
						<button class="dark" type="submit" onclick="return addCheck()">注册</button>
					</div>
				</form>
			</div>
		</div>	
	</div>

<div class="site-link">
		<a href="Login.jsp" target="_blank">
			管理员 <img src="http://creatorvisions.com/img/new-logo-2.png"> 
		登录</a>
	</div>
	<style type="text/css">
		.site-link{
      padding: 5px 15px;
			position: fixed;
			z-index: 99999;
			background: #fff;
			box-shadow: 0 0 4px rgba(0,0,0,.14), 0 4px 8px rgba(0,0,0,.28);
			right: 30px;
			bottom: 30px;
			border-radius: 10px;
		}
		.site-link img{
			width: 30px;
			height: 30px;
		}
	</style>

    <script type="text/javascript" src="js/login_signup.js"></script>
</body>
</html>