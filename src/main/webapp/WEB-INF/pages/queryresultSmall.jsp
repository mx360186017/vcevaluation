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
<title>选择成果</title>

<script type="text/javascript"
	src="<%= basePath%>/static/media/js/popwin.js"></script>
	<script type="text/javascript"
	src="<%= basePath%>/static/media/js/jquery.js"></script>
<script type="text/javascript">

	var res_id;
	var res_name;

	var str_list = "";
	var str_idlist = "";
	//返回值到父窗口
	function returnPopValue() {	
		
		var addresseeList = $(':checkbox:checked');
		//在父界面显示出选择的人
		var selectList = $(window.parent.document).find('#selectList');
		var ids = $(window.parent.document).find('input[name=ids]');
		$.each(addresseeList,function(index,obj){
			
			var str = obj.value.split(',');
			
			//判断是否以及选择过			
			var flag = true;
			
			$.each(ids,function(i,v){
				if (v.value == str[0])
					flag = false;
			});
			if (flag) {
				//selectList.append('<span>' + str[1] + '</span>;');
			//	$("#selectList").html('<span>' + str[1] + '</span>;')
				selectList.append("<input type='hidden' name='ids' value=" + str[1] + ">");
				
			}
			str_list += str[1]+";"
			str_idlist += str[0]+";"
		
		});
		//selectList.append(str_list);
		selectList.html(str_list+"<input type='hidden' name='ids_list' value=" + str_idlist + ">");
		//selectList.html(str_idlist+"<input type='hidden' name='str_idlist' value=" + str_idlist + ">");
		alert(str_idlist);
		$(window.parent.document).find('#popWinClose').click();
	}
	
	//关闭当前窗口
	function closeWin(){
		$(window.parent.document).find('#popWinClose').click();
	}
	
	$(document).ready(function(){
		$('input[name="ids"]').click(function(){
			res_id = $.trim( $(this).parent().parent().find('td').eq(1).text() );
			res_name = $.trim( $(this).parent().parent().find('td').eq(2).text() );			
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
			    <th width="129" height="24">成果编号</th>
			    <th width="177" height="24">成果名称</th>   
			  </tr>
			
			  <c:forEach items="${requestScope.list6 }" var="res">
			  <tr>
			    <td height="24"><input type="checkbox" name="ids" value="${res.res_id },${res.res_name }"></td>
			    <td height="24"><c:out value="${res.res_id  }"/></td>
			    <td height="24"><c:out value="${res.res_name }"/></td>   
			  </tr>
			  </c:forEach>
			</table>
			
			<div class="text-center">			
				<input type="button" value="确定" class="btn btn-primary" onclick="returnPopValue();">
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