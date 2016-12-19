<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  %>
      <% String path=request.getContextPath();
     String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
     response.setHeader("Content-Range", "bytes 0-800/801");
    %>
    <%@ page import="java.util.*"%>
<%@ page import="com.vcevaluation.pojo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<meta name="description" content="iDea a Bootstrap-based, Responsive HTML5 Template">
<meta name="author" content="htmlcoder.me">

<!-- Mobile Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
      <jsp:include page="/head.jsp" flush="true"/>
</head>
<body>
<script type="text/javascript"
	src="<%= basePath%>/static/media/js/popwin.js"></script>
	<script type="text/javascript"
	src="<%= basePath%>/static/media/js/jquery.js"></script>
	<jsp:include page="/header1.jsp" flush="true"/>
	<script>
	var flag = 0;
function checkPname(){
		var proname=$("#pro_name").val();

	if(proname==""){
		$("#validate_proname").html("请输入项目名称");
			$("#validate_proname").css("display","inline");
			$("#validate_proname").css("color","red");
			$("#validate_proname").css("font-size","16px");
			return false;
	}else{//论文名称是否存在的验证
		$.ajax({
			type : 'post',
			url : 'getPronameValidation?pro_name='+proname,
			success : function (msg){
				if(msg == 'success'){//不存在
					$("#validate_proname").css("display","inline");
					$("#validate_proname").html("");
					flag = 1;
				}else{
					$("#validate_proname").css("display","inline");
					$("#validate_proname").html("该名称已存在！请重输");
					$("#validate_proname").css("color","red");
					$("#validate_proname").css("font-size","16px");
					
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
	<div class="container">
		<div class="row" style="min-height: 400px">
			<div class="span1"></div>

			<div class="span9">
				<form name="form1" method="post" id="form1" action="" enctype="multipart/form-data" Content-Range="bytes 0-800/801">
					<div style="text-align: center;">
						<h3>新建项目</h3>
					</div>
					<table border="0" class="table table-striped">
						
                        <tr>
							<td>项目名称</td>
							<td><input type="text" name="pro_name" id="pro_name" onblur="checkPname()" style="height:35px;width: 75%" datatype="*"></td>
							 <label id="validate_proname" style="font-size:9px;display:none;"></label>
						</tr>
					   
						<tr>
							<td>选择项目包含的成果</td>
							<td>
							
							<div id="selectList"></div>	 
								<input type="button" name="addresseeBtn1" id="addresseeBtn1" value="选择成果" class="btn btn-gray btn-sm" >
								<input type="button" name="button" id="addresseeBtn3" value="清空" class="btn btn-light-gray btn-sm">
							</td>
						</tr>
						<tr>
	                    <td>选择团队</td>
		                     <td><input type="text" name="team_name" id="team_name" readonly style="height:35px;width: 75%">
		                      <input type="hidden" name="team_id" id="team_id">
		                      <input type="button" name="button" id="teamBtn" value="选择团队" class="btn btn-gray btn-sm"></td>
	                    </tr>
	                    <tr>
	                        <td>硬件与技术是否配套</td>
	                        <td><select class="form-control" id="pro_fit" name="pro_fit" style="width: 75%">
									<option value="1">硬件十分先进，能支持技术</option>
									<option value="2">硬件基本能支持技术</option>
									<option value="3">硬件还有待改进来满足此次项目所需技术</option>
							</select>
							</td>
	                    </tr>
	                    <tr>
	                       <td>涉及领域是否有最近政策支持</td>
	                       <td>
	                       <select class="form-control" id="pro_support" name="pro_support" style="width: 75%">
									<option value="0">没有政策支持</option>
									<option value="1">有政策支持</option>
							</select>
							</td>
	                    </tr>
	                     <tr>
	                       <td>涉及领域处于什么时期</td>
	                       <td>
	                       <select class="form-control" id="pro_period" name="pro_period" style="width: 75%">
									<option value="1">市场爆发期</option>
									<option value="2">市场增长期</option>
									<option value="3">市场稳定期</option>
									<option value="4">市场衰退期或不确定</option>
							</select></td>
	                    </tr>
	                     <tr>
	                       <td>银行贷款(:万元)</td>
	                       <td><input type="text" name="pro_bank" id="pro_bank" style="height:35px;width: 75%" datatype="*"></td>
	                    </tr>
	                    
	                     <tr>
	                       <td>企业自筹资金(:万元)</td>
	                       <td><input type="text" name="pro_capital" id="pro_capital" style="height:35px;width: 75%" datatype="*"></td>
	                    </tr>
	                     
	                    <tr>
	                       <td>去年企业年利润</td>
	                       <td>
	                       <select class="form-control" id="pro_lastbenifit" name="pro_lastbenifit" style="width: 75%" >
	                       <option value="0">年利润为0或亏损</option>
	                       <option value="1">1% - 10%</option>
	                       <option value="2">10% - 20%</option>
	                       <option value="3">20% - 30%</option>
	                       <option value="4">30%以上</option>
	                       </select>
	                       </td>
	                    </tr>
						<tr>
							<td>项目计划</td>
							<td><textarea name="pro_plan" id="pro_plan"
									rows="10" style="width: 90%;" datatype="*"></textarea></td>
						</tr>
						<tr>
							<td>项目方案</td>
							<td><textarea name="pro_scheme" id="pro_scheme"
									rows="13" style="width: 90%;" datatype="*"></textarea></td>
						</tr>
						<tr>
						<td> 上传项目相关文件</td>
						 <td><input type="file" id="file1" name="file1" ><br/>   </td>
						 </tr> 
					</table>
					<div align="center">

		                   <input type="button"
							name="creatManyBtn" id="creatManyBtn" value="创建"
							class="btn btn-primary">  
						   <input type="button"
							name="button" id="button" value="取消" class="btn btn-danger">
					</div>
				</form>
			</div>
		</div>
		</div>
		<jsp:include page="/footer1.jsp" flush="true"/>
			<script type="text/javascript">
	
			$(document).ready(function(e) {
		
				//新建项目
				 $('#creatManyBtn').click(function(e) {
		        $('#form1').attr('action','creatProject');
		        $('#form1').submit();
		        });
				
				//选择多个成果模态窗口
				$('#addresseeBtn1').click(function(){			
					popWin.showWin("600","500","选择多个成果","selectPassResultSmall");
				});
				//选择团队模态窗口
				$('#teamBtn').click(function(){			
					popWin.showWin("600","500","选择团队","selectTeamSmall");				
				});
				//清空多选
				$('#addresseeBtn3').click(function() {
						$('#selectList').empty();
				});

		});
	</script>
	
<!-- js files -->
<script src="<%= basePath%>/static/media/js/jquery.min.js"></script>
<script src="<%= basePath%>/static/media/js/bootstrap.min.js"></script>
<script src="<%= basePath%>/static/media/js/SmoothScroll.min.js"></script>
<script src="<%= basePath%>/static/media/js/index.js"></script>
<script src="<%= basePath%>/static/media/js/top.js"></script>
<script src="<%= basePath%>/static/media/js/jqBootstrapValidation.js"></script>
<!--  <script src="<%= basePath%>/static/media/js/contact_me.js"></script>	--> 
<!-- /js files -->
	
</body>
</html>