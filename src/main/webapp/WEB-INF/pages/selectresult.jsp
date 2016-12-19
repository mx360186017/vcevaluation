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
								<li><a href="/vcevaluation/selectResult">查询成果</a></li>
								<li class="active">成果展示</li>
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
				 
					<h3 class="hdg" style="font-family:	\5FAE\8F6F\96C5\9ED1">成果查询</h3>
				
					<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
						<ul id="myTab" class="nav nav-tabs" role="tablist">
							<li role="presentation" ><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-

controls="home" aria-expanded="true">查看全部成果</a></li>
							<li role="presentation"><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-

controls="profile">查看评估已截止成果</a></li>
                            <li role="presentation" class="active"><a href="#profile1" role="tab" id="profile1-tab" data-toggle="tab" aria-

controls="profile1">查看待评估成果</a></li>
							
							
							<li role="presentation" class="dropdown">
								<a href="#" id="myTabDrop1" class="dropdown-toggle" data-toggle="dropdown" aria-controls="myTabDrop1-

contents">根据成果类型查询</a>
								<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1" id="myTabDrop1-contents">
									<li><a href="#dropdown1" tabindex="-1" role="tab" id="dropdown1-tab" data-toggle="tab" aria-

controls="dropdown1">查看论文</a></li>
									<li><a href="#dropdown2" tabindex="-1" role="tab" id="dropdown2-tab" data-toggle="tab" aria-

controls="dropdown2">查看专利</a></li>
                                    <li><a href="#dropdown3" tabindex="-1" role="tab" id="dropdown3-tab" data-toggle="tab" aria-

