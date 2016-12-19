/*
* @author qilin
* @date 2014/12/26
* @desc 登录之后的首页js
*/
/***
 * 加载已备案网站数据列表
 */
function getRecordedWebSites(){
	$.post("../user/listRecordWebSites",function(data){
		var trHtml = '';
		for(var i = 0;i < data.length;i++){
			if(data[i].webSiteName!='undefined'){
		          trHtml += "<tr>";
		          trHtml += "<td>"+data[i].webSiteName+"</td>";
		          if(data[i].interactive == 1){
		        	  trHtml += "<td>交互式</td>";
		          }else{
		        	  trHtml += "<td>非交互式</td>";
		          }
		          trHtml += "<td>"+data[i].unitNature+"</td>";
		          trHtml += "<td>"+data[i].applyDate+"</td>";
		          trHtml += "<td>"+data[i].finishDate+"</td>";
		          trHtml += "<td>"+data[i].recordNum+"</td>";
		          trHtml += "<td>";
		          trHtml += "<a href='../apply/staticWebInfo?webSiteId="+data[i].id+"'>";
		          trHtml += "<img title='查看' src='../img/hong_xiazai.png' />";
		          trHtml += "</a>";
		          trHtml += "</td>";
		          trHtml += "</tr>";
			}
		}
		$("#ybalist").html(trHtml);
	});
}

/***
 * 加载草稿数据列表
 */
function getListDraft(){
	$.post("../user/listDraft",function(data){
		var draftHtml = '';
		for(var j = 0;j < data.length;j++){
			if(data[j].websiteName!='undefined'){
				draftHtml += "<tr>";
				draftHtml += "<td>"+data[j].accessType+"</td>";
				draftHtml += "<td>"+data[j].websiteName+"</td>";
				if(data[j].interactive == 1)
				{
				   draftHtml += "<td>交互式</td>";
		        }else
		        {	        	
		           draftHtml += "<td>非交互式</td>";
		        }
				//draftHtml += "<td>"+data[j].miniRecNum+"</td>";
				draftHtml += "<td>"+data[j].updateDate+"</td>";
				draftHtml += "<td>";
				draftHtml += "<a href='../apply/newWebSiteApply1?webSiteId="+data[j].id+"&biztype="+data[j].biztype+"&from=caogao'>";
				draftHtml += "<img title='编辑' src='../img/edit.png' />";
				draftHtml += "</a>";
				draftHtml += "<a href='../apply/deletedsavedraft?webSiteId="+data[j].id+"' onclick='return confirm(\"是否删除此条记录？\")'>";
				draftHtml += "<img title='删除' src='../img/del.png' />";
				draftHtml += "</a>";
				draftHtml += "</td>";
				draftHtml += "</tr>";
			}
		}
		$("#draftList").html(draftHtml);		
	});
}

/**
 * 列举待我备案的网站
 */
function getWaitRecordWebSiteList(){
	$.post("../user/listWaitRecordWebs",function(data){
		var trHtml = '';
		for(var i = 0;i < data.length;i++){
			if(data[i].websiteName!='undefined'){
		          trHtml += "<tr>";
		          if(data[i].websiteName!=null){
		        	  trHtml += "<td>"+data[i].websiteName+"</td>";
		          }else{
		        	  trHtml += "<td>"+''+"</td>";
		          }
		          if(data[i].websiteDomain!=null){
		        	  trHtml += "<td>"+data[i].websiteDomain+"</td>";
		          }else{
		        	  trHtml += "<td>"+''+"</td>";
		          }
		          if(data[i].webUnitname!=null){
		        	  trHtml += "<td>"+data[i].webUnitname+"</td>";
		          }else{
		        	  trHtml += "<td>"+''+"</td>";
		          }
		          if(data[i].ministryNum!=null){
		        	  trHtml += "<td>"+data[i].ministryNum+"</td>";
		          }else{
		        	  trHtml += "<td>"+''+"</td>";
		          }
		          if(data[i].noticeDate!=null){
		        	  trHtml += "<td>"+data[i].noticeDate+"</td>";
		          }else{
		        	  trHtml += "<td>"+''+"</td>";
		          }
		          trHtml += "<td>";
		          trHtml += "<a href='../apply/newWebSiteApply1?oldWebSiteId="+data[i].websiteId+"&biztype="+3+"&from=cunliang'>";
		          trHtml += "<img title='编辑' src='../img/edit.png' />";
		
		          trHtml += "</a>";
		          trHtml += "</td>";
		          trHtml += "</tr>";
			}
		}
		$("#wba_tbody").html(trHtml);
	});
}





