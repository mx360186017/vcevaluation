<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<!DOCTYPE html>
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
	<head>
	<meta charset="utf-8">
	<title>Portfolio</title>
	<meta name="description" content="iDea a Bootstrap-based, Responsive HTML5 Template">
	<meta name="author" content="htmlcoder.me">

	<!-- Mobile Meta -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
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

        <jsp:include page="/header1.jsp" flush="true"/>
        
			<!-- page-intro start-->
			<!-- ================ -->
			<div class="page-intro">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<ol class="breadcrumb">
								<li><i class="fa fa-home pr-10"></i><a href="/vcevaluation/toIndex">首页</a></li>
								<li class="active">负责团队详情</li>
							</ol>
						</div>
					</div>
				</div>
			</div>
			<!-- page-intro end -->
			<div class="section clearfix">
				<div class="container">

					<div class="row grid-space-20">
					
					    <div class="col-lg-10 col-md-9">
									<div class="portfolio-item vertical-divider-right">
										<h2 class="title">团队介绍--${team.team_name}</h2>
										<div class="separator-2"></div>
										<p>${team.team_introduction}</p>
										<div class="owl-carousel content-slider well">
										<c:forEach items="${tm}" var="tms">
											<div class="testimonial">
												<div class="testimonial-image">
													<img src="<%= basePath%>/static/projectstyle/images/${tms.member_image}" alt="Jane Doe" title="Jane Doe" class="img-circle">
												</div>
												<div class="testimonial-body">
													<p>${tms.member_remark}</p>
													<div class="testimonial-info-1">- ${tms.member_name}</div>
													<div class="testimonial-info-2">By ${tms.team_name}</div>
												</div>
											</div>
										</c:forEach>
										</div>
									</div>
								</div>
								<div class="col-lg-2 col-md-3">
									<div class="portfolio-item side margin-top-clear">
										<div class="row">
											<div class="col-md-12 col-sm-4 col-xs-6">
												<div class="block clearfix">
													<h3 class="title margin-top-clear">团队信息</h3>
													<ul class="list">
														<li><strong class="vertical-divider">团队名称 </strong>${team.team_name}</li>
														<li><strong class="vertical-divider">成立时间 </strong>${team.cooperation_time}</li>
														<li><strong class="vertical-divider">团队主要负责领域</strong> ${team.team_remark}</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
					
					</div>
					
				</div>
			</div>
			<!-- section end -->

			<!-- section start -->
			<!-- ================ -->
			<div class="section clearfix">
				<div class="container">
                       <h2>团队成员信息</h2>
					   <p>该团队成员信息如下：</p>
					   <div class="separator-2"></div>

					<c:forEach items="${tm}" var="tm">
							<div class="col-lg-6 col-md-12">
								<div class="image-box team-member option-3">
									<div class="overlay-container">
									<!-- 	<img src="<%= basePath%>/images/${tm.ream_remark}" alt=""> -->
									<img src="<%= basePath%>/static/projectstyle/images/${tm.member_image}" alt=""> 	
									</div>
									<div class="image-box-body">
										<h3 class="title">${tm.member_name}</h3>
										<small>${tm.member_job}</small>
										<div class="separator-2"></div>
										<p>${tm.member_work}</p>
										<ul class="list-unstyled">
										    <c:if test="${tm.member_edu==1}">
												<li><i class="fa fa-male"></i>男</li>
											</c:if>
											<c:if test="${tm.member_edu==2}">
												<li><i class="fa fa-female"></i>女</li>
											</c:if>
											
											<c:if test="${tm.member_edu==1}">
												<li><i class="fa fa-graduation-cap"></i>博士</li>
											</c:if>
											<c:if test="${tm.member_edu==2}">
												<li><i class="fa fa-graduation-cap"></i>硕士</li>
											</c:if>
											<c:if test="${tm.member_edu==3}">
												<li><i class="fa fa-graduation-cap"></i>本科</li>
											</c:if>
											<c:if test="${tm.member_edu==4}">
												<li><i class="fa fa-graduation-cap"></i>本科以下</li>
											</c:if>
											<li><i class="fa fa-envelope pr-10"></i><a href="mailto:janedoe@idea.com">${tm.member_intime}</a></li>
											<li><i class="fa fa-envelope pr-10"></i>${tm.member_level}</li>
										</ul>
									</div>
								</div>
								</div>
							</c:forEach>
						
						
						
					</div>
					<div class="space"></div>
				</div>
			</div>
			<!-- section end -->


       <jsp:include page="/footer1.jsp" flush="true"/>
	</body>
</html>
