<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.vcevaluation.pojo.User" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
	User user = (User)request.getSession().getAttribute("user");
	String username = "";
	if (user!=null){
		username = user.getUser_name();
	}
%>
<!DOCTYPE html>
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
	<head>
	<meta charset="utf-8">
	<title>项目详情</title>
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
								<li><i class="fa fa-reply-all"></i><a href="/vcevaluation/selectAllProject">查看所有项目</a></li>
								<li class="active">项目详情</li>
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

						<!-- main start -->
						<!-- ================ -->
						<div class="main col-md-12">

							<!-- page-title start -->
							<!-- ================ -->
							<h1 class="page-title margin-top-clear">${pro.pro_name}</h1>
							<!-- page-title end -->
							<div class="row">
								<div class="col-md-4">
									<h3>项目计划</h3>
									<div class="separator-2"></div>
									<p>${pro.pro_plan}</p>
								
								</div>
								<div class="col-md-4">
									<h3>项目方案</h3>
									<div class="separator-2"></div>
									<p>${pro.pro_scheme}</p>
									
								</div>
								<div class="col-md-4">
									<!-- Nav tabs -->
									<ul class="nav nav-pills white space-top" role="tablist">
										<li class="active"><a href="#portfolio-images" role="tab" data-toggle="tab" title="images"><i class="fa fa-camera pr-5"></i> logo</a></li>
									</ul>
									<!-- Tab panes -->
									<div class="tab-content clear-style">
										<div class="tab-pane active" id="portfolio-images">
										<img style="max-width:360px; max-height:222px;" src="<%= basePath%>/static/adStyle/img/${pro.pro_type}"  alt="">
											<%-- <img src="<%= basePath%>/static/adStyle/img/${pro.pro_type}" alt=""> --%>
													<a href="<%= basePath%>/static/adStyle/img/${pro.pro_type}"  class="popup-img overlay" title="image title"><i class="fa fa-search-plus"></i></a>
										</div>
										
									</div>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-md-3 col-xs-6">
									<h3>项目简介</h3>
									<ul class="list">
									
										<li><strong class="vertical-divider">申请人 </strong><a href=" #">${user.user_name}</a></li>
										<input type="hidden" id="user_id" name="user_id" value="${user.user_id}"/>
										<li><strong class="vertical-divider">申请时间 </strong> ${pro.pro_protime}</li>
										<li><strong class="vertical-divider">附件 </strong>文件名
											 <a href="<%=basePath %>/downloadpro?upload_id=${pro.pro_remark}">下载</a></li>
										<li><strong class="vertical-divider">负责团队</strong><a href="/vcevaluation/toteamItem?team_id=${team.team_id}">${team.team_name}</a></li>
										<input type="hidden" id="team_id" name="team_id" value="${team.team_id}"/>
										<li><strong class="vertical-divider">设备是否支持技术 </strong>
										    <c:if test="${pro.pro_fit==1}">
											硬件十分先进，能支持技术
						                    </c:if>
						                    <c:if test="${pro.pro_fit==2}">
											硬件基本能支持技术
						                    </c:if>
						                    <c:if test="${pro.pro_fit==3}">
											硬件还有待改进来满足此次项目所需技术
						                    </c:if></li>
										<li><strong class="vertical-divider">企业自筹资金 </strong>${pro.pro_capital} 万元</li>
										<li><strong class="vertical-divider">银行贷款资金 </strong>${pro.pro_bank} 万元</li>
									
										<li><strong class="vertical-divider">是否有政策支持 </strong><c:if test="${pro.pro_support==1}">
											是
						                    </c:if>
						                    <c:if test="${pro.pro_support==0}">
											否
						                    </c:if></li>
										<li><strong class="vertical-divider">市场现状 </strong><c:if test="${pro.pro_period==1}">
											市场爆发期
						                    </c:if>
						                    <c:if test="${pro.pro_period==2}">
											市场增长期</
						                    </c:if>
						                    <c:if test="${pro.pro_period==3}">
											市场稳定期
						                    </c:if>
						                    <c:if test="${pro.pro_period==4}">
											市场衰退期或不确定
						                    </c:if>
						                    </li>
										<li><strong class="vertical-divider">企业去年年收益百分比 </strong>
										    <c:if test="${pro.pro_lastbenifit==0}">
											年利润为0或亏损
						                    </c:if>
										    <c:if test="${pro.pro_lastbenifit==1}">
											1% - 10%
						                    </c:if>
						                    <c:if test="${pro.pro_lastbenifit==2}">
											10% - 20%
						                    </c:if>
						                    <c:if test="${pro.pro_lastbenifit==3}">
											20% - 30%
						                    </c:if>
						                    <c:if test="${pro.pro_lastbenifit==4}">
											30%以上
						                    </c:if></li>
									</ul>
								</div>
								<div class="col-md-3 col-xs-6">
									<h3>评估信息</h3>
									<ul class="list">
										<c:if test="${pro.pro_flag==1}">
										<li><strong class="vertical-divider">评估状态</strong>待评估</li>
										</c:if>
										<c:if test="${pro.pro_flag==2}">
										<li><strong class="vertical-divider">评估状态</strong>评估截至</li>
										</c:if>
										<li><strong class="vertical-divider">评估截止时间</strong>${pro.pro_eva_deadline}</li>
										<li><strong class="vertical-divider">评估次数 </strong> ${pro.pro_times}</li>
										<li><strong class="vertical-divider">评估均值</strong>${pro.pro_evalue}</li>
									
										
								    </ul>
								</div>
							    <c:if test="${pro.pro_flag==1}" >	
							    <%if(user.getUser_type()==0){%>
								<div class="col-md-6 col-xs-12">
									<h3>评估该项目</h3>
									<p>根据上述项目信息进行评估</p>
									<a href="/vcevaluation/toEvaluationProject?pro_id=${pro.pro_id}" class="btn btn-white margin-top-clear">开始粗糙化评估</a>
									<a href="/vcevaluation/toEvaluationProDetail?pro_id=${pro.pro_id}" class="btn btn-white margin-top-clear">精细化评估方案</a>
								</div>
								<%}%>
								</c:if>
								
								<c:if test="${pro.pro_flag==2}" >
								<div class="col-md-6 col-xs-12">
								<h2>
										<c:if test="${pro.pro_evalue>=8}">
										<li><strong class="vertical-divider">评估结果 </strong>评估通过<i class="fa fa-check"></i></li>
										</c:if>
										<c:if test="${pro.pro_evalue<8}">
										<li><strong class="vertical-divider">评估结果</strong>评估未通过<i class="fa fa-close"></i></a></li>
										</c:if>
								</h2>
								</div>
								</c:if>
								
							</div>
						</div>
						<!-- main end -->

					</div>
				</div>
			</section>
			<!-- main-container end -->


       <jsp:include page="/footer1.jsp" flush="true"/>
	</body>
</html>
