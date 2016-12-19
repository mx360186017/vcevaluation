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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<!-- footer start (Add "light" class to #footer in order to enable light footer) -->
	<!-- ================ -->
	<footer id="footer">

		<!-- .footer start -->
		<!-- ================ -->
		<div class="footer">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<div class="footer-content">
							<div class="logo-footer"><img id="logo-footer" src="<%= basePath%>/static/projectstyle/images/logo_red_footer.png" alt=""></div>
							<div class="row">
								<div class="col-sm-6">
									<p>Lorem ipsum dolor sit amet, consect tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim ven.</p>
									<ul class="social-links circle">
										<li class="facebook"><a target="_blank" href="http://sc.chinaz.com"><i class="fa fa-facebook"></i></a></li>
										<li class="twitter"><a target="_blank" href="http://sc.chinaz.com"><i class="fa fa-twitter"></i></a></li>
										<li class="googleplus"><a target="_blank" href="http://sc.chinaz.com"><i class="fa fa-google-plus"></i></a></li>
										<li class="skype"><a target="_blank" href="http://sc.chinaz.com"><i class="fa fa-skype"></i></a></li>
										<li class="linkedin"><a target="_blank" href="http://sc.chinaz.com"><i class="fa fa-linkedin"></i></a></li>
									</ul>
								</div>
								<div class="col-sm-6">
									<ul class="list-icons">
										<li><i class="fa fa-map-marker pr-10"></i> One infinity loop, 54100</li>
										<li><i class="fa fa-phone pr-10"></i> +00 1234567890</li>
										<li><i class="fa fa-fax pr-10"></i> +00 1234567891 </li>
										<li><i class="fa fa-envelope-o pr-10"></i> info@idea.com</li>
									</ul>
								</div>
							</div>
							<a href="page-about.html" class="link"><span>Read More</span></a>
						</div>
					</div>
					<div class="space-bottom hidden-lg hidden-xs"></div>
					<div class="col-sm-6 col-md-2">
						<div class="footer-content">
							<h2>Links</h2>
							<nav>
								<ul class="nav nav-pills nav-stacked">
									<li><a href="index.html">Home</a></li>
									<li class="active"><a href="blog-right-sidebar.html">Blog</a></li>
									<li><a href="portfolio-3col.html">Portfolio</a></li>
									<li><a href="page-about.html">About</a></li>
									<li><a href="page-contact.html">Contact</a></li>
								</ul>
							</nav>
						</div>
					</div>
					<div class="col-sm-6 col-md-3 col-md-offset-1">
						<div class="footer-content">
							<h2>Latest Projects</h2>
							<div class="gallery row">
								<div class="gallery-item col-xs-4">
									<div class="overlay-container">
										<img src="<%= basePath%>/static/projectstyle/images/gallery-1.jpg" alt="">
										<a href="portfolio-item.html" class="overlay small">
											<i class="fa fa-link"></i>
										</a>
									</div>
								</div>
								<div class="gallery-item col-xs-4">
									<div class="overlay-container">
										<img src="<%= basePath%>/static/projectstyle/images/gallery-2.jpg" alt="">
										<a href="portfolio-item.html" class="overlay small">
											<i class="fa fa-link"></i>
										</a>
									</div>
								</div>
								<div class="gallery-item col-xs-4">
									<div class="overlay-container">
										<img src="<%= basePath%>/static/projectstyle/images/gallery-3.jpg" alt="">
										<a href="portfolio-item.html" class="overlay small">
											<i class="fa fa-link"></i>
										</a>
									</div>
								</div>
								<div class="gallery-item col-xs-4">
									<div class="overlay-container">
										<img src="<%= basePath%>/static/projectstyle/images/gallery-4.jpg" alt="">
										<a href="portfolio-item.html" class="overlay small">
											<i class="fa fa-link"></i>
										</a>
									</div>
								</div>
								<div class="gallery-item col-xs-4">
									<div class="overlay-container">
										<img src="<%= basePath%>/static/projectstyle/images/gallery-5.jpg" alt="">
										<a href="portfolio-item.html" class="overlay small">
											<i class="fa fa-link"></i>
										</a>
									</div>
								</div>
								<div class="gallery-item col-xs-4">
									<div class="overlay-container">
										<img src="<%= basePath%>/static/projectstyle/images/gallery-6.jpg" alt="">
										<a href="portfolio-item.html" class="overlay small">
											<i class="fa fa-link"></i>
										</a>
									</div>
								</div>
								<div class="gallery-item col-xs-4">
									<div class="overlay-container">
										<img src="<%= basePath%>/static/projectstyle/images/gallery-7.jpg" alt="">
										<a href="portfolio-item.html" class="overlay small">
											<i class="fa fa-link"></i>
										</a>
									</div>
								</div>
								<div class="gallery-item col-xs-4">
									<div class="overlay-container">
										<img src="<%= basePath%>/static/projectstyle/images/gallery-8.jpg" alt="">
										<a href="portfolio-item.html" class="overlay small">
											<i class="fa fa-link"></i>
										</a>
									</div>
								</div>
								<div class="gallery-item col-xs-4">
									<div class="overlay-container">
										<img src="<%= basePath%>/static/projectstyle/images/gallery-9.jpg" alt="">
										<a href="portfolio-item.html" class="overlay small">
											<i class="fa fa-link"></i>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="space-bottom hidden-lg hidden-xs"></div>
			</div>
		</div>
		<!-- .footer end -->

		<!-- .subfooter start -->
		<!-- ================ -->
		<div class="subfooter">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<p>Copyright &copy; 2015.Company name All rights reserved.<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
					</div>
					<div class="col-md-6">
						<nav class="navbar navbar-default" role="navigation">
							<!-- Toggle get grouped for better mobile display -->
							<div class="navbar-header">
								<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-2">
									<span class="sr-only">Toggle navigation</span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
								</button>
							</div>   
							<div class="collapse navbar-collapse" id="navbar-collapse-2">
								<ul class="nav navbar-nav">
									<li><a href="index.html">Home</a></li>
									<li><a href="page-about.html">About</a></li>
									<li><a href="blog-right-sidebar.html">Blog</a></li>
									<li><a href="portfolio-3col.html">Portfolio</a></li>
									<li><a href="page-contact.html">Contact</a></li>
								</ul>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>
		<!-- .subfooter end -->

	</footer>
	<!-- footer end -->
	
	
		</div>
		<!-- page-wrapper end -->

		<!-- JavaScript files placed at the end of the document so the pages load faster
		================================================== -->
		<!-- Jquery and Bootstap core js files -->
		<script type="text/javascript" src="<%= basePath%>/static/projectstyle/plugins/jquery.min.js"></script>
		<script type="text/javascript" src="<%= basePath%>/static/projectstyle/bootstrap/js/bootstrap.min.js"></script>

		<!-- Modernizr javascript -->
		<script type="text/javascript" src="<%= basePath%>/static/projectstyle/plugins/modernizr.js"></script>

		<!-- Isotope javascript -->
		<script type="text/javascript" src="<%= basePath%>/static/projectstyle/plugins/isotope/isotope.pkgd.min.js"></script>

		<!-- Owl carousel javascript -->
		<script type="text/javascript" src="<%= basePath%>/static/projectstyle/plugins/owl-carousel/owl.carousel.js"></script>

		<!-- Magnific Popup javascript -->
		<script type="text/javascript" src="<%= basePath%>/static/projectstyle/plugins/magnific-popup/jquery.magnific-popup.min.js"></script>

		<!-- Appear javascript -->
		<script type="text/javascript" src="<%= basePath%>/static/projectstyle/plugins/jquery.appear.js"></script>

		<!-- Sharrre javascript -->
		<script type="text/javascript" src="<%= basePath%>/static/projectstyle/plugins/jquery.sharrre.js"></script>

		<!-- Count To javascript -->
		<script type="text/javascript" src="<%= basePath%>/static/projectstyle/plugins/jquery.countTo.js"></script>

		<!-- Parallax javascript -->
		<script src="<%= basePath%>/static/projectstyle/plugins/jquery.parallax-1.1.3.js"></script>

		<!-- Contact form -->
		<script src="<%= basePath%>/static/projectstyle/plugins/jquery.validate.js"></script>

		<!-- Initialization of Plugins -->
		<script type="text/javascript" src="<%= basePath%>/static/projectstyle/js/template.js"></script>

		<!-- Custom Scripts -->
		<script type="text/javascript" src="<%= basePath%>/static/projectstyle/js/custom.js"></script>

        <script src="<%= basePath%>/static/My97DatePicker/WdatePicker.js" type="text/javascript"></script>

</body>
</html>