/**
 * 列举当前登录用户的带认领网站信息
 */
function getWaitClaimWebSiteList(){
	$.post("../user/listWaitMeClaimWebSites",function(data){
		var trHtml = '';
		for(var i = 0;i < data.length;i++){
			if(data[i].domainName!='undefined'){
		          trHtml += "<tr>";
		          if(data[i].webName!=null){
		        	  trHtml += "<td>"+data[i].webName+"</td>";
		          }else{
		        	  trHtml += "<td>"+''+"</td>";
		          }
		          trHtml += "<td>"+data[i].domainName+"</td>";
		          if(data[i].unitName!=null){
		        	  trHtml += "<td>"+data[i].unitName+"</td>";
		          }else{
		        	  trHtml += "<td>"+''+"</td>";
		          }
		          if(data[i].minrecnum!=null){
		        	  trHtml += "<td>"+data[i].minrecnum+"</td>";
		          }else{
		        	  trHtml += "<td>"+''+"</td>";
		          }
		          if(data[i].policeRecordNum!=null){
		        	  trHtml += "<td>"+data[i].policeRecordNum+"</td>";
		          }else{
		        	  trHtml += "<td>"+''+"</td>";
		          }
		          trHtml += "<td>";
		         // trHtml += "<a href='../apply/ClaimWebSite1?webSiteId="+data[i].id+"&biztype="+2"'>";
		          trHtml += "<a href='../apply/newWebSiteApply1?oldWebSiteId="+data[i].id+"&biztype="+2+"&from=cunliang'>";
		          trHtml += "<img title='编辑' src='../img/edit.png' />";
		
		          trHtml += "</a>";
		          trHtml += "</td>";
		          trHtml += "</tr>";
			}
		}
		$("#drl_tbody").html(trHtml);
	});
	
}

/**
 * 确认是否是我的带认领网站
 * @param id
 */
function sureClaimWebSite(id){
	//alert(id);
}

/**
 * 保存我已经认领的网站
 */
function saveMyClaimWebSite(){
		var num=document.getElementById("1").innerText;//获取span的值
		var nums=num.substr(1, 1);//截取数字
		
		//待认领
		$(".webClaimRadio").each(function(i){
			var mywebsite = $('input[name=mywebsite'+i+']:checked').val();
			var cid = $("#wzid"+i+"").val();
			
			if(mywebsite&&mywebsite!=0){//如果“是”循环+1
				nums=parseInt(nums)+1;
			}
//			console.debug("-=-=-=-=-=-=-="+mywebsite);
//			console.debug("-=-=-=-=-=-=-="+cid);
			$.ajax({
				type: "POST",
				url: '../user/saveMeClaimWebSites',
				data: {
					'cid':cid,
					'mark':mywebsite
				},
				success: function(msg){
//					alert( "Data Saved: " + msg );
				}
			});
		});
		
		var num2=document.getElementById("2").innerText;//获取span的值
		var nums2=num2.substr(1, 1);//截取数字
		//待备案
		$(".webClaimRadios").each(function(i){
			var mywebsites = $('input[name=mywebsites'+i+']:checked').val();
			var cids = $("#wzids"+i+"").val();
			
			if(mywebsites&&mywebsites!=0){//如果“是”循环+1
				nums2=parseInt(nums2)+1;
			}
//			console.debug("-=-=-=-=-=-=-="+mywebsites);
//			console.debug("-=-=-=-=-=-=-="+cids);
			$.ajax({
				type: "POST",
				url: '../user/saveMeDbaWebSites',
				data: {
					'cid':cids,
					'mark':mywebsites
				},
				success: function(msg){
					//alert( "Data Saved: " + msg );
				}
			});
		});
	 $('#tc_renling').modal('hide');
	 document.getElementById("1").innerText="("+nums+")";//给span赋值
	 document.getElementById("2").innerText="("+nums2+")";//给span赋值
}

