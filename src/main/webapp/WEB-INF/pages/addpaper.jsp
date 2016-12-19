<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <% String path=request.getContextPath();
     String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
     response.setHeader("Content-Range", "bytes 0-800/801");
     request.setCharacterEncoding("UTF-8") ;
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>论文提交</title>
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
		<h2 class="text-center title">论文提交</h2>
								<div class="separator"></div>
								<p class="text-center">请输入论文基本信息</p>
		
			<form id="form1" role="form" action="upload1" method="post"  Content-Range="bytes 0-800/801" enctype="multipart/form-data" >
                <div class="col-lg-6 col-md-6 col-sm-6 contact-agile1">    
					<div class="control-group form-group">
                        <div class="controls">
                            <label class="contact-p1">论文名称:</label>
                            <input type="text" class="form-control" name="p_name" id="p_name" onblur="checkPname()" required data-validation-required-message="Please enter your name.">
                            <label id="validate_pname" style="font-size:9px;display:none;"></label>
                            <p class="help-block"></p>
                        </div>
                    </div>	
                    <div class="control-group form-group">
                        <div class="controls">
                            <label class="contact-p1">发表时间:</label>
                            <input type="text"  class="form-control Wdate" onFocus="WdatePicker({lang:'zh-cn',maxDate:new Date()})" name="p_time" id="p_time"style="height:40px"/>
                           <!--  <input type="text" class="form-control form_datetime" name="p_time" id="p_time" required data-validation-required-message="Please enter your phone number."> -->
							<!-- <span class="add-on"><i class="icon-th"></i></span> -->
							<p class="help-block"></p>
						</div>
                    </div>
                   <div class="control-group form-group">
                        <div class="controls">
                            <label class="contact-p1">被引用次数:</label>
                            <input type="text" class="form-control" name="p_cited" id="p_cited" onblur="checkCited()" required data-validation-required-message="Please enter your name.">
                            <label id="validate_cited" style="font-size:9px;display:none;"></label>
                            <p class="help-block"></p>
                        </div>
                    </div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 contact-agile2">
                    <div class="control-group form-group">
                        <div class="controls">
                            <label class="contact-p1">发表刊物:</label>
								<select class="form-control" id="p_publications" name="p_publications">
								<c:forEach items="${journals}" var="journals">
									<option value="${journals.j_id}">${journals.j_name}</option>
								</c:forEach>
								</select>
							<p class="help-block"></p>
						</div>
                    </div>
					<div class="control-group form-group">
                        <div class="controls">
                            <label class="contact-p1">科学索引类别:</label>
                            <select class="form-control" id="p_category" name="p_category">
									<option value="1">SCI(科学引文索引)</option>
									<option value="2">EI(工程索引)</option>
									<option value="3">ISTP(科技会议录索引)</option>
									<option value="4">其他</option>
							</select>
                            <p class="help-block"></p>
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
						 <label class="contact-p1">论文附件:</label>
						 <input type="file" name="file1" style="height:34px;width:200px">
							<p class="help-block"></p>
						</div>
                    </div>
				</div>
				<div class="col-lg-12">	
                    <div class="control-group form-group">
                        <div class="controls">
                            <label class="contact-p1">论文介绍:</label>
                            <textarea rows="10" cols="100" class="form-control" name="p_introduction" id="p_introduction" required data-validation-required-message="Please enter your introduction" maxlength="999" style="resize:none"></textarea>
							<p class="help-block"></p>
                        </div>
                    </div>
                   
                  <button type="submit" class="btn btn-primary" style="width:1110px">论文提交</button>
				</div>
				<div class="clearfix"></div>
				 
            </form> 
      
    
	</div>	
</section>			
<!-- /contact section -->

<jsp:include page="/footer1.jsp" flush="true"/>
<script>
function checkCited(){
	var cited=$("#p_cited").val();
	var regcited=/^\d+$/;
	if(cited==""){
		$("#validate_cited").html("请输入被引用次数");}
		else if(!regcited.test(cited)){
			$("#validate_cited").html("请输入数字");
			
		}else{
			$("#validate_cited").html("");
			return true;
		}
		$("#validate_cited").css("display","inline");
			$("#validate_cited").css("color","red");
			$("#validate_cited").css("font-size","16px");
			return false;
	}


var flag = 0;
function checkPname(){
		var pname=$("#p_name").val();

	if(pname==""){
		$("#validate_pname").html("请输入论文名称");
			$("#validate_pname").css("display","inline");
			$("#validate_pname").css("color","red");
			$("#validate_pname").css("font-size","16px");
			return false;
	}else{//论文名称是否存在的验证
		$.ajax({
			type : 'post',
			url : 'getRnameValidation?r_name='+pname,
			success : function (msg){
				if(msg == 'success'){//不存在
					$("#validate_pname").css("display","inline");
					$("#validate_pname").html("");
					flag = 1;
				}else{
					$("#validate_pname").css("display","inline");
					$("#validate_pname").html("该名称已存在！请重输");
					$("#validate_pname").css("color","red");
					$("#validate_pname").css("font-size","16px");
					
				}
			}
		}); 
		if(flag == 1){
			return true;
		}
		return false;
	}
	}
</script>
</body>
</html>