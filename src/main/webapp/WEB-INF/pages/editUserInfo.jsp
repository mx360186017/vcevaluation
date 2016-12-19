<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.vcevaluation.pojo.User"
	import="com.vcevaluation.pojo.Resultprovider"
	import="com.vcevaluation.pojo.Eva_expert" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
	User user = (User) request.getAttribute("user");
	Eva_expert eva_expert = (Eva_expert) request
			.getAttribute("eva_expert");
	Resultprovider resultprovider = (Resultprovider) request
			.getAttribute("resultprovider");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>修改个人信息</title>
<meta name="description" content="iDea a Bootstrap-based, Responsive HTML5 Template">
<meta name="author" content="htmlcoder.me">

<!-- Mobile Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="/head.jsp" flush="true"/>
<script>
	function identify() {
		user_type = $("#user_type").val();
		if (user_type == 0) {//expert
			$("#ex_info").css("display", "");
			$("#rp_info").css("display", "none");

		}
		if (user_type == 1) {//rp
			$("#ex_info").css("display", "none");
			$("#rp_info").css("display", "");
		}
	}
	/*用window.onload调用identify()*/
	window.onload = identify;//不要括号
</script>

</head>

<body>
	<jsp:include page="/header1.jsp" flush="true" />

	<!-- typography page -->
	<div class="typography">

		<!-- container-wrap -->
		<div class="container">
			</br> </br>
			<h3 class="hdg">修改个人信息</h3>
			</br>
			<!--修改个人信息页面 Form Begin-->
			<form action="editUserInfo2" id="form_userinfo"
				class="form-horizontal" method="post">
				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1"
						style="width: 110px">用户名</span> <input type="text"
						class="form-control" name="user_name"
						value="<%=user.getUser_name()%>" aria-describedby="sizing-addon1"
						style="height: 46px; width: 850px">
				</div>
				</br>

				<div>
					<!-- 获取当前用户的id -->
					<input type="hidden" id="user_id" name="user_id"
						value="<%=user.getUser_id()%>" /> <input type="hidden"
						id="user_type" name="user_type" value="<%=user.getUser_type()%>" />
				</div>

				<div>
					<input type="hidden" id="user_type" name="user_type"
						value="<%=user.getUser_type()%>" />
				</div>
				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1"
						style="width: 110px">姓名&nbsp;&nbsp;&nbsp;</span>
						<input
						type="text" class="form-control" name="user_realname"
						value="<%=user.getUser_realname()%> "
						aria-describedby="sizing-addon1"
						style="height: 46px; width: 850px">  
				</div>
				</br>
				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1"
						style="width: 110px">性别&nbsp;&nbsp;&nbsp;</span>
						
							<select class="form-control" id="user_gender" name="user_gender" style="height: 46px; width: 850px">
								<c:if test="<%=user.getUser_gender() == 0%>">
								<option style="text-align:center" value="未填写"  selected = "selected">未填写</option>
								<option style="text-align:center" value="男">男</option>
								<option style="text-align:center" value="女">女</option>
								</c:if>
								<c:if test="<%=user.getUser_gender() == 1%>">
								<option style="text-align:center" value="男"  selected = "selected">男</option>
								<option style="text-align:center" value="女">女</option>
								</c:if>
								<c:if test="<%=user.getUser_gender() == 2%>">
								<option style="text-align:center" value="女" selected = "selected">女</option>
								<option style="text-align:center" value="男">男</option>
								</c:if>
							</select>
						
				</div>
				</br>
				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1"
						style="width: 110px">密码&nbsp;&nbsp;&nbsp;</span> <input
						type="text" class="form-control" name="user_pwd"
						value="<%=user.getUser_pwd()%>" aria-describedby="sizing-addon1"
						style="height: 46px; width: 850px"> <input type="hidden"
						value="<%=user.getUser_gender()%>" />
				</div>
				</br>
				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1"
						style="width: 110px">邮箱&nbsp;&nbsp;&nbsp;</span> <input
						type="text" class="form-control" name="user_email"
						value="<%=user.getUser_email()%>"
						aria-describedby="sizing-addon1"
						style="height: 46px; width: 850px">
				</div>
				</br>
				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1"
						style="width: 110px">学历&nbsp;&nbsp;&nbsp;</span>
						
							<select class="form-control" style="height: 46px; width: 850px" id="user_edu" name="user_edu">
							<c:if test="<%=user.getUser_edu() == 0%>">
							<option style="text-align:center" value="未填写"  selected = "selected">未填写</option>
							<option style="text-align:center" value="博士">博士</option>
							<option style="text-align:center" value="硕士">硕士</option>
							<option style="text-align:center" value="本科">本科</option>
							<option style="text-align:center" value="本科以下">本科以下</option>
							</c:if>
							<c:if test="<%=user.getUser_edu() == 1%>">
							<option style="text-align:center" value="博士" selected = "selected">博士</option>
							<option style="text-align:center" value="硕士">硕士</option>
							<option style="text-align:center" value="本科">本科</option>
							<option style="text-align:center" value="本科以下">本科以下</option>
							</c:if>
							<c:if test="<%=user.getUser_edu() == 2%>">
							<option style="text-align:center" value="博士" >博士</option>
							<option style="text-align:center" value="硕士" selected = "selected">硕士</option>
							<option style="text-align:center" value="本科">本科</option>
							<option style="text-align:center" value="本科以下">本科以下</option>
							</c:if>
							<c:if test="<%=user.getUser_edu() == 3%>">
							<option style="text-align:center" value="博士" >博士</option>
							<option style="text-align:center" value="硕士" >硕士</option>
							<option style="text-align:center" value="本科" selected = "selected">本科</option>
							<option style="text-align:center" value="本科以下">本科以下</option>
							</c:if>
							<c:if test="<%=user.getUser_edu() == 4%>">
							<option style="text-align:center" value="博士" >博士</option>
							<option style="text-align:center" value="硕士" >硕士</option>
							<option style="text-align:center" value="本科">本科</option>
							<option style="text-align:center" value="本科以下" selected = "selected">本科以下</option>
							</c:if>
							</select>
						</a> 
				</div>
				</br>
				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1"
						style="width: 110px">年龄&nbsp;&nbsp;&nbsp;</span> <input
						type="text" class="form-control" name="user_age"
						value="<%=user.getUser_age()%>" aria-describedby="sizing-addon1"
						style="height: 46px; width: 850px">
				</div>
				</br>
				<div>

					<div id="ex_info">
						<div id="ex_qf" class="input-group input-group-lg">
							<span class="input-group-addon" id="sizing-addon1"
								style="width: 110px">级别&nbsp;&nbsp;&nbsp;</span> <input
								type="text" class="form-control" name="ex_qualification"
								value="<%=eva_expert.getEx_qualification()%>"
								aria-describedby="sizing-addon1"
								style="height: 46px; width: 850px">
						</div>
						</br>
						<div id="ex_et" class="input-group input-group-lg">
							<span class="input-group-addon" id="sizing-addon1"
								style="width: 110px">工龄&nbsp;&nbsp;&nbsp;</span> <input
								type="text" class="form-control" name="ex_expertise"
								value="<%=eva_expert.getEx_expertise()%>"
								aria-describedby="sizing-addon1"
								style="height: 46px; width: 850px">
						</div>
						</br>
						<div id="ex_bf" class="input-group input-group-lg">
							<span class="input-group-addon" id="sizing-addon1"
								style="width: 110px">业务领域&nbsp;</span> <input type="text"
								class="form-control" name="ex_businessfield"
								value="<%=eva_expert.getEx_businessfield()%>"
								aria-describedby="sizing-addon1"
								style="height: 46px; width: 850px">
						</div>
						</br>
					</div>
					<div id="rp_info">
						<div id="rp_qf" class="input-group input-group-lg">
							<span class="input-group-addon" id="sizing-addon1"
								style="width: 110px">资历&nbsp;&nbsp;&nbsp;</span> <input
								type="text" class="form-control" name="rp_qualification"
								value="<%=resultprovider.getRp_qualification()%>"
								aria-describedby="sizing-addon1"
								style="height: 46px; width: 850px">
						</div>
						</br>
						<div id="rp_fd" class="input-group input-group-lg">
							<span class="input-group-addon" id="sizing-addon1"
								style="width: 110px">研究方向&nbsp;</span> <input type="text"
								class="form-control" name="rp_field"
								value="<%=resultprovider.getRp_field()%>"
								aria-describedby="sizing-addon1"
								style="height: 46px; width: 850px">
						</div>
						</br>
						<div id="rp_rs" class="input-group input-group-lg">
							<span class="input-group-addon" id="sizing-addon1"
								style="width: 110px">科研情况&nbsp;</span> <input type="text"
								class="form-control" name="rp_research"
								value="<%=resultprovider.getRp_research()%>"
								aria-describedby="sizing-addon1"
								style="height: 46px; width: 850px">
						</div>
						</br>
					</div>
					<div class="input-group input-group-lg">
						<span class="input-group-addon" id="sizing-addon1"
							style="width: 110px">简介&nbsp;&nbsp;&nbsp;</span>
						<textarea name="user_remark" id="user_remark"
							class="form-control" style="height: 200px; width: 850px"><%=user.getUser_remark()%></textarea>
					</div>
					<br>
					<div class="grid_3 grid_5">
						<h3>
							<!-- <input type="submit" value="提交"> -->
							   <a class="btn radius btn-gray" href="javascript:document:form_userinfo.submit();">提交</a>
							<a class="btn radius btn-gray" href="#"><span 
								onclick="javascript:history.go(-1);">返回</span></a>
						</h3>
					</div>
			</form>
			<!-- END FORM-->
			<br> <br> <br>
		</div>
		<!-- //container-wrap -->
	</div>
	<!-- //typography -->

	<!-- footer section -->
	<jsp:include page="/footer1.jsp" flush="true" />
	<!-- /footer section -->

	<a href="#0" class="cd-top">Top</a>
	<!-- js files -->
	<script src="<%= basePath%>/static/media/js/jquery.min.js"></script>
	<script src="<%= basePath%>/static/media/js/bootstrap.min.js"></script>
	<script src="<%= basePath%>/static/media/js/SmoothScroll.min.js"></script>
	<script src="<%= basePath%>/static/media/js/index.js"></script>
	<script src="<%= basePath%>/static/media/js/top.js"></script>
	<!-- /js files -->
</body>
</html>