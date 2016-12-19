function account() {
	var account = $("#account").val();
}
/**
 * 账号检查
 */
function accountChecks() {

	$("#accountFlag").val('');
	var account = $("#account").val();
	$("#accountRequired").hide();
	$("#accountNum").hide();
	$("#accountRule").hide();
	$("#accountY").hide();
	$("#accountR").hide();
	/**
	 * if(charStatisticsNumber(account) >= 6){//账号大于、等于6位
	 * if(/^[a-zA-Z0-9_]{1,}$/.test(account)){//数字、字母、下划线
	 * $.post("../user/validAccount?account="+account,function(data){ if(data ==
	 * 2){//账号可以使用 $("#accountFlag").val('1'); $("#accountR").show(); }else
	 * if(data == 1){//被占用 $("#accountFlag").val(''); $("#accountY").show(); }
	 * }); }else{ $("#accountFlag").val(''); $("#accountRule").show(); } }else
	 * if(charStatisticsNumber(account) == 0){//请输入账号 $("#accountFlag").val('');
	 * $("#accountRequired").show(); }else{//账号最少六位 $("#accountFlag").val('');
	 * $("#accountNum").show(); }
	 */
	if (/^[a-zA-Z0-9_]{1,}$/.test(account)) {// 数字、字母、下划线
		if (charStatisticsNumber(account) >= 6) {// 账号大于、等于6位
			$.post("../user/validAccount?account=" + account, function(data) {
				if (data == 2) {// 账号可以使用
					$("#accountFlag").val('1');
					$("#accountR").show();
					$("#accountY").hide();
				} else if (data == 1) {// 被占用
					$("#accountFlag").val('');
					$("#accountR").hide();
					$("#accountY").show();
				}
			});
		} else {// 账号最少六位
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

}
/*function zhengze() {
	var pwd = $("#pwd").val();
	if (/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$/.test(pwd)) {// 数字、字母、下
		
	}else{
		$("#pwdR").hide();
		$("#pwdError").show();
	}
}*/
/**
 * 设置密码
 */
function pwdCheck() {
	$("#pwdFlag").val('');
	var pwd = $("#pwd").val();
	$("#pwdRequired").hide();
	$("#pwdNum").hide();
	$("#pwdR").hide();

	if (charStatisticsNumber(pwd) >= 6 && /^(?![a-zA-Z0-9]+$)(?![^a-zA-Z/D]+$)(?![^0-9/D]+$).{8,16}$/.test(pwd)) {// 密码大于、等于6位，必须数字+字母或者下划线
		
		$("#pwdFlag").val('1');
		$("#pwdR").show();
	
	} else if (charStatisticsNumber(pwd) == 0) {// 请设置密码

		$("#pwdFlag").val('');
		$("#pwdRequired").show();
	} else {

		$("#pwdFlag").val('');
		$("#pwdNum").show();
	}

	// ------------------------------密码复杂度验证
	var ls = 0;// 判断类型个数（1：弱， 2：中， 3：中， 4：强）
	if (pwd.match(/([a-z])+/) && charStatisticsNumber(pwd) >= 6) {// 小写字母
		ls++;
	}
	if (pwd.match(/([0-9])+/) && charStatisticsNumber(pwd) >= 6) {// 数字
		ls++;
	}
	if (pwd.match(/([A-Z])+/) && charStatisticsNumber(pwd) >= 6) {// 大写字母
		ls++;
	}
	if (pwd.match(/[^a-zA-Z0-9]+/) && charStatisticsNumber(pwd) >= 6) {// 其他字符
		ls++;
	}
	if (ls == 1) {// alert('弱');
		var objs = $("#mmRuo");
		objs.each(function(objs, item) {
			$(item).css("background-color", "red");
		});

		var objs = $("#mmZhong");
		objs.each(function(objs, item) {
			$(item).css("background-color", "yellow");
		});
		var objs = $("#mmQiang");
		objs.each(function(objs, item) {
			$(item).css("background-color", "yellow");
		});
	} else if (ls == 2 || ls == 3) {// alert('中');
		var objs = $("#mmRuo");
		objs.each(function(objs, item) {
			$(item).css("background-color", "yellow");
		});

		var objs = $("#mmZhong");
		objs.each(function(objs, item) {
			$(item).css("background-color", "#7cfe10");
		});

		var objs = $("#mmQiang");
		objs.each(function(objs, item) {
			$(item).css("background-color", "yellow");
		});
	} else if (ls == 4) {// alert('强');
		var objs = $("#mmRuo");
		objs.each(function(objs, item) {
			$(item).css("background-color", "yellow");
		});
		var objs = $("#mmZhong");
		objs.each(function(objs, item) {
			$(item).css("background-color", "yellow");
		});

		var objs = $("#mmQiang");
		objs.each(function(objs, item) {
			$(item).css("background-color", "#7cfe10");
		});
	}
	// ------------------------------密码复杂度验证
}

/**
 * 确认密码
 */
function repwdCheck() {
	$("#repwdFlag").val("");
	var repwd = $("#repwd").val();
	var pwd = $("#pwd").val();
	$("#repwdRequired").hide();
	$("#repwdY").hide();
	$("#repwdR").hide();
	if ($("#pwdFlag").val()) {// 密码已设置
		if (charStatisticsNumber(repwd) == 0) {// 确认密码为空
			$("#repwdFlag").val("");
			$("#repwdRequired").show();
		} else {
			if (repwd == pwd) {// 两次密码一致
				$("#repwdFlag").val("1");
				$("#repwdR").show();
			} else {
				$("#repwdFlag").val("");
				$("#repwdY").show();
			}
		}
	} else {// 密码未设置
		pwdCheck();
	}
}

/**
 * 验证码
 */
/*
 * function validCodeCheck(){ $("validCodeFlag").val(""); var validCode =
 * $("#validCode").val(); $("#validCodeRequired").hide();
 * $("#validCodeE").hide(); $("#validCodeR").hide(); if(validCode.length ==
 * 4){//验证码 $.post("../portal/verCode?t=5&code="+validCode,function(data){
 * $("#validCodeFlag").val(""); if(data == 1){//验证成功
 * $("#validCodeFlag").val("1"); $("#validCodeR").show(); }else{
 * $("#validCodeFlag").val(""); $("#validCodeE").show(); } }); }else
 * if(""==validCode){//验证码为空 $("validCodeFlag").val("");
 * $("#validCodeRequired").show(); }else{ $("#validCodeFlag").val("");
 * $("#validCodeE").show(); } }
 */

/**
 * 手机号
 */
function telnumCheck() {
	$("#telnumFlag").val("");
	var telnum = $("#telnum").val();
	$("#telnumRequired").hide();
	$("#telnumRule").hide();
	$("#telnumY").hide();
	$("#telnumR").hide();
	$("#telnumYY").hide();
	if (telnum) {
		if (isValidMobile(telnum)) {// 符合规则
			$.post("../user/veryDatas?flag=1&code=" + telnum, function(data) {
				$("#telnumFlag").val("");
				if (data == "1") {
					$("#telnumFlag").val("");
					$("#telnumY").show();
				} else {
					$("#telnumFlag").val("1");
					$("#telnumR").show();
				}
			});
		} else {// 不符合规则
			$("#telnumFlag").val("");
			$("#telnumRule").show();
		}
	} else {// 手机为空
		$("#telnumFlag").val("");
		$("#telnumRequired").show();
	}
}

/**
 * 邮箱
 */
function emailCheck() {
	$("#emailFlag").val("");
	var email = $("#email").val();
	$("#emailRequired").hide();
	$("#emailRule").hide();
	$("#emailY").hide();
	$("#emailR").hide();
	if (email) {
		if (isValidEmail(email)) {// 符合规则
			/*
			 * $.post("../user/veryDatas?flag=2&code="+email,function(data){
			 * $("#emailFlag").val(""); if(data == "2"){
			 * $("#emailFlag").val(""); $("#emailY").show(); }else{
			 * $("#emailFlag").val("1"); $("#emailR").show(); } });
			 */
			$("#emailFlag").val("1");
			$("#emailR").show();
		} else {
			$("#emailFlag").val("");
			$("#emailRule").show();
		}
	} else {// 邮箱为空
		$("#emailFlag").val("");
		$("#emailRequired").show();
	}
}

/**
 * 提交表单
 */
function submitForm() {
	
	//smscheckZC();
	
//	$.ajaxSetup({
//        async: false
//    });
//	$.post("../sys/phone",{"telNum":$("#telnum").val()},function(data){
//		if(data=='2'){
//			$("#telnumRequired").hide();
//			$("#telnumRule").hide();
//			$("#telnumY").hide();
//			$("#telnumR").hide();
//			$("#telnumYY").show();
//			$("#telnumFlag").val("");
//		}else if(data=='1'){
//			telnumCheck();// 手机号
//		}
//	});

	emailCheck();// 邮箱
	// 表单提交为空
	if (charStatisticsNumber($("#account").val()) == 0) {// 请输入账号
		$("#accountFlag").val('');
		$("#accountRequired").show();
	}

	if ($("#email").val() == "") {// 邮箱
		$("#emailFlag").val("");
		$("#emailRequired").show();
	} else {
		if (isValidEmail($("#email").val())) {// 符合规则
			$("#emailFlag").val("1");
			$("#emailR").show();
		} else {
			$("#emailFlag").val("");
			$("#emailRule").show();
		}
	}
	
//	if ($("#telnum").val() == "") {// 手机
//		$("#telnumFlag").val("");
//		$("#telnumRequired").show();
//	} else {
//		if (isValidMobile($("#telnum").val())) {// 符合规则
//			$.post("../sys/phone",{"telNum":$("#telnum").val()},function(data){
//				if(data=='2'){
//					$("#telnumRequired").hide();
//					$("#telnumRule").hide();
//					$("#telnumY").hide();
//					$("#telnumR").hide();
//					$("#telnumYY").show();
//					$("#telnumFlag").val("");
//				}else if(data=='1'){
//					$("#telnumFlag").val("1");
//					$("#telnumR").show();
//				}
//			});
//		} else {// 不符合规则
//			$("#telnumFlag").val("");
//			$("#telnumRule").show();
//		}
//	}

	if ($("#repwd").val() == "") {// 确认密码
		$("#repwdFlag").val("");
		$("#repwdRequired").show();
	}
	if ($("#pwd").val() == "") {// 密码
		$("#pwdFlag").val('');
		$("#pwdRequired").show();
	}

	if ($("#account").val() == "") {// 账号
		$("validCodeFlag").val("");
		$("#validCodeRequired").show();
	} else {
		var account = $("#account").val();
		if (/^[a-zA-Z0-9_]{1,}$/.test(account)) {// 数字、字母、下划线
			if (charStatisticsNumber(account) >= 6) {// 账号大于、等于6位
				$.post("../user/validAccount?account=" + account,
						function(data) {
							if (data == 2) {// 账号可以使用
								$("#accountFlag").val('1');
								$("#accountR").show();
							} else if (data == 1) {// 被占用
								$("#accountFlag").val('');
								$("#accountY").show();
							}
						});
			} else {// 账号最少六位
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
	}
	
	$("#validCodeRequired").hide();
	$("#validCodeE").hide();
	$("#validCodeR").hide();
	
	
	/*
	 * if($("#validCode").val()==""){//验证码 $("validCodeFlag").val("");
	 * $("#validCodeRequired").show(); }
	 */

	//alert($("#accountFlag").val());
	//alert($("#pwdFlag").val());
    //alert($("#repwdFlag").val());
	// alert($("#validCodeFlag").val());//短信验证码
	//alert($("#telnumFlag").val());
	//alert($("#emailFlag").val());
	//alert($("#smsFlagrR").val());
	
	// 当表单所有数据验证通过提交
	if ($("#accountFlag").val() && $("#pwdFlag").val() && $("#repwdFlag").val()
			&& $("#smsFlagrR").val() && $("#telnumFlag").val()
			&& $("#emailFlag").val()) {
		document.getElementById("over").style.display = "block";
		document.getElementById("layout").style.display = "block";
		$("#registerform").submit();
	}
}

/**
 * 验证码
 */
//function validCodeCheckRegister() {
//	$("validCodeFlag").val("");
//	var validCode = $("#validCode").val();
//	$("#validCodeRequired").hide();
//	$("#validCodeE").hide();
//	$("#validCodeR").hide();
//	if (validCode.length == 4) {// 验证码
//		$.post("../portal/verCode?t=11&code=" + validCode, function(data) {
//			$("#validCodeFlag").val("");
//			if (data == 1) {// 验证成功
//				$("#validCodeFlag").val("1");
//				$("#validCodeR").show();
//			} else {
//				$("#validCodeFlag").val("");
//				$("#validCodeE").show();
//			}
//		});
//	} else if ("" == validCode) {// 验证码为空
//		$("validCodeFlag").val("");
//		$("#validCodeRequired").show();
//	} else {
//		$("#validCodeFlag").val("");
//		$("#validCodeE").show();
//	}



