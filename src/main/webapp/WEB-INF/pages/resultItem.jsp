<%@ page language="java"  import="com.vcevaluation.pojo.User" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
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
	<title>成果详情</title>
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
								<li><i class="fa fa-reply-all"></i><a href="/vcevaluation/selectResult">查看所有成果</a></li>
								<li class="active">成果详情</li>
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
							<h1 class="page-title margin-top-clear">${result.res_name}</h1>
							
							<!-- page-title end -->
							<div class="row">
								<div class="col-md-6">
									<c:if test="${result.res_type==1}">
								      <h3 class="page-title">成果详述--论文</h3>
							        </c:if>
								    <c:if test="${result.res_type==2}">
								      <h3 class="page-title">成果详述--专利</h3>
							        </c:if>
							        <c:if test="${result.res_type==3}">
								      <h3 class="page-title">成果详述--软件</h3>
							        </c:if>
									
							        <div class="separator-2"></div>
                                    <p>${result.res_introduction}</p>
									<c:if test="${result.res_type==1}">
										<p>${paper.paper_remark}</p>
									</c:if>
								    <c:if test="${result.res_type==2}">
										<p>${patent.pa_abstract}</p>
										<p>${patent.pa_details}</p>
									</c:if>
									<c:if test="${result.res_type==3}">
										<p>${software.s_brief}</p>
									</c:if>
								
								</div>
							    <c:if test="${result.res_type==1}">
									<div class="col-md-6">
										<h3>论文信息</h3>
										<div class="separator-2"></div>
										<ul class="list">
										    <li><strong class="vertical-divider">论文名称 </strong>${paper.paper_name}</li>
											<li><strong class="vertical-divider">申请人 </strong><a href=" #">${user.user_name}</a></li>
											<li><strong class="vertical-divider">附件 </strong>文件名
											 <a href="<%=basePath %>/download?upload_id=${result.res_url}">下载</a></li>
											<li><strong class="vertical-divider">申请时间 </strong>${result.res_protime}</li>
											<li><strong class="vertical-divider">发表时间 </strong>${paper.paper_pubtime}</li>
											<li><strong class="vertical-divider">被引用次数 </strong>${paper.paper_cited}</li>
											<c:if test="${paper.paper_category==1}">
											<li><strong class="vertical-divider">科学索引类别</strong>SCI(科学引文索引)</li>
											</c:if>
											<c:if test="${paper.paper_category==2}">
											<li><strong class="vertical-divider">科学索引类别</strong>EI(工程索引)</li>
											</c:if>
											<c:if test="${paper.paper_category==3}">
											<li><strong class="vertical-divider">科学索引类别</strong>ISTP(科技会议录索引)</li>
											</c:if>
											<c:if test="${paper.paper_category==4}">
											<li><strong class="vertical-divider">科学索引类别</strong>其他</li>
											</c:if>
											<li><strong class="vertical-divider">发表刊物</strong>${journal.j_name}</li>
										</ul>
									</div>
								</c:if>
								
								<c:if test="${result.res_type==2}">
									<div class="col-md-6">
										<h3>专利信息</h3>
										<div class="separator-2"></div>
										<ul class="list">
										    <li><strong class="vertical-divider">专利名称</strong>${patent.pa_name}</li>
											<li><strong class="vertical-divider">申请人</strong><a href=" #">${user.user_name}</a></li>
											<li><strong class="vertical-divider">附件 </strong>文件名
											 <a href="<%=basePath %>/download?upload_id=${result.res_url}">下载</a></li>
											<li><strong class="vertical-divider">申请时间 </strong>${result.res_protime}</li>
											<li><strong class="vertical-divider">专利号</strong>${patent.pa_number}</li>
											<li><strong class="vertical-divider">发明者</strong>${patent.pa_inventor}</li>
											<li><strong class="vertical-divider">发布时间</strong>${patent.pa_pubtime}</li>
											<li><strong class="vertical-divider">专利分类</strong>
											<c:if test="${patent.pa_type==1}">
											发明类(产品)
						                    </c:if>
						                    <c:if test="${patent.pa_type==2}">
											发明类(方法)
						                    </c:if>
						                    <c:if test="${patent.pa_type==3}">
											外观设计类
						                    </c:if>
						                    <c:if test="${patent.pa_type==4}">
											实用新型类
						                    </c:if>
						                    </li>
										</ul>
									</div>
								</c:if>
								
								<c:if test="${result.res_type==3}">
									<div class="col-md-6">
										<h3>软件信息</h3>
										<div class="separator-2"></div>
										<ul class="list">
											<li><strong class="vertical-divider">软件名称 </strong>${software.s_name}</li>
											<li><strong class="vertical-divider">申请人 </strong><a href=" #">${user.user_name}</a></li>
											<li><strong class="vertical-divider">附件 </strong>文件名
											 <a href="<%=basePath %>/download?upload_id=${result.res_url}">下载</a></li>
											<li><strong class="vertical-divider">完成时间 </strong>${result.res_protime}</li>
											<c:if test="${software.s_ispublished==1}">
											   <li><strong class="vertical-divider">是否发布 </strong>是</li>
											</c:if>
											<c:if test="${software.s_ispublished==0}">
											   <li><strong class="vertical-divider">是否发布 </strong>否</li>
											</c:if>
											<li><strong class="vertical-divider">完成时间 </strong>${software.s_finishtime}</li>
											<li><strong class="vertical-divider">可移植性</strong>
											<c:if test="${software.s_level==1}">
											高度可移植性(任何平台或环境都可以运行)
						                    </c:if>
						                    <c:if test="${software.s_level==2}">
											较好的可移植性(大多数平台或环境都可以运行)
						                    </c:if>
						                    <c:if test="${software.s_level==3}">
											一般的可移植性(少数平台或环境)
						                    </c:if>
						                    <c:if test="${software.s_level==4}">
											较差的可移植性(只针对一两种平台或环境)
						                    </c:if></li>
											<li><strong class="vertical-divider">功能完备性</strong>
											<c:if test="${software.s_ccm==1}">
											软件实现的功能完全满足软件计划书中要求的(完备性好)
						                    </c:if>
						                    <c:if test="${software.s_ccm==2}">
											基本满足完备性
						                    </c:if>
						                    <c:if test="${software.s_ccm==3}">
											有少量功能没有实现
						                    </c:if>
						                    </li>
										</ul>
									</div>
								</c:if>
								
							</div>
							<hr>
							<div class="row">
								
								<div class="col-md-6 col-xs-12">
									<h3>评估信息</h3>
									<ul class="list">
										<c:if test="${result.res_flag==1}">
										<li><strong class="vertical-divider">评估状态</strong>待评估</li>
										</c:if>
										<c:if test="${result.res_flag==2}">
										<li><strong class="vertical-divider">评估状态</strong>评估截至</li>
										</c:if>
										<li><strong class="vertical-divider">评估截止时间</strong>${result.res_eva_deadline}</li>
										<li><strong class="vertical-divider">评估次数 </strong> ${result.res_times}</li>
										<li><strong class="vertical-divider">评估均值</strong>${result.res_evalue}</li>
										
										
								    </ul>
								</div>
								
								<c:if test="${result.res_flag==1}" >
								<%if(user.getUser_type()==0){%>
								<div class="col-md-6 col-xs-12">
								    <c:if test="${result.res_type==1}">
										<h3>评估该论文</h3>
										<p>根据上述论文信息进行评估</p>
										<a href="/vcevaluation/toEvaluationPaper?res_id=${result.res_id}" class="btn btn-white margin-top-clear">开始评估</a>
									</c:if>
									<c:if test="${result.res_type==2}">
										<h3>评估该专利</h3>
										<p>根据上述专利信息进行评估</p>
										<a href="/vcevaluation/toEvaluationPatent?res_id=${result.res_id}" class="btn btn-white margin-top-clear">开始评估</a>
									</c:if>
									<c:if test="${result.res_type==3}">
										<h3>评估该软件</h3>
										<p>根据上述软件信息进行评估</p>
										<a href="/vcevaluation/toEvaluationSoftware?res_id=${result.res_id}" class="btn btn-white margin-top-clear">开始评估</a>
									</c:if>
										
								</div>
								<%}%>
								</c:if>
								
								<c:if test="${result.res_flag==2}" >
								<div class="col-md-6 col-xs-12">
								<h2>
											<c:if test="${result.res_evalue>=7}">
											<p>评估通过<i class="fa fa-check"></i></p>
											
											</c:if>
											<c:if test="${result.res_evalue<7}">
											<p>评估未通过<i class="fa fa-close"></i></p>
								
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
