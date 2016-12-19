<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
	<head>
		<meta charset="utf-8">
		<title>管理员管理</title>
		<meta name="description" content="iDea a Bootstrap-based, Responsive HTML5 Template">
		<meta name="author" content="htmlcoder.me">

		<!-- Mobile Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<!-- Favicon -->
		<link rel="shortcut icon" href="images/favicon.ico">

 <jsp:include page="/head.jsp" flush="true"/> 
	</head>

	<!-- body classes: 
			"boxed": boxed layout mode e.g. <body class="boxed">
			"pattern-1 ... pattern-9": background patterns for boxed layout mode e.g. <body class="boxed pattern-1"> 
	-->
	<body>
		<!-- scrollToTop -->
		<!-- ================ -->
		<div class="scrollToTop"><i class="icon-up-open-big"></i></div>

		<!-- page wrapper start -->
		<!-- ================ -->
		<div class="page-wrapper">

			<!-- header-top start -->
			<!-- ================ -->
			<div class="header-top">
				<div class="container">
					<div class="row">
						<div class="col-xs-2  col-sm-6">
						</div>
						<div class="col-xs-10 col-sm-6">

							<!-- header-top-second start -->
							<!-- ================ -->
							<div id="header-top-second"  class="clearfix">

								<!-- header top dropdowns start -->
								<!-- ================ -->
								<div class="header-top-dropdown">
									<div class="btn-group dropdown">
										<button type="button" class="btn dropdown-toggle" data-toggle="dropdown"><i class="fa fa-search"></i> Search</button>
										<ul class="dropdown-menu dropdown-menu-right dropdown-animation">
											<li>
												<form role="search" class="search-box">
													<div class="form-group has-feedback">
														<input type="text" class="form-control" placeholder="Search">
														<i class="fa fa-search form-control-feedback"></i>
													</div>
												</form>
											</li>
										</ul>
									</div>

								</div>
								<!--  header top dropdowns end -->

							</div>
							<!-- header-top-second end -->

						</div>
					</div>
				</div>
			</div>
			<!-- header-top end -->

			<!-- header start (remove fixed class from header in order to disable fixed navigation mode) -->
			<!-- ================ --> 
			<header class="header fixed clearfix">
				<div class="container">
					<div class="row">
						<div class="col-md-3">

							<!-- header-left start -->
							<!-- ================ -->
							<div class="header-left clearfix">

								<!-- logo -->
								<div class="logo">
									<a href="index.html"><img id="logo" src="<%= basePath%>/static/projectstyle/images/logo_red.png" alt="iDea"></a>
								</div>

								<!-- name-and-slogan -->
								<div class="site-slogan">
									风险评估指标系统后台管理
								</div>

							</div>
							<!-- header-left end -->

						</div>
						<div class="col-md-9">

							<!-- header-right start -->
							<!-- ================ -->
							<div class="header-right clearfix">

								<!-- main-navigation start -->
								<!-- ================ -->
								<div class="main-navigation animated">

									<!-- navbar start -->
									<!-- ================ -->
									<nav class="navbar navbar-default" role="navigation">
										<div class="container-fluid">

											<!-- Toggle get grouped for better mobile display -->
											<div class="navbar-header">
												<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
													<span class="sr-only">Toggle navigation</span>
													<span class="icon-bar"></span>
													<span class="icon-bar"></span>
													<span class="icon-bar"></span>
												</button>
											</div>

											<!-- Collect the nav links, forms, and other content for toggling -->
											<div class="collapse navbar-collapse" id="navbar-collapse-1">
												<ul class="nav navbar-nav navbar-right">
												<li><a href="#" class="dropdown-toggle" data-toggle="dropdown">首页</a></li>
													<li class="dropdown">
														<a href="#" class="dropdown-toggle" data-toggle="dropdown">成果提供者管理</a>
														<ul class="dropdown-menu">
															<li><a href="#">增加提供者</a></li>
															<li><a href="#">查看提供者</a></li>
															<li><a href="#">编辑提供者</a></li>
															<li><a href="#">检索提供者</a></li>
														</ul>
													</li>
													<li class="dropdown">
														<a href="#" class="dropdown-toggle" data-toggle="dropdown">评估专家管理</a>
														<ul class="dropdown-menu">
															<li><a href="#">增加专家</a></li>
															<li><a href="#">查看专家</a></li>
															<li><a href="#">编辑专家</a></li>
															<li><a href="#">检索提供者</a></li>
														</ul>
													</li>
													<li class="dropdown">
														<a href="#" class="dropdown-toggle" data-toggle="dropdown">成果项目管理</a>
														<ul class="dropdown-menu">
															<li><a href="#">查看所有成果</a></li>
															<li><a href="#">编辑成果</a></li>
															<li><a href="#">查看所有项目</a></li>
															<li><a href="#">编辑项目</a></li>
														</ul>
													</li>
													<li class="dropdown active">
														<a href="#" class="dropdown-toggle" data-toggle="dropdown">指标管理</a>
														<ul class="dropdown-menu">
															<li><a href="#">增加指标</a></li>
															<li class="active"><a href="#">查看指标</a></li>
															<li><a href="#">编辑指标</a></li>
															<li><a href="#">查询指标</a></li>
														</ul>
													</li>
												</ul>
											</div>

										</div>
									</nav>
									<!-- navbar end -->

								</div>
								<!-- main-navigation end -->

							</div>
							<!-- header-right end -->

						</div>
					</div>
				</div>
			</header>
			<!-- header end -->

			<!-- page-intro start-->
			<!-- ================ -->
			<div class="page-intro">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<ol class="breadcrumb">
								<li><i class="fa fa-home pr-10"></i><a href="#">Home</a></li>
								<li class="active">后台管理</li>
							</ol>
						</div>
					</div>
				</div>
			</div>
			<!-- page-intro end -->

			<!-- main-container start -->
			<!-- ================ -->
			<section class="main-container">

				<div class="container">
					<div class="row">

						<!-- sidebar start -->
						<aside class="col-md-3">
							<div class="sidebar">
								<div class="block clearfix">
									<h3 class="title">后台管理菜单</h3>
									<div class="separator"></div>
									<nav>
										<ul class="nav nav-pills nav-stacked">
											<li><a href="eCharts">统计</a></li>
											<li class="active"><a href="#">管理成果提供者</a></li>
											<li><a href="#">管理评审专家</a></li>
											<li><a href="#">管理成果</a></li>
											<li><a href="#">管理项目</a></li>
											<li><a href="selectIndexFactor">管理指标</a></li>
										</ul>
									</nav>
								</div>
							</div>
						</aside>
						<!-- sidebar end -->

						<!-- main start -->
						<!-- ================ -->
						<div class="main col-md-8 col-md-offset-1">

							<!-- page-title start -->
							<!-- ================ -->
							<h1 class="page-title">首页</h1>
							<div class="separator-2"></div>
							<p class="lead">XXX管理员，欢迎登录！ </p>
							<!-- page-title end -->

							<!-- blogpost start -->
							
							
							<!-- blogpost end -->
					

						</div>
						<!-- main end -->

					</div>
				</div>
			</section>
			<!-- main-container end -->

			
<jsp:include page="/footer1.jsp" flush="true"/> 

	</body>
</html>
