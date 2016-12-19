<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap Multi Step Registration Form Template</title>

        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="<%= basePath%>/static/media/assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%= basePath%>/static/media/assets/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="<%= basePath%>/static/media/assets/css/form-elements.css">
        <link rel="stylesheet" href="<%= basePath%>/static/media/assets/css/style.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Favicon and touch icons -->
        <link rel="shortcut icon" href="assets/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<%= basePath%>/static/media/assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="<%= basePath%>/static/media/assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="<%= basePath%>/static/media/assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="<%= basePath%>/static/media/assets/ico/apple-touch-icon-57-precomposed.png">

    </head>

    <body>

		
 	<script>
			function nextfun(){
				$("#f2").css("display","")
				$("#f1").css("display","none")
			}
			function nextfun2(){
				$("#f3").css("display","")
				$("#f2").css("display","none")
			}	
			function prefun2(){
				$("#f1").css("display","")
				$("#f2").css("display","none")
			}
			function prefun3(){
				$("#f2").css("display","")
				$("#f3").css("display","none")
			}
			function onchangeSelect(){
	        	identify = $("#identify").val();
	        	if(identify == 1){//成果提供者
	        		$("#u_qualification2").css("display","");
	        		$("#u_field").css("display","");
	        		$("#u_research").css("display","");
	        		$("#u_qualification1").css("display","none");
	        		$("#u_expertise").css("display","none");
	        		$("#u_businessfield").css("display","none");
	        	}
	        	if(identify == 0){
	        		//基金经理
	        		$("#u_qualification2").css("display","none");
	        		$("#u_field").css("display","none");
	        		$("#u_research").css("display","none");
	        		$("#u_qualification1").css("display","");
	        		$("#u_expertise").css("display","");
	        		$("#u_businessfield").css("display","");
	        	}
	        }
			
			function validation(){
				if(checkName() && checkps() && checkcps() && checkEmail()){
					return true;
				}else{
					return false;
				}
			}
			
			var flagName = 0;
			function checkName(){
				var name=$("#u_name").val();
			    var regName=/^[a-zA-Z]\w{3,15}$/;
			    if(name == ""){
			    	$("#prompt_name").html("用户名不能为空！");
			    	$("#prompt_name").css("display","inline");
			        $("#prompt_name").css("color","red"); 
			        $("#prompt_name").css("font-size","16px");
			      	return false;
			    }else if(!regName.test(name)){
			    	$("#prompt_name").html("以英文字母开头,英文字母和数字组成,4-16位");
			    	$("#prompt_name").css("display","inline");
			        $("#prompt_name").css("color","red"); 
			        $("#prompt_name").css("font-size","16px");
			      	return false;
			    }else{
			    	$.ajax({
	    				type : 'post',
	    				url : 'getNameValidation?u_name='+name,
	    				success : function (msg){
	    					if(msg == 'failure'){//用户不存在
	    						$("#prompt_name").css("display","inline");
	    						$("#prompt_name").html("");
	    						flagName = 1;
	    					}else{
	    						$("#prompt_name").html("用户名已存在！请重输");
	    						$("#prompt_name").css("display","inline");
	    						$("#prompt_name").css("color","red");
	    						$("#prompt_name").css("font-size","16px");
	    					}
	    				}
	    			});
			    	if(flagName == 1){
	    				return true;
	    			}
	    			return false;
			    } 
			}
			
			function checkRealName(){
				var rname=$("#u_realname").val();
				if(rname==""){
					$("#prompt_realname").html("请输入真实姓名");
				}else{
					$("#prompt_realname").html("");
					return true;}
				$("#prompt_realname").css("display","inline");
      			$("#prompt_realname").css("color","red");
      			$("#prompt_realname").css("font-size","16px");
      			return false;
			}
			
			function checkRemark(){
				var remark=$("#u_remark").val();
				if(remark==""){
					$("#prompt_remark").html("请输入简介");
				}else{
					$("#prompt_remark").html("");
					return true;}
				$("#prompt_remark").css("display","inline");
      			$("#prompt_remark").css("color","red");
      			$("#prompt_remark").css("font-size","16px");
      			return false;
			}
			
			function checkAge(){
				var age=$("#u_age").val();
				var regage=/^\d+$/;
				if(age==""){
					$("#prompt_age").html("请输入年龄");}
					else if(!regage.test(age)){
						$("#prompt_age").html("请输入数字");
						
					}else{
						$("#prompt_age").html("");
						return true;
					}
					$("#prompt_age").css("display","inline");
	      			$("#prompt_age").css("color","red");
	      			$("#prompt_age").css("font-size","16px");
	      			return false;
				}
			
			function checkExe(){
				var exe=$("#ex_expertise").val();
				var regexe=/\d/;
				if(exe==""){
					$("#prompt_exe").html("请输入工作年限");}
					else if(!regexe.test(exe)){
						$("#prompt_exe").html("请输入数字");
						
					}else{
						$("#prompt_exe").html("");
						return true;
					}
					$("#prompt_exe").css("display","inline");
	      			$("#prompt_exe").css("color","red");
	      			$("#prompt_exe").css("font-size","16px");
	      			return false;
				}
			function checkExq(){
				var exq=$("#ex_qualification").val();
				if(exq==""){
					$("#prompt_exq").html("请输入级别");
				}else{
					$("#prompt_exq").html("");
					return true;}
				$("#prompt_exq").css("display","inline");
      			$("#prompt_exq").css("color","red");
      			$("#prompt_exq").css("font-size","16px");
      			return false;
			}
			
			function checkExb(){
				var exb=$("#ex_businessfield").val();
				if(exb==""){
					$("#prompt_exb").html("请输入业务擅长领域");
				}else{
					$("#prompt_exb").html("");
					return true;}
				$("#prompt_exb").css("display","inline");
      			$("#prompt_exb").css("color","red");
      			$("#prompt_exb").css("font-size","16px");
      			return false;
			}
			
			function checkRpq(){
				var rpq=$("#rp_qualification").val();
				if(rpq==""){
					$("#prompt_rpq").html("请输入资历");
				}else{
					$("#prompt_rpq").html("");
					return true;}
				$("#prompt_rpq").css("display","inline");
      			$("#prompt_rpq").css("color","red");
      			$("#prompt_rpq").css("font-size","16px");
      			return false;
			}
			
			function checkRpf(){
				var rpf=$("#rp_field").val();
				if(rpf==""){
					$("#prompt_rpf").html("请输入研究方向");
				}else{
					$("#prompt_rpf").html("");
					return true;}
				$("#prompt_rpf").css("display","inline");
      			$("#prompt_rpf").css("color","red");
      			$("#prompt_rpf").css("font-size","16px");
      			return false;
			}
			
			function checkRpr(){
				var rpr=$("#rp_research").val();
				if(rpr==""){
					$("#prompt_rpr").html("请输入科研情况");
				}else{
					$("#prompt_rpr").html("");
					return true;}
				$("#prompt_rpr").css("display","inline");
      			$("#prompt_rpr").css("color","red");
      			$("#prompt_rpr").css("font-size","16px");
      			return false;
			}
			
			function checkps(){
				var ps=$("#u_pwd").val();
				var regps = /^[a-zA-Z0-9]{6,12}$/;
				 
				if(ps == ""){
			    	$("#prompt_ps").html("请输入密码");
			    }
				else if(!regps.test(ps)){
					$("#prompt_ps").html("密码为6-12位的数字和字母");
					
				}else{
					$("#prompt_ps").html("");
					return true;
				}
				$("#prompt_ps").css("display","inline");
      			$("#prompt_ps").css("color","red");
      			$("#prompt_ps").css("font-size","16px");
      			return false;
			}
			
			function checkcps(){
			    var ps=$("#u_pwd").val();
			    var cps=$("#u_repeat_pwd").val();
			    
			    if(cps == ""){
			    	$("#prompt_cps").html("请重复密码");
			    }else if(ps != cps){
			    	$("#prompt_cps").html("密码不一致");
	      		}else{
	      			$("#prompt_cps").html("");
	      			return true;
	      		}
			    $("#prompt_cps").css("display","inline");
      			$("#prompt_cps").css("color","red");
      			$("#prompt_cps").css("font-size","16px");
      			return false;
			}

			var flag = 0;
			function checkEmail(){
	   			var email=$("#u_email").val();
	    		var regEmail = /^\w+@\w+\.[a-zA-Z]{2,3}(.[a-zA-Z]{2,3})?$/;
				if(!regEmail.test(email)){//邮箱格式的验证
	    			$("#prompt_mail").html("邮箱格式不正确");
	      			$("#prompt_mail").css("display","inline");
	      			$("#prompt_mail").css("color","red");
	      			$("#prompt_mail").css("font-size","16px");
	      			return false;
	    		}else{//邮箱是否存在的验证
	    			$.ajax({
	    				type : 'post',
	    				url : 'getEmailValidation?u_email='+email,
	    				success : function (msg){
	    					if(msg == 'success'){//不存在
	    						$("#prompt_mail").css("display","inline");
	    						$("#prompt_mail").html("");
	    						flag = 1;
	    					}else{
	    						$("#prompt_mail").css("display","inline");
	    						$("#prompt_mail").html("邮箱已存在！请重输");
	    						$("#prompt_mail").css("color","red");
	    						$("#prompt_mail").css("font-size","16px");
	    						
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
        <!-- Top content -->
        <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1 ><strong>注册</strong> <small >请输入有效信息</small></h1>
                            <div class="description">
                            	<p>
	                            	<!-- This is a free responsive multi-step registration form made with Bootstrap. 
	                            	Download it on <a href="http://azmind.com"><strong>AZMIND</strong></a>, customize and use it as you like! -->
                            	</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	
                        	<form role="form" action="userRegister" method="post"  Content-Range="bytes 0-800/801" enctype="multipart/form-data" class="registration-form"  onsubmit="return validation();">
                        		
                        		<fieldset id="f1">
		                        	<div class="form-top">
		                        		<div class="form-top-left">
		                        			<h3>步骤 1 / 3</h3>
		                            		<p>Tell us who you are:</p>
		                        		</div>
		                        		<div class="form-top-right">
		                        			<i class="fa fa-user"></i>
		                        		</div>
		                            </div>
		                            <div class="form-bottom">
				                    	<!--  <div class="form-group">
				                    		<label class="sr-only" for="form-first-name">First name</label>
				                        	<input type="text" name="form-first-name" placeholder="First name..." class="form-first-name form-control" id="form-first-name">
				                        </div>-->
				                        
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-last-name">用户名</label>
				                        	<input type="text" name="u_name" id="u_name" onblur="checkName()" placeholder="请输入用户名..." class="form-last-name form-control" >
				                            <label id="prompt_name" style="font-size:9px;display:none;"></label>
				                            
				                        </div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-last-name">真实姓名</label>
				                        	<input type="text" name="u_realname" id="u_realname" onblur="checkRealName()" placeholder="请输入真实姓名..." class="form-last-name form-control">
				                        	<label id="prompt_realname" style="font-size:9px;display:none;"></label>
				                        	
				                        </div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-email">Email</label>
				                        	<input type="text" name="u_email" id="u_email" onblur="checkEmail()" placeholder="请输入你的Email..." class="form-email form-control" >
				                        	<label id="prompt_mail" style="display:none;font-size:9px;"></label>
				                        </div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-about-yourself">简介</label>
				                        	<textarea name="u_remark" id="u_remark" onblur="checkRemark()" placeholder="请输入你的简介..." 
				                        				class="form-about-yourself form-control" ></textarea>
				                        	<label id="prompt_remark" style="font-size:9px;display:none;"></label>
				                        </div>
				                        <button type="button" class="btn btn-next" onclick="nextfun()">下一步</button>
				                    </div>
			                    </fieldset>
			                    
			                    <fieldset style="display:none" id="f2">
		                        	<div class="form-top">
		                        		<div class="form-top-left">
		                        			<h3>步骤 2 / 3</h3>
		                            		<p>Set up your account:</p>
		                        		</div>
		                        		<div class="form-top-right">
		                        			<i class="fa fa-key"></i>
		                        		</div>
		                            </div>
		                            <div class="form-bottom">
		                               <div class="form-group" >
							                <a class="select" id="select">
												<select style="height:50px;width:505px" id="u_gender" name="u_gender">
												<option style="height:25px;" value="0">请选择性别：</option>
												<option style="height:25px;text-align:center" value="1">男</option>
												<option style="height:25px;text-align:center" value="2">女</option>
												</select>
											</a> 
					                    </div>
					                    <div class="form-group" >
							                <a class="select" id="select">
							                <span class="cur-select"></span> 
												<select style="height:50px;width:505px" id="u_edu" name="u_edu">
												<option style="height:25px;"value="0">请选择学历：</option>
												<option style="height:25px;text-align:center"value="1">博士</option>
												<option style="height:25px;text-align:center"value="2">硕士</option>
												<option style="height:25px;text-align:center"value="3">本科</option>
												<option style="height:25px;text-align:center"value="4">本科以下</option>			
												</select>
											</a> 
					                    </div>
				                       <div class="form-group">
				                    		<label class="sr-only" for="form-facebook">年龄</label>
				                        	<input type="text" name="u_age" id="u_age" onblur="checkAge()" placeholder="输入您的年龄..." class="form-facebook form-control" >
				                            <label id="prompt_age" style="font-size:9px;display:none;"></label>
				                        </div>
				                        <div class="form-group">
				                    		<label class="sr-only" for="form-password">密码</label>
				                        	<input type="password" name="u_pwd"  id="u_pwd" onblur="checkps()" placeholder="请输入你的密码..." class="form-password form-control">
				                        	<label id="prompt_ps" style="font-size:9px;display:none;"></label>
				                        </div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-repeat-password">重复密码</label>
				                        	<input type="password" name="u_repeat_pwd" id="u_repeat_pwd" onblur="checkcps()" placeholder="再次输入密码..." 
				                        				class="form-repeat-password form-control" >
				                        	<label id="prompt_cps" style="font-size:9px;display:none;"></label>
				                        </div>
				                        <button type="button" class="btn btn-previous" onclick="prefun2()">上一步</button>
				                        <button type="button" class="btn btn-next" onclick="nextfun2()">下一步</button>
				                    </div>
			                    </fieldset>
			                    
			                    <fieldset style="display:none" id="f3">
		                        	<div class="form-top">
		                        		<div class="form-top-left">
		                        			<h3>步骤 3 / 3</h3>
		                            		<p>Social media profiles:</p>
		                        		</div>
		                        		<div class="form-top-right">
		                        			<i class="fa fa-twitter"></i>
		                        		</div>
		                            </div>
		                            <div class="form-bottom">
		                                <div class="form-group" >
							               <!--  <select id="id_identify" name="identify"  >
								                <option style="text-align:center;height:30px" value="0">学生</option>
								                <option style="text-align:center;height:30px" value="1">教师</option>
							                </select>-->
							                <a class="select" >
												<select style="height:50px;width:505px" id="identify" name="identify"onchange="onchangeSelect();">		
												<option style="height:25px;text-align:center" value="0">基金经理</option>
												<option style="height:25px;text-align:center" value="1">成果提供者</option>
												</select>
											</a> 
					                    </div>
				                    	<div id="u_qualification1" class="form-group">
				                    		<label class="sr-only" for="form-facebook">级别</label>
				                        	<input type="text" name="ex_qualification"id="ex_qualification"  onblur="checkExq()" placeholder="输入您的级别..." class="form-facebook form-control" >
				                            <label id="prompt_exq" style="font-size:9px;display:none;"></label>
				                        </div>
				                        <div  id="u_expertise" class="form-group">
				                        	<label class="sr-only" for="form-twitter">工作年限</label>
				                        	<input type="text" name="ex_expertise"  id="ex_expertise" onblur="checkExe()" placeholder="输入您的工作年限..." class="form-twitter form-control">
				                            <label id="prompt_exe" style="font-size:9px;display:none;"></label>
				                        </div>
				                        <div  id="u_businessfield" class="form-group">
				                        	<label class="sr-only" for="form-google-plus">业务擅长领域</label>
				                        	<input type="text" name="ex_businessfield"  id="ex_businessfield"  onblur="checkExb()" placeholder="输入您的业务擅长领域..." class="form-google-plus form-control">
				                            <label id="prompt_exb" style="font-size:9px;display:none;"></label>
				                        </div>
				                        <div  id="u_qualification2" class="form-group" style="display:none">
				                    		<label class="sr-only" for="form-facebook" >资历</label>
				                        	<input type="text" name="rp_qualification" id="rp_qualification" onblur="checkRpq()" placeholder="输入您的资历..." class="form-facebook form-control" >
				                            <label id="prompt_rpq" style="font-size:9px;display:none;"></label>
				                        </div>
				                        <div  id="u_field" class="form-group" style="display:none">
				                        	<label class="sr-only" for="form-twitter">研究方向</label>
				                        	<input type="text" name="rp_field" id="rp_field" onblur="checkRpf()" placeholder="输入您的研究方向..." class="form-twitter form-control" >
				                            <label id="prompt_rpf" style="font-size:9px;display:none;"></label>
				                        </div>
				                        <div  id="u_research" class="form-group" style="display:none">
				                        	<label class="sr-only" for="form-google-plus" style="display:none">科研情况</label>
				                        	<input type="text" name="rp_research" id="rp_research" onblur="checkRpr()" placeholder="输入您的科研情况..." class="form-google-plus form-control" >
				                            <label id="prompt_rpr" style="font-size:9px;display:none;"></label>
				                        </div>
				                        <div class="form-group" >
				                             <p  style="display:inline">上传资历凭证:&nbsp&nbsp&nbsp
				                             <input type="file" name="file4" style="display:inline" >
				                             </p>
				                        </div>
				                       
				                        <button type="button" class="btn btn-previous" onclick="prefun3()">上一步</button>
				                        <button type="submit" class="btn">注册</button>
				                    </div>
			                    </fieldset>
		                    
		                    </form>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>


        <!-- Javascript -->
        <script src="<%= basePath%>/static/media/assets/js/jquery-1.11.1.min.js"></script>
        <script src="<%= basePath%>/static/media/assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="<%= basePath%>/static/media/assets/js/jquery.backstretch.min.js"></script>
        <script src="<%= basePath%>/static/media/assets/js/retina-1.1.0.min.js"></script>
        <script src="<%= basePath%>/static/media/assets/js/scripts.js"></script>
        
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->

    </body>

</html>