//注销网站发送验证码倒计时
var ZXWZcount = 60;
function ZXWZstartTime(){
	ZXWZcount--;
	 if(ZXWZcount > 0){
		 $("#ZXWZcurrentTime").text(ZXWZcount);
		 setTimeout('ZXWZstartTime()',1000);
	 }else{
		 $("#ZXWZnumMinu").hide();//倒计时隐藏
		 $("#ZXWZfsyz").show();//手机验证码送按钮显示
		 ZXWZcount = 60;
	 }
}

//手机修改密码发送验证码倒计时
var XGcount = 60;
function XGstartTime(){
	XGcount--;
	 if(XGcount > 0){
		 $("#XGcurrentTime").text(XGcount);
		 setTimeout('XGstartTime()',1000);
	 }else{
		 $("#XGnumMinu").hide();//倒计时隐藏
		 $("#XGfsyz").show();//手机验证码送按钮显示
		 XGcount = 60;
	 }
}

//注册用户发送验证码倒计时
var ZCcount = 60;
function ZCstartTime(){
	ZCcount--;
	 if(ZCcount > 0){
		 $("#ZCcurrentTime").text(ZCcount);
		 setTimeout('ZCstartTime()',1000);
	 }else{
		 $("#ZCnumMinu").hide();//倒计时隐藏
		 $("#ZCfsyz").show();//注册用户发送验证码按钮显示
		 ZCcount = 60;
		 alert("如果您没有收到验证码，请填写0000可以通过验证");
	 }
}

//手机信用验证发送验证码倒计时
var XYcount = 60;
function XYstartTime(){
	XYcount--;
	 if(XYcount > 0){
		 $("#XYcurrentTime").text(XYcount);
		 setTimeout('XYstartTime()',1000);
	 }else{
		 $("#XYnumMinu").hide();//倒计时隐藏
		 $("#XYfsyz").show();//手机信用验证发送验证码倒计时
		 XYcount = 60;
	 }
}

/**
 * 给指定的手机号发送短信
 * @param telnum
 * @param type
 */
