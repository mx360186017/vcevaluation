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
		<title>风险评估系统</title>
		<meta name="description" content="iDea a Bootstrap-based, Responsive HTML5 Template">
		<meta name="author" content="htmlcoder.me">

		<!-- Mobile Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<!-- Favicon -->
		<link rel="shortcut icon" href="<%= basePath%>/static/projectstyle/images/favicon.ico">

		<!-- Web Fonts -->
		 
		 

		<!-- Bootstrap core CSS -->
		<link href="<%= basePath%>/static/projectstyle/bootstrap/css/bootstrap.css" rel="stylesheet">

		<!-- Font Awesome CSS -->
		<link href="<%= basePath%>/static/projectstyle/fonts/font-awesome/css/font-awesome.css" rel="stylesheet">

		<!-- Fontello CSS -->
		<link href="<%= basePath%>/static/projectstyle/fonts/fontello/css/fontello.css" rel="stylesheet">

		<!-- Plugins -->
		<link href="<%= basePath%>/static/projectstyle/plugins/rs-plugin/css/settings.css" media="screen" rel="stylesheet">
		<link href="<%= basePath%>/static/projectstyle/plugins/rs-plugin/css/extralayers.css" media="screen" rel="stylesheet">
		<link href="<%= basePath%>/static/projectstyle/plugins/magnific-popup/magnific-popup.css" rel="stylesheet">
		<link href="<%= basePath%>/static/projectstyle/css/animations.css" rel="stylesheet">
		<link href="<%= basePath%>/static/projectstyle/plugins/owl-carousel/owl.carousel.css" rel="stylesheet">

		<!-- iDea core CSS file -->
		<link href="<%= basePath%>/static/projectstyle/css/style.css" rel="stylesheet">

		<!-- Color Scheme (In order to change the color scheme, replace the red.css with the color scheme that you prefer)-->
		<link href="<%= basePath%>/static/projectstyle/css/skins/red.css" rel="stylesheet">

		<!-- Custom css --> 
		<link href="<%= basePath%>/static/projectstyle/css/custom.css" rel="stylesheet">
	</head>

	<!-- body classes: 
			"boxed": boxed layout mode e.g. <body class="boxed">
			"pattern-1 ... pattern-9": background patterns for boxed layout mode e.g. <body class="boxed pattern-1"> 
	-->
	<body class="front">
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

							</div>
							<!-- header-top-second end -->

						</div>
					</div>
				</div>
			</div>
			<!-- header-top end -->

			<!-- header start (remove fixed class from header in order to disable fixed navigation mode) -->
			<!-- ================ --> 
			<jsp:include page="/header1.jsp"></jsp:include>
