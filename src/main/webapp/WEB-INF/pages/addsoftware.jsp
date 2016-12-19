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
<title>软件提交</title>
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
		<h2 class="text-center title">软件提交</h2>
								<div class="separator"></div>
								<p class="text-center">请输入软件基本信息</p>
		
			<form action="upload3"  method="post"  Content-Range="bytes 0-800/801" enctype="multipart/form-data">
                <div class="col-lg-6 col-md-6 col-sm-6 contact-agile1">    
					<div class="control-group form-group">
                        <div class="controls">
                            <label class="contact-p1">软件名称:</label>
                            <input type="text"  class="form-control" name="s_name" id="s_name" onblur="checkSname()"  required data-validation-required-message="Please enter your name.">
                            <label id="validate_sname" style="font-size:9px;display:none;"></label>
                            <p class="help-block"></p>
                        </div>
                    </div>	
                    <div class="control-group form-group">
                        <div class="controls">
                            <label class="contact-p1">是否发布(在某个应用商店或平台上):</label>
                            <select class="form-control" id="s_ispublished" name="s_ispublished">
									<option value="0">未发布</option>
									<option value="1">发布</option>
							</select>
							<p class="help-block"></p>
						</div>
                    </div>
                   <div class="control-group form-group">
                        <div class="controls">
                            <label class="contact-p1">完成时间:</label>
                             <input type="text"  class="form-control Wdate" onFocus="WdatePicker({lang:'zh-cn',maxDate:new Date()})" name="s_finishtime" id="s_finishtime"style="height:40px"/>
                            
                             <!-- <input class="Wdate" type="text" onClick="WdatePicker()">
                             <input type="text"  class="form-control Wdate" onFocus="WdatePicker({lang:'zh-cn',maxDate:new Date()})" name="s_finishtime" id="s_finishtime"style="height:40px"/> -->
                     
                            <p class="help-block"></p>
                        </div>
                    </div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 contact-agile2">
                    <div class="control-group form-group">
                        <div class="controls">
                            <label class="contact-p1">可移植性:</label>
                            <select class="form-control" id="s_level" name="s_level">
									<option value="1">高度可移植性(任何平台或环境都可以运行)</option>
									<option value="2">较好的可移植性(大多数平台或环境都可以运行)</option>
									<option value="3">一般的可移植性(少数平台或环境)</option>
									<option value="4">较差的可移植性(只针对一两种平台或环境)</option>
							</select>
							<p class="help-block"></p>
						</div>
                    </div>
					<div class="control-group form-group">
                        <div class="controls">
                            <label class="contact-p1">功能完备性:</label>
                            <select class="form-control" id="s_ccm" name="s_ccm">
									<option value="1">软件实现的功能完全满足软件计划书中要求的</option>
									<option value="2">基本满足完备性</option>
									<option value="3">有少量功能没有实现</option>
							</select>
                            <p class="help-block"></p>
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
						 <label class="contact-p1">软件附件:</label>
						 <input type="file" name="file3" style="height:34px;width:200px">
							<p class="help-block"></p>
						</div>
                    </div>
				</div>
				<div class="col-lg-12">	
                    <div class="control-group form-group">
                        <div class="controls">
                            <label class="contact-p1">软件介绍:</label>
                            <textarea rows="10" cols="100" class="form-control" name="s_brief" id="s_brief" required data-validation-required-message="Please enter your introduction" maxlength="999" style="resize:none"></textarea>
							<p class="help-block"></p>
                        </div>
                    </div>
                    <div id="success"></div>
                    <!-- For success/fail messages -->
                    <button type="submit" class="btn btn-primary" style="width:1110px">软件提交</button>
				</div>
				<div class="clearfix"></div>	
            </form>            
       	
	</div>	
</section>			
<!-- /contact section -->

<jsp:include page="/footer1.jsp" flush="true"/>

<a href="#0" class="cd-top">Top</a>

<script>

var flag = 0;
function checkSname(){
		var sname=$("#s_name").val();

	if(sname==""){
		$("#validate_sname").html("请输入论文名称");
			$("#validate_sname").css("display","inline");
			$("#validate_sname").css("color","red");
			$("#validate_sname").css("font-size","16px");
			return false;
	}else{//论文名称是否存在的验证
		$.ajax({
			type : 'post',
			url : 'getRnameValidation?r_name='+sname,
			success : function (msg){
				if(msg == 'success'){//不存在
					$("#validate_sname").css("display","inline");
					$("#validate_sname").html("");
					flag = 1;
				}else{
					$("#validate_sname").css("display","inline");
					$("#validate_sname").html("该名称已存在！请重输");
					$("#validate_sname").css("color","red");
					$("#validate_sname").css("font-size","16px");
					
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
	if(checkSname()){
		return true;
	}else{
		return false;
	}
}

</script>

</body>
</html>