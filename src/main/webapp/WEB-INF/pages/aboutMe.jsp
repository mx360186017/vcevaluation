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
		  <jsp:include page="/head.jsp" flush="true"/>
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

				
		</div>
		<!-- page-wrapper end -->

		<jsp:include page="/footer1.jsp" flush="true"/>
	</body>
</html>