function sendMsgCode(telnum,type,userid){
	var yzm="";
	if(type==2){//用户注册时的手机号
		yzm=$("#validCode").val();
		var pdreturn="";
		//=-=-==-=-=-=-=-=-=-=-=-=-=-=-
		$("#validCodeRequired").hide();
		$("#validCodeE").hide();
		$("#validCodeR").hide();
		if($("#validCodeFlag").val()==1&&yzm.length==4){
			$("#validCodeR").show();
			validCodeCheckRegister();
		}else{
			$("#validCodeE").show();
			pdreturn="1";
		}
		//=-=-==-=-=-=-=-=-=-=-=-=-=-=-
		var telnum=$("#"+telnum).val();
		$("#telnumRequired").hide();
		$("#telnumRule").hide();
		$("#telnumY").hide();
		$("#telnumR").hide();
		$("#telnumYY").hide();
		if(isValidMobile($("#telnum").val())){//符合规则
			 $("#telnumFlag").val("1");
			 $("#shifouSms").val("1");
			 $("#telnumR").show();
		}else{//不符合规则
	    	   $("#telnumFlag").val("");
	    	   $("#telnumRule").show();
	    	   pdreturn="1";
	    }	
		if(pdreturn==1){
			return;
		}
	}
	if(type==4){//手机修改密码时的验证码
		yzm=$("#validCodeXgmm").val();
		$("#smsXgmmE").hide();
		$("#smsXgmmR").hide();
		$("#smsXgmmQ").hide();
		if($("#smsXgmmFlag").val()==1&&yzm.length==4){
			$("#smsXgmmR").show();
		}else{
			$("#smsXgmmE").show();
			return;
		}
	}
	if(type==1){//手机注销网站时的验证码
		yzm=$("#validCodeZxsj").val();
		$("#smsZxsjE").hide();
		$("#smsZxsjR").hide();
		$("#smsZxsjQ").hide();
		if($("#smsZxsjFlag").val()==1&&yzm.length==4){
			$("#smsZxsjR").show();
		}else{
			$("#smsZxsjE").show();
			return;
		}
	}
	if(type==3){//手机验证时的验证码
		yzm=$("#validCodeSjyz").val();
		$("#smsSjyzE").hide();
		$("#smsSjyzR").hide();
		$("#smsSjyzQ").hide();
		if($("#smsSjyzFlag").val()==1&&yzm.length==4){
			$("#smsSjyzR").show();
		}else{
			$("#smsSjyzE").show();
			return;
		}
	}
	$.post("../sys/sendMsgCode",{"telNum":telnum,"type":type,"userid":userid,"yzm":yzm},function(data){
		//alert("短信已经发送，请注意查收，5分钟之内有效！CODE="+data);
		if(type==1){//注销网站
			if(data==41){
				alert("验证码失效，短信发送失败，请刷新验证码重新发送");
				return;
			}
		}
		if(type==2){//注册
			if(data==41){
				//alert("验证码失效，短信发送失败，请刷新验证码重新发送");
				return;
			}
		}
		if(type==3){//手机验证
			if(data==41){
				alert("验证码失效，短信发送失败，请刷新验证码重新发送");
				return;
			}
		}
		if(type==4){//修改密码
			if(data==42){
				alert("验证码失效，短信发送失败，请刷新验证码重新发送");
				return;
			}
			if(data==41){
				alert("短信发送失败，请重新发送");
				return;
			}
		}
		
		alert("短信已经发送，请注意查收，5分钟之内有效");
		//$("#msgvalicateZC").val(data);
//		alert("5分钟之内有效！验证码为："+data);
//		alert("短信功能暂时无法使用");
		if(type==1){//注销网站
			$("#ZXWZnumMinu").show();//倒计时显示
			$("#ZXWZfsyz").hide();//手机验证码送按钮隐藏
			ZXWZstartTime();//开始倒计时
		}
		if(type==2){//注册用户
			$("#ZCnumMinu").show();//倒计时显示
			$("#ZCfsyz").hide();//注册用户发送验证码按钮隐藏
			ZCstartTime();
		}
		if(type==3){//手机信用验证
			$("#XYnumMinu").show();//倒计时显示
			$("#XYfsyz").hide();//注册用户发送验证码按钮隐藏
			XYstartTime();
		}
		if(type==4){//手机修改密码
			$("#XGnumMinu").show();//倒计时显示
			$("#XGfsyz").hide();//手机验证码送按钮隐藏
			XGstartTime();
		}
	});
}
/**
 * 短信验证码（注册用户）
 * @param code
 * @param type
 */
function smscheckZC(){	
	$("#smsRR").hide();
	$("#smsER").hide();
	$("#smsWR").hide();
	$("#smsQR").hide();
	var msgvalicateZC = $("#msgvalicateZC").val();
	if (msgvalicateZC.length == 5||msgvalicateZC.length == 4) {// 验证码
		if($("#msgvalicateZC").val()=='0000'){
			$("#smsRR").hide();
			$("#smsER").hide();
			$("#smsWR").hide();
			$("#smsQR").hide();
			if($("#shifouSms").val()=="1"){
				$("#smsFlagrR").val("1");
				$("#smsRR").show();
			}else{
				$("#smsFlagrR").val("");
				$("#smsER").show();
			}
		}else{
			$.post("../sys/checkMsgCode?code="+$("#msgvalicateZC").val()+"&num=2",function(data){
				$("#smsRR").hide();
				$("#smsER").hide();
				$("#smsWR").hide();
				$("#smsQR").hide();
				$("#smsFlagR").val("");
				if(data == "0"){
					$("#smsFlagrR").val("1");
					$("#smsRR").show();
				}
				if(data == "1"){//验证码过期
					$("#smsFlagrR").val("");
					$("#smsWR").show();
				}
				if(data == "-1"){//验证码错误
					$("#smsFlagrR").val("");
					$("#smsER").show();	
				}
			});
		}
	}else{
		$("#smsFlagrR").val("");
		$("#smsER").show();	
	}
}

