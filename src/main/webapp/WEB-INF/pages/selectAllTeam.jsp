<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>查询所有团队</title>
<meta name="description" content="iDea a Bootstrap-based, Responsive HTML5 Template">
<meta name="author" content="htmlcoder.me">

<!-- Mobile Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="/head.jsp" flush="true"/>
</head>

<body>
<jsp:include page="/header1.jsp" flush="true"/>
			<!-- page-intro start-->
			<!-- ================ -->
			<div class="page-intro">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<ol class="breadcrumb">
								<li><i class="fa fa-home pr-10"></i><a href="/vcevaluation/toIndex">Home</a></li>
								<li class="active">查询所有团队</li>
							</ol>
						</div>
					</div>
				</div>
			</div>
			<!-- page-intro end -->

				<!-- main start -->
				<!-- ================ -->
				<div id="icon-boxes" class="main">
				<!-- Icon Boxes start -->
					<!-- ============================================================================== -->
					<div class="container">
						<h2>团队展示</h2>
						<br>
					</div>
					<div class="gray-bg section">
						<div class="container">
							<div class="row">
								<div class="col-md-12">
									<div class="row grid-space-10">
									<c:forEach items="${teams}" var="teams">
										<div class="col-sm-4">
											<div class="box-style-2 object-non-visible" data-animation-effect="fadeInUpSmall" data-effect-delay="0">
												<div class="icon-container white-bg">
													<i class="fa fa-leaf"></i>
												</div>
												<div class="body">
													<h2>${teams.team_name}</h2>
													<p>${teams.team_introduction}</p>
													<a href="/vcevaluation/toteamItem?team_id=${teams.team_id}" class="link"><span>详情</span></a>
												</div>
											</div>
										</div>
									</c:forEach>	
									</div>
									
								</div>
							</div>
						</div>
					</div>
					<div class="space"></div>
					
				</div>
				<!-- main end -->


<!-- footer section -->
<jsp:include page="/footer1.jsp" flush="true"/>
<!-- /footer section -->

</body>
</html>