<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<script language='JavaScript'>
	function isValidate(form) {
		username = form.username.value;
		userpass = form.userpass.value;

		if (!minLength(username, 3)) {
			alert("用户名长度小于3位！");
			form.username.focus();
			return false;
		}

		if (!maxLength(username, 8)) {
			alert("用户名长度大于8位！");
			form.username.focus();
			return false;
		}

		if (!minLength(userpass, 6)) {
			alert("口令长度小于6位！");
			form.userpass.focus();
			return false;
		} 
		return true;
	}

	function minLength(str, length) {
		if (str.length >= length)
			return true;
		else
			return false;
	}

	function maxLength(str, length) {
		if (str.length <= length)
			return true;
		else
			return false;
	}
</script>


<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>登录</title>
<meta name="description" content="">
<meta name="author" content="templatemo">

<link
	href='http://fonts.useso.com/css?family=Open+Sans:400,300,400italic,700'
	rel='stylesheet' type='text/css'>
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/templatemo-style.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
	      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	    <![endif]-->
</head>
<body class="light-gray-bg">
	<div class="templatemo-content-widget templatemo-login-widget white-bg">
		<header class="text-center">
		<div class="square"></div>
		<h1>中标数据采集系统</h1>
		</header>
		<form name="loginform" action="login" method="post" onsubmit="return isValidate(loginform)"
			class="templatemo-login-form">
			<div class="form-group">
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-user fa-fw"></i>
					</div>
					<input type="text" name="username" class="form-control"
						placeholder="xxxxxxx">
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-key fa-fw"></i>
					</div>
					<input type="password" name="userpass" class="form-control" placeholder="******">
				</div>
			</div>
			<div class="form-group">
				<div class="checkbox squaredTwo">
					<input type="checkbox" id="c1" name="cc" /> <label for="c1"><span></span>Remember
						me</label>
				</div>
			</div>
			<div class="form-group">
				<Input type="submit" class="templatemo-blue-button width-100" value="Login" name="btnLogin" />
			</div>
		</form>
	</div> 
	<div
		class="templatemo-content-widget templatemo-login-widget templatemo-register-widget white-bg">
		<p>
			Not a registered user yet? <strong><a href="register.jsp"
				class="blue-text">Sign up now!</a>
			</strong>
		</p>
	</div>
</body>
</html>