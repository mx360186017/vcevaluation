<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>

<!-- CSS -->
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
<link rel="stylesheet"
	href="<%= basePath%>/static/media/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%= basePath%>/static/media/assets/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<%= basePath%>/static/media/assets/css/form-elements.css">
<link rel="stylesheet"
	href="<%= basePath%>/static/media/assets/css/style.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

<!-- Favicon and touch icons -->
<link rel="shortcut icon"
	href="<%= basePath%>/static/media/assets/ico/favicon.png">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="<%= basePath%>/static/media/assets/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="<%= basePath%>/static/media/assets/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="<%= basePath%>/static/media/assets/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="<%= basePath%>/static/media/assets/ico/apple-touch-icon-57-precomposed.png">
<script>
function checkNamePwd(){
	var a_name = $("#a_name").val();
	var a_pwd = $("#a_pwd").val();
//	alert(u_name+":"+u_pwd);
	var result = false;
	$.ajax({
		async : false,
		type : 'post',
		url : 'checkAdminnamePwd/?a_name='+a_name+"&a_pwd="+a_pwd,
		success : function(msg){
			if(msg == 'success'){
				result = true;
			}else{
				$("#prompt_ps").css("display","inline");
				$("#prompt_ps").css("color","red");
				$("#prompt_ps").html("用户名或密码错误！");
				$("#prompt_ps").css("font-size","16px");
				result = false;				
			}
		}
	});
	
	return result;
}
</script>
</head>

<body>

	<!-- Top content -->
	<div class="top-content">

		<div class="inner-bg">
			<div class="container">
				<div class="row">
					<div class="col-sm-8 col-sm-offset-2 text">
						<h1>
							<strong>登录</strong> <small>风险评估系统</small>
						</h1>
						 <!--  <div class="description">
							<p>
								还没有账户？
								请 <a href=register><strong>注册</strong></a>
							</p>
						</div> -->
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 form-box">
						<div class="form-top">
							<div class="form-top-left">
								<h3>Login</h3>
							            还没有账户？
								请 <a href=register><strong>注册</strong></a>
							</div>
							<div class="form-top-right">
								<i class="fa fa-key"></i>
							</div>
						</div>
						<div class="form-bottom">
							<form role="form" action="ad_login" method="post" class="login-form" onsubmit="return checkNamePwd();">
								<div class="form-group">
									<label class="sr-only" for="form-username">用户名</label> <input
										type="text" name="a_name" placeholder="用户名..."
										class="form-username form-control" id="a_name">
										<label id="prompt_name" style="font-size:9px;display:none;"></label>
								</div>
								<div class="form-group">
									<label class="sr-only" for="form-password">密码</label> <input
										type="password" name="a_pwd" placeholder="密码..."
										class="form-password form-control" id="a_pwd">
									<label id="prompt_ps" style="font-size:9px;display:none;"></label>
								</div>
								<button type="submit" class="btn">登录</button>
							</form>
						</div>
					</div>
				</div>
				<!-- <div class="row">
					<div class="col-sm-6 col-sm-offset-3 social-login">
						<h3>...or login with:</h3>
						<div class="social-login-buttons">
							<a class="btn btn-link-1 btn-link-1-facebook" href="#"> <i
								class="fa fa-facebook"></i> Facebook
							</a> <a class="btn btn-link-1 btn-link-1-twitter" href="#"> <i
								class="fa fa-twitter"></i> Twitter
							</a> <a class="btn btn-link-1 btn-link-1-google-plus" href="#"> <i
								class="fa fa-google-plus"></i> Google Plus
							</a>
						</div>
					</div>
				</div> -->
			</div>
		</div>

	</div>


	<!-- Javascript -->
	<script
		src="<%= basePath%>/static/media/assets/js/jquery-1.11.1.min.js"></script>
	<script
		src="<%= basePath%>/static/media/assets/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="<%= basePath%>/static/media/assets/js/jquery.backstretch.min.js"></script>
	<script src="<%= basePath%>/static/media/assets/js/scripts.js"></script>

	<!--[if lt IE 10]>
            <script src="<%= basePath%>/static/media/assets/js/placeholder.js"></script>
        <![endif]

	<div class="backstretch"
		style="left: 0px; top: 0px; overflow: hidden; margin: 0px; padding: 0px; height: 389px; width: 1349px; z-index: -999999; position: fixed;">
		<img src="<%= basePath%>/static/media/assets/img/backgrounds/1.jpg"
			style="position: absolute; display: none; margin: 0px; padding: 0px; border: none; width: auto; height: 389px; max-height: none; max-width: none; z-index: -999999; top: 0px;">
	</div>-->

</body>

</html>