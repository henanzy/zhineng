<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <script type="text/javascript" src="../js/LodopFuncs.js"></script>


<title>收款费用收据</title>




<script   type="text/javascript">
  //获得当前时间,刻度为一千分一秒
  var initializationTime=(new Date()).getTime();
  function showLeftTime(){
	   var now=new Date();
	   var year=now.getFullYear();
	   var month=now.getMonth()+1;
	  /*   if(month==10){
		   month=month;
	   }
	    if(month==11){ 
		   month=month;
	   } else if(month==12){
		   month=month
	   }else{
		   month=0+""+month;
	   } */  
	    if (month >= 1 && month <= 9) {
	        month = "0" + month;
	    }
	   var day=now.getDate();
	   if(day>=10 && day<=31){
		   day=day
	   }else if(day>=0 && day<=9) {
		  day=0+""+day; 
	   }
	   
	   var hours=now.getHours();
	   var minutes=now.getMinutes();
	   var seconds=now.getSeconds();
	   document.all.show.innerHTML=""+year+"年"+month+"月"+day+"日 "+hours+":"+minutes+":"+seconds+"";
	   //一秒刷新一次显示时间
	     var timeID=setTimeout(showLeftTime,1000);  
  }
</script>

</head>
<script type="text/javascript">
var  LODOP;
function myPrint() {	
	LODOP=getLodop(); 
	LODOP.SET_PRINT_PAGESIZE(1, 700,1000,"");
	LODOP.SET_PRINT_STYLE("FontSize",11);
	LODOP.ADD_PRINT_TEXT(10,10,100,25,"郭德强");
	LODOP.SET_PRINT_STYLEA(2,"FontName","隶书");
	LODOP.SET_PRINT_STYLEA(2,"FontSize",15);
	LODOP.ADD_PRINT_TEXT(10,10,100,25,"科学家");
	LODOP.ADD_PRINT_TEXT(10,10,100,25,"地址：中国北京社会科学院附近东大街西胡同");
	LODOP.ADD_PRINT_TEXT(10,10,100,25,"电话：010-88811888");
	      
	LODOP.PREVIEW();	       
};
function doPrint(){
	//第一步，将要打印的内容赋值给一个对象
/* 	var newstr = document.getElementById("printDiv").innerHTML;//得到需要打印的元素HTML
	//第二步，将之前所有的页面内容赋值给一个对象
	var oldstr = document.body.innerHTML;//保存当前页面的HTML
	//第三步，将要打印的DIV赋值给整个页面，也就是说页面加入有十个DIV，执行整个操作后就剩一个要打印的DIV了
	document.body.innerHTML = newstr; */
	//第四步，执行打印函数
var LODOP=getLodop();
	//第五步，讲之前保存的所有页面内容，重新还原。即把1个DIV重新还原成10个DIV
	/* document.body.innerHTML = oldstr; */
}
</script>
<body onload="showLeftTime()">
<div id="printDiv" style="background-color:#4BC9D3;width: 750px;float:left;">
	 
	<table   style="border:1px solid;background-color:#4BC9D3; border-color:#red;" width="750px" border="0" cellspacing="1"  cellpadding="0" >
		<h2 align="center"  style="font-style: bold">&nbsp;&nbsp;空&nbsp;&nbsp;调&nbsp;&nbsp;费&nbsp;&nbsp;用&nbsp;&nbsp;收&nbsp;&nbsp;据</h2>
		<h3 align="center" style="display: block;font-size:17px; margin: 5px" id="timetable" " ><label id="show">显示时间的位置</label></h3>
	&nbsp;&nbsp;&nbsp;&nbsp;
 
	
	 <tr>
      <td width="450" height="40">今收到：<u><%=session.getAttribute("xqm")%></u>小区 <u><%=session.getAttribute("ldh")%></u>楼栋 <u><%=session.getAttribute("dyh")%></u>单元<u><%=session.getAttribute("hh")%></u>户<u></td>
      <td width="385">姓名：<u><%=session.getAttribute("name")%></u></td>
    </tr>
    <tr>
      <td height="40">收款事由：中央空调费用</td>
      <td></td>
    </tr>
    <tr>
      <td height="40">人民币：<u><%=session.getAttribute("rmbD")%></u></td>
      <td>￥：<u><%=session.getAttribute("rmbX")%></u> 整</td>
    </tr>
    <tr>
      <td height="40">收费模式：<u><%=session.getAttribute("model")%></u></td>
     <!--   <td>起止时间:<u>2018</u>年 <u>7</u>月 <u>15</u>日-<u>2018</u>年 <u>8</u>月 <u>15</u>日</td> -->
      <td>起止时间:<%=session.getAttribute("startTime")%>至&nbsp;<%=session.getAttribute("endTime")%></td>
     
    </tr>
    <tr>
      <td height="40">收款人/经办人：<u>财务01</u></td>
      <td>收款单位签章：河南润恒节能技术开发有限公司</td>
    </tr>
    
   
  </table>
	<h3 style="display: block;font-size:16px; margin: 40px ;text-align:right" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;交款人签字确认:<u><%=session.getAttribute("name")%></u></h3>
</div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<div style=" margin-left:700px">
 <input type="button" onClick="myPrint()" value="打印" />
</div>
</body>
</html>
