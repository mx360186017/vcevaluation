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
		<title>评估项目</title>
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
	<script>
function checkIndex(s){
	//String sname= "scord_index"+s;
	var score1=$("#scord_index" + s).val();
	var regscore1=/^[0-9]+([.]{1}[0-9]+){0,1}$/;
	if(score1==""){
		$("#vali_scord_index"+s).html("请输入评分");}
		else if(!regscore1.test(score1)){
			
			$("#vali_scord_index"+s).html("请输入数值");
			
		}else if(score1 > 10){
			$("#vali_scord_index"+s).html("请输入符合要求的数值");
		}
		else{
			$("#vali_scord_index"+s).html("");
			return true;
		}
		$("#vali_scord_index"+s).css("display","inline");
			$("#vali_scord_index"+s).css("color","red");
			$("#vali_scord_index"+s).css("font-size","16px");
			return false;
	}

function checkReason(a){
	var reason=$("#score_reason" + a).val();
	if(reason==""){
		$("#vali_scord_reason" + a).html("请输入原因");
	}else{
		$("#vali_scord_reason" + a).html("");
		return true;}
	$("#vali_scord_reason" + a).css("display","inline");
		$("#vali_scord_reason" + a).css("color","red");
		$("#vali_scord_reason" + a).css("font-size","16px");
		return false;
}

