<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
	response.setHeader("Content-Range", "bytes 0-800/801");
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>精细化评估方案</title>
<meta name="description"
	content="iDea a Bootstrap-based, Responsive HTML5 Template">
<meta name="author" content="htmlcoder.me">

<!-- Mobile Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="/head.jsp" flush="true" />

</head>

<body>
	<jsp:include page="/header1.jsp" flush="true" />

	<!-- contact section -->
	<section class="contact-w3ls">

	<div class="container">
		</br>
		<div class="space-bottom"></div>
		<form id="form3"  role="form" action="/vcevaluation/evaluationProDetail" method="post" >
		<h2>Vertical Tabs</h2>
		<!-- Tabs start -->
		<!-- ================ -->
		<div class="vertical">
			<!-- Nav tabs -->
			<ul class="nav nav-tabs" role="tablist">

				<c:forEach items="${indexs}" var="index" varStatus="status">
					<li><a id="tab${status.index+1}" href="#vtab${status.index+1}"
						role="tab" data-toggle="tab"><i class="fa fa-magic pr-10"></i>
							${index.index_name}</a></li>
					<%-- <c:forEach items="${factors}" var="factor" varStatus="status">
									<c:if test="${factor.factor_index_id == index.index_id}">
									<c:set var="salary"  value="${factors}"/>
									<c:out value="${salary}"/>
									<input type="hidden" id="indexName${status.index+1}" value="${factor.factor_name}">
									<input type="hidden" id="indexWeight${status.index+1}" value="${factor.factor_weight}%">
									</c:if>
									</c:forEach> --%>
				</c:forEach>
			</ul>
			<!-- Tab panes -->
			<!-- Calar -->
			<script type="text/javascript">
				function fun() {
					for (var i = 0; i < 13; i++) {
						flag = i;
						alert(flag);
						var tab = ducument.getElementById('tab' + i);
						var indexName = ducument
								.getElementById('indexName' + i).value;
						var indexWeight = ducument.getElementById('indexWeight'
								+ i).value;
						var tabHrefNum = tab.href.replace("#", "");
						var vtab = ducument.getElementById(tabHrefNum);

					}

				}
			</script>
			<!-- Calar -->
			
			
			<div class="tab-content" style="width: 90%">
			
			<input type="hidden" value="${project.pro_id}"
												name="pro_id">
				<div class="tab-pane fade" id="vtab1">
					<!-- <h1 class="text-center title">Very Flexible</h1> -->
					<ul class="list-icons">
						<c:forEach items="${indexs}" var="index" varStatus="status"
							begin="0" end="0">
							 <li><a id="tab${status.index+1}"
								href="#vtab${status.index+1}" role="tab" data-toggle="tab"><i
									class="fa fa-magic pr-10"></i> ${index.index_name}</a></li> 
							<c:forEach items="${factors}" var="factor" varStatus="status">
								<c:if test="${factor.factor_index_id == index.index_id}">

									<li id="subitem_${status.index+1}" data-module="b">
										<div>
											<input type="hidden" value="${factor.factor_id}"
												name="factorId${status.index+1}">
											${factor.factor_name} <input id="score_${status.index+1}"
												style="float: right; text-align: center; width: 300px; margin-top: -0.5%; margin-right: 20%"
												type="text" value="8" name="score${factor.factor_id}" placeholder="8" />

										</div>
								</c:if>
							</c:forEach>
						</c:forEach>
					</ul>
				</div>
				<div class="tab-pane fade" id="vtab2" >
					<!-- <h1 class="text-center title">Top Notch 24/7 Support</h1> -->
					<ul class="list-icons">
						<c:forEach items="${indexs}" var="index" varStatus="status"
							begin="1" end="1">
							 <li><a id="tab${status.index+1}"
								href="#vtab${status.index+1}" role="tab" data-toggle="tab"><i
									class="fa fa-magic pr-10"></i> ${index.index_name}</a></li> 
							<c:forEach items="${factors}" var="factor" varStatus="status">
								<c:if test="${factor.factor_index_id == index.index_id}">

									<li id="subitem2_${status.index+1}" data-module="b">
										<div>
											
											${factor.factor_name} <input id="score2_${status.index+1}"
												style="float: right; text-align: center; width: 300px; margin-top: -0.5%; margin-right: 20%"
												type="text" value="8" name="score${factor.factor_id} " placeholder="8" />

										</div>
										</li>
								</c:if>
							</c:forEach>
						</c:forEach>
					</ul>

				</div>
				<div class="tab-pane fade" id="vtab3" >
					<!-- <h1 class="text-center title">100% Responsive</h1> -->
					<ul class="list-icons">
						<c:forEach items="${indexs}" var="index" varStatus="status"
							begin="2" end="2">
							<li><a id="tab3${status.index+1}"
								href="#vtab${status.index+1}" role="tab" data-toggle="tab"><i
									class="fa fa-magic pr-10"></i> ${index.index_name}</a></li>
							<c:forEach items="${factors}" var="factor" varStatus="status">
								<c:if test="${factor.factor_index_id == index.index_id}">

									<li id="subitem3_${status.index+1}" data-module="b">
										<div>
											<input type="hidden" value="${factor.factor_id}"
												name="factorId${status.index+1}">
											${factor.factor_name} <input id="score_${status.index+1}"
												style="float: right; text-align: center; width: 300px; margin-top: -0.5%; margin-right: 20%"
												type="text" value="8" name="score${factor.factor_id}" placeholder="8" />

										</div>
								</c:if>
							</c:forEach>
						</c:forEach>
					</ul>


				</div>
				<div class="tab-pane fade" id="vtab4" >
					<!-- <h1 class="text-center title">Well Documented</h1> -->
					<ul class="list-icons">
						<c:forEach items="${indexs}" var="index" varStatus="status"
							begin="3" end="3">
							<li><a id="tab4${status.index+1}"
								href="#vtab${status.index+1}" role="tab" data-toggle="tab"><i
									class="fa fa-magic pr-10"></i> ${index.index_name}</a></li>
							<c:forEach items="${factors}" var="factor" varStatus="status">
								<c:if test="${factor.factor_index_id == index.index_id}">

									<li id="subitem4_${status.index+1}" data-module="b">
										<div>
											<input type="hidden" value="${factor.factor_id}"
												name="factorId${status.index+1}">
											${factor.factor_name} <input id="score_${status.index+1}"
												style="float: right; text-align: center; width: 300px; margin-top: -0.5%; margin-right: 20%"
												type="text" value="8" name="score${factor.factor_id}" placeholder="8" />

										</div>
								</c:if>
							</c:forEach>
						</c:forEach>
					</ul>
				</div>
				<div class="tab-pane fade" id="vtab5" >
					<!-- <h1 class="text-center title">Well Documented</h1> -->
					<ul class="list-icons">
						<c:forEach items="${indexs}" var="index" varStatus="status"
							begin="4" end="4">
							<li><a id="tab5${status.index+1}"
								href="#vtab${status.index+1}" role="tab" data-toggle="tab"><i
									class="fa fa-magic pr-10"></i> ${index.index_name}</a></li>
							<c:forEach items="${factors}" var="factor" varStatus="status">
								<c:if test="${factor.factor_index_id == index.index_id}">

									<li id="subitem5_${status.index+1}" data-module="b">
										<div>
											<input type="hidden" value="${factor.factor_id}"
												name="factorId${status.index+1}">
											${factor.factor_name} <input id="score_${status.index+1}"
												style="float: right; text-align: center; width: 300px; margin-top: -0.5%; margin-right: 20%"
												type="text" value="8" name="score${factor.factor_id}" placeholder="8" />

										</div>
								</c:if>
							</c:forEach>
						</c:forEach>
					</ul>


				</div>
				<div class="tab-pane fade" id="vtab6" >
					<!-- <h1 class="text-center title">Well Documented</h1> -->
					<ul class="list-icons">
						<c:forEach items="${indexs}" var="index" varStatus="status"
							begin="5" end="5">
							<li><a id="tab6${status.index+1}"
								href="#vtab${status.index+1}" role="tab" data-toggle="tab"><i
									class="fa fa-magic pr-10"></i> ${index.index_name}</a></li>
							<c:forEach items="${factors}" var="factor" varStatus="status">
								<c:if test="${factor.factor_index_id == index.index_id}">

									<li id="subitem6_${status.index+1}" data-module="b">
										<div>
											<input type="hidden" value="${factor.factor_id}"
												name="factorId${status.index+1}">
											${factor.factor_name} <input id="score_${status.index+1}"
												style="float: right; text-align: center; width: 300px; margin-top: -0.5%; margin-right: 20%"
												type="text" value="8" name="score${factor.factor_id}" placeholder="8" />

										</div>
								</c:if>
							</c:forEach>
						</c:forEach>
					</ul>

				</div>
				<div class="tab-pane fade" id="vtab7" >
					<!-- <h1 class="text-center title">Well Documented</h1> -->
					<ul class="list-icons">
						<c:forEach items="${indexs}" var="index" varStatus="status"
							begin="6" end="6">
							<li><a id="tab7${status.index+1}"
								href="#vtab${status.index+1}" role="tab" data-toggle="tab"><i
									class="fa fa-magic pr-10"></i> ${index.index_name}</a></li>
							<c:forEach items="${factors}" var="factor" varStatus="status">
								<c:if test="${factor.factor_index_id == index.index_id}">

									<li id="subitem7_${status.index+1}" data-module="b">
										<div>
											<input type="hidden" value="${factor.factor_id}"
												name="factorId${status.index+1}">
											${factor.factor_name} <input id="score_${status.index+1}"
												style="float: right; text-align: center; width: 300px; margin-top: -0.5%; margin-right: 20%"
												type="text" value="8" name="score${factor.factor_id}" placeholder="8" />

										</div>
								</c:if>
							</c:forEach>
						</c:forEach>
					</ul>

				</div>
				<div class="tab-pane fade" id="vtab8" >
					<!-- <h1 class="text-center title">Well Documented</h1> -->
					<ul class="list-icons">
						<c:forEach items="${indexs}" var="index" varStatus="status"
							begin="7" end="7">
							<li><a id="tab8${status.index+1}"
								href="#vtab${status.index+1}" role="tab" data-toggle="tab"><i
									class="fa fa-magic pr-10"></i> ${index.index_name}</a></li>
							<c:forEach items="${factors}" var="factor" varStatus="status">
								<c:if test="${factor.factor_index_id == index.index_id}">

									<li id="subitem8_${status.index+1}" data-module="b">
										<div>
											<input type="hidden" value="${factor.factor_id}"
												name="factorId${status.index+1}">
											${factor.factor_name} <input id="score_${status.index+1}"
												style="float: right; text-align: center; width: 300px; margin-top: -0.5%; margin-right: 20%"
												type="text" value="8" name="score${factor.factor_id}" placeholder="8" />

										</div>
								</c:if>
							</c:forEach>
						</c:forEach>
					</ul>

				</div>
				<div class="tab-pane fade" id="vtab9" >
					<!-- <h1 class="text-center title">Well Documented</h1> -->
					<ul class="list-icons">
						<c:forEach items="${indexs}" var="index" varStatus="status"
							begin="8" end="8">
							<li><a id="tab9${status.index+1}"
								href="#vtab${status.index+1}" role="tab" data-toggle="tab"><i
									class="fa fa-magic pr-10"></i> ${index.index_name}</a></li>
							<c:forEach items="${factors}" var="factor" varStatus="status">
								<c:if test="${factor.factor_index_id == index.index_id}">

									<li id="subitem9_${status.index+1}" data-module="b">
										<div>
											<input type="hidden" value="${factor.factor_id}"
												name="factorId${status.index+1}">
											${factor.factor_name} <input id="score_${status.index+1}"
												style="float: right; text-align: center; width: 300px; margin-top: -0.5%; margin-right: 20%"
												type="text" value="8" name="score${factor.factor_id}" placeholder="8" />

										</div>
								</c:if>
							</c:forEach>
						</c:forEach>
					</ul>

				</div>
				<div class="tab-pane fade" id="vtab10" >
