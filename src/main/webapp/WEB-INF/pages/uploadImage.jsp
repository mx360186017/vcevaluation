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
<title>上传项目logo</title>
 <jsp:include page="/head.jsp" flush="true"/>
</head>
<script type="text/javascript">

</script>
<body>
<jsp:include page="/header1.jsp" flush="true"/>
<!-- <form name="serForm" action="/VentureAssessPlatform/springUpload2" method="post"  enctype="multipart/form-data">
<h1>采用流的方式上传文件</h1>
<input type="file" name="file">
<input type="submit" value="upload"/>
</form> -->
<div class="container">
	<form name="Form2" action="/vcevaluation/uploadImage" method="post"  enctype="multipart/form-data">
    <h1>给项目上传图片</h1>
    <input type="hidden" name="pro_id" value="${pro_id}">
    
   <input type="file" name="file" accept="image/*">
   <input type="submit" id="BtDelet" value="上传图片"/>
    <img src="static/adStyle/img/${imagePath}"  alt="Head Portraits"/>
</form>
</div>
<jsp:include page="/footer1.jsp" flush="true"/>
</body>
</html>