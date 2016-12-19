/**
 * 输入检查公共方法
 * @date 2015-01-21
 * @param busCode
 * @returns {Boolean}
 */

/* 工商营业执照注册号 */
function isValidBusCode(busCode){
      var ret=false;
	  if(busCode.length==15){
	    var sum=0;
        var s=[];
        var p=[];
        var a=[];
        var m=10;
        p[0]=m;
	    for(var i=0;i<busCode.length;i++){
	       a[i]=parseInt(busCode.substring(i,i+1),m);
           s[i]=(p[i]%(m+1))+a[i];
           if(0==s[i]%m){
             p[i+1]=10*2;
           }else{
             p[i+1]=(s[i]%m)*2;
            }    
	    }                                       
	    if(1==(s[14]%m)){//营业执照编号正确!
	        ret = true;
	    }else{//营业执照编号错误!
           ret = false;
         }
	  }else if(""==busCode){
		  ret = false;
	  }
       return ret;
}

/* 组织机构代码 */
function isValidOrgCode(orgCode){
    //return ""==orgCode || orgCode.length==10;
    var ret=false;
   /* var codeVal = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
    var intVal =    [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35];
    var crcs =[3,7,9,10,5,8,4,2];
    if(!(""==orgCode) && orgCode.length==10){
       var sum=0;
       for(var i=0;i<8;i++){
          var codeI=orgCode.substring(i,i+1);
          var valI=-1;
          for(var j=0;j<codeVal.length;j++){
              if(codeI==codeVal[j]){
            	  console.log(codeI+"-"+codeVal[j]);
                 valI=intVal[j];
                 break;
              }
          }
          sum+=valI*crcs[i];
       }
       var crc = 11- (sum %  11);
       switch (crc){
	       case 10:{
	         crc="X";
	         break;
	       }
	       default:{
	          break;
	       }
       }
       //alert("crc="+crc+",inputCrc="+orgCode.substring(9));
       if(crc==orgCode.substring(9)){
    	 //alert("组织代码正确!");
         ret = true;
       }
    }else if(""==orgCode){
      ret = false;
    }*/
    if(/^\d{8}(-)?\d{1}$/.test(orgCode.replace(/\s+/g,""))){
    	ret = true;
    }else if(""==orgCode){
    	ret = false;
    }else{
    	ret = false;
    }
    return ret;
}

/* 统计字符串字节数  */
function charStatisticsByte(str){
	
	var strLength = str.replace(/[^\x00-\xff]/g,"**").length;
	/* 2、9个字
	if(strLength >= 4 || strLength <= 18){
		ret = true;
	} */
	return strLength;
}
/* 统计字符串长度  */
function charStatisticsNumber(str){
   var number = str.replace(/\s+/g,"").length;
   return number;
}

