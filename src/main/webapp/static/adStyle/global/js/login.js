/**
 * 验证码
 */
function validCodeCheck() {
	$("validCodeFlag").val("");
	var validCode = $("#validCode").val();
	$("#validCodeRequired").hide();
	$("#validCodeE").hide();
	$("#validCodeR").hide();
	if (validCode.length == 4) {// 验证码
		$.post("../portal/verCode?t=4&code=" + validCode, function(data) {
			$("#validCodeFlag").val("");
			if (data == 1) {// 验证成功
				$("#validCodeFlag").val("1");
				$("#validCodeR").show();
			} else {
				$("#validCodeFlag").val("");
				$("#validCodeE").show();
			}
		});
	} else if ("" == validCode) {// 验证码为空
		$("validCodeFlag").val("");
		$("#validCodeRequired").show();
	} else {
		$("#validCodeFlag").val("");
		$("#validCodeE").show();
	}
}
/**
 * 账号
 */
/*function accountCheck() {
	$("#accountFlag").val('');
	var account = $("#account").val();
	$("#accountRequired").hide();
	$("#accountNum").hide();
	$("#accountRule").hide();
	$("#accountR").hide();

	if (/^[a-zA-Z0-9_]{1,}$/.test(account)) {// 数字、字母、下划线
		if (charStatisticsNumber(account) >= 6) {// 账号大于、等于6位
			$("#accountFlag").val('1');
			$("#accountR").show();
		} else {
			$("#accountFlag").val('');
			$("#accountNum").show();
		}
	} else if (charStatisticsNumber(account) == 0) {// 请输入账号
		$("#accountFlag").val('');
		$("#accountRequired").show();
	} else {
		$("#accountFlag").val('');
		$("#accountRule").show();
	}
}*/
function accountCheck() {
	$("#accountFlag").val('');
	var account = $("#account").val();
	$("#accountRequired").hide();

	if (charStatisticsNumber(account) == 0) {// 请输入账号
		$("#accountFlag").val('');
		$("#accountRequired").show();
	}else{
		$("#accountFlag").val('1');
	}
}

/* 统计字符串长度 */
function charStatisticsNumber(str) {
	var number = str.replace(/\s+/g, "").length;
	return number;
}

/**
 * 密码
 */
/*function pwdCheck() {
	$("#pwdFlag").val('');
	var pwd = $("#pwd").val();
	$("#pwdRequired").hide();
	$("#pwdNum").hide();
	$("#pwdR").hide();
	if (charStatisticsNumber(pwd) >= 6) {// 密码大于、等于6位

		$("#pwdFlag").val('1');
		$("#pwdR").show();
	} else if (charStatisticsNumber(pwd) == 0) {// 请设置密码
		$("#pwdFlag").val('');
		$("#pwdRequired").show();
	} else {
		$("#pwdFlag").val('');
		$("#pwdNum").show();
	}
}*/
function pwdCheck() {
	$("#pwdFlag").val('');
	var pwd = $("#pwd").val();
	$("#pwdRequired").hide();

	if (charStatisticsNumber(pwd) == 0) {// 请设置密码
		$("#pwdFlag").val('');
		$("#pwdRequired").show();
	}else{
		$("#pwdFlag").val('1');
	}
}

/**
 * 登陆
 */
function logging() {
	pwdCheck();
	accountCheck();
	//refresh();
	var pwd = $("#pwd").val();
	if ($("#validCode").val() == "") {
		$("validCodeFlag").val("");
		$("#validCodeRequired").show();
	}
	if ($("#pwdFlag").val() && $("#accountFlag").val()
			&& $("#validCodeFlag").val()) {
		document.getElementById("over").style.display = "block";
		document.getElementById("layout").style.display = "block";
		if (/^(?![a-zA-Z0-9]+$)(?![^a-zA-Z/D]+$)(?![^0-9/D]+$).{8,16}$/.test(pwd)) {// 数字、字母、下
	
			$("#zz").val("0");
		} else {
		
			$("#zz").val("1");
		}
		$("#loginform").submit();
	}
}


function refresh(){
	var time = new Date().getTime();
    document.getElementById('imgs').src="http://localhost:8080/iscs/common/image.jsp?t=4&tim="+time;
}

/**
 * 需要页面加载完执行的动作
 */
$(document).ready(function (){
	if($("#account").val()&&$("#pwd").val()){
		$("#remindme").attr("checked","checked");
	}
}); 

document.onkeydown=function(event){
    var e = event || window.event || arguments.callee.caller.arguments[0];      
    if(e && e.keyCode==13){ // enter 键
   	 	logging();
    }
}; 
