<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<meta name="description"
	content="iDea a Bootstrap-based, Responsive HTML5 Template">
<meta name="author" content="htmlcoder.me">

<!-- Mobile Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Favicon -->
<link rel="shortcut icon" href="images/favicon.ico">

<script type="text/javascript"
	src="<%=basePath%>/static/adStyle/global/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/static/adStyle/global/js/echarts.min.js"></script>
<script src="http://echarts.baidu.com/build/dist/echarts.js"></script>

<jsp:include page="/head.jsp" flush="true" />
</head>


<body>

	<!-- scrollToTop -->
	<!-- ================ -->
	<div class="scrollToTop">
		<i class="icon-up-open-big"></i>
	</div>

	<!-- page wrapper start -->
	<!-- ================ -->
	<div class="page-wrapper">

		<!-- header-top start -->
		<!-- ================ -->
		<div class="header-top">
			<div class="container">
				<div class="row">
					<div class="col-xs-2  col-sm-6"></div>
					<div class="col-xs-10 col-sm-6">

						<!-- header-top-second start -->
						<!-- ================ -->
						<div id="header-top-second" class="clearfix">

							<!-- header top dropdowns start -->
							<!-- ================ -->
							<div class="header-top-dropdown">
								<div class="btn-group dropdown">
									<button type="button" class="btn dropdown-toggle"
										data-toggle="dropdown">
										<i class="fa fa-search"></i> Search
									</button>
									<ul
										class="dropdown-menu dropdown-menu-right dropdown-animation">
										<li>
											<form role="search" class="search-box">
												<div class="form-group has-feedback">
													<input type="text" class="form-control"
														placeholder="Search"> <i
														class="fa fa-search form-control-feedback"></i>
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
							<a href="index.html"><img id="logo"
								src="<%=basePath%>/static/projectstyle/images/logo_red.png"
								alt="iDea"></a>
						</div>

						<!-- name-and-slogan -->
						<div class="site-slogan">风险评估指标系统后台管理</div>

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
									<button type="button" class="navbar-toggle"
										data-toggle="collapse" data-target="#navbar-collapse-1">
										<span class="sr-only">Toggle navigation</span> <span
											class="icon-bar"></span> <span class="icon-bar"></span> <span
											class="icon-bar"></span>
									</button>
								</div>

								<!-- Collect the nav links, forms, and other content for toggling -->
								<div class="collapse navbar-collapse" id="navbar-collapse-1">
									<ul class="nav navbar-nav navbar-right">
										<li><a href="index.html" class="dropdown-toggle"
											data-toggle="ad_login">首页</a></li>
										<li class="dropdown"><a href="index.html"
											class="dropdown-toggle" data-toggle="dropdown">成果提供者管理</a>
											<ul class="dropdown-menu">
												<li><a href="index.html">增加提供者</a></li>
												<li><a href="index-2.html">查看提供者</a></li>
												<li><a href="index-3.html">编辑提供者</a></li>
												<li><a href="index-3.html">检索提供者</a></li>
											</ul></li>
										<li class="dropdown"><a href="shop-listing-3col.html"
											class="dropdown-toggle" data-toggle="dropdown">评估专家管理</a>
											<ul class="dropdown-menu">
												<li><a href="shop-listing-3col.html">增加专家</a></li>
												<li><a href="shop-listing-4col.html">查看专家</a></li>
												<li><a href="shop-listing-sidebar.html">编辑专家</a></li>
												<li><a href="index-3.html">检索提供者</a></li>
											</ul></li>
										<li class="dropdown"><a href="shop-listing-3col.html"
											class="dropdown-toggle" data-toggle="dropdown">成果项目管理</a>
											<ul class="dropdown-menu">
												<li><a href="shop-listing-3col.html">查看所有成果</a></li>
												<li><a href="shop-listing-4col.html">编辑成果</a></li>
												<li><a href="shop-listing-sidebar.html">查看所有项目</a></li>
												<li><a href="shop-product.html">编辑项目</a></li>
											</ul></li>
										<li class="dropdown active"><a
											href="blog-right-sidebar.html" class="dropdown-toggle"
											data-toggle="dropdown">指标管理</a>
											<ul class="dropdown-menu">
												<li><a href="blog-right-sidebar.html">增加指标</a></li>
												<li class="active"><a href="blog-left-sidebar.html">查看指标</a></li>
												<li><a href="blog-no-sidebar.html">编辑指标</a></li>
												<li><a href="blog-masonry.html">查询指标</a></li>
											</ul></li>
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
							<li><i class="fa fa-home pr-10"></i><a href="index.html">Home</a></li>
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
				<div class="col-md-3 col-sm-6">
					<div class="box-style-1">
						<h2 class="title">成果提供者</h2>
						<i class="fa fa-users"></i> <span class="stat-num counting"
							data-to="1125" data-speed="3000">${listNum_users[1]}</span>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="box-style-1">
						<h2 class="title">评审专家</h2>
						<i class="fa fa-users"></i> <span class="stat-num counting"
							data-to="1125" data-speed="3000">${listNum_users[2]}</span>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="box-style-1">
						<h2 class="title">游客</h2>
						<i class="fa fa-users"></i> <span class="stat-num counting"
							data-to="1125" data-speed="3000">10</span>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="box-style-1">
						<h2 class="title">项目投资人</h2>
						<i class="fa fa-users"></i> <span class="stat-num counting"
							data-to="1125" data-speed="3000">5</span>
					</div>
				</div>
				<div class="main col-md-9" style="width: 80%">

					<!-- page-title start -->
					<!-- ================ -->
					<!-- <h1 id="tabs" class="page-title">Tabs</h1> -->
					<br>
					<!-- page-title end -->

					<!-- Tabs start -->
					<!-- ============================================================================== -->
					<h2>后台图形化统计信息</h2>

					<!-- tabs start -->
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li class="active"><a href="#htab1" role="tab"
							data-toggle="tab"><i class="fa fa-home pr-5"></i>成果统计</a></li>
						<li class=""><a href="#htab2" role="tab" data-toggle="tab"><i
								class="fa fa-user pr-5"></i>项目统计</a></li>
						<li class=""><a href="#htab3" role="tab" data-toggle="tab"><i
								class="fa fa-envelope pr-5"></i>指标统计</a></li>
						<li class=""><a href="#htab4" role="tab" data-toggle="tab"><i
								class="fa fa-envelope pr-5"></i>用户统计</a></li>

					</ul>
					<!-- Tab panes -->
					<div class="tab-content">

						<div class="tab-pane fade active in" id="htab1">
							<h1 class="text-center">本系统成果统计饼状图</h1>
							<div class="space-bottom"></div>
							<div class="row">
								<div id="main" style="width: 600px; height: 400px;"></div>
								<input type="hidden" id="paperObj" value="1"> <input
									type="hidden" id="softObj" value="2"> <input
									type="hidden" id="patentObj" value="3">
								<script type="text/javascript">
									$(function() {
										var paperObj = document.getElementById(
												'paperObj').val();
										alert(paperObj);
										var softObj = document.getElementById(
												'softObj').val();
										var paperObj = document.getElementById(
												'patentObj').val();
										var patentObj = echarts.init(document
												.getElementById('main'));
									});
									</script>
								<script type="text/javascript">
									// 基于准备好的dom，初始化echarts实例
									var myChart = echarts.init(document
											.getElementById('main'));

									// 指定图表的配置项和数据
									option = {
										title : {
											text : '本系统成果统计饼状图',
											subtext : 'SICD风险投资评估管理系统',
											x : 'center'
										},
										tooltip : {
											trigger : 'item',
											formatter : "{a} <br/>{b} : {c} ({d}%)"
										},
										legend : {
											orient : 'vertical',
											left : 'left',
											data : [ '软件成果', '论文成果', '专利成果' ]
										},
										series : [ {
											name : '访问来源',
											type : 'pie',
											radius : '55%',
											center : [ '50%', '60%' ],
											data : [ {
												value : ${listNum_results[0]},
												name : '论文成果'
											}, {
												value : ${listNum_results[1]},
												name : '专利成果'
											}, {
												value : ${listNum_results[2]},
												name : '软件成果'
											}, ],
											itemStyle : {
												emphasis : {
													shadowBlur : 10,
													shadowOffsetX : 0,
													shadowColor : 'rgba(0, 0, 0, 0.5)'
												}
											}
										} ]
									};

									// 使用刚指定的配置项和数据显示图表。
									myChart.setOption(option);
								</script>

							</div>
							<!-- <a href="page-services.html" class="btn btn-default">Read
								more</a> -->
						</div>
						<div class="tab-pane fade" id="htab2">
							<h1 class="text-center">本系统产业化项目统计图</h1>
							<div class="space-bottom"></div>
							<div class="row">
								<div id="main1" style="width: 600px; height: 400px;"></div>
								<script type="text/javascript">
									// 基于准备好的dom，初始化echarts实例
									var myChart1 = echarts.init(document
											.getElementById('main1'));

									// 指定图表的配置项和数据
									//app.title = '堆叠柱状图';

									option1 = {
										color : [ '#3398DB' ],
										tooltip : {
											trigger : 'axis',
											axisPointer : { // 坐标轴指示器，坐标轴触发有效
												type : 'shadow' // 默认为直线，可选为：'line' | 'shadow'
											}
										},
										grid : {
											left : '3%',
											right : '4%',
											bottom : '3%',
											containLabel : true
										},
										xAxis : [ {
											type : 'category',
											data : [ '项目总量', '评审失败的项目', '产业化项目', '审核截止', '待审核' ],
											axisTick : {
												alignWithLabel : true
											}
										} ],
										yAxis : [ {
											type : 'value'
										} ],
										series : [ {
											name : '数量',
											type : 'bar',
											barWidth : '60%',
											data : [ ${listNum_projects[0]}, ${listNum_projects[1]}, 
											         ${listNum_projects[2]}, ${listNum_projects[3]},
											         ${listNum_projects[4]}]
										} ]
									};

									// 使用刚指定的配置项和数据显示图表。
									myChart1.setOption(option1);
								</script>
							</div>
							<!-- <a href="page-services.html" class="btn btn-default">Read
								more</a> -->
						</div>
						<div class="tab-pane fade" id="htab3">
							<h1 class="text-center">评估指标统计图</h1>
							<div class="space-bottom"></div>
							<div class="row">

								<div id="main2" style="width: 700px; height: 400px;"></div>
								<script type="text/javascript">
									// 路径配置
									require
											.config({
												paths : {
													echarts : 'http://echarts.baidu.com/build/dist'
												}
											});

									// 使用
									require([ 'echarts', 'echarts/chart/tree' // 使用柱状图就加载bar模块，按需加载
									], function(ec) {
										// 基于准备好的dom，初始化echarts图表
										var myChart2 = ec.init(document
												.getElementById('main2'));

										var option2 = {
											title : {
												text : '项目评估指标'
											},
											toolbox : {
												show : true,
												feature : {
													mark : {
														show : true
													},
													dataView : {
														show : true,
														readOnly : false
													},
													restore : {
														show : true
													},
													saveAsImage : {
														show : true
													}
												}
											},
											series : [ {
												name : '树图',
												type : 'tree',
												orient : 'horizontal', // vertical horizontal
												rootLocation : {
													x : 100,
													y : 230
												}, // 根节点位置  {x: 100, y: 'center'}
												nodePadding : 20,
												layerPadding : 200,
												hoverable : false,
												roam : true,
												symbolSize : 6,
												itemStyle : {
													normal : {
														color : '#4883b4',
														label : {
															show : true,
															position : 'right',
															formatter : "{b}",
															textStyle : {
																color : '#000',
																fontSize : 15
															}
														},
														lineStyle : {
															color : '#ccc',
															type : 'curve' // 'curve'|'broken'|'solid'|'dotted'|'dashed'

														}
													},
													emphasis : {
														color : '#4883b4',
														label : {
															show : false
														},
														borderWidth : 0
													}
												},
											
												data : [ {
													name : '项目',
													value : 6,
													children : [ {
														name : '${indexs[0]}',
														value : 4,
														children : [ {
															name : '影响因子1',
															value : 4
														}, {
															name : '影响因子2',
															value : 4
														}, {
															name : '影响因子3',
															value : 2
														}, {
															name : '影响因子4',
															value : 2
														}

														]
													}, {
														name : '${indexs[1]}',
														value : 4,
														children : [ {
															name : '影响因子5',
															value : 4
														}, {
															name : '影响因子6',
															value : 4
														} ]
													}, {
														name : '${indexs[2]}',
														value : 1,
														children : [ {
															name : '影响因子7',
															value : 4
														}, {
															name : '影响因子8',
															value : 4
														}, {
															name : '影响因子9',
															value : 2
														}, {
															name : '影响因子10',
															value : 2
														} ]
													}, {
														name : '${indexs[3]}',
														value : 1,
														children : [ {
															name : '影响因子11',
															value : 4
														}, {
															name : '影响因子12',
															value : 4
														}, {
															name : '影响因子13',
															value : 2
														}, {
															name : '影响因子14',
															value : 2
														} ]
													} ]
												} ]
											} ]
										};

										// 为echarts对象加载数据 
										myChart2.setOption(option2);
									});
								</script>

							</div>
							<!-- <a href="page-services.html" class="btn btn-default">Read
								more</a> -->
						</div>
						<div class="tab-pane fade" id="htab4">
							<h1 class="text-center">本系统用户角色饼状图</h1>
							<div class="space-bottom"></div>
							<div class="row">
								<div id="main3" style="width: 600px; height: 400px;"></div>
								<script type="text/javascript">
									// 基于准备好的dom，初始化echarts实例
									var myChart = echarts.init(document
											.getElementById('main3'));

									// 指定图表的配置项和数据
									option3 = {
										title : {
											text : '本系统用户角色饼状图',
											subtext : 'SICD风险投资评估管理系统',
											x : 'center'
										},
										tooltip : {
											trigger : 'item',
											formatter : "{a} <br/>{b} : {c} ({d}%)"
										},
										legend : {
											orient : 'vertical',
											left : 'left',
											data : [ '成果提供者', '评审专家', '普通游客' ]
										},
										series : [ {
											name : '访问来源',
											type : 'pie',
											radius : '55%',
											center : [ '50%', '60%' ],
											data : [ {
												value : 10,
												name : '游客'
											}, {
												value : ${listNum_users[1]},
												name : '评审专家'
											}, {
												value : ${listNum_users[2]},
												name : '成果提供者'
											}, ],
											itemStyle : {
												emphasis : {
													shadowBlur : 10,
													shadowOffsetX : 0,
													shadowColor : 'rgba(0, 0, 0, 0.5)'
												}
											}
										} ]
									};

									// 使用刚指定的配置项和数据显示图表。
									myChart.setOption(option3);
								</script>

							</div>
							<!-- <a href="page-services.html" class="btn btn-default">Read
								more</a> -->
						</div>
					</div>
					<!-- tabs end -->

					<div class="space"></div>


				</div>
				<!-- pills end -->

			</div>


		</div>
	</div>
	</section>
	<!-- main-container end -->


	<jsp:include page="/footer1.jsp" flush="true" />

</body>
</html>