/**
 * 验证码（注销网站时发送短信）
 * @param code
 * @param type
 */
function smscheckZxsj() {
	$("smsZxsjFlag").val("");
	var validCodeZxsj = $("#validCodeZxsj").val();
	$("#smsZxsjE").hide();
	$("#smsZxsjR").hide();
	$("#smsZxsjQ").hide();
	if (validCodeZxsj.length == 4) {// 验证码
		$.post("../portal/verCode?t=13&code=" + validCodeZxsj, function(data) {
			$("#smsZxsjFlag").val("");
			if (data == 1) {// 验证成功
				$("#smsZxsjFlag").val("1");
				$("#smsZxsjR").show();
			} else {
				$("#smsZxsjFlag").val("");
				$("#smsZxsjE").show();
			}
		});
	} else if ("" == validCodeZxsj) {// 验证码为空
		$("smsZxsjFlag").val("");
		$("#smsZxsjQ").show();
	} else {
		$("#smsZxsjFlag").val("");
		$("#smsZxsjE").show();
	}
}

/**
 * 验证码（手机验证时发送短信）
 * @param code
 * @param type
 */
function smscheckSjyz() {
	$("smsSjyzFlag").val("");
	var validCodeSjyz = $("#validCodeSjyz").val();
	$("#smsSjyzE").hide();
	$("#smsSjyzR").hide();
	$("#smsSjyzQ").hide();
	if (validCodeSjyz.length == 4) {// 验证码
		$.post("../portal/verCode?t=14&code=" + validCodeSjyz, function(data) {
			$("#smsSjyzFlag").val("");
			if (data == 1) {// 验证成功
				$("#smsSjyzFlag").val("1");
				$("#smsSjyzR").show();
			} else {
				$("#smsSjyzFlag").val("");
				$("#smsSjyzE").show();
			}
		});
	} else if ("" == validCodeSjyz) {// 验证码为空
		$("smsSjyzFlag").val("");
		$("#smsSjyzQ").show();
	} else {
		$("#smsSjyzFlag").val("");
		$("#smsSjyzE").show();
	}
}

/**
 * 验证码（修改密码时发送短信）
 * @param code
 * @param type
 */
function smscheckXgmm() {
	$("smsXgmmFlag").val("");
	var validCodeXgmm = $("#validCodeXgmm").val();
	$("#smsXgmmE").hide();
	$("#smsXgmmR").hide();
	$("#smsXgmmQ").hide();
	if (validCodeXgmm.length == 4) {// 验证码
		$.post("../portal/verCode?t=12&code=" + validCodeXgmm, function(data) {
			$("#smsXgmmFlag").val("");
			if (data == 1) {// 验证成功
				$("#smsXgmmFlag").val("1");
				$("#smsXgmmR").show();
			} else {
				$("#smsXgmmFlag").val("");
				$("#smsXgmmE").show();
			}
		});
	} else if ("" == validCodeXgmm) {// 验证码为空
		$("smsXgmmFlag").val("");
		$("#smsXgmmQ").show();
	} else {
		$("#smsXgmmFlag").val("");
		$("#smsXgmmE").show();
	}
}

/**
 * 短信验证码(修改密码)
 * @param code
 * @param type
 */
function smscheck(){	
	$.post("../sys/checkMsgCode?code="+$("#msgvalicate").val()+"&num=4",function(data){
		$("#smsR").hide();
		$("#smsE").hide();
		$("#smsW").hide();
		$("#smsQ").hide();
		$("#smsFlag").val("");
		if(data == "0"){
			$("#smsFlag").val("0");
			$("#smsR").show();
		}
		if(data == "1"){//验证码过期
			$("#smsFlag").val("1");
			$("#smsW").show();
		}
		if(data == "-1"){//验证码错误
			$("#smsFlag").val("-1");
			$("#smsE").show();	
		}
	});
}