<!-- 					<h1 class="text-center title">Well Documented</h1>
 -->					<ul class="list-icons">
						<c:forEach items="${indexs}" var="index" varStatus="status"
							begin="9" end="9">
							<li><a id="tab10${status.index+1}"
								href="#vtab${status.index+1}" role="tab" data-toggle="tab"><i
									class="fa fa-magic pr-10"></i> ${index.index_name}</a></li>
							<c:forEach items="${factors}" var="factor" varStatus="status">
								<c:if test="${factor.factor_index_id == index.index_id}">

									<li id="subitem10_${status.index+1}" data-module="b">
										<div>
											<input type="hidden" value="${factor.factor_id}"
												name="factorId${status.index+1}">
											${factor.factor_name} <input id="score_${status.index+1}"
												style="float: right; text-align: center; width: 300px; margin-top: -0.5%; margin-right: 20%"
												type="text" value="8" name="score${factor.factor_id}" placeholder="8" />

										</div>
								</c:if>
							</c:forEach>
						</c:forEach>
					</ul>

				</div>
				<div class="tab-pane fade" id="vtab11" >
					<!-- <h1 class="text-center title">Well Documented</h1> -->
					<ul class="list-icons">
						<c:forEach items="${indexs}" var="index" varStatus="status"
							begin="10" end="10">
							<li><a id="tab11${status.index+1}"
								href="#vtab${status.index+1}" role="tab" data-toggle="tab"><i
									class="fa fa-magic pr-10"></i> ${index.index_name}</a></li>
							<c:forEach items="${factors}" var="factor" varStatus="status">
								<c:if test="${factor.factor_index_id == index.index_id}">

									<li id="subitem11_${status.index+1}" data-module="b">
										<div>
											<input type="hidden" value="${factor.factor_id}"
												name="factorId${status.index+1}">
											${factor.factor_name} <input id="score_${status.index+1}"
												style="float: right; text-align: center; width: 300px; margin-top: -0.5%; margin-right: 20%"
												type="text" value="8" name="score${factor.factor_id}" placeholder="8" />

										</div>
								</c:if>
							</c:forEach>
						</c:forEach>
					</ul>


				</div>
				<div class="tab-pane fade" id="vtab12">
					<!-- <h1 class="text-center title">Well Documented</h1> -->
					<ul class="list-icons">
						<c:forEach items="${indexs}" var="index" varStatus="status"
							begin="11" end="11">
							<li><a id="tab12${status.index+1}"
								href="#vtab${status.index+1}" role="tab" data-toggle="tab"><i
									class="fa fa-magic pr-10"></i> ${index.index_name}</a></li>
							<c:forEach items="${factors}" var="factor" varStatus="status">
								<c:if test="${factor.factor_index_id == index.index_id}">

									<li id="subitem12_${status.index+1}" data-module="b">
										<div>
											<input type="hidden" value="${factor.factor_id}"
												name="factorId${status.index+1}">
											${factor.factor_name} <input id="score_${status.index+1}"
												style="float: right; text-align: center; width: 300px; margin-top: -0.5%; margin-right: 20%"
												type="text" value="8" name="score${factor.factor_id}" placeholder="8" />

										</div>
								</c:if>
							</c:forEach>
						</c:forEach>
					</ul>
                  <button type="submit" class="btn btn-white" >提交评估</button>

				</div>
			
			 
		</div> 
		
		<!-- tabs end -->
   </div>
   
   </form>

	</div>
	</section>
	<!-- /contact section -->

	<jsp:include page="/footer1.jsp" flush="true" />

</body>
</html>