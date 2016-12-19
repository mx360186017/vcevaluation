<%@ page language="java" import="com.vcevaluation.pojo.User" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
	User user = (User)request.getSession().getAttribute("user");
	String username = "";
	String userrealname = "";
	if (user!=null){
		username = user.getUser_name();
		userrealname = user.getUser_realname();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>风险投资评估，欢迎您</title>
<!-- for-mobile-apps -->
</head>
<body>

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
						 <button type="button" class="btn dropdown-toggle"> 
							<%=username%><a href="/vcevaluation/userLogout">注销</a></button>
							<button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
							
							<i class="fa fa-search"></i> Search</button>
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
					
						<a href="index.html">	<img id="logo" src="<%= basePath%>/static/projectstyle/images/logo_red.png" alt="iDea"></a>
					</div>

                    <!-- name-and-slogan -->
								<div class="site-slogan">
									风险投资评估系统
								</div>

				</div>
				<!-- header-left end -->

			</div>
			<div class="col-md-9" >

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
								<div class="collapse navbar-collapse" id="navbar-collapse-1" >
									<ul class="nav navbar-nav navbar-right">
										<li class="dropdown">
											<a href="/vcevaluation/toIndex" class="dropdown-toggle" data-toggle="dropdown">首页</a>
										</li>
										<!-- mega-menu start -->
										<li class="dropdown mega-menu">
											<a href="#" class="dropdown-toggle" data-toggle="dropdown">评估准备</a>
											<ul class="dropdown-menu">
												<li>
													<div class="row">
														<div class="col-lg-4 col-md-3 hidden-sm">
															<h4>成果与项目评估</h4>
															<p>为客户提供更好的一站式数据风险评估解决方案，以客户的口碑塑造资源品牌，携手广大客户，共同发展进步</p>
															<img src="<%= basePath%>/static/projectstyle/images/section-image-3.png" alt="iDea">
														</div>
														<div class="col-lg-8 col-md-9">
															<h4>Pages</h4>
															<div class="row">
																<%if(user.getUser_type()==1){%>
																<div class="col-sm-4">
																	<div class="divider"></div>
																	<!-- 基金经理：0； -->
																		<ul class="menu">
																			<li><a href="/vcevaluation/toaddpaper"><i class="icon-right-open"></i>提交论文</a></li>
																			<li><a href="/vcevaluation/toaddpatent"><i class="icon-right-open"></i>提交专利</a></li>
																			<li><a href="/vcevaluation/toaddsoftware"><i class="icon-right-open"></i>提交软件</a></li>
																			<li><a href="/vcevaluation/toAddproject"><i class="icon-right-open"></i>创建项目</a></li>
																			<li><a href="/vcevaluation/selectPaper?pageNum=1"><i class="icon-right-open"></i>查询全部论文</a></li>
																		    <li><a href="/vcevaluation/selectPatent?pageNum=1"><i class="icon-right-open"></i>查询全部专利</a></li>
																		    <li><a href="/vcevaluation/selectSoftware?pageNum=1"><i class="icon-right-open"></i>查询全部软件</a></li>
																		</ul>
																</div>
																<%}%>
																<div class="col-sm-4">
																	<div class="divider"></div>
																	<ul class="menu">
																		<li><a href="/vcevaluation/selectNoEvaResult?pageNum=1"><i class="icon-right-open"></i>查询待评估成果</a></li>
																		<li><a href="/vcevaluation/selectEvaResult?pageNum=1"><i class="icon-right-open"></i>查询评估截至成果</a></li>
																		<li><a href="/vcevaluation/selectPassResult?pageNum=1"><i class="icon-right-open"></i>查询评估达标成果</a></li>
																		<li><a href="/vcevaluation/selectNoPassResult?pageNum=1"><i class="icon-right-open"></i>查询未达标成果</a></li>
																		<li><a href="/vcevaluation/selectAllResult?pageNum=1"><i class="icon-right-open"></i>查询全部成果</a></li>
																	
																	</ul>
																</div>
																<div class="col-sm-4">
																	<div class="divider"></div>
																	<ul class="menu">
																		<li><a href="/vcevaluation/selectNoEvaProject?pageNum=1"><i class="icon-right-open"></i>查询待评估项目</a></li>
																		<li><a href="/vcevaluation/selectEvaProject?pageNum=1"><i class="icon-right-open"></i>查询评估截至项目</a></li>
																		<li><a href="/vcevaluation/selectPassProject?pageNum=1"><i class="icon-right-open"></i>查询评估达标项目</a></li>
																		<li><a href="/vcevaluation/selectNoPassProject?pageNum=1"><i class="icon-right-open"></i>查询未达标项目</a></li>
																		<li><a href="/vcevaluation/selectAllProject?pageNum=1"><i class="icon-right-open"></i>查询全部项目</a></li>
																	</ul>
																</div>
															</div>
														</div>
													</div>
												</li>
											</ul>
										</li>
										
									
										<li class="dropdown">
											<a href="shop-listing-3col.html" class="dropdown-toggle" data-toggle="dropdown">团队&成员</a>
											<ul class="dropdown-menu">
												<li><a href="/vcevaluation/selectAllTeam">团队展示</a></li>
											</ul>
										</li>
										<li class="dropdown">
											<a href="blog-right-sidebar.html" class="dropdown-toggle" data-toggle="dropdown">个人中心</a>
											<ul class="dropdown-menu">
												<li><a href="/vcevaluation/userInfo">查看个人信息</a></li>
												<li><a href="/vcevaluation/showUserInfo">修改个人信息</a></li>
											</ul>
										</li>
									</ul>
								</div>
                               <!-- mega-menu end -->
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