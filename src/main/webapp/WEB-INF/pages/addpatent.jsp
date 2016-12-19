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
<title>专利提交</title>
<meta name="description" content="iDea a Bootstrap-based, Responsive HTML5 Template">
<meta name="author" content="htmlcoder.me">

<!-- Mobile Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
      <jsp:include page="/head.jsp" flush="true"/>
</head>

<body>
<jsp:include page="/header1.jsp" flush="true"/>

<!-- contact section -->
<section class="contact-w3ls">
	<div class="container">
		</br>
		<h2 class="text-center title">专利提交</h2>
								<div class="separator"></div>
								<p class="text-center">请输入专利基本信息</p>
			<form action="upload2" method="post"  Content-Range="bytes 0-800/801" enctype="multipart/form-data">
                <div class="col-lg-6 col-md-6 col-sm-6 contact-agile1">    
					<div class="control-group form-group">
                        <div class="controls">
                            <label class="contact-p1">专利名称:</label>
                            <input type="text" class="form-control" name="pa_name" id="pa_name" onblur="checkPaname()" required data-validation-required-message="Please enter your name.">
                            <label id="validate_paname" style="font-size:9px;display:none;"></label>
                            <p class="help-block"></p>
                        </div>
                    </div>	
                    <div class="control-group form-group">
                        <div class="controls">
                            <label class="contact-p1">专利类型</label>
							<select class="form-control" id="pa_type" name="pa_type">
									<option value="1">发明类(产品)</option>
									<option value="2">发明类(方法)</option>
									<option value="3">外观设计类</option>
									<option value="4">实用新型类</option>
							</select>
							<p class="help-block"></p>
						</div>
                    </div>
                   <div class="control-group form-group">
                        <div class="controls">
                            <label class="contact-p1">专利发明人:</label>
                            <input type="text" class="form-control" name="pa_inventor" id="pa_inventor" required data-validation-required-message="Please enter your name.">
                            <p class="help-block"></p>
                        </div>
                    </div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 contact-agile2">
                    <div class="control-group form-group">
                        <div class="controls">
                            <label class="contact-p1">申请时间:</label>
                           <input type="text"  class="form-control Wdate" onFocus="WdatePicker({lang:'zh-cn',maxDate:new Date()})" name="pa_pubtime" id="pa_pubtime"style="height:40px"/>
                             <!--  <input type="date" class="form-control" name="pa_pubtime" id="pa_pubtime"/>
                           <input type="text" class="form-control" name="pa_pubtime" id="pa_pubtime" required data-validation-required-message="Please enter your email address.">
							-->
							<p class="help-block"></p>
						</div>
                    </div>
					<div class="control-group form-group">
                        <div class="controls">
                            <label class="contact-p1">专利号:</label>
                            <input type="text" class="form-control" name="pa_number" id="pa_number" required data-validation-required-message="Please enter Subject.">
                            <p class="help-block"></p>
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
						 <label class="contact-p1">专利附件:</label>
						 <input type="file" name="file2" style="height:34px;width:200px">
							<p class="help-block"></p>
						</div>
                    </div>
				</div>
				<div class="col-lg-12">	
                    <div class="control-group form-group">
                        <div class="controls">
                            <label class="contact-p1">原理性阐述:</label>
                            <textarea rows="10" cols="100" class="form-control" name="pa_details" id="pa_details" required data-validation-required-message="Please enter your introduction" maxlength="999" style="resize:none"></textarea>
							<p class="help-block"></p>
                        </div>
                    </div>
                    <div id="success"></div>
                    <!-- For success/fail messages -->
                    <button type="submit" class="btn btn-primary" style="width:1110px">专利提交</button>
				</div>
				<div class="clearfix"></div>	
            </form>            
       	
	</div>	
</section>			
<!-- /contact section -->

<jsp:include page="/footer1.jsp" flush="true"/>

<a href="#0" class="cd-top">Top</a>
<%-- <!-- js files -->
<script src="<%= basePath%>/static/media/js/jquery.min.js"></script>
<script src="<%= basePath%>/static/media/js/bootstrap.min.js"></script>
<script src="<%= basePath%>/static/media/js/SmoothScroll.min.js"></script>
<script src="<%= basePath%>/static/media/js/index.js"></script>
<script src="<%= basePath%>/static/media/js/top.js"></script>
<script src="<%= basePath%>/static/media/js/jqBootstrapValidation.js"></script> --%>
	 
<!-- /js files -->
<script>

var flag = 0;
function checkPaname(){
		var paname=$("#pa_name").val();

	if(paname==""){
		$("#validate_paname").html("请输入论文名称");
			$("#validate_paname").css("display","inline");
			$("#validate_paname").css("color","red");
			$("#validate_paname").css("font-size","16px");
			return false;
	}else{//论文名称是否存在的验证
		$.ajax({
			type : 'post',
			url : 'getRnameValidation?r_name='+paname,
			success : function (msg){
				if(msg == 'success'){//不存在
					$("#validate_paname").css("display","inline");
					$("#validate_paname").html("");
					flag = 1;
				}else{
					$("#validate_paname").css("display","inline");
					$("#validate_paname").html("该名称已存在！请重输");
					$("#validate_paname").css("color","red");
					$("#validate_paname").css("font-size","16px");
					
				}
			}
		}); 
		if(flag == 1){
			return true;
		}
		return false;
	}
	}
	
function validation(){
	if(checkPaname()){
		return true;
	}else{
		return false;
	}
}

</script>
</body>
</html>