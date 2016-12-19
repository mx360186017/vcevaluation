<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<!-- Favicon -->
		<link rel="shortcut icon" href="<%= basePath%>/static/projectstyle/images/favicon.ico">

		<!-- Web Fonts -->
		 
		 

		<!-- Bootstrap core CSS -->
		<link href="<%= basePath%>/static/projectstyle/bootstrap/css/bootstrap.css" rel="stylesheet">

		<!-- Font Awesome CSS -->
		<link href="<%= basePath%>/static/projectstyle/fonts/font-awesome/css/font-awesome.css" rel="stylesheet">

		<!-- Fontello CSS -->
		<link href="<%= basePath%>/static/projectstyle/fonts/fontello/css/fontello.css" rel="stylesheet">

		<!-- Plugins -->
		<link href="<%= basePath%>/static/projectstyle/plugins/magnific-popup/magnific-popup.css" rel="stylesheet">
		<link href="<%= basePath%>/static/projectstyle/css/animations.css" rel="stylesheet">
		<link href="<%= basePath%>/static/projectstyle/plugins/owl-carousel/owl.carousel.css" rel="stylesheet">

		<!-- iDea core CSS file -->
		<link href="<%= basePath%>/static/projectstyle/css/style.css" rel="stylesheet">

		<!-- Color Scheme (In order to change the color scheme, replace the red.css with the color scheme that you prefer)-->
		<link href="<%= basePath%>/static/projectstyle/css/skins/red.css" rel="stylesheet">

		<!-- Custom css --> 
		<link href="<%= basePath%>/static/projectstyle/css/custom.css" rel="stylesheet">