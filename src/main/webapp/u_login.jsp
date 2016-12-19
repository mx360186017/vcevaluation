<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0032)http://beian.gov.cn/portal/index -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>风险投资评估系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=9">
<link href="<%= basePath%>/static/adStyle/global/css/bootstrap.css" rel="stylesheet" media="screen">
<link href="<%= basePath%>/static/adStyle/global/css/bootstrap-responsive.css" rel="stylesheet"
	media="screen">
<link href="<%= basePath%>/static/adStyle/global/css/css.css" rel="stylesheet" media="screen">
<link href="<%= basePath%>/static/adStyle/global/css/css2.css" rel="stylesheet" media="screen">
<link rel="stylesheet" href="<%= basePath%>/static/adStyle/global/css/milk.css">
<!-- 表单验证 -->

<style>
.error {
	position: absolute;
	top: 60px;
	left: 278px;
	width: 300px;
}

.error2 {
	position: absolute;
	top: 98px;
	left: 278px;
	width: 300px;
}

.error3 {
	position: absolute;
	top: 135px;
	left: 278px;
	width: 300px;
}
</style>

</head>
<body>
	<div class="wrapper" style="position: relative;">
		<!-- 页面头 -->

		<!-- start:头部 -->
		<div class="container container1">
			<div class="navbar-header page-scroll">
				<a class="logo">
					<h3>风险投资评估系统</h3>
				</a>

				<div class="logo-right index-top">
					<div class="input-append pull-right">
						<input class="span2" type="text" style="border-right: 0px;"
							placeholder="项目查询"> <span class="add-on"><i
							class="icon-search"
							;style="background-image: url('<%= basePath%>/static/adStyle/global/img/glyphicons-halflings.png')"></i></span>
							
					</div>
					<ul class="nav nav-pills z-index">
						<li class="active"><a href="ventureAssess.html">首页</a></li>
						<li><a href="/vcevaluation/toAboutMe">关于我们</a></li>
						<li><a href="#">评估准备</a></li>
						<li><a href="#">评估实施</a></li>
						<li><a href="#">产业化项目</a></li>
						<li><a href="#">评估专家</a></li>
						<li><a href="#" onclick="loading()">评估方案</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="heng"
			style="background-image: url('<%= basePath%>/static/adStyle/global/img/index-heng.png')"></div>
		<!-- end:头部 -->
		<div id="over1" class="over"></div>
		<div id="layout1" class="layout">
			<img src="<%= basePath%>/static/adStyle/global/img/loading2.gif">
		</div>
		<script type="text/javascript">
        function loading() {
            document.getElementById("over").style.display = "block";
            document.getElementById("layout").style.display = "block";
        }
    </script>
		<!-- start:登录 -->
		<div class="z_indexk">
			<div class="z_adbg"
				style="background-image: url('<%= basePath%>/static/adStyle/global/img/adbg.png')">
				<div class="container container1">
					<div class="z_adleft">
						<div class="xuanch"></div>
						<div class="liucheng">
							<img src="<%= basePath%>/static/adStyle/global/img/liucheng.png">
						</div>
					</div>
					<!-- start:登录框 -->
					<div class="loginbg" style="position: relative; width: 330px;">
						<!-- start:tab页 -->
						<ul class="nav nav-tabs login_tab" id="myTab"
							style="margin-top: -16px;">
							<li class="active"><a
								href="http://beian.gov.cn/portal/index#ptyh" data-toggle="tab">普通用户登录</a>
							</li>
							<!--  <li><a href="#jrs" data-toggle="tab">接入商登录</a></li> -->
						</ul>
						<!-- start:tab页 -->
						<!-- start:tab页内容 -->
						<div id="myTabContent" class="tab-content tab_tablek">
							<form role="form" action="login1" method="post" class="login-form" onsubmit="return checkNamePwd();">								<div class="tab-pane fade active in" id="ptyh">
									<ul class="unstyled controls logink">
										<li class="row-fluid"><label id="laccount" for="account"
											class=" text-right z_color">用户名</label>&nbsp; 
											
											 <input
											class="z_input" type="text" name="u_name" id="u_name"
											maxlength="30">
											<label id="prompt_name" style="font-size:9px;display:none;"></label>
											<!-- <input
											type="hidden" id="accountFlag"> <span
											id="accountRequired" class="error" style="display: none;"><img
												src="global/img/unchecked.gif"><font color="red">请输入账号</font></span>
											<span id="accountNum" class="error" style="display: none;"><img
												src="global/img/unchecked.gif"><font color="red">账号最少六位</font></span>
											<span id="accountRule" class="error" style="display: none;"><img
												src="global/unchecked.gif"><font color="red">账号为字母、数字、下划线</font></span>
											<span id="accountR" class="error" style="display: none;"><img
												src="global/checked.gif"></span> <span class="status error"></span> -->
										</li>
										<li class="row-fluid"><label id="lpwd" for="pwd"
											class="text-right z_color">密码</label>&nbsp; 
											
											<input class="z_input" type="password" name="u_pwd" id="u_pwd" maxlength="20">
											<label id="prompt_ps" style="font-size:9px;display:none;"></label>
											<!-- <input type="hidden" id="pwdFlag"> 
											<span
											id="pwdRequired" class="error2" style="display: none;"><img
												src="global/img/unchecked.gif"><font color="red">请输入密码</font></span>
											<span id="pwdNum" class="error2" style="display: none;"><img
												src="global/img/unchecked.gif"><font color="red">密码最少六位</font></span>
											<span id="pwdR" class="error2" style="display: none;"><img
												src="global/img/checked.gif"></span> <span
											class="status error2"></span> -->
											</li>
									
										<li class="row-fluid" style="margin-top: 5px;">
											<!-- <button class="btn btn-danger btn-large" type="submit" style="width:230px; margin-left:35px;" id="btn">登录</button>-->
											<input type="hidden" value="" name="zz" id="zz">
											<button href="javascript:void(0)"
												class="btn btn-danger btn-large"
												style="width: 220px; margin-left: 35px;" id="btn"
												onclick="submit">登录</button>
										</li>
										<button class="row-fluid" style="width:80%;border:0px;background-color:transparent">
											<label class="text-left z_color "
												style="width: 110px;margin-left:13%">没有账号？<a
												href="register">注册</a></label>

										</button>
									</ul>
								</div>
							</form>
							<div class="tab-pane fade" id="jrs"></div>
						</div>
						<!-- end:tab页内容 -->
					</div>
					<!-- end:登录框 -->
				</div>
			</div>
			<!-- end:登录 -->
			<div id="over" class="over"></div>
			<div id="layout" class="layout">
				<img src="global/img/loading2.gif">
			</div>
			<!-- start:内容 -->
			<div class="container container1 index_content">
				<div class="index_left">
					<div class="tongzhi"
						style="overflow: hidden; background-image: url('<%= basePath%>/static/adStyle/global/img/tongzhi.png')">
						<p class="z_p">
							<span class="tit">评审专家</span>
							<span class="more"><a href="/VentureAssessPlatform/expert"><img src="<%= basePath%>/static/adStyle/global/img/1.png"></a></span>
						</p>

						<marquee behavior="scroll" direction="down" loop="-1"
							scrollamount="2" onmouseout="this.start()"
							onmouseover="this.stop()" vspace="10" height="145"
							style="margin-top: 10px; margin-bottom: 10px; height: 145px;">
							<img src="../global/img/1.png"/>
							<!--  <ul class="tz_list">
                               
							</ul>-->
						</marquee>
					</div>
					<div class="gongshi"
						style="background-image: url('<%= basePath%>/static/adStyle/global/img/gongshi.png')">
						<p class="z_p">
							<span class="tit">常见问题</span> <span class="more"><a
								href="#"><img src="<%= basePath%>/static/adStyle/global/img/more.gif"></a></span>
						</p>
						<ul class="tz_list">


							<li><a title="风险投资的涵义" href="#"> <span class="tz_tit">风险投资的涵义</span>
									<!-- <span> [2016-01-03]</span> -->
							</a></li>



							<li><a title="风险投资价值评估对象和因素" href="#"> <span
									class="tz_tit">风险投资价值评估对象和因素</span> <!-- <span> [2015-08-06]</span> -->
							</a></li>



							<li><a title="风险投资的价值" href="#"> <span class="tz_tit">风险投资的价值</span>
									<!-- <span> [2015-08-15]</span> -->
							</a></li>








						</ul>
					</div>
				</div>
				<div class="index_right">
					<div class="content">
						<h5>
							产业化项目预览<span><a
								href="http://beian.gov.cn/portal/recordNotice"><img
									src="global/img/more.gif"></a></span>
						</h5>
						<ul class="tz_list listr">


							<li><a title="中国公安部：依法打击网络犯罪 加强国际执法合作 "
								href="http://beian.gov.cn/portal/topicDetail?id=43">中国公安部：依法打击网络犯罪
									加强国际执法合作 </a></li>



							<li><a title="公安机关关闭3家违法网站"
								href="http://beian.gov.cn/portal/topicDetail?id=46">公安机关关闭3家违法网站</a>
							</li>



							<li><a
								title="公安机关打击整治网络黑客犯罪活动成效显著   侦破黑客犯罪案件400余起 抓获违法犯罪嫌疑人900余名  "
								href="http://beian.gov.cn/portal/topicDetail?id=45">公安机关打击整治网络黑客犯罪活动成效显著
									侦破黑客犯罪案件400余起 抓获违法犯罪嫌疑人900余名 </a></li>



							<li><a title="公安部指挥破获特大网络赌博案 "
								href="http://beian.gov.cn/portal/topicDetail?id=44">公安部指挥破获特大网络赌博案
							</a></li>


						</ul>
					</div>
					<div class="content">
						<h5>
							政策法规<span><a href="http://beian.gov.cn/portal/recordIssue"><img
									src="global/img/more.gif"></a></span>
						</h5>
						<ul class="tz_list listr">


							<li><a title="关于科学技术体制改革的决定"
								href="http://beian.gov.cn/portal/topicDetail?id=42">关于科学技术体制改革的决定</a>
							</li>



							<li><a title="国家高新技术产业开发区若干政策的暂行规定 "
								href="http://beian.gov.cn/portal/topicDetail?id=40">国家高新技术产业开发区若干政策
									的暂行规定 </a></li>



							<li><a title="中华人民共和国促进科技成果转化法"
								href="http://beian.gov.cn/portal/topicDetail?id=39">中华人民共和国促进科技成果转化法</a>
							</li>



							<li><a title="关于印发《互联网危险物品信息发布管理规定》的通知"
								href="http://beian.gov.cn/portal/topicDetail?id=37">关于印发《互联网危险物品信息发布管理规定》的通知</a>
							</li>



							<li><a title="企业管理百科全书 "
								href="http://beian.gov.cn/portal/topicDetail?id=41">企业管理百科全书
							</a></li>

						</ul>
					</div>
					<div class="content" style="margin-top: 10px;">
						<h5>
							评估参数<span><a
								href="http://beian.gov.cn/portal/downloadcenter"><img
									src="global/img/more.gif"></a></span>
						</h5>
						<ul class="tz_list listr">



							<li><a href="http://beian.gov.cn/portal/downloadFile?id=6">
									<span>互联网站安全服务平台操作指南</span>

							</a></li>



							<li><a href="http://beian.gov.cn/portal/downloadFile?id=5">
									<span>互联网信息服务单位网络安全责任告知书</span>

							</a></li>



							<li><a href="http://beian.gov.cn/portal/downloadFile?id=3">
									<span>信息安全技术互联网服务安全评估基本程序及要求</span>

							</a></li>



							<li><a href="http://beian.gov.cn/portal/downloadFile?id=2">
									<span>信息安全技术互联网交互式服务安全保护要求</span>

							</a></li>



							<li><a href="http://beian.gov.cn/portal/downloadFile?id=25">
									<span>互联网信息服务安全检查意见书</span>

							</a></li>




						</ul>
					</div>
					<div class="content" style="margin-top: 10px;">
						<h5>
							成果预览<span><a
								href="http://beian.gov.cn/portal/recordPolicies"><img
									src="global/img/more.gif"></a></span>
						</h5>
						<ul class="tz_list listr">


							<li><a title="互联网信息服务单位网络安全责任告知书"
								href="http://beian.gov.cn/portal/topicDetail?id=47">互联网信息服务单位网络安全责任告知书</a>
							</li>



							<li><a title="计算机信息网络国际联网安全保护管理办法（公安部第33号令） "
								href="http://beian.gov.cn/portal/topicDetail?id=13">计算机信息网络国际联网安全保护管理办法（公安部第33号令）
							</a></li>



							<li><a title="全国人民代表大会常务委员会关于加强网络信息保护的决定"
								href="http://beian.gov.cn/portal/topicDetail?id=23">全国人民代表大会常务委员会关于加强网络信息保护的决定</a>
							</li>



							<li><a title="关于规范网络转载版权秩序的通知"
								href="http://beian.gov.cn/portal/topicDetail?id=20">关于规范网络转载版权秩序的通知</a>
							</li>



							<li><a title="互联网新闻信息服务单位约谈工作规定"
								href="http://beian.gov.cn/portal/topicDetail?id=19">互联网新闻信息服务单位约谈工作规定</a>
							</li>




						</ul>
					</div>
				</div>
				<!--  <p class="text-left lianjie" style="clear:both">友情链接</p>
      <ul class="inline lianjie_a">
        <li><a href="#">中华人民共和国公安部</a></li>
        <li><a href="#">中华人民共和国工业和信息化部</a></li>
        <li><a href="#">中国万网</a></li>
        <li><a href="#">美橙互联</a></li>
      </ul> -->
			</div>
			<!-- end:内容 -->
		</div>
		<!-- 页面尾 -->


		<div class="z_footerk">
			<p class="z_gap"></p>

			<div class="z_footer">
				<p class="text-center">
					Copyright2015 SICD社会复杂数据智能处理实验室 All Rights Reserved
					<!-- <br/>公安机关备案号:京010202000001号 -->
					<!--  <a href="javascript:void(0)" onClick="recordsform()">京ICP备030173号</a> -->
					<br>
					<!--         建议使用1024*768以上分辨率浏览 <br/> -->
					<!-- 地址：北京市东长安街14号 -->

					京ICP备05070602号&nbsp;&nbsp;&nbsp;
					<!--  邮编：100741 -->
					邮箱：<a href="mailto:support@beian.gov.cn">support@beian.gov.cn</a><br>
				</p>

				<div style="width: 400px; margin: 0 auto; padding: 0;">
					<a target="_blank"
						href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=11010102002019"
						style="display: inline-block; text-decoration: none; height: 20px; line-height: 20px;">
						<!--<img
                    src="global/img/ghs.png" style="float:left;">-->

						<p
							style="float: left; height: 20px; line-height: 20px; margin: 0px 0px 0px 5px; color: #666666;">SICD社会复杂数据智能处理实验室
							11010102002019号</p>&nbsp;&nbsp;&nbsp;建议使用1024*768以上分辨率浏览
					</a>
				</div>
				<p></p>

				<form id="recordform"
					action="http://beian.gov.cn/portal/registerSystemInfo"
					method="post">
					<input type="hidden" name="recordcode" value="京ICP备030173号">
				</form>
			</div>
		</div>
