<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  %>
      <% String path=request.getContextPath();
     String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
     response.setHeader("Content-Range", "bytes 0-800/801");
    %>
<%@ page import="com.vcevaluation.pojo.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"">
<title>选择团队</title>

<script type="text/javascript"
	src="<%= basePath%>/static/media/js/popwin.js"></script>
	<script type="text/javascript"
	src="<%= basePath%>/static/media/js/jquery.js"></script>
<script type="text/javascript">

	var team_id;
	var team_name;
	
	//返回值到父窗口
	function returnPopValue1() {		
				
		$(window.parent.document).find('#team_id').val(team_id);
		$(window.parent.document).find('#team_name').val(team_name);	
		$(window.parent.document).find('#popWinClose').click();
	}
	
	//关闭当前窗口
	function closeWin(){
		$(window.parent.document).find('#popWinClose').click();
	}
	
	$(document).ready(function(){
		$('input[name="ids1"]').click(function(){
			team_id = $.trim( $(this).parent().parent().find('td').eq(1).text() );
			team_name = $.trim( $(this).parent().parent().find('td').eq(2).text() );			
		});		
	});
</script>
</head>
<body>

<div class="container">
	<div class="row"> 
	    <div class="span8" style="min-height: 400px;">
	    	<table class="table table-striped">
			  <tr>
			    <th width="100" height="24">选择</th>
			    <th width="129" height="24">团队编号</th>
			    <th width="177" height="24">团队名称</th>   
			  </tr>
			
			  <c:forEach items="${requestScope.list7 }" var="team">
			  <tr>
			    <td height="24"><input type="radio" name="ids1"></td>
			    <td height="24"><c:out value="${team.team_id }"/></td>
			    <td height="24"><c:out value="${team.team_name }"/></td>   
			  </tr>
			  </c:forEach>
			</table>
			
			<div class="text-center">			
				<input type="button" value="确定" class="btn btn-primary" onclick="returnPopValue1();">
				<input type="button" value="取消" class="btn" onclick="closeWin();">
			</div>
			
		</div>
	</div>	
</div>
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