<!-- header end -->

			<!-- banner start -->
			<!-- ================ -->
			<div class="banner">

				<!-- slideshow start -->
				<!-- ================ -->
				<div class="slideshow-boxed">
					<div class="container">

						<!-- slider revolution start -->
						<!-- ================ -->
						<div class="slider-banner-container">
							<div class="slider-banner-2">
								<ul>
									<!-- slide 1 start -->
									<li data-transition="random" data-slotamount="7" data-masterspeed="500" data-saveperformance="on" data-title="Slide 1">
									
									<!-- main image -->
									<img src="<%= basePath%>/static/projectstyle/images/slider-1-slide-1.jpg"  alt="slidebg1" data-bgposition="center top" data-bgfit="cover" data-bgrepeat="no-repeat">

									<!-- LAYER NR. 1 -->
									<div class="tp-caption default_bg large sfr tp-resizeme"
										data-x="0"
										data-y="70" 
										data-speed="600"
										data-start="1200"
										data-end="9400"
										data-endspeed="600">项目评估
									</div>

									<!-- LAYER NR. 2 -->
									<div class="tp-caption dark_gray_bg sfl medium tp-resizeme"
										data-x="0"
										data-y="170" 
										data-speed="600"
										data-start="1600"
										data-end="9400"
										data-endspeed="600"><i class="icon-check"></i>
									</div>

									<!-- LAYER NR. 3 -->
									<div class="tp-caption light_gray_bg sfb medium tp-resizeme"
										data-x="50"
										data-y="170" 
										data-speed="600"
										data-start="1600"
										data-end="9400"
										data-endspeed="600">规模及产品方案数据
									</div>

									<!-- LAYER NR. 4 -->
									<div class="tp-caption dark_gray_bg sfl medium tp-resizeme"
										data-x="0"
										data-y="220" 
										data-speed="600"
										data-start="1800"
										data-end="9400"
										data-endspeed="600"><i class="icon-check"></i>
									</div>

									<!-- LAYER NR. 5 -->
									<div class="tp-caption light_gray_bg sfb medium tp-resizeme"
										data-x="50"
										data-y="220" 
										data-speed="600"
										data-start="1800"
										data-end="9400"
										data-endspeed="600">团队规模与投资公司规模
									</div>

									<!-- LAYER NR. 6 -->
									<div class="tp-caption dark_gray_bg sfl medium tp-resizeme"
										data-x="0"
										data-y="270" 
										data-speed="600"
										data-start="2000"
										data-end="9400"
										data-endspeed="600"><i class="icon-check"></i>
									</div>

									<!-- LAYER NR. 7 -->
									<div class="tp-caption light_gray_bg sfb medium tp-resizeme"
										data-x="50"
										data-y="270" 
										data-speed="600"
										data-start="2000"
										data-end="9400"
										data-endspeed="600">资金流动性分析
									</div>

									<!-- LAYER NR. 8 -->
									<div class="tp-caption dark_gray_bg sfl medium tp-resizeme"
										data-x="0"
										data-y="320" 
										data-speed="600"
										data-start="2200"
										data-end="9400"
										data-endspeed="600"><i class="icon-check"></i>
									</div>

									<!-- LAYER NR. 9 -->
									<div class="tp-caption light_gray_bg sfb medium tp-resizeme"
										data-x="50"
										data-y="320" 
										data-speed="600"
										data-start="2200"
										data-end="9400"
										data-endspeed="600">投资领域前景分析与利润预测
									</div>

									<!-- LAYER NR. 10 -->
									<div class="tp-caption dark_gray_bg sfb medium tp-resizeme"
										data-x="0"
										data-y="370" 
										data-speed="600"
										data-start="2400"
										data-end="9400"
										data-endspeed="600">还有更多...
									</div>

									</li>
									<!-- slide 1 end -->

									<!-- slide 2 start -->
									<li data-transition="random" data-slotamount="7" data-masterspeed="500" data-saveperformance="on" data-title="Slide 2">
									
									<!-- main image -->
									<img src="<%= basePath%>/static/projectstyle/images/slider-1-slide-2.jpg"  alt="slidebg1" data-bgposition="center top" data-bgfit="cover" data-bgrepeat="no-repeat">

									<!-- LAYER NR. 1 -->
									<div class="tp-caption white_bg large sfr tp-resizeme"
										data-x="0"
										data-y="70" 
										data-speed="600"
										data-start="1200"
										data-end="9400"
										data-endspeed="600">风险因素
									</div>

									<!-- LAYER NR. 2 -->
									<div class="tp-caption default_bg sfl medium tp-resizeme"
										data-x="0"
										data-y="170" 
										data-speed="600"
										data-start="1600"
										data-end="9400"
										data-endspeed="600"><i class="icon-check"></i>
									</div>

									<!-- LAYER NR. 3 -->
									<div class="tp-caption white_bg sfb medium tp-resizeme"
										data-x="50"
										data-y="170" 
										data-speed="600"
										data-start="1600"
										data-end="9400"
										data-endspeed="600">技术方案风险
									</div>

									<!-- LAYER NR. 4 -->
									<div class="tp-caption default_bg sfl medium tp-resizeme"
										data-x="0"
										data-y="220" 
										data-speed="600"
										data-start="1800"
										data-end="9400"
										data-endspeed="600"><i class="icon-check"></i>
									</div>

									<!-- LAYER NR. 5 -->
									<div class="tp-caption white_bg sfb medium tp-resizeme"
										data-x="50"
										data-y="220" 
										data-speed="600"
										data-start="1800"
										data-end="9400"
										data-endspeed="600">市场风险
									</div>

									<!-- LAYER NR. 6 -->
									<div class="tp-caption default_bg sfl medium tp-resizeme"
										data-x="0"
										data-y="270" 
										data-speed="600"
										data-start="2000"
										data-end="9400"
										data-endspeed="600"><i class="icon-check"></i>
									</div>

									<!-- LAYER NR. 7 -->
									<div class="tp-caption white_bg sfb medium tp-resizeme"
										data-x="50"
										data-y="270" 
										data-speed="600"
										data-start="2000"
										data-end="9400"
										data-endspeed="600">资金风险
									</div>

									<!-- LAYER NR. 8 -->
									<div class="tp-caption default_bg sfl medium tp-resizeme"
										data-x="0"
										data-y="320" 
										data-speed="600"
										data-start="2200"
										data-end="9400"
										data-endspeed="600"><i class="icon-check"></i>
									</div>

									<!-- LAYER NR. 9 -->
									<div class="tp-caption white_bg sfb medium tp-resizeme"
										data-x="50"
										data-y="320" 
										data-speed="600"
										data-start="2200"
										data-end="9400"
										data-endspeed="600">社会风险
									</div>
                               
									<!-- LAYER NR. 10 -->
									<div class="tp-caption default_bg sfb medium tp-resizeme"
										data-x="0"
										data-y="370" 
										data-speed="600"
										data-start="2400"
										data-end="9400"
										data-endspeed="600">更多...
									</div>


									</li>
									<!-- slide 2 end -->

									<!-- slide 3 start -->
									<li data-transition="random" data-slotamount="7" data-masterspeed="500" data-saveperformance="on" data-title="Slide 3">
									
									<!-- main image -->
									<img src="<%= basePath%>/static/projectstyle/images/slider-1-slide-3.jpg"  alt="kenburns"  data-bgposition="left center" data-kenburns="on" data-duration="10000" data-ease="Linear.easeNone" data-bgfit="100" data-bgfitend="115" data-bgpositionend="right center">

									<!-- LAYER NR. 1 -->
									<div class="tp-caption white_bg large sfr tp-resizeme"
										data-x="0"
										data-y="70" 
										data-speed="600"
										data-start="1200"
										data-end="9400"
										data-endspeed="600">服务 &amp; 团队
									</div>

									<!-- LAYER NR. 2 -->
									<div class="tp-caption dark_gray_bg sfl medium tp-resizeme"
										data-x="0"
										data-y="170" 
										data-speed="600"
										data-start="1600"
										data-end="9400"
										data-endspeed="600"><i class="icon-check"></i>
									</div>

									<!-- LAYER NR. 3 -->
									<div class="tp-caption white_bg sfb medium tp-resizeme"
										data-x="50"
										data-y="170" 
										data-speed="600"
										data-start="1600"
										data-end="9400"
										data-endspeed="600">优质的服务
									</div>

									<!-- LAYER NR. 4 -->
									<div class="tp-caption dark_gray_bg sfl medium tp-resizeme"
										data-x="0"
										data-y="220" 
										data-speed="600"
										data-start="1800"
										data-end="9400"
										data-endspeed="600"><i class="icon-check"></i>
									</div>

									<!-- LAYER NR. 5 -->
									<div class="tp-caption white_bg sfb medium tp-resizeme"
										data-x="50"
										data-y="220" 
										data-speed="600"
										data-start="1800"
										data-end="9400"
										data-endspeed="600">专业的评估人员
									</div>

									<!-- LAYER NR. 6 -->
									<div class="tp-caption dark_gray_bg sfl medium tp-resizeme"
										data-x="0"
										data-y="270" 
										data-speed="600"
										data-start="2000"
										data-end="9400"
										data-endspeed="600"><i class="icon-check"></i>
									</div>

									<!-- LAYER NR. 7 -->
									<div class="tp-caption white_bg sfb medium tp-resizeme"
										data-x="50"
										data-y="270" 
										data-speed="600"
										data-start="2000"
										data-end="9400"
										data-endspeed="600">组合化评估方式
									</div>

									<!-- LAYER NR. 8 -->
									<div class="tp-caption dark_gray_bg sfl medium tp-resizeme"
										data-x="0"
										data-y="320" 
										data-speed="600"
										data-start="2200"
										data-end="9400"
										data-endspeed="600"><i class="icon-check"></i>
									</div>

									<!-- LAYER NR. 9 -->
									<div class="tp-caption white_bg sfb medium tp-resizeme"
										data-x="50"
										data-y="320" 
										data-speed="600"
										data-start="2200"
										data-end="9400"
										data-endspeed="600">给出良好的评估意见
									</div>

									<!-- LAYER NR. 10 -->
									<div class="tp-caption dark_gray_bg sfb medium tp-resizeme"
										data-x="0"
										data-y="370" 
										data-speed="600"
										data-start="2400"
										data-end="9400"
										data-endspeed="600">不要错过!
									</div>

									<!-- LAYER NR. 11 -->
									<div class="tp-caption sfr"
										data-x="right" data-hoffset="-660"
										data-y="center" 
										data-speed="600"
										data-start="2700"
										data-endspeed="600"
										data-autoplay="false"
										data-autoplayonlyfirsttime="false"
										data-nextslideatend="true">
										<div class="embed-responsive embed-responsive-16by9">
									
										</div>
									</div>

									</li>
									<!-- slide 3 end -->

								</ul>
								<div class="tp-bannertimer tp-bottom"></div>
							</div>
						</div>
						<!-- slider revolution end -->
						
					</div>
				</div>
				<!-- slideshow end -->

			</div>
			<!-- banner end -->
			<!-- section start -->
			<!-- ================ -->
			<div class="section clearfix">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<h1 class="text-center">关于我们</h1>
							<div class="separator"></div>
							<br>
							<div class="row">
								<div class="col-md-6">
									<h2 class="title">iDea - 风险评估</h2>
									<div class="row">
										<div class="col-md-6">
											<img src="<%= basePath%>/static/projectstyle/images/section-image-1.png" alt="">
										</div>
										<div class="col-md-6">
											<p>我们以专业的方法、谨慎的作风、客观的态度、公正的原则以及热情的服务，致力为中小型企业、国内外银行、投融资公司、政府组织等机构提供投资项目数据分析、投资项目评估、经济效益评价、项目数据分析研究</p>
										</div>
									</div>
									<p>为客户提供更好的一站式数据风险评估解决方案，以客户的口碑塑造资源品牌，携手广大客户，共同发展进步。</p>
									<a href="#" class="btn btn-white">Learn More</a>
									<div class="space hidden-md hidden-lg"></div>
								</div>
								<div class="col-md-6">
									<div class="panel-group panel-dark" id="accordion">
										<div class="panel panel-default">
											<div class="panel-heading">
												<h4 class="panel-title">
													<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
														<i class="fa fa-bold"></i>专业优势
													</a>
												</h4>
											</div>
											<div id="collapseOne" class="panel-collapse collapse in">
												<div class="panel-body">
													 专业的技术，丰富的成功经验，权威的数据分析，为您提供最真实可靠的数据分析报告！秉承诚信、客观、科学、实效、公正的经营理念，坚持高水准的专业品质，为客户提供最有价值的服务，努力成为客户发展历程中值得信赖的合作伙伴！
												</div>
											</div>
										</div>
										<div class="panel panel-default">
											<div class="panel-heading">
												<h4 class="panel-title">
													<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" class="collapsed">
														<i class="fa fa-leaf"></i>优质的评估团队
													</a>
												</h4>
											</div>
											<div id="collapseTwo" class="panel-collapse collapse">
												<div class="panel-body">
                                                                                                                                                本系统中用户有数多位专业评估分析人员、风险控制人员组成，具备丰富的专业知识及行业经验，涉及金融、法律、财务、投融资、营销等全方位的经济领域，熟悉资本市场运作规律，充分了解投资人对投资项目的关注重点、评判标准及心态偏好。为项目提供科学、严谨、规范的金融投资综合分析、项目风险评定分析、项目投资价值分析、投资价值与增值潜力分析、项目数据分析及项目投资专案分析等专业报告，为企业把握风险，促进投融资项目合作。												</div>
											</div>
										</div>
										
									</div>
								</div>
							</div>
							<br>
						</div>
					</div>
				</div>
			</div>
			<!-- section end -->
			<!-- main-container start -->
			<!-- ================ -->
			<section class="main-container gray-bg">

				<!-- main start -->
				<!-- ================ -->
				<div class="main">
					<div class="container">
						<div class="row">
							<div class="col-md-12">
								<h1 class="text-center title">Features</h1>
								<div class="separator"></div>
								<p class="text-center">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
								<div class="row">
									<div class="col-sm-4">
										<div class="box-style-1 white-bg object-non-visible" data-animation-effect="fadeInUpSmall" data-effect-delay="0">
											<i class="fa fa-leaf"></i>
											<h2>Clean Design and Code</h2>
											<p>Voluptatem ad provident non <a href="#">repudiandae</a> veritatis beatae cupiditate amet reiciendis.</p>
											<a href="page-services.html" class="btn-default btn">Read More</a>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="box-style-1 white-bg object-non-visible" data-animation-effect="fadeInUpSmall" data-effect-delay="200">
											<i class="fa fa-laptop"></i>
											<h2>Very Flexible</h2>
											<p>Iure sequi unde hic. Sapiente quaerat labore sequi inventore veritatis cumque.</p>
											<a href="page-services.html" class="btn-default btn">Read More</a>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="box-style-1 white-bg object-non-visible" data-animation-effect="fadeInUpSmall" data-effect-delay="400">
											<i class="fa fa-sitemap"></i>
											<h2>Latest Technologies</h2>
											<p>Inventore dolores aut laboriosam cum consequuntur delectus sequi! Eum est.</p>
											<a href="page-services.html" class="btn-default btn">Read More</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- main end -->

			</section>
			<!-- main-container end -->



			<!-- section start -->
			<!-- ================ -->
			<div class="section parallax light-translucent-bg parallax-bg-3">
				<div class="container">
					<div class="call-to-action">
						<div class="row">
							<div class="col-md-8">
								<h1 class="title text-center">Risk Assessment</h1>
								<p class="text-center">在国际投资领域中，为减少投资人的投资失误和风险，每一次投资活动都必须建立一套科学的，适应自己的投资活动特征的理论和方法</p>
							</div>
							<div class="col-md-4">
								<div class="text-center">
									<a href="#" class="btn btn-default btn-lg">评估方案</a>
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
					<div class="row">
						<div class="col-md-12">

							<h1 class="text-center">为什么要选择我们？</h1>
							<div class="separator"></div>
							
							<!-- Tabs start -->
							<!-- ================ -->
							<div class="vertical hc-tabs">

								<!-- Tabs Top -->
								<div class="hc-tabs-top">
									<img data-tab="#tab1" src="<%= basePath%>/static/projectstyle/images/section-image-1.png" alt="iDea" data-tab-animation-effect="fadeInRightSmall">
									<img data-tab="#tab2" src="<%= basePath%>/static/projectstyle/images/section-image-2.png" alt="iDea" data-tab-animation-effect="fadeInRightSmall">
									<img data-tab="#tab3" src="<%= basePath%>/static/projectstyle/images/section-image-3.png" alt="iDea" data-tab-animation-effect="fadeInRightSmall">
									<img data-tab="#tab4" src="<%= basePath%>/static/projectstyle/images/section-image-4.png" alt="iDea" data-tab-animation-effect="fadeInRightSmall">
									<img data-tab="#tab5" src="<%= basePath%>/static/projectstyle/images/section-image-1.png" alt="iDea" data-tab-animation-effect="fadeInRightSmall">
									<img data-tab="#tab6" src="<%= basePath%>/static/projectstyle/images/section-image-2.png" alt="iDea" data-tab-animation-effect="fadeInRightSmall">
									<img data-tab="#tab7" src="<%= basePath%>/static/projectstyle/images/section-image-3.png" alt="iDea" data-tab-animation-effect="fadeInRightSmall">
									<div class="space"></div>
								</div>
								
								<!-- Tabs Arrow -->
								<div class="arrow hidden-sm hidden-xs"><i class="fa fa-caret-up"></i></div>
								
								<!-- Nav tabs -->
								<ul class="nav nav-tabs" role="tablist">
									<li class="active"><a href="#tab1" role="tab" data-toggle="tab"><i class="fa fa-magic pr-10"></i> 风险因素分析</a></li>
									<li><a href="#tab2" role="tab" data-toggle="tab"><i class="fa fa-life-saver pr-10"></i> 技术风险</a></li>
									<li><a href="#tab3" role="tab" data-toggle="tab"><i class="fa fa-expand pr-10"></i> 市场风险</a></li>
									<li><a href="#tab4" role="tab" data-toggle="tab"><i class="fa fa-file-o pr-10"></i> 资金风险</a></li>
									<li><a href="#tab5" role="tab" data-toggle="tab"><i class="fa fa-file-o pr-10"></i> 社会风险</a></li>
									<li><a href="#tab6" role="tab" data-toggle="tab"><i class="fa fa-file-o pr-10"></i> 项目方案风险</a></li>
									<li><a href="#tab7" role="tab" data-toggle="tab"><i class="fa fa-file-o pr-10"></i> 其他风险</a></li>
								</ul>

								<!-- Tab panes -->
								<div class="tab-content">
									<div class="tab-pane fade in active" id="tab1">
										<h1 class="text-center title">风险因素</h1>
										<div class="space"></div>
										<div class="row">
											<div class="col-md-6">
												<ul class="list-icons">
													<li><i class="icon-check pr-10"></i> 技术风险</li>
													<li><i class="icon-check pr-10"></i> 市场风险</li>
													<li><i class="icon-check pr-10"></i> 资金风险</li>
													<li><i class="icon-check pr-10"></i> 设计方案风险</li>
													<li><i class="icon-check pr-10"></i> 社会风险</li>
													<li><i class="icon-check pr-10"></i> 综合风险</li>
												</ul>
											</div>
											<div class="col-md-6">
												<p>   风险因素是引起或增加风险事故发生机会的条件。本项目风险分析是在市场分析、技术方案、工程方案和社会评价论证的基础上，进一步综合分析识别项目在建设和运营中潜在的主要风险因素，提示风险来源，提出规避风险对策，以降低风险造成的损失。</p>
												<p>   项目工程应将风险管理作为重要的内容，对风险的预测、调查分析、监控都应成为项目建设和管理的重要组成部分。</p>
												<a href="#" class="btn btn-default">更多</a>
											</div>
										</div>
									</div>
									<div class="tab-pane fade" id="tab2">
										<h1 class="text-center title">技术风险</h1>
										<div class="space"></div>
										<div class="row">
											<div class="col-md-12">
												<p>技术风险的种类很多，其主要类型是技术不足风险、技术开发风险、技术保护风险、技术使用风险、技术取得和转让风险。
                                                <p>技术风险可依据工程项目风险定义进行等级区分。通常分为低、中、高风险三个等级。低风险是指可辨识且可监控其对项目目标影响的风险；中等风险是指可辨识的，对工程系统的技术性能、费用或进度将产生较大影响的风险，这类风险发生的可能性相当高，是有条件接受的事件，需要对其进行严密监控。高风险是指发生的可能性很高，不可接受的事件，其后果将对工程项目有极大影响的风险。</p>
												<a href="#" class="btn btn-default">更多</a>
											</div>
										</div>
									</div>
									<div class="tab-pane fade" id="tab3">
										<h1 class="text-center title">市场风险</h1>
										<div class="space"></div>
										<div class="row">
											<div class="col-md-12">
												<p>市场产品销售量与价格为项目运行效益的较大风险。由于产品的附加值较高，预计从事本行业的研究和生产单位会有所增加。产品目前是否处于市场快速增长期，目前是否有有替代产品出现等都是风险分析的重要凭据。</p>
												<p>评价实例：公司目前处于**地位，通过本次扩产后，能大幅提高市场占有率，发展成为国内规模最大、技术领先、国际竞争力最强的*****生产厂家。</p>
												<a href="#" class="btn btn-default">更多</a>
											</div>
										</div>
									</div>
									<div class="tab-pane fade" id="tab4">
										<h1 class="text-center title">资金风险</h1>
										<div class="space"></div>
										<div class="row">
											<div class="col-md-12">
												<p>项目总投资为***万元，其筹措方案为：申请银行贷款***万元，企业自筹资金***万元。银行贷款占项目总投资的***%。（公司上一年的年利润），有很强的贷款偿还能力。</p>
												<p>资金风险具体体现在：企业控制应收应付款、存货存量、资金流管理、企业预算、企业并购、考量资金时间价值和风险管理等</p>
												<a href="#" class="btn btn-default">更多</a>
											</div>
										</div>
									</div>
									<div class="tab-pane fade" id="tab5">
										<h1 class="text-center title">设计方案风险</h1>
										<div class="space"></div>
										<div class="row">
											<div class="col-md-12">
												<p>设计方案的优劣，对项目建设成功与否关系重大。项目投资控制的重点在于施工以前的设计阶段。在初步设计阶段，影响项目投资的可能性则为75%～95%；在技术设计阶段，影响项目投资的可能性则为5%～35%，可见设计对整个建设工程的效益是何等的重要。</p>
												<p>运用价值工程理论，采取限额设计的方法，正确合理选择方案和材料，避免盲目追求高标准，从质量经济性进行设计决策，达到节约投资的目的。采用工程量清单计价模式进行建设工程项目招标投标，有利于控制建设项目投资，并将材料上涨风险合理转移给承包商。</p>
												<a href="#" class="btn btn-default">更多</a>
											</div>
										</div>
									</div>
									<div class="tab-pane fade" id="tab6">
										<h1 class="text-center title">社会风险</h1>
										<div class="space"></div>
										<div class="row">
											<div class="col-md-12">
												<p>若产品为政策鼓励类产品、高新技术出口产品、重点产业化的高新技术产品，则政策等社会风险小</p>
												<p>评价实例：**项目属于清洁生产、环境友好型项目，建设符合***市工业发展整体规划和工业布局；项目建设用地为公司厂区内，不存在与当地居民发生用地矛盾；实施单位资金调度能力强，规模经营可有效摊低产品和原材料价格波动带来的风险，资金风险及市场风险较小。该项目总体上属于“小风险”范围。</p>
												<a href="#" class="btn btn-default">更多</a>
											</div>
										</div>
									</div>
									<div class="tab-pane fade" id="tab7">
										<h1 class="text-center title">综合风险</h1>
										<div class="space"></div>
										<div class="row">
											<div class="col-md-12">
												<p>综合上述风险因素，并结合其他非主要风险因素进行综合评价</p>
												<p>评价实例：**项目属于清洁生产、环境友好型项目，建设符合***市工业发展整体规划和工业布局；项目建设用地为公司厂区内，不存在与当地居民发生用地矛盾；实施单位资金调度能力强，规模经营可有效摊低产品和原材料价格波动带来的风险，资金风险及市场风险较小。该项目总体上属于“小风险”范围。</p>
												<a href="#" class="btn btn-default">更多</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- tabs end -->
				
						</div>
					</div>
				</div>
			</div>
			<!-- section end -->
            <div class="section gray-bg clearfix">
				<div class="owl-carousel content-slider">
				<c:forEach items="${allmember}" var="allmember">
					<div class="testimonial">
						<div class="container">
							<div class="row">
								<div class="col-md-8 col-md-offset-2">
									<h2 class="title">Just Perfect!</h2>
									<div class="testimonial-image">
									<img src="<%= basePath%>/static/projectstyle/images/${allmember.member_image}"  class="img-circle">
									</div>
									<div class="testimonial-body">
										<p>${allmember.member_remark}</p>
										<div class="testimonial-info-1">- ${allmember.member_name}</div>
										<div class="testimonial-info-2">By ${allmember.team_name}</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>	
					
				</div>
			</div>
			<!-- section end -->
			
			<!-- section start -->
			<!-- ================ -->
			<div class="section clearfix">

				<div class="container">
					<div class="row">
						<div class="col-md-12">

							<h2>Our Work</h2>
							<div class="separator-2"></div>
							<div class="owl-carousel carousel">
							<c:forEach items="${pros}" var="pro">
								<div class="image-box object-non-visible" data-animation-effect="fadeInLeft" data-effect-delay="300">
									<div class="overlay-container">
											<img src="<%= basePath%>/static/projectstyle/images/portfolio-1.jpg" alt="">
											<div class="overlay">
												<div class="overlay-links">
													<a href="/vcevaluation/projectItem?pro_id=${pro.pro_id}"><i class="fa fa-link"></i></a>
													<a href="<%= basePath%>/static/projectstyle/images/portfolio-1.jpg" class="popup-img"><i class="fa fa-search-plus"></i></a>
												</div>
												<span>${pro.pro_name}</span>
											</div>
										</div>
										<div class="image-box-body">
											<h3 style="white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" class="title"><a href="/vcevaluation/projectItem?pro_id=${pro.pro_id}">${ pro.pro_name}</a></h3>
											<div style="text-overflow:ellipsis;word-wrap: break-word;height:67.5px;width:230px;overflow:hidden;">${ pro.pro_plan}</div>
											
											<span>${usermap[pro.pro_creater]}</span>
											<div class="elements-list pull-right">
												
												<a  href="/vcevaluation/projectItem?pro_id=${pro.pro_id}" ><span>项目详情</span></a>
											</div>
											
										</div>
								</div>
							</c:forEach>	
								
							</div>

						</div>
					</div>
				</div>

			</div>
			<!-- section end -->

			<!-- footer start (Add "light" class to #footer in order to enable light footer) -->
			<!-- ================ -->
			<footer id="footer">

				<!-- .footer start -->
				<!-- ================ -->
				<div class="footer">
					<div class="container">
						<div class="row">
							<div class="col-md-6">
								<div class="footer-content">
									<div class="logo-footer"><img id="logo-footer" src="<%= basePath%>/static/projectstyle/images/logo_red_footer.png" alt=""></div>
									<div class="row">
										<div class="col-sm-6">
											<p>Lorem ipsum dolor sit amet, consect tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim ven.</p>
											<ul class="social-links circle">
												<li class="facebook"><a target="_blank" href="http://sc.chinaz.com"><i class="fa fa-facebook"></i></a></li>
												<li class="twitter"><a target="_blank" href="http://sc.chinaz.com"><i class="fa fa-twitter"></i></a></li>
												<li class="googleplus"><a target="_blank" href="http://sc.chinaz.com"><i class="fa fa-google-plus"></i></a></li>
												<li class="skype"><a target="_blank" href="http://sc.chinaz.com"><i class="fa fa-skype"></i></a></li>
												<li class="linkedin"><a target="_blank" href="http://sc.chinaz.com"><i class="fa fa-linkedin"></i></a></li>
											</ul>
										</div>
										<div class="col-sm-6">
											<ul class="list-icons">
												<li><i class="fa fa-map-marker pr-10"></i> One infinity loop, 54100</li>
												<li><i class="fa fa-phone pr-10"></i> +00 1234567890</li>
												<li><i class="fa fa-fax pr-10"></i> +00 1234567891 </li>
												<li><i class="fa fa-envelope-o pr-10"></i> info@idea.com</li>
											</ul>
										</div>
									</div>
									<a href="page-about.html" class="link"><span>Read More</span></a>
								</div>
							</div>
							<div class="space-bottom hidden-lg hidden-xs"></div>
							<div class="col-sm-6 col-md-2">
								<div class="footer-content">
									<h2>Links</h2>
									<nav>
										<ul class="nav nav-pills nav-stacked">
											<li><a href="index.html">Home</a></li>
											<li class="active"><a href="blog-right-sidebar.html">Blog</a></li>
											<li><a href="portfolio-3col.html">Portfolio</a></li>
											<li><a href="page-about.html">About</a></li>
											<li><a href="page-contact.html">Contact</a></li>
										</ul>
									</nav>
								</div>
							</div>
							<div class="col-sm-6 col-md-3 col-md-offset-1">
								<div class="footer-content">
									<h2>Latest Projects</h2>
									<div class="gallery row">
										<div class="gallery-item col-xs-4">
											<div class="overlay-container">
												<img src="<%= basePath%>/static/projectstyle/images/gallery-1.jpg" alt="">
												<a href="portfolio-item.html" class="overlay small">
													<i class="fa fa-link"></i>
												</a>
											</div>
										</div>
										<div class="gallery-item col-xs-4">
											<div class="overlay-container">
												<img src="<%= basePath%>/static/projectstyle/images/gallery-2.jpg" alt="">
												<a href="portfolio-item.html" class="overlay small">
													<i class="fa fa-link"></i>
												</a>
											</div>
										</div>
										<div class="gallery-item col-xs-4">
											<div class="overlay-container">
												<img src="<%= basePath%>/static/projectstyle/images/gallery-3.jpg" alt="">
												<a href="portfolio-item.html" class="overlay small">
													<i class="fa fa-link"></i>
												</a>
											</div>
										</div>
										<div class="gallery-item col-xs-4">
											<div class="overlay-container">
												<img src="<%= basePath%>/static/projectstyle/images/gallery-4.jpg" alt="">
												<a href="portfolio-item.html" class="overlay small">
													<i class="fa fa-link"></i>
												</a>
											</div>
										</div>
										<div class="gallery-item col-xs-4">
											<div class="overlay-container">
												<img src="<%= basePath%>/static/projectstyle/images/gallery-5.jpg" alt="">
												<a href="portfolio-item.html" class="overlay small">
													<i class="fa fa-link"></i>
												</a>
											</div>
										</div>
										<div class="gallery-item col-xs-4">
											<div class="overlay-container">
												<img src="<%= basePath%>/static/projectstyle/images/gallery-6.jpg" alt="">
												<a href="portfolio-item.html" class="overlay small">
													<i class="fa fa-link"></i>
												</a>
											</div>
										</div>
										<div class="gallery-item col-xs-4">
											<div class="overlay-container">
												<img src="<%= basePath%>/static/projectstyle/images/gallery-7.jpg" alt="">
												<a href="portfolio-item.html" class="overlay small">
													<i class="fa fa-link"></i>
												</a>
											</div>
										</div>
										<div class="gallery-item col-xs-4">
											<div class="overlay-container">
												<img src="<%= basePath%>/static/projectstyle/images/gallery-8.jpg" alt="">
												<a href="portfolio-item.html" class="overlay small">
													<i class="fa fa-link"></i>
												</a>
											</div>
										</div>
										<div class="gallery-item col-xs-4">
											<div class="overlay-container">
												<img src="<%= basePath%>/static/projectstyle/images/gallery-9.jpg" alt="">
												<a href="portfolio-item.html" class="overlay small">
													<i class="fa fa-link"></i>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="space-bottom hidden-lg hidden-xs"></div>
					</div>
				</div>
				<!-- .footer end -->

				<!-- .subfooter start -->
				<!-- ================ -->
				<div class="subfooter">
					<div class="container">
						<div class="row">
							<div class="col-md-6">
								<p>Copyright &copy; 2015.Company name All rights reserved.<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
							</div>
							<div class="col-md-6">
								<nav class="navbar navbar-default" role="navigation">
									<!-- Toggle get grouped for better mobile display -->
									<div class="navbar-header">
										<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-2">
											<span class="sr-only">Toggle navigation</span>
											<span class="icon-bar"></span>
											<span class="icon-bar"></span>
											<span class="icon-bar"></span>
										</button>
									</div>   
									<div class="collapse navbar-collapse" id="navbar-collapse-2">
										<ul class="nav navbar-nav">
											<li><a href="index.html">Home</a></li>
											<li><a href="page-about.html">About</a></li>
											<li><a href="blog-right-sidebar.html">Blog</a></li>
											<li><a href="portfolio-3col.html">Portfolio</a></li>
											<li><a href="page-contact.html">Contact</a></li>
										</ul>
									</div>
								</nav>
							</div>
						</div>
					</div>
				</div>
				<!-- .subfooter end -->

			</footer>
			<!-- footer end -->

		</div>
		<!-- page-wrapper end -->

		<!-- JavaScript files placed at the end of the document so the pages load faster
		================================================== -->
		<!-- Jquery and Bootstap core js files -->
		<script type="text/javascript" src="<%= basePath%>/static/projectstyle/plugins/jquery.min.js"></script>
		<script type="text/javascript" src="<%= basePath%>/static/projectstyle/bootstrap/js/bootstrap.min.js"></script>

		<!-- Modernizr javascript -->
		<script type="text/javascript" src="<%= basePath%>/static/projectstyle/plugins/modernizr.js"></script>

		<!-- jQuery REVOLUTION Slider  -->
		<script type="text/javascript" src="<%= basePath%>/static/projectstyle/plugins/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
		<script type="text/javascript" src="<%= basePath%>/static/projectstyle/plugins/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>

		<!-- Isotope javascript -->
		<script type="text/javascript" src="<%= basePath%>/static/projectstyle/plugins/isotope/isotope.pkgd.min.js"></script>

		<!-- Owl carousel javascript -->
		<script type="text/javascript" src="<%= basePath%>/static/projectstyle/plugins/owl-carousel/owl.carousel.js"></script>

		<!-- Magnific Popup javascript -->
		<script type="text/javascript" src="<%= basePath%>/static/projectstyle/plugins/magnific-popup/jquery.magnific-popup.min.js"></script>

		<!-- Appear javascript -->
		<script type="text/javascript" src="<%= basePath%>/static/projectstyle/plugins/jquery.appear.js"></script>

		<!-- Count To javascript -->
		<script type="text/javascript" src="<%= basePath%>/static/projectstyle/plugins/jquery.countTo.js"></script>

		<!-- Parallax javascript -->
		<script src="<%= basePath%>/static/projectstyle/plugins/jquery.parallax-1.1.3.js"></script>

		<!-- Contact form -->
		<script src="<%= basePath%>/static/projectstyle/plugins/jquery.validate.js"></script>

		<!-- Initialization of Plugins -->
		<script type="text/javascript" src="<%= basePath%>/static/projectstyle/js/template.js"></script>

		<!-- Custom Scripts -->
		<script type="text/javascript" src="<%= basePath%>/static/projectstyle/js/custom.js"></script>

	</body>
</html>