<script src="<%= basePath%>/static/adStyle/global/js/jquery.js"></script>
<script src="<%= basePath%>/static/adStyle/global/js/jquery-1.11.1.js"></script>
<script src="<%= basePath%>/static/adStyle/global/js/bootstrap.min.js"></script>
<script src="<%= basePath%>/static/adStyle/global/js/jquery.mockjax.js"></script>
<script src="<%= basePath%>/static/adStyle/global/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%= basePath%>/static/adStyle/global/js/login.js"></script>
<script type="text/javascript" src="<%= basePath%>/static/adStyle/global/js/recordquery.js"></script>
<script type="text/javascript">
function checkNamePwd(){
	var u_name = $("#u_name").val();
	var u_pwd = $("#u_pwd").val();
	var result = false;
	$.ajax({
		async : false,
		type : 'post',
		url : 'checkUsernamePwd/?u_name='+u_name+"&u_pwd="+u_pwd,
		success : function(msg){
			if(msg == 'success'){
				result = true;
			}else{
				$("#prompt_ps").css("display","inline");
				$("#prompt_ps").css("color","red");
				$("#prompt_ps").html("用户名或密码错误！");
				$("#prompt_ps").css("font-size","16px");
				result = false;				
			}
		}
	});
	
	return result;
}
</script>
</body>
</html>