/* 判断是否有特殊字符 */
function isTszf(str){
	  var ret=false;
	  var patt = new RegExp(/[`~#$%^&=|{}';<>]|<script>/);
	  if(patt.test(str)){
		 ret=true;
	  }
	  return ret;
}

/* 电话 */
function isValidPhone(phone){
	  var ret=false;
	  /*if(/^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/.test(phone.replace(/\s+/g,""))){
	     ret = true;
	  }*/
	  //格式：国家号码-区号-电话号码  或   区号-电话号码  
	  if(/^\d{4,}-\d{3,}-\d{5,}$/.test(phone.replace(/\s+/g,""))||/^\d{3,}-\d{5,}$/.test(phone.replace(/\s+/g,""))){
		  ret = true;
	  }
	  return ret;
}

/* 手机号 */
function isValidMobile(mobile){
	var ret = false;
	//格式：（手机号）   	或	（+86手机号）	或	（0086手机号）
	if(/^(((13|14|15|17|18)[0-9]{1})+\d{8})$/.test(mobile.replace(/\s+/g,""))||/^(((\+8613|\+8614|\+8615|\+8617|\+8618)[0-9]{1})+\d{8})$/.test(mobile.replace(/\s+/g,""))||/^(((008613|008614|008615|008617|008618)[0-9]{1})+\d{8})$/.test(mobile.replace(/\s+/g,""))
	){
		ret = true;
	}
	return ret;
}

/* 邮箱 */
function isValidEmail(email){
   var ret = false;
   var re = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/
   if(re.test(email)){
	   ret = true;
   }
   var c=email.substr(email.length-28);
	if(c=='@cn.panasonic-healthcare.com'&&charStatisticsNumber(email)>28){
		ret = true;
	}
   return ret;
}

/* 邮箱 */
/*function isValidEmail(email){
	var ret = false;
	if(/^([a-zA-Z0-9]*[-_\.]?[a-zA-Z0-9]+)*@([a-zA-Z0-9]*[-_]?[a-zA-Z0-9]+)+[\\.][A-Za-z]{2,3}([\\.][A-Za-z]{2,3})?$/.test(email.replace(/\s+/g,""))){
		ret = true;
	}//^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$
	 //^([a-zA-Z0-9]*[-_]?[a-zA-Z0-9]+)*@([a-zA-Z0-9]*[-_]?[a-zA-Z0-9]+)+[\\.][A-Za-z]{2,3}([\\.][A-Za-z]{2})?$
	///^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/
	
		var e=email.substr(email.length-17);
		if(e=='@corp.netease.com'&&charStatisticsNumber(email)>17){//网易的工作邮箱
			ret = true;
		}
	
	var a=email.substr(email.length-12);
	if(a=='@vip.163.com'&&charStatisticsNumber(email)>12){//网易VIP邮箱
		ret = true;
	}
	var c=email.substr(email.length-28);
	if(c=='@cn.panasonic-healthcare.com'&&charStatisticsNumber(email)>28){
		ret = true;
	}
	return ret;
}*/

/* 备案号 */
function isValidRecord(record){
	var ret = false;
	if(/^[^\x00-\xff]{1}(ICP){1}[^\x00-\xff]{1}(\d){4,10}([^\x00-\xff]{1})?(-\d+)?$/.test(record.replace(/\s+/g,""))){
		ret = true;
	}else if("" ==record){
		ret = false;
	}
	return ret;
}

//万网域名if(/^[a-z0-9-]{1,63}\.([a-z0-9-]{1,63}\.)*(com|cn|online|club|xin|wang|top|xyz|ren|site|website|space|tech|date|net|biz|win|news|video|click|link|pics|photo|cc|party|trade|science|pub|rocks|band|market|help|gift|press|wiki|design|software|social|lawyer|engineer|live|studio|org|me|gov.cn|ac|edu|gov|cc|info|tv|name|hk|co.uk|co|so|tel|mobi|asia|中国|公司|网络|政务|公益|我爱你|集团|其他)$/i.test(domain.replace(/\s+/g,"")))
//万网域名+国家域名
/* 主域名  */
function isValidDomain(domain){
	var ret = false;
	if(/^[a-z0-9-]{1,63}\.([a-z0-9-]{1,63}\.)*(com|cn|online|club|xin|wang|top|xyz|ren|site|website|space|tech|date|net|biz|win|news|video|click|link|pics|photo|cc|party|trade|science|pub|rocks|band|market|help|gift|press|wiki|design|software|social|lawyer|engineer|live|studio|org|me|gov.cn|ac|edu|gov|cc|info|tv|name|hk|co.uk|co|so|tel|mobi|asia|中国|公司|网络|政务|公益|我爱你|集团|其他|al|dz|af|ar|ae|aw|om|az|eg|et|ie|ee|ad|ao|ai|ag|at|au|mo|bb|pg|bs|pk|py|ps|bh|pa|br|by|bm|bg|mp|bj|be|is|pr|ba|pl|bo|bz|bw|bt|bf|bi|bv|kp|gq|dk|de|tl|tp|tg|dm|do|ru|ec|er|ee|fr|fo|pf|gf|tf|va|ph|fj|fi|cv|fk|gm|cg|cd|co|cr|gg|gd|gl|ge|cu|gp|gu|gy|kz|ht|kr|nl|an|hm|hn|ki|dj|kg|gn|gw|ca|gh|ga|kh|cz|zw|cm|qa|ky|km|ci|kw|cc|hr|ke|ck|lv|ls|la|lb|lt|lr|ly|li|re|lu|rw|ro|mg|im|mv|mt|mw|my|ml|mk|mh|mq|yt|mu|mr|us|um|as|vi|mn|ms|bd|pe|fm|mm|md|ma|mc|mz|mx|na|za|aq|gs|nr|np|ni|ne|ng|nu|no|nf|pw|pn|pt|jp|se|ch|sv|ws|yu|sl|sn|cy|sc|sa|cx|st|sh|kn|lc|sm|pm|vc|lk|sk|si|sj|sz|sd|sr|sb|so|tj|tw|th|tz|to|tc|tt|tn|tv|tr|tm|tk|wf|vu|gt|ve|bn|ug|ua|uy|uz|es|eh|gr|hk|sg|nc|nz|hu|sy|jm|am|ac|ye|iq|ir|il|it|in|id|uk|vg|io|jo|vn|zm|je|td|gi|cl|cf|cn|citic|pro|travel)$/i.test(domain.replace(/\s+/g,""))){
		ret = true;
	}else if(domain.length > 63){
		ret = false;
	}else if(""==domain){
		ret = false;
	}
	return ret;
}
/* 主从域名：中文  (\S\.)* */
function isValidDomainZhongWen(domain){
	var ret = false;
	if(/^[\S]{1,20}\.([\S]{1,20}\.)*(com|cn|online|club|xin|wang|top|xyz|ren|site|website|space|tech|date|net|biz|win|news|video|click|link|pics|photo|cc|party|trade|science|pub|rocks|band|market|help|gift|press|wiki|design|software|social|lawyer|engineer|live|studio|org|me|gov.cn|ac|edu|gov|cc|info|tv|name|hk|co.uk|co|so|tel|mobi|asia|中国|公司|网络|政务|公益|我爱你|集团|其他|al|dz|af|ar|ae|aw|om|az|eg|et|ie|ee|ad|ao|ai|ag|at|au|mo|bb|pg|bs|pk|py|ps|bh|pa|br|by|bm|bg|mp|bj|be|is|pr|ba|pl|bo|bz|bw|bt|bf|bi|bv|kp|gq|dk|de|tl|tp|tg|dm|do|ru|ec|er|ee|fr|fo|pf|gf|tf|va|ph|fj|fi|cv|fk|gm|cg|cd|co|cr|gg|gd|gl|ge|cu|gp|gu|gy|kz|ht|kr|nl|an|hm|hn|ki|dj|kg|gn|gw|ca|gh|ga|kh|cz|zw|cm|qa|ky|km|ci|kw|cc|hr|ke|ck|lv|ls|la|lb|lt|lr|ly|li|re|lu|rw|ro|mg|im|mv|mt|mw|my|ml|mk|mh|mq|yt|mu|mr|us|um|as|vi|mn|ms|bd|pe|fm|mm|md|ma|mc|mz|mx|na|za|aq|gs|nr|np|ni|ne|ng|nu|no|nf|pw|pn|pt|jp|se|ch|sv|ws|yu|sl|sn|cy|sc|sa|cx|st|sh|kn|lc|sm|pm|vc|lk|sk|si|sj|sz|sd|sr|sb|so|tj|tw|th|tz|to|tc|tt|tn|tv|tr|tm|tk|wf|vu|gt|ve|bn|ug|ua|uy|uz|es|eh|gr|hk|sg|nc|nz|hu|sy|jm|am|ac|ye|iq|ir|il|it|in|id|uk|vg|io|jo|vn|zm|je|td|gi|cl|cf|cn|citic|pro|travel)$/i.test(domain.replace(/\s+/g,""))){
		ret = true;
	}else if(domain.length > 63){
		ret = false;
	}else if(""==domain){
		ret = false;
	}
	return ret;
}
/* 二级域名加 1个/ 的格式    例如：gr.cn/zhuzi  */
function isValidDomainXieGang(domain){
	var ret = false;
	if(/^[a-z0-9-]{1,63}\.([a-z0-9-]{1,63}\.)*(com|cn|online|club|xin|wang|top|xyz|ren|site|website|space|tech|date|net|biz|win|news|video|click|link|pics|photo|cc|party|trade|science|pub|rocks|band|market|help|gift|press|wiki|design|software|social|lawyer|engineer|live|studio|org|me|gov.cn|ac|edu|gov|cc|info|tv|name|hk|co.uk|co|so|tel|mobi|asia|中国|公司|网络|政务|公益|我爱你|集团|其他|al|dz|af|ar|ae|aw|om|az|eg|et|ie|ee|ad|ao|ai|ag|at|au|mo|bb|pg|bs|pk|py|ps|bh|pa|br|by|bm|bg|mp|bj|be|is|pr|ba|pl|bo|bz|bw|bt|bf|bi|bv|kp|gq|dk|de|tl|tp|tg|dm|do|ru|ec|er|ee|fr|fo|pf|gf|tf|va|ph|fj|fi|cv|fk|gm|cg|cd|co|cr|gg|gd|gl|ge|cu|gp|gu|gy|kz|ht|kr|nl|an|hm|hn|ki|dj|kg|gn|gw|ca|gh|ga|kh|cz|zw|cm|qa|ky|km|ci|kw|cc|hr|ke|ck|lv|ls|la|lb|lt|lr|ly|li|re|lu|rw|ro|mg|im|mv|mt|mw|my|ml|mk|mh|mq|yt|mu|mr|us|um|as|vi|mn|ms|bd|pe|fm|mm|md|ma|mc|mz|mx|na|za|aq|gs|nr|np|ni|ne|ng|nu|no|nf|pw|pn|pt|jp|se|ch|sv|ws|yu|sl|sn|cy|sc|sa|cx|st|sh|kn|lc|sm|pm|vc|lk|sk|si|sj|sz|sd|sr|sb|so|tj|tw|th|tz|to|tc|tt|tn|tv|tr|tm|tk|wf|vu|gt|ve|bn|ug|ua|uy|uz|es|eh|gr|hk|sg|nc|nz|hu|sy|jm|am|ac|ye|iq|ir|il|it|in|id|uk|vg|io|jo|vn|zm|je|td|gi|cl|cf|cn|citic|pro|travel)([/][a-z0-9]{1,10})$/i.test(domain.replace(/\s+/g,""))){
		ret = true;
	}else if(domain.length > 63){
		ret = false;
	}else if(""==domain){
		ret = false;
	}
	return ret;
}
/* 二级域名加 2个 / / 的格式    例如：gr.cn/zhuzi/  */
function isValidDomainShuangXieGang(domain){
	var ret = false;
	if(/^[a-z0-9-]{1,63}\.([a-z0-9-]{1,63}\.)*(com|cn|online|club|xin|wang|top|xyz|ren|site|website|space|tech|date|net|biz|win|news|video|click|link|pics|photo|cc|party|trade|science|pub|rocks|band|market|help|gift|press|wiki|design|software|social|lawyer|engineer|live|studio|org|me|gov.cn|ac|edu|gov|cc|info|tv|name|hk|co.uk|co|so|tel|mobi|asia|中国|公司|网络|政务|公益|我爱你|集团|其他|al|dz|af|ar|ae|aw|om|az|eg|et|ie|ee|ad|ao|ai|ag|at|au|mo|bb|pg|bs|pk|py|ps|bh|pa|br|by|bm|bg|mp|bj|be|is|pr|ba|pl|bo|bz|bw|bt|bf|bi|bv|kp|gq|dk|de|tl|tp|tg|dm|do|ru|ec|er|ee|fr|fo|pf|gf|tf|va|ph|fj|fi|cv|fk|gm|cg|cd|co|cr|gg|gd|gl|ge|cu|gp|gu|gy|kz|ht|kr|nl|an|hm|hn|ki|dj|kg|gn|gw|ca|gh|ga|kh|cz|zw|cm|qa|ky|km|ci|kw|cc|hr|ke|ck|lv|ls|la|lb|lt|lr|ly|li|re|lu|rw|ro|mg|im|mv|mt|mw|my|ml|mk|mh|mq|yt|mu|mr|us|um|as|vi|mn|ms|bd|pe|fm|mm|md|ma|mc|mz|mx|na|za|aq|gs|nr|np|ni|ne|ng|nu|no|nf|pw|pn|pt|jp|se|ch|sv|ws|yu|sl|sn|cy|sc|sa|cx|st|sh|kn|lc|sm|pm|vc|lk|sk|si|sj|sz|sd|sr|sb|so|tj|tw|th|tz|to|tc|tt|tn|tv|tr|tm|tk|wf|vu|gt|ve|bn|ug|ua|uy|uz|es|eh|gr|hk|sg|nc|nz|hu|sy|jm|am|ac|ye|iq|ir|il|it|in|id|uk|vg|io|jo|vn|zm|je|td|gi|cl|cf|cn|citic|pro|travel)([/][a-z0-9]{1,10}[/])$/i.test(domain.replace(/\s+/g,""))){
		ret = true;
	}else if(domain.length > 63){
		ret = false;
	}else if(""==domain){
		ret = false;
	}
	return ret;
}


/* 子域名  */
function isValidSubDom(SubDom){
	
	var ret = false;
	//if(/^([a-z0-9-]{1,63}\.)*[a-z0-9-]{2,63}\.(com|net|ac|cn|org|edu|gov|biz|cc|info|tv|name|hk|co.uk|gov.cn|wang|top|me|co|so|tel|mobi|asia|xyz|ren|中国|公司|网络|政务|公益|我爱你|其他)$/i.test(SubDom.replace(/\s+/g,""))){
	if(/^[a-z0-9-]{1,63}\.([a-z0-9-]{1,63}\.)*(com|cn|online|club|xin|wang|top|xyz|ren|site|website|space|tech|date|net|biz|win|news|video|click|link|pics|photo|cc|party|trade|science|pub|rocks|band|market|help|gift|press|wiki|design|software|social|lawyer|engineer|live|studio|org|me|gov.cn|ac|edu|gov|cc|info|tv|name|hk|co.uk|co|so|tel|mobi|asia|中国|公司|网络|政务|公益|我爱你|集团|其他|al|dz|af|ar|ae|aw|om|az|eg|et|ie|ee|ad|ao|ai|ag|at|au|mo|bb|pg|bs|pk|py|ps|bh|pa|br|by|bm|bg|mp|bj|be|is|pr|ba|pl|bo|bz|bw|bt|bf|bi|bv|kp|gq|dk|de|tl|tp|tg|dm|do|ru|ec|er|ee|fr|fo|pf|gf|tf|va|ph|fj|fi|cv|fk|gm|cg|cd|co|cr|gg|gd|gl|ge|cu|gp|gu|gy|kz|ht|kr|nl|an|hm|hn|ki|dj|kg|gn|gw|ca|gh|ga|kh|cz|zw|cm|qa|ky|km|ci|kw|cc|hr|ke|ck|lv|ls|la|lb|lt|lr|ly|li|re|lu|rw|ro|mg|im|mv|mt|mw|my|ml|mk|mh|mq|yt|mu|mr|us|um|as|vi|mn|ms|bd|pe|fm|mm|md|ma|mc|mz|mx|na|za|aq|gs|nr|np|ni|ne|ng|nu|no|nf|pw|pn|pt|jp|se|ch|sv|ws|yu|sl|sn|cy|sc|sa|cx|st|sh|kn|lc|sm|pm|vc|lk|sk|si|sj|sz|sd|sr|sb|so|tj|tw|th|tz|to|tc|tt|tn|tv|tr|tm|tk|wf|vu|gt|ve|bn|ug|ua|uy|uz|es|eh|gr|hk|sg|nc|nz|hu|sy|jm|am|ac|ye|iq|ir|il|it|in|id|uk|vg|io|jo|vn|zm|je|td|gi|cl|cf|cn|citic|pro|travel)$/i.test(SubDom.replace(/\s+/g,""))){
		ret = true;
	}else if(SubDom.length > 63){
		ret = false;
	}else if(""==SubDom){
		ret = false;
	}
	return ret;
	///^([a-z0-9-]{1,65}\.)*[a-z0-9-]{2,}\.(com|net|ac|cn|org|edu|gov|biz|cc|info|tv|name|hk|co.uk|gov.cn|wang|top|me|co|so|tel|mobi|asia|xyz|ren|中国|公司|网络|政务|公益|我爱你|其他)$/i
}

/* 主域名为IP地址，，不可以填ip段  */
function isValidIPzym(ip){
	var ret = false;
	var reg = /^([0-9]|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.([0-9]|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.([0-9]|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.([0-9]|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])$/;
	if(reg.test(ip.replace(/\s+/g,""))){
		ret = true;
	}else if(""==ip){
		ret = false;
	}
	return ret;
}
/* IP地址可以添加ip和Ip段 */
function isValidIP(ip){
	var ret = false;
	 var position = ip.indexOf("-");//按 “ - ”截取ip段
     var a = ip.substring(0,position);//前一段
	if(a!=""){//如果ip的长度大于15，说明是ip段
		 //alert(ip);
	     var position = ip.indexOf("-");//按 “ - ”截取ip段
	     var ip1 = ip.substring(0,position);//前一段
	     //alert(ip1); // 第一个 - 左边的字串: abc
	     var ip2 = ip.substr(position + 1).replace("-","");//后一段
	     //alert(ip2); // 第一个 - 右边的字串: defg
	    
	     //判断ip1和ip2的值是否正确和相等(开始)------------------------------------------------------------------------------------------------------
	     var ret1=false;
	     var ret2=false;
	     var reg1 = /^([0-9]|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.([0-9]|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.([0-9]|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.([0-9]|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])$/;		    
	     if(reg1.test(ip1.replace(/\s+/g,""))){
				ret1 = true;
			}else if(""==ip1){
				ret1 = false;
			}
	     var reg2 = /^([0-9]|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.([0-9]|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.([0-9]|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.([0-9]|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])$/;
	     if(reg2.test(ip2.replace(/\s+/g,""))){
				ret2 = true;
			}else if(""==ip2){
				ret2 = false;
			}
	     
	     if(ret1==true&&ret2 == true){//ip1和ip2都验证正确
	    	 if(ip1==ip2){//如果ip1==ip2，不通过
	    		 ret = false;
	    		 return ret;
	    	 }
	    	 if(ip1.split(".")[2]>ip2.split(".")[2]){//判断ip1和ip2的第3个点之前的值
		    	ret = false;
		    	return ret;
	    	 }
	    	 if(ip1.split(".")[2]=ip2.split(".")[2]){//判断ip1和ip2的第3个点之前的值
	    		 if(ip1.substr(-2,2)>=ip2.substr(-2,2)){
	    			 ret = false;
				     return ret;
		    	 }
		     }
	    	 
	    	 
	    	 //判断ip段第二个点之前的值是否相等（开始）******************************************************************
	    	 if(ip1.split(".")[0]==ip2.split(".")[0]){//判断ip1和ip2的第一个点之前的值是否相等
	    		 if(ip1.split(".")[1]==ip2.split(".")[1]){//判断ip1和ip2的第二个点之前的值是否相等
	    			 //alert(ip1.split(".")[1]);//输出ip1第一个点的值
	    	    	 ret = true;
		    	 }
	    	 }
	    	 //判断ip段第二个点之前的值是否相等（结束）******************************************************************
	     
	     }
	     //判断ip1和ip2的值是否正确和相等（结束）------------------------------------------------------------------------------------------------------	     
	     return ret;
	}else{
		var reg = /^([0-9]|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.([0-9]|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.([0-9]|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.([0-9]|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])$/;
		if(reg.test(ip.replace(/\s+/g,""))){
			ret = true;
		}else if(""==ip){
			ret = false;
		}
		return ret;
	}
}

/**
 * 身份证
 */
/* 规则  */
function clsIDCard(CardNo) {
	  this.Valid=false;
	  this.ID15='';
	  this.ID18='';
	  this.Local='';
	  if(CardNo!=null)this.SetCardNo(CardNo);
}  
// 设置身份证号码，15位或者18位
clsIDCard.prototype.SetCardNo = function(CardNo) {
  this.ID15='';
  this.ID18='';
  this.Local='';
  CardNo=CardNo.replace(" ","");
  var strCardNo;
  if(CardNo.length==18) {
    pattern= /^\d{17}(\d|x|X)$/;
    if (pattern.exec(CardNo)==null)return;
    strCardNo=CardNo.toUpperCase();
  } else {
    pattern= /^\d{15}$/;
    if (pattern.exec(CardNo)==null)return;
    strCardNo=CardNo.substr(0,6)+'19'+CardNo.substr(6,9);
    strCardNo+=this.GetVCode(strCardNo);
  }
  this.Valid=this.CheckValid(strCardNo);
};
// 校验身份证有效性
clsIDCard.prototype.IsValid = function() {
  return this.Valid;
};
// 返回生日字符串，格式如下，1981-10-10
clsIDCard.prototype.GetBirthDate = function() {
  var BirthDate='';
  if(this.Valid)BirthDate=this.GetBirthYear()+'-'+this.GetBirthMonth()+'-'+this.GetBirthDay();
  return BirthDate;
};
// 返回生日中的年，格式如下，1981
clsIDCard.prototype.GetBirthYear = function() {
  var BirthYear='';
  if(this.Valid)BirthYear=this.ID18.substr(6,4);
  return BirthYear;
};
// 返回生日中的月，格式如下，10
clsIDCard.prototype.GetBirthMonth = function() {
  var BirthMonth='';
  if(this.Valid)BirthMonth=this.ID18.substr(10,2);
  if(BirthMonth.charAt(0)=='0')BirthMonth=BirthMonth.charAt(1);
  return BirthMonth;
};
// 返回生日中的日，格式如下，10
clsIDCard.prototype.GetBirthDay = function() {
  var BirthDay='';
  if(this.Valid)BirthDay=this.ID18.substr(12,2);
  return BirthDay;
};
// 返回性别，1：男，0：女
clsIDCard.prototype.GetSex = function() {
  var Sex='';
  if(this.Valid)Sex=this.ID18.charAt(16)%2;
  return Sex;
};
// 返回15位身份证号码
clsIDCard.prototype.Get15 = function() {
  var ID15='';
  if(this.Valid)ID15=this.ID15;
  return ID15;
};
// 返回18位身份证号码
clsIDCard.prototype.Get18 = function() {
  var ID18='';
  if(this.Valid)ID18=this.ID18;
  return ID18;
};
// 返回所在省，例如：上海市、浙江省
clsIDCard.prototype.GetLocal = function() {
  var Local='';
  if(this.Valid)Local=this.Local;
  return Local;
};
clsIDCard.prototype.GetVCode = function(CardNo17) {
  var Wi = new Array(7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2,1);
  var Ai = new Array('1','0','X','9','8','7','6','5','4','3','2');
  var cardNoSum = 0;
  for (var i=0; i<CardNo17.length; i++)cardNoSum+=CardNo17.charAt(i)*Wi[i];
  var seq = cardNoSum%11;
  return Ai[seq];
};
clsIDCard.prototype.CheckValid = function(CardNo18) {
  if(this.GetVCode(CardNo18.substr(0,17))!=CardNo18.charAt(17))return false;
  if(!this.IsDate(CardNo18.substr(6,8)))return false;
  var aCity={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江 ",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北 ",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏 ",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"};
  if(aCity[parseInt(CardNo18.substr(0,2))]==null)return false;
  this.ID18=CardNo18;
  this.ID15=CardNo18.substr(0,6)+CardNo18.substr(8,9);
  this.Local=aCity[parseInt(CardNo18.substr(0,2))];
  return true;
};
clsIDCard.prototype.IsDate = function(strDate) {
  var r = strDate.match(/^(\d{1,4})(\d{1,2})(\d{1,2})$/);
  if(r==null)return false;
  var d= new Date(r[1], r[2]-1, r[3]);
  return (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[2]&&d.getDate()==r[3]);
};

/* 方法   */
function isCardNo2(idCard){
	 var ret = false;
	 var checkFlag = new clsIDCard(idCard);
	     
	  if (!checkFlag.IsValid()) {
		  ret = false;
	  }else if(""==idCard){
		  ret = true;
	  }else{
		  ret = true;
	  }
	  return ret;
}




