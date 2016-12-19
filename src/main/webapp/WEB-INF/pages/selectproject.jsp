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
<title>查询成果</title>
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
								<li href="/vcevaluation/selectAllProject">查询项目</li>
								<li class="active">项目展示</li>
							</ol>
						</div>
					</div>
				</div>
			</div>
			<!-- page-intro end -->
<!-- typography page -->
<div class="typography">

			<!-- container-wrap -->
			<div class="container">
				<div class="grid_3 grid_5">
				 
					<h3 class="hdg" style="font-family:	\5FAE\8F6F\96C5\9ED1">项目查询</h3>
				
					<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
						<ul id="myTab" class="nav nav-tabs" role="tablist">
							<li role="presentation" ><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-

controls="home" aria-expanded="true">查看全部项目</a></li>
							<li role="presentation"><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-

controls="profile">查看评估已截止项目</a></li>
                            <li role="presentation" class="active"><a href="#profile1" role="tab" id="profile1-tab" data-toggle="tab" aria-

controls="profile1">查看待评估项目</a></li>
							
						</ul>
						<div id="myTabContent" class="tab-content">
							<div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
								<table class="table table-hover">
									<thead>
										<tr>
		                                    
		                                    <th>项目名称</th>
		                                    <th>项目创建者</th>
		                                    <th>项目提交时间</th>
		                                    <th>项目资金</th>
		                                    <th>评估次数</th>
		                                    <th>评估均值</th>
		                                    <th>评估截止日期</th>
		                                    <th>更多</th>
	                                    </tr>
									</thead>
									<tbody>
										<c:forEach items="${allpro}" var="allpro">
											<tr>
												
												<td>${ allpro.pro_name}</td>
												<td>${ allpro.pro_creater}</td>
												<td>${ allpro.pro_protime}</td>
												<c:if test="${allpro.pro_flag==1}">
												<td>待评估</td>
												</c:if>
												<c:if test="${allpro.pro_flag==2}">
												<td>评估截至</td>
												</c:if>
												<td>${ allpro.pro_times}</td>
												<td>${ allpro.pro_evalue}</td>
												<td>${ allpro.pro_eva_deadline}</td>
												<td><a class="" href="/vcevaluation/projectItem?pro_id=${allpro.pro_id}">查看详情</a></td>
											</tr>
									    </c:forEach>
									</tbody>
							    </table>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">
								<table class="table table-striped">
									<thead>
											<tr>
		                                   
		                                    <th>项目名称</th>
		                                    <th>项目创建者</th>
		                                    <th>项目提交时间</th>
		                                    <th>项目资金</th>
		                                    <th>评估次数</th>
		                                    <th>评估均值</th>
		                                    <th>评估截止日期</th>
		                                    <th>评估结果</th>
		                                    <th>更多</th>
	                                    </tr>
									</thead>
									<tbody>
										<c:forEach items="${evapro}" var="evapro">
											<tr>
											
												<td>${ evapro.pro_name}</td>
												<td>${ evapro.pro_creater}</td>
												<td>${ evapro.pro_protime}</td>
												<c:if test="${evapro.pro_flag==1}">
												<td>待评估</td>
												</c:if>
												<c:if test="${evapro.pro_flag==2}">
												<td>评估截至</td>
												</c:if>
												<td>${ evapro.pro_times}</td>
												<td>${ evapro.pro_evalue}</td>
												<td>${ evapro.pro_eva_deadline}</td>
												<c:if test="${evapro.pro_evalue >= 8}">
                                    	        <td ><i class="fa fa-check"></i></td>                                    
                                                </c:if>
                                                <c:if test="${evapro.pro_evalue < 8}">
	                                            <td ><i class="fa fa-close"></i></td>
                                                </c:if>
												<td><a class="" href="/vcevaluation/projectItem?pro_id=${evapro.pro_id}">查看详情</a></td>
											</tr>
									    </c:forEach>
									</tbody>
					             </table>
						 </div>
							
						<div role="tabpanel" class="tab-pane fade" id="profile1" aria-labelledby="profile1-tab">
						<table class="table table-striped">
								<thead>
											<tr>
		                                  
		                                    <th>项目名称</th>
		                                    <th>项目创建者</th>
		                                    <th>项目提交时间</th>
		                                    <th>项目资金</th>
		                                    <th>评估次数</th>
		                                    <th>评估均值</th>
		                                    <th>评估截止日期</th>
		                                    <th>更多</th>
	                                    </tr>
									</thead>
									<tbody>
										<c:forEach items="${noevapro}" var="noevapro">
											<tr>
											
												<td>${ noevapro.pro_name}</td>
												<td>${ noevapro.pro_creater}</td>
												<td>${ noevapro.pro_protime}</td>
												<c:if test="${noevapro.pro_flag==1}">
												<td>待评估</td>
												</c:if>
												<c:if test="${noevapro.pro_flag==2}">
												<td>评估截至</td>
												</c:if>
												<td>${ noevapro.pro_times}</td>
												<td>${ noevapro.pro_evalue}</td>
												<td>${ noevapro.pro_eva_deadline}</td>
												<td><a class="" href="/vcevaluation/projectItem?pro_id=${noevapro.pro_id}">查看详情</a></td>
											</tr>
									    </c:forEach>
									</tbody>
								</table>
							</div>
							
							</div>
						</div>
					</div>
				
				<br>
				<br>
				<br>
				<br>
			</div>
			<!-- //container-wrap -->
	</div>
	<!-- //typography -->
	
<!-- footer section -->
<jsp:include page="/footer1.jsp" flush="true"/>
<!-- /footer section -->

</body>
</html>