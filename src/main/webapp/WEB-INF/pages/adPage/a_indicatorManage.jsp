<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
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

<jsp:include page="/head.jsp" flush="true" />
<link href="<%=basePath%>/static/adStyle/css/tree.css" rel="stylesheet">
</head>

<!-- body classes: 
			"boxed": boxed layout mode e.g. <body class="boxed">
			"pattern-1 ... pattern-9": background patterns for boxed layout mode e.g. <body class="boxed pattern-1"> 
	-->
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
											data-toggle="dropdown">首页</a></li>
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

				<!-- sidebar start -->
				<aside class="col-md-3">
				<div class="sidebar">
					<div class="block clearfix">
						<h3 class="title">后台管理菜单</h3>
						<div class="separator"></div>
						<nav>
						<ul class="nav nav-pills nav-stacked">
							<li><a href="index.html">首页</a></li>
							<li class="active"><a href="blog-right-sidebar.html">管理成果提供者</a></li>
							<li><a href="portfolio-3col.html">管理评审专家</a></li>
							<li><a href="page-about.html">管理成果</a></li>
							<li><a href="page-about.html">管理项目</a></li>
							<li><a href="page-contact.html">管理指标</a></li>
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
					<div class="container">
						<section id="main_content">
						<h3>
							<span>评估指标管理</span>
						</h3>
						<div>
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target="#myModal">添加指标</button>
							<button type="button" id="deleteIndicator"
								onclick="deleteIndicator()" class="btn btn-primary">删除指标</button>
							<!-- Modal -->
							<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
								aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">
												<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
											</button>
											<h4 class="modal-title" id="myModalLabel">新增评估指标</h4>
										</div>
										<div class="modal-body">
											<form role="form" action="/vcevaluation/addIndicator">
												<div class="form-group">
													<label for="exampleInputEmail1">指标名称:</label> <input
														type="text" class="form-control" name="index_name"
														id="index_name" placeholder="请输入指标名称...">
												</div>
												<div class="form-group">
													<label for="exampleInputPassword1">指标权重:</label> <input
														type="text" class="form-control" name="index_weight"
														id="index_weight" placeholder="请输入指标权重...">
												</div>
												<!--<div class="form-group">-->
												<!--<label for="exampleInputFile">File input</label>-->
												<!--<input type="file" id="exampleInputFile">-->
												<!--<p class="help-block">Example block-level help text here.</p>-->
												<!--</div>-->
												<div class="radio" name="assessDatafather">
													<label> <input type="radio" id="inlineRadio1"
														name="option" value="1">一级指标
													</label> <label> <input type="radio" id="inlineRadio2"
														name="option" value="2" checked="checked">二级指标
													</label>
												</div>
												<div id="selectFather" class="form-group">
													<label for="selectFather">父指标:</label> <select
														class="form-control" id="selectFather1"
														name="optionFather">
														<c:forEach items="${indexs}" var="a">
															<option value="${a.index_id}">${a.index_name}</option>
														</c:forEach>
													</select>
												</div>
												<button type="submit" class="btn btn-default"
													onclick="check()">提交</button>
												<button type="button" class="btn btn-default"
													data-dismiss="modal">关闭</button>
											</form>
										</div>
									</div>
								</div>
							</div>

							<!-- Modal -->

							<!-- Modal -->
							<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
								aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">
												<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
											</button>
											<h4 class="modal-title" id="myModalLabel1">编辑评估指标</h4>
										</div>
										<div class="modal-body">
											<form role="form" action="/vcevaluation/editIndicator1">
											<input type="hidden" id="index_Id1" name="index_id1" value="">
												<div class="form-group">
													<label for="exampleInputEmail1">指标名称:</label> <input
														type="text" class="form-control" name="index_name1"
														id="index_name1" placeholder="请输入指标名称...">
												</div>
												<div class="form-group">
													<label for="exampleInputPassword1">指标权重:</label> <input
														type="text" class="form-control" name="index_weight1"
														id="index_weight1" placeholder="请输入指标权重...">
												</div>
												<!--<div class="form-group">-->
												<!--<label for="exampleInputFile">File input</label>-->
												<!--<input type="file" id="exampleInputFile">-->
												<!--<p class="help-block">Example block-level help text here.</p>-->
												<!--</div>-->
												<!-- <div class="radio" name="assessDatafather">
										<label > <input type="radio"
											id="inlineRadio1" name="option" value="1">一级指标
										</label> <label > <input
											type="radio" id="inlineRadio2" name="option"
											value="2">二级指标
										</label>
									</div> -->
												<%-- <div id="selectFather" class="form-group">
										<label for="selectFather">父指标:</label> 
										<select class="form-control" id="selectFather1" name="optionFather">
											<c:forEach items="${indexs}" var="a">
												<option value="${a.index_id}">${a.index_name}</option>
											</c:forEach>
										</select>
									</div> --%>
												<button type="submit" class="btn btn-default"
													onclick="check()">提交</button>
												<button type="button" class="btn btn-default"
													data-dismiss="modal">关闭</button>
											</form>
										</div>
									</div>
								</div>
							</div>


							<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
								aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">
												<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
											</button>
											<h4 class="modal-title" id="myModalLabel2">编辑评估指标</h4>
										</div>
										<div class="modal-body">
											<form role="form" action="/vcevaluation/editIndicator2">
												<div class="form-group">
													<label for="exampleInputEmail1">指标名称:</label> <input
														type="text" class="form-control" name="index_name2"
														id="index_name2" placeholder="请输入指标名称...">
												</div>
												<div class="form-group">
													<label for="exampleInputPassword1">指标权重:</label> <input
														type="text" class="form-control" name="index_weight2"
														id="index_weight2" placeholder="请输入指标权重...">
														<input type="hidden" id="indexId2" value="">
												</div>
												<!--<div class="form-group">-->
												<!--<label for="exampleInputFile">File input</label>-->
												<!--<input type="file" id="exampleInputFile">-->
												<!--<p class="help-block">Example block-level help text here.</p>-->
												<!--</div>-->
												<!-- <div class="radio" name="assessDatafather">
										<label > <input type="radio"
											id="inlineRadio1" name="option" value="1">一级指标
										</label> <label > <input
											type="radio" id="inlineRadio2" name="option"
											value="2">二级指标
										</label>
									</div> -->
									            <input type="hidden" id="indexCId" name="index_id2" value="">
												<%-- <div id="selectFather2" class="form-group">
													<label for="selectFather">父指标:</label> <select
														class="form-control" id="selectFather2"
														name="optionFather2">
														<c:forEach items="${indexs}" var="a">
															<option value="${a.index_id}">${a.index_name}</option>
														</c:forEach>
													</select>
												</div> --%>
												<button type="submit" class="btn btn-default"
													onclick="check()">提交</button>
												<button type="button" class="btn btn-default"
													data-dismiss="modal">关闭</button>
											</form>
										</div>
									</div>
								</div>
							</div>

							<!-- Modal -->

							<!--<button type="button" class="btn btn-primary">Primary</button>-->
						</div>
						<form action="" style="width: 60%">
							<c:forEach items="${indexs}" var="index" varStatus="status">
								<ul
									style="border: 0px; background-color: white; list-style-type: none"
									class="sTree2  listsClass" id="sTree2">
									<li id="item_${status.index+1}" class="item_a"
										style="list-style-type: none" data-module="a">
										<div>

											<input type="checkbox" id="checkFather_${status.index+1}"
												class="checkFather" name="checkBox">
											${index.index_name}(${index.index_remark}%) <input
												type="hidden" id="indexName${status.index+1}"
												value="${index.index_name}"> <input type="hidden"
												id="indexWeight${status.index+1}"
												value="${index.index_remark}%"> <input type="hidden"
												id="indexId${status.index+1}" value="${index.index_id}">
											<button
												style="background: transparent; color: red; border: 0px; font-size: 16px; padding: 0px"
												type="button" class="btn btn-primary btn-sm"
												data-toggle="modal" data-target="#myModal1"
												id="editFather${status.index+1}">编辑指标</button>
											<!--  <input
									style="float: right; text-align: center; width: auto; margin-top: -0.5%"
									type="text" value="" name="assessDataFatherValue" /> -->
										</div>
										<ul style="list-style-type: none" class="">
											<c:forEach items="${factors}" var="factor" varStatus="status">

												<c:if test="${factor.factor_index_id == index.index_id}">
													<li style="list-style-type: none"
														id="subitem_${status.index+1}" data-module="b">
														<div>
															<input type="checkbox" id="checkChild_${status.index+1}"
																name="checkBox1"> ${factor.factor_name}
															(${factor.factor_weight}%) <input type="hidden"
																id="indexNameC${status.index+1}"
																value="${factor.factor_name}"> <input
																type="hidden" id="indexWeightC${status.index+1}"
																value="${factor.factor_weight}%"> <input
																type="hidden" id="indexIdC${status.index+1}"
																value="${factor.factor_id}">
																<input
																type="hidden" id="indexIdFC${status.index+1}"
																value="${factor.factor_index_id}">
															<button
																style="background: transparent; color: red; border: 0px; font-size: 14px; padding: 0px"
																type="button" class="btn btn-primary btn-sm"
																data-toggle="modal" data-target="#myModal2"
																id="editChild${status.index+1}">编辑指标</button>
														</div>
													</li>
												</c:if>

											</c:forEach>
										</ul>
									</li>
								</ul>
							</c:forEach>
							<button type="submit" class="btn btn-default">提交</button>
						</form>
						</section>
						<script type="text/javascript">
							//                alert(111);
							var checkBox1 = document
									.getElementById('inlineCheckbox1');
							var checkBox2 = document
									.getElementById('inlineCheckbox2');
							function check() {

								if (checkBox1.checked) {
									alert("指标是一级指标");

								} else if (checkBox2.checked) {
									alert("指标是二级指标");

								} else {
									alert("提示：您没有选择指标类型！！！");
								}

							}
						</script>
						<script type="text/javascript">
							function deleteIndicator() {
								for (var i = 1; i < 4; i++) {
									var checkObj = $('#checkFather_' + i);
									var Obj = $('#item_' + i);
									if (checkObj[0].checked) {
										Obj.hide();
									} else {
										Obj.show();
									}
								}
								for (var j = 1; j < 5; j++) {
									var checkChild = $('#checkChild_' + j);
									var subitem = $('#subitem_' + j);
									if (checkChild[0].checked) {
										subitem.hide();
									} else {
										subitem.show();
									}
								}
							}
						</script>

					</div>

					<ul class="pagination">
						<li><a href="#">«</a></li>
						<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">»</a></li>
					</ul>
					<!-- pagination end -->

				</div>
				<!-- main end -->

			</div>
		</div>
		</section>
		<!-- main-container end -->
		<!-- <script type="text/javascript">
		var  a = {};
		     function test1(){
		    	 var test1 = document.getElementById('editFather'${index+1});
		     }
		</script> -->
		<script type="text/javascript">
		    var i = 1;
			function editFatherIndicator() {				
				for (i = 1; i < 13; i++) {
					//alert(document.getElementById('editFather' + i).id);
					var test1 = document.getElementById('editFather' + i).onclick = function() {
						//alert(i);
						var editFather =this.id;
						//alert(editFather);

						var editFatherNum = editFather.replace(/[^0-9]/ig, "");
						var obj1 = "indexName" + "" + editFatherNum;
						var obj2 = "indexWeight" + "" + editFatherNum;
						var obj3 = "indexId"+""+editFatherNum;
						var indexName = document.getElementById(obj1).value;
						var indexWeight = document.getElementById(obj2).value;
						var indexId = document
								.getElementById(obj3).value;
						var index_weight1 = document
						.getElementById('index_name1');
						var index_weight1 = document
								.getElementById('index_weight1');
						var index_Id1 = document
						.getElementById('index_Id1');
						index_name1.value = indexName;
						index_weight1.value = (indexWeight.replace("%", ""))*0.01;
						index_Id1.value = indexId;
					}

				}
			}
			
			 function editChildIndicator() {
				for (var j = 1; j < 119; j++) {
					var test2 = document.getElementById('editChild' + j).onclick = function(){
					var editChild = this.id;
					
					//alert(editFather);
					var editChildNum = editChild.replace(/[^0-9]/ig, "");
					var obj4 = "indexNameC" + "" + editChildNum;
					//alert(obj4);
					var obj5 = "indexWeightC" + "" + editChildNum;
					var obj6 = "indexIdC"+""+editChildNum;
					
					//var obj7 = "indexIdfC"+""+editChildNum;
					var indexNameC = document.getElementById(obj4).value;
					
					var indexWeightC = document.getElementById(obj5).value;
					
					var indexIdC = document.getElementById(obj6).value;
					
					//var indexIdFC = document.getElementById(obj7).value;
					var index_name2 = document.getElementById('index_name2');
					var index_weight2 = document
							.getElementById('index_weight2');
					var indexCId = document
					.getElementById('indexCId');
					index_name2.value = indexNameC;
					index_weight2.value = (indexWeightC.replace("%", ""))*0.01;
					indexCId.value=indexIdC;
				}
			}
			}			
			 window.onload = function(){
				 editFatherIndicator();
				 editChildIndicator();				
				}
		</script>

		<jsp:include page="/footer1.jsp" flush="true" />
</body>
</html>