/**
 * 
 */
function smssub(phone,yhms){
	$("#smsR").hide();
	$("#smsE").hide();
	$("#smsW").hide();
	$("#smsQ").hide();
	if($("#smsFlag").val() == "0"){
		$("#form_setpwd").submit();
	}else if($("#smsFlag").val() == "1"){
		$("#smsW").show();
	}else if($("#smsFlag").val() == "-1"){
		$("#smsE").show();
	}else if($("#smsFlag").val() == ""){
		$("#smsQ").show();
	}
}

$(function(){
	 
	//获取当前登陆人未读消息数量
	$.post("../sys/getSysMessageNumber",function(data){
		$("#sysmsgnum").text(data);
	});
});


function readStatus(id){
	 //alert(123)
	 $.ajax({
		 url:"../sys/setSysMessageStatus",
		 type:"post",
		 data:{id:id},
		 dataType:"json",
		 success:function(res){
		// alert(res)
			 window.location.reload();
		 },
		 error:function(res){
			 
			 
		 }
		 
		 
	 });
	 
}

//删除消息
function delSysMessage(id){
	
	// alert(123)
	// alert(id)
	 $.ajax({
		 url:"../sys/delSysMessageStatus",
		 type:"post",
		 data:{id:id},
		 dataType:"json",
		 success:function(res){
			// alert(res)
			 window.location.reload();
		 },
		 error:function(res){
			 
			 
		 }
		 
		 
	 });
	 
} 

/**
 * 荣誉度显示
 */
function sanGeRyd(){
	$.ajax({
		  //async:false,
		  dataType:"json",
		  url: "../user/yhXX",
		  success: function(data){
			var provinceStr='';
			var ryd=data.ryd;//荣誉度：现在的最大值为35
			if(ryd<=5){//1星
				provinceStr='<img src='+ctx+'/img/wuxing1.png><img src='+ctx+'/img/wuxing2.png><img src='+ctx+'/img/wuxing2.png><img src='+ctx+'/img/wuxing2.png><img src='+ctx+'/img/wuxing2.png>';
			}else if(ryd>5&&ryd<=15){//2星
				provinceStr='<img src='+ctx+'/img/wuxing1.png><img src='+ctx+'/img/wuxing1.png><img src='+ctx+'/img/wuxing2.png><img src='+ctx+'/img/wuxing2.png><img src='+ctx+'/img/wuxing2.png>';
			}else if(ryd>15&&ryd<=25){//3星
				provinceStr='<img src='+ctx+'/img/wuxing1.png><img src='+ctx+'/img/wuxing1.png><img src='+ctx+'/img/wuxing1.png><img src='+ctx+'/img/wuxing2.png><img src='+ctx+'/img/wuxing2.png>';
			}else if(ryd>25&&ryd<=35){//4星
				provinceStr='<img src='+ctx+'/img/wuxing1.png><img src='+ctx+'/img/wuxing1.png><img src='+ctx+'/img/wuxing1.png><img src='+ctx+'/img/wuxing1.png><img src='+ctx+'/img/wuxing2.png>';
			}
			$("#zhuyeRyd").html(provinceStr);
			$("#yanzhengRyd").html(provinceStr);
			$("#toubuRyd").html(provinceStr);
		  }
	});
	
}

/**
 * 验证注册表单
 */
function yzZcBd() {
	
	telnumCheck();// 手机号

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
	if ($("#telnum").val() == "") {// 手机
		$("#telnumFlag").val("");
		$("#telnumRequired").show();
	} else {
		if (isValidMobile($("#telnum").val())) {// 符合规则
			$("#telnumFlag").val("1");
			$("#telnumR").show();
		} else {// 不符合规则
			$("#telnumFlag").val("");
			$("#telnumRule").show();
		}
	}

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
}