function validation(){
	if(checkIndex(1) && checkIndex(2)&& checkIndex(3) &&checkIndex(4) && checkReason(1)&& checkReason(2)
			&& checkReason(3)&& checkReason(4)){
		return true;
	}else{
		return false;
	}
}
function onclickli1(){
	document.getElementById("li1").setAttribute("class", "active") ;
	document.getElementById("li2").setAttribute("class", "") ;
	document.getElementById("li3").setAttribute("class", "") ;
	document.getElementById("li4").setAttribute("class", "") ;
	document.getElementById("li5").setAttribute("class", "") ;
	document.getElementById("li6").setAttribute("class", "") ;
}
function onclickli2(){
	document.getElementById("li1").setAttribute("class", "") ;
	document.getElementById("li2").setAttribute("class", "active") ;
	document.getElementById("li3").setAttribute("class", "") ;
	document.getElementById("li4").setAttribute("class", "") ;
	document.getElementById("li5").setAttribute("class", "") ;
	document.getElementById("li6").setAttribute("class", "") ;
}
function onclickli3(){
	document.getElementById("li1").setAttribute("class", "") ;
	document.getElementById("li2").setAttribute("class", "") ;
	document.getElementById("li3").setAttribute("class", "active") ;
	document.getElementById("li4").setAttribute("class", "") ;
	document.getElementById("li5").setAttribute("class", "") ;
	document.getElementById("li6").setAttribute("class", "") ;
}
function onclickli4(){
	document.getElementById("li1").setAttribute("class", "") ;
	document.getElementById("li2").setAttribute("class", "") ;
	document.getElementById("li3").setAttribute("class", "") ;
	document.getElementById("li4").setAttribute("class", "active") ;
	document.getElementById("li5").setAttribute("class", "") ;
	document.getElementById("li6").setAttribute("class", "") ;
}
function onclickli5(){
	document.getElementById("li1").setAttribute("class", "") ;
	document.getElementById("li2").setAttribute("class", "") ;
	document.getElementById("li3").setAttribute("class", "") ;
	document.getElementById("li4").setAttribute("class", "") ;
	document.getElementById("li5").setAttribute("class", "active") ;
	document.getElementById("li6").setAttribute("class", "") ;
}
function onclickli6(){
	document.getElementById("li1").setAttribute("class", "") ;
	document.getElementById("li2").setAttribute("class", "") ;
	document.getElementById("li3").setAttribute("class", "") ;
	document.getElementById("li4").setAttribute("class", "") ;
	document.getElementById("li5").setAttribute("class", "") ;
	document.getElementById("li6").setAttribute("class", "active") ;
}
</script>
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
								<li><i class="fa fa-home pr-10"></i><a href="/vcevaluation/toIndex">Home</a></li>
								<li class="active">评估项目</li>
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
							<h1 id="tabs" class="page-title">评估对象：${project.pro_name}</h1>
							<!-- page-title end -->
							
							<!-- 评估论文 -->
						
								<div class="space-bottom"></div>
								<form role="form" id="Evaform3"  action="evaluationProject" method="post"  onsubmit="return validation();">	
								<!-- pills start -->
								<div>
									<input type="hidden" id="pro_id" name="pro_id"
												value="${project.pro_id}" />
								</div>
								<div class="process">
									<!-- Nav tabs -->
									<ul class="nav nav-pills white space-top" role="tablist">
										<li id="li1"  class="active"><a href="#pill-pr-1" role="tab" data-toggle="tab" title="技术风险评估"><i class="fa fa-dot-circle-o pr-5"></i>技术风险评估性 </a></li>
										<li id="li2" ><a href="#pill-pr-2" role="tab" data-toggle="tab" title="资金风险评估"><i class="fa fa-dot-circle-o pr-5"></i> 资金风险评估</a></li>
										<li id="li3" ><a href="#pill-pr-3" role="tab" data-toggle="tab" title="社会风险评估"><i class="fa fa-dot-circle-o pr-5"></i> 社会风险评估</a></li>
										<li id="li4" ><a href="#pill-pr-4" role="tab" data-toggle="tab" title="市场风险评估"><i class="fa fa-dot-circle-o pr-5"></i> 市场风险评估</a></li>
										<li id="li5" ><a href="#pill-pr-5" role="tab" data-toggle="tab" title="工程设计方案风险"><i class="fa fa-dot-circle-o pr-5"></i>设计方案风险评估</a></li>
										<li id="li6" ><a href="#pill-pr-6" role="tab" data-toggle="tab" title="综合风险评估"><i class="fa fa-dot-circle-o pr-5"></i> 综合风险评估</a></li>
									</ul>
									<!-- Tab panes -->
									<div class="tab-content clear-style">
										<div class="tab-pane active" id="pill-pr-1">
											<h3>系统评估指标值仅供参考</h3>
											<p>项目技术风险评估由<a href="">技术设备支持</a>、<a href="">技术使用风险</a>和<a href="">开发团队因素</a>这三个因素作为估算因素</p>
											<table class="table table-bordered">
												<thead>
													<tr>
														<th>评估因素</th>
														<th>该项内容</th>
														<th>所占权重</th>
														<th>该项评估值</th>
													
													</tr>
												</thead>
												<tbody>
												<c:forEach items="${index1}" var="index1" begin="0" end="2">
												    <tr>
														<td>${index1.factor_name}</td>
														<td>${map1[index1.factor_id]}</td>
														<td>${index1.factor_weight}</td>
													    <td>${map[index1.factor_id]}</td>
													</tr>
												</c:forEach>
												    <tr>
												     <td colspan="2"></td>
														<td>该指标（先进性）加权估值为</td>
														<td>${a}</td>
													
										            </tr>
												</tbody>
												
											</table>
											
										<div>
											<input type="hidden" id="project_indexEva1" name="project_indexEva1"
												value="${a}" />
										</div>
											<input type="text" class="form-control" id="scord_index1" name="scord_index1" onblur="checkIndex(1)" placeholder="输入您的评分，不大于10的正整数">
											  <label id="vali_scord_index1" style="font-size:9px;display:none;"></label>
											</br>
											<input type="text" class="form-control" id="score_reason1" name="score_reason1" onblur="checkReason(1)"  placeholder="输入你的评分原因及简短意见">
											<label id="vali_scord_reason1" style="font-size:9px;display:none;"></label>
											 </br>
										    <button class="btn btn-white" href="#pill-pr-2" role="tab" data-toggle="tab" onclick="onclickli2()">下一步</button>
										</div>
										<div class="tab-pane" id="pill-pr-2">
										    <h3>系统评估指标值仅供参考</h3>
											<p>项目的资金风险评估由<a href="">贷款偿还能力</a>和<a href="">自筹占所需比</a>两个因素作为估算因素</p>
											<table class="table table-bordered">
												<thead>
													<tr>
														<th>评估因素</th>
														<th>该项内容</th>
														<th>所占权重</th>
														<th>该项评估值</th>
													
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${index2}" var="index2"  begin="3" end="4">
												       <tr>
														<td>${index2.factor_name}</td>
														<td>${map3[index2.factor_id]}</td>
														<td>${index2.factor_weight}</td>
													    <td>${map2[index2.factor_id]}</td>
													</tr>
												</c:forEach>
												    <tr>
												        <td colspan="2"></td>
														<td>该指标（先进性）加权估值为</td>
														<td>${b}</td>
										            </tr>
												</tbody>
											</table>
											<div>
											<input type="hidden" id="project_indexEva2" name="project_indexEva2"
												value="${b}" />
										    </div>
											<input type="text" class="form-control" id="scord_index2" name="scord_index2" onblur="checkIndex(2)" placeholder="输入您的评分，不大于10的正整数">
											<label id="vali_scord_index2" style="font-size:9px;display:none;"></label>
											</br>
											<input type="text" class="form-control" id="score_reason2" name="score_reason2" onblur="checkReason(2)" placeholder="输入你的评分原因及简短意见">
										    <label id="vali_scord_reason2" style="font-size:9px;display:none;"></label>
										    </br>
										    <button class="btn btn-white" href="#pill-pr-1" role="tab" data-toggle="tab" onclick="onclickli1()">上一步</button>
										    <button class="btn btn-white" href="#pill-pr-3" role="tab" data-toggle="tab" onclick="onclickli3()">下一步</button>
										</div>
										<div class="tab-pane" id="pill-pr-3">
										     <h3>系统评估指标值仅供参考</h3>
											<p>项目的社会风险评估由<a href="">是否有政策支持</a>这个因素作为估算因素</p>
											<table class="table table-bordered">
												<thead>
													<tr>
														<th>评估因素</th>
														<th>该项内容</th>
														<th>所占权重</th>
														<th>该项评估值</th>
													
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${index3}" var="index3" begin="5" end="5">
												       <tr>
														<td>${index3.factor_name}</td>
														<td>${map5[index3.factor_id]}</td>
														<td>${index3.factor_weight}</td>
													    <td>${map4[index3.factor_id]}</td>
													</tr>
												</c:forEach>
												    <tr>
												        <td colspan="2"></td>
														<td>该指标（先进性）加权估值为</td>
														<td>${c}</td>
										            </tr>
												</tbody>
											</table>
											<div>
											<input type="hidden" id="project_indexEva3" name="project_indexEva3"
												value="${c}" />
										    </div>
										   
										    <input type="text" class="form-control" id="scord_index3" name="scord_index3" onblur="checkIndex(3)" placeholder="输入您的评分，不大于10的正整数">
											<label id="vali_scord_index3" style="font-size:9px;display:none;"></label>
											</br>
											<input type="text" class="form-control" id="score_reason3" name="score_reason3" onblur="checkReason(3)" placeholder="输入你的评分原因及简短意见">
										    <label id="vali_scord_reason3" style="font-size:9px;display:none;"></label>
										    </br>
										    <button class="btn btn-white" href="#pill-pr-2" role="tab" data-toggle="tab" onclick="onclickli2()">上一步</button>
										    <button class="btn btn-white" href="#pill-pr-4" role="tab" data-toggle="tab" onclick="onclickli4()">下一步</button>
										</div>
										<div class="tab-pane" id="pill-pr-4">
											<h3>系统评估指标值仅供参考</h3>
											<p>项目的市场风险评估由<a href="">市场收益性</a>这个因素作为估算因素</p>
											<table class="table table-bordered">
												<thead>
													<tr>
														<th>评估因素</th>
														<th>该项内容</th>
														<th>所占权重</th>
														<th>该项评估值</th>
													
													</tr>
												</thead>
												<tbody>
													
												       <tr>
														<td>市场收益性</td>
														<td>${map7[24]}</td>
														<td>1.0</td>
													    <td>${d}</td>
													</tr>
												
												    <tr>
												        <td colspan="2"></td>
														<td>该指标（先进性）加权估值为</td>
														<td>${d}</td>
										            </tr>
												</tbody>
											</table>
											<div>
											<input type="hidden" id="project_indexEva4" name="project_indexEva4"
												value="${d}" />
										    </div>
											</br>
										    <input type="text" class="form-control" id="scord_index4" name="scord_index4" onblur="checkIndex(4)" placeholder="输入您的评分，不大于10的正整数">
											<label id="vali_scord_index4" style="font-size:9px;display:none;"></label>
											
											</br>
											<input type="text" class="form-control" id="score_reason4" name="score_reason4" onblur="checkReason(4)" placeholder="输入你的评分原因及简短意见">
											<label id="vali_scord_reason4" style="font-size:9px;display:none;"></label>
											</br>
											
											<button class="btn btn-white" href="#pill-pr-3" role="tab" data-toggle="tab" onclick="onclickli3()">上一步</button>
											<button class="btn btn-white" href="#pill-pr-5" role="tab" data-toggle="tab" onclick="onclickli5()">下一步</button>
										   
											</div>
											<div class="tab-pane" id="pill-pr-5">
											</br>
										    <input type="text" class="form-control" id="scord_index5" name="scord_index5" onblur="checkIndex(5)" placeholder="输入您的评分，不大于10的正整数">
											<label id="vali_scord_index5" style="font-size:9px;display:none;"></label>
											
											</br>
											<input type="text" class="form-control" id="score_reason5" name="score_reason5" onblur="checkReason(5)" placeholder="输入你的评分原因及简短意见">
											<label id="vali_scord_reason5" style="font-size:9px;display:none;"></label>
											</br>
											<button class="btn btn-white" href="#pill-pr-4" role="tab" data-toggle="tab" onclick="onclickli4()">上一步</button>
										    <button class="btn btn-white" href="#pill-pr-6" role="tab" data-toggle="tab" onclick="onclickli6()">下一步</button>
											
										
										   
											</div>
											<div class="tab-pane" id="pill-pr-6">
											</br>
										    <input type="text" class="form-control" id="scord_index6" name="scord_index6" onblur="checkIndex(6)" placeholder="输入您的评分，不大于10的正整数">
											<label id="vali_scord_index6" style="font-size:9px;display:none;"></label>
											
											</br>
											<input type="text" class="form-control" id="score_reason6" name="score_reason6" onblur="checkReason(6)" placeholder="输入你的评分原因及简短意见">
											<label id="vali_scord_reason6" style="font-size:9px;display:none;"></label>
											</br>
											
											<button class="btn btn-white" href="#pill-pr-5" role="tab" data-toggle="tab" onclick="onclickli5()">上一步</button>
											<button type="submit" class="btn btn-white" >提交评估</button>
										
										   
											</div>
										</div>
									</div>
									<!-- pills end -->
	                            </form>   
	                     	          
	                    
						
						  
					  </div>

						<!-- main end -->

				
					</div>
				</div>
			</section>
			<!-- main-container end -->

			<!-- section start -->
			<!-- ================ -->
			<div class="section gray-bg text-muted footer-top clearfix">
				<div class="container">
					<div class="row">
						<div class="col-md-6">
							<div class="owl-carousel clients">
								<div class="client">
									<a href="#"><img src="<%= basePath%>/static/projectstyle/images/client-1.png" alt=""></a>
								</div>
								<div class="client">
									<a href="#"><img src="<%= basePath%>/static/projectstyle/images/client-2.png" alt=""></a>
								</div>
								<div class="client">
									<a href="#"><img src="<%= basePath%>/static/projectstyle/images/client-3.png" alt=""></a>
								</div>
								<div class="client">
									<a href="#"><img src="<%= basePath%>/static/projectstyle/images/client-4.png" alt=""></a>
								</div>
								<div class="client">
									<a href="#"><img src="<%= basePath%>/static/projectstyle/images/client-5.png" alt=""></a>
								</div>
								<div class="client">
									<a href="#"><img src="<%= basePath%>/static/projectstyle/images/client-6.png" alt=""></a>
								</div>
								<div class="client">
									<a href="#"><img src="<%= basePath%>/static/projectstyle/images/client-7.png" alt=""></a>
								</div>
								<div class="client">
									<a href="#"><img src="<%= basePath%>/static/projectstyle/images/client-8.png" alt=""></a>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<blockquote class="inline">
								<p class="margin-clear">Design is not just what it looks like and feels like. Design is how it works.</p>	
								<footer><cite title="Source Title">Steve Jobs </cite></footer>
							</blockquote>
						</div>
					</div>
				</div>
			</div>
			<!-- section end -->

			 <jsp:include page="/footer1.jsp" flush="true"/>
	</body>
</html>