controls="dropdown3">查看软件</a></li>
								</ul>
							</li>
						</ul>
						<div id="myTabContent" class="tab-content">
							<div role="tabpanel" class="tab-pane fade" id="home" aria-labelledby="home-tab">
								<table class="table table-hover">
									<thead>
										<tr>
		                                    <th>成果类型</th>
		                                    <th>成果名称</th>
		                                    <th>成果提供者</th>
		                                    <th>成果提交时间</th>
		                                    <th>评估状态</th>
		                                    <th>评估次数</th>
		                                    <th>评估均值</th>
		                                    <th>评估截止日期</th>
		                                    <th>更多</th>
	                                    </tr>
									</thead>
									<tbody>
										<c:forEach items="${list}" var="lar" begin="0" end="5">
											<tr>
											   <c:if test="${lar.res_type==1}">
												<td>论文</td>
												</c:if>
												<c:if test="${lar.res_type==2}">
												<td>专利</td>
												</c:if>
												<c:if test="${lar.res_type==3}">
												<td>软件</td>
												</c:if>
												<td>${ lar.res_name}</td>
												<td>${ lar.res_provider}</td>
												<td>${ lar.res_protime}</td>
												<c:if test="${lar.res_flag==1}">
												<td>待评估</td>
												</c:if>
												<c:if test="${lar.res_flag==2}">
												<td>评估截至</td>
												</c:if>
												<td>${ lar.res_times}</td>
												<td>${ lar.res_evalue}</td>
												<td>${ lar.res_eva_deadline}</td>
												<td><a class="" href="/vcevaluation/resultItem?res_id=${lar.res_id}">查看详情</a></td>
											</tr>
									    </c:forEach>
									</tbody>
							    </table>
                                 <div style="margin:0px auto;text-align:right;">
                                 <input type="button" onclick="window.location.href='/vcevaluation/selectAllResult?pageNum=1'" class="btn btn-white" value="更 多">
                                 <!--  <a href="/vcevaluation/selectPaper?pageNum=1"> 更多</a>		
                                  <input type="btn btn-white" class="btn btn-white" href="/vcevaluation/selectAllResult?pageNum=1" value="更多">		 -->
                                  </div>						
                                  	</div>
							<div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">
								<table class="table table-striped">
									<thead>
										<tr>
		                                    <th>成果类型</th>
		                                    <th>成果名称</th>
		                                    <th>成果提供者</th>
		                                    <th>成果提交时间</th>
		                                    <th>评估状态</th>
		                                    <th>评估次数</th>
		                                    <th>评估均值</th>
		                                    <th>评估截止日期</th>
		                                    <th>评估结果</th>
		                                    <th>更多</th>
	                                    </tr>
									</thead>
									<tbody>
										<c:forEach items="${list5}" var="lanr" begin="0" end="5">
											<tr>
											   <c:if test="${lanr.res_type==1}">
												<td>论文</td>
												</c:if>
												<c:if test="${lanr.res_type==2}">
												<td>专利</td>
												</c:if>
												<c:if test="${lanr.res_type==3}">
												<td>软件</td>
												</c:if>
												<td>${ lanr.res_name}</td>
												<td>${ lanr.res_provider}</td>
												<td>${ lanr.res_protime}</td>
												<c:if test="${lanr.res_flag==1}">
												<td>待评估</td>
												</c:if>
												<c:if test="${lanr.res_flag==2}">
												<td>评估截至</td>
												</c:if>
												<td>${ lanr.res_times}</td>
												<td>${ lanr.res_evalue}</td>
												<td>${ lanr.res_eva_deadline}</td>
												<c:if test="${lanr.res_evalue >= 7}">
                                    	        <td ><i class="fa fa-check"></i></td>                                    
                                                </c:if>
                                                <c:if test="${lanr.res_evalue < 7}">
	                                            <td ><i class="fa fa-close"></i></td>
                                                </c:if>
												<td><a class="" href="/vcevaluation/resultItem?res_id=${lanr.res_id}">查看详情</a></td>
											</tr>
									    </c:forEach>
									    
									</tbody>
							
					             </table>
					              <div style="margin:0px auto;text-align:right;">
                                  <input type="button" onclick="window.location.href='/vcevaluation/selectEvaResult?pageNum=1'" class="btn btn-white" value="更 多">
          
                                  </div>
						 </div>
							
						<div role="tabpanel" class="tab-pane fade in active" id="profile1" aria-labelledby="profile1-tab">
						<table class="table table-striped">
								<thead>
										<tr>
		                                    <th>成果类型</th>
		                                    <th>成果名称</th>
		                                    <th>成果提供者</th>
		                                    <th>成果提交时间</th>
		                                    <th>评估状态</th>
		                                    <th>评估次数</th>
		                                    <th>评估均值</th>
		                                    <th>评估截止日期</th>
		                                    <th>更多</th>
	                                    </tr>
									</thead>
									<tbody>
										<c:forEach items="${list4}" var="laer" begin="0" end="5">
											<tr>
											   <c:if test="${laer.res_type==1}">
												<td>论文</td>
												</c:if>
												<c:if test="${laer.res_type==2}">
												<td>专利</td>
												</c:if>
												<c:if test="${laer.res_type==3}">
												<td>软件</td>
												</c:if>
												<td>${ laer.res_name}</td>
												<td>${ laer.res_provider}</td>
												<td>${ laer.res_protime}</td>
												<c:if test="${laer.res_flag==1}">
												<td>待评估</td>
												</c:if>
												<c:if test="${laer.res_flag==2}">
												<td>评估截至</td>
												</c:if>
												<td>${ laer.res_times}</td>
												<td>${ laer.res_evalue}</td>
												<td>${ laer.res_eva_deadline}</td>
												<td><a class="" href="/vcevaluation/resultItem?res_id=${laer.res_id}">查看详情</a></td>
											</tr>
											
									    </c:forEach>
									    
									</tbody>
								</table>
								<div style="margin:0px auto;text-align:right;">
								<input type="button" onclick="window.location.href='/vcevaluation/selectNoEvaResult?pageNum=1'" class="btn btn-white" value="更 多">
                                  </div>
							</div>
						    
						    <div role="tabpanel" class="tab-pane fade" id="dropdown1" aria-labelledby="dropdown1-tab">
								<table class="table">
									<thead>
										<tr>
		                                    <th>成果名称</th>
		                                    <th>论文提供者</th>
		                                    <th>论文提交时间</th>
		                                    <th>评估状态</th>
		                                    <th>评估次数</th>
		                                    <th>评估均值</th>
		                                    <th>评估截止日期</th>
		                                    <th>更多</th>
	                                    </tr>
									</thead>
									<tbody>
										<c:forEach items="${list1}" var="lpar" begin="0" end="5">
											<tr>
											 
												<td>${ lpar.res_name}</td>
												<td>${ lpar.res_provider}</td>
												<td>${ lpar.res_protime}</td>
												<c:if test="${lpar.res_flag==1}">
												<td>待评估</td>
												</c:if>
												<c:if test="${lpar.res_flag==2}">
												<td>评估截至</td>
												</c:if>
												<td>${ lpar.res_times}</td>
												<td>${ lpar.res_evalue}</td>
												<td>${ lpar.res_eva_deadline}</td>
												<td><a class="" href="/vcevaluation/resultItem?res_id=${lpar.res_id}">查看详情</a></td>
											</tr>
									    </c:forEach>
									</tbody>
								</table>
								<div style="margin:0px auto;text-align:right;">
                                  <input type="button" onclick="window.location.href='/vcevaluation/selectPaper?pageNum=1'" class="btn btn-white" value="更 多">
                                  </div>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="dropdown2" aria-labelledby="dropdown2-tab">
								<table class="table">
									<thead>
										<tr>
		                                    <th>成果名称</th>
		                                    <th>专利提供者</th>
		                                    <th>专利提交时间</th>
		                                    <th>评估状态</th>
		                                    <th>评估次数</th>
		                                    <th>评估均值</th>
		                                    <th>评估截止日期</th>
		                                    <th>更多</th>
	                                    </tr>
									</thead>
									<tbody>
										<c:forEach items="${list2}" var="lpat" begin="0" end="5">
											<tr>
											 
												<td>${ lpat.res_name}</td>
												<td>${ lpat.res_provider}</td>
												<td>${ lpat.res_protime}</td>
												<c:if test="${lpat.res_flag==1}">
												<td>待评估</td>
												</c:if>
												<c:if test="${lpat.res_flag==2}">
												<td>评估截至</td>
												</c:if>
												<td>${ lpat.res_times}</td>
												<td>${ lpat.res_evalue}</td>
												<td>${ lpat.res_eva_deadline}</td>
												<td><a class="" href="/vcevaluation/resultItem?res_id=${lpat.res_id}">查看详情</a></td>
											</tr>
									    </c:forEach>
									</tbody>
								</table>
								<div style="margin:0px auto;text-align:right;">
                                  <input type="button" onclick="window.location.href='/vcevaluation/selectPatent?pageNum=1'" class="btn btn-white" value="更 多">
                                  </div>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="dropdown3" aria-labelledby="dropdown3-tab">
								<table class="table table-striped">
									<thead>
										<tr>
		                                    <th>成果名称</th>
		                                    <th>软件提供者</th>
		                                    <th>软件提交时间</th>
		                                    <th>评估状态</th>
		                                    <th>评估次数</th>
		                                    <th>评估均值</th>
		                                    <th>评估截止日期</th>
		                                    <th>更多</th>
	                                    </tr>
									</thead>
									<tbody>
										<c:forEach items="${list3}" var="ls" begin="0" end="5">
											<tr>
												<td>${ ls.res_name}</td>
												<td>${ ls.res_provider}</td>
												<td>${ ls.res_protime}</td>
												<c:if test="${ls.res_flag==1}">
												<td>待评估</td>
												</c:if>
												<c:if test="${ls.res_flag==2}">
												<td>评估截至</td>
												</c:if>
												<td>${ ls.res_times}</td>
												<td>${ ls.res_evalue}</td>
												<td>${ ls.res_eva_deadline}</td>
												<td><a class="" href="/vcevaluation/resultItem?res_id=${ls.res_id}">查看详情</a></td>
											</tr>
									    </c:forEach>
									</tbody>
								</table>
								<div style="margin:0px auto;text-align:right;">
                                  <input type="button" onclick="window.location.href='/vcevaluation/selectSoftware?pageNum=1'" class="btn btn-white" value="更 多">
                                 		
                                  </div>
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