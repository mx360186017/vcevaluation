<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  %>
      <% String path=request.getContextPath();
     String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
     response.setHeader("Content-Range", "bytes 0-800/801");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>文件上传</title>

</head>
<body>
	<form action="uploadimage" enctype="multipart/form-data" Content-Range="bytes 0-800/801" method="post">
		  上传用户：<input type="text" name="username"><br/>
	              上传文件：<input type="file" id="file1" name="file1" ><br/>       
                          上传图片：<input type="file"  id="file2" name="file2" accept="image/*"><br/>
         <input type="submit" value="提交">
	</form>
</body>
</html>