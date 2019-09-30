<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>运行管理</title>

<!-- Required Stylesheets -->
<link rel="stylesheet" type="text/css" href="../css/reset.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="../css/text.css"
	media="screen" />
<link rel="stylesheet" type="text/css"
	href="../css/fonts/ptsans/stylesheet.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/fluid.css"
	media="screen" />

<link rel="stylesheet" type="text/css" href="../css/mws.style.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="../css/icons/icons.css"
	media="screen" />

<!-- Demo and Plugin Stylesheets -->
<link rel="stylesheet" type="text/css" href="../css/demo.css"
	media="screen" />

<link rel="stylesheet" type="text/css"
	href="../plugins/colorpicker/colorpicker.css" media="screen" />
<link rel="stylesheet" type="text/css"
	href="../plugins/jimgareaselect/css/imgareaselect-default.css"
	media="screen" />
<link rel="stylesheet" type="text/css"
	href="../plugins/fullcalendar/fullcalendar.css" media="screen" />
<link rel="stylesheet" type="text/css"
	href="../plugins/fullcalendar/fullcalendar.print.css" media="print" />
<link rel="stylesheet" type="text/css" href="../plugins/tipsy/tipsy.css"
	media="screen" />
<link rel="stylesheet" type="text/css"
	href="../plugins/sourcerer/Sourcerer-1.2.css" media="screen" />
<link rel="stylesheet" type="text/css"
	href="../plugins/jgrowl/jquery.jgrowl.css" media="screen" />
<link rel="stylesheet" type="text/css"
	href="../plugins/spinner/spinner.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/jui/jquery.ui.css"
	media="screen" />

<!-- Theme Stylesheet -->
<link rel="stylesheet" type="text/css" href="../css/mws.theme.css"
	media="screen" />

<!-- JavaScript Plugins -->

<script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>

<script type="text/javascript"
	src="../plugins/jimgareaselect/jquery.imgareaselect.min.js"></script>
<script type="text/javascript"
	src="../plugins/jquery.dualListBox-1.3.min.js"></script>
<script type="text/javascript" src="../plugins/jgrowl/jquery.jgrowl.js"></script>
<script type="text/javascript" src="../plugins/jquery.filestyle.js"></script>
<script type="text/javascript"
	src="../plugins/fullcalendar/fullcalendar.min.js"></script>
<script type="text/javascript" src="../plugins/jquery.dataTables.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="../plugins/flot/excanvas.min.js"></script>
<![endif]-->
<!-- <script type="text/javascript" src="../plugins/flot/jquery.flot.min.js"></script>
<script type="text/javascript"
	src="../plugins/flot/jquery.flot.pie.min.js"></script>
<script type="text/javascript"
	src="../plugins/flot/jquery.flot.stack.min.js"></script>
<script type="text/javascript"
	src="../plugins/flot/jquery.flot.resize.min.js"></script> -->
<script type="text/javascript"
	src="../plugins/colorpicker/colorpicker.js"></script>
<script type="text/javascript" src="../plugins/tipsy/jquery.tipsy.js"></script>
<script type="text/javascript"
	src="../plugins/sourcerer/Sourcerer-1.2.js"></script>
<script type="text/javascript" src="../plugins/jquery.placeholder.js"></script>
<script type="text/javascript" src="../plugins/jquery.validate.js"></script>
<script type="text/javascript" src="../plugins/jquery.mousewheel.js"></script>
<script type="text/javascript" src="../plugins/spinner/ui.spinner.js"></script>
<script type="text/javascript" src="../js/jquery-ui.js"></script>

<script type="text/javascript" src="../js/mws.js"></script>
<script type="text/javascript" src="../js/demo.js"></script>
<script type="text/javascript" src="../js/themer.js"></script>
<script type="text/javascript">
/* 平均开度 */
var findXqAvgKd=${findXqAvgKd}
/* 平均温度 */
var findXqAvgWd=${findXqAvgWd}
</script>
<script type="text/javascript" src="../js/yxgl.js"></script>
<!-- <script type="text/javascript" src="../js/table.js"></script> -->
<style>
.span-up{
        border-style: solid;
        border-width: 0px 5px 5px 5px;
        border-color: transparent transparent black transparent;
        width: 0px;
        height: 0px;
        display: block;
        position: absolute;
        top: 14px;
       	right: 6px;
    }
    
    .span-down{
        border-style: solid;
        border-width: 5px 5px 0px 5px;
        border-color: black transparent transparent transparent;
        width: 0px;
        height: 0px;
        display: block;
        position: absolute;
        top: 20px;
        right: 6px;
    }
* {
	margin: 0;
	padding: 0;
	list-style-type: none;
}


		th,td{  
  
  white-space: nowrap;
} 
.table-th-css {
	position: relative !important;
	top: 0;
}

html,body{
	height:125%;
}

/* td悬停样式 */
 	.blue {
		background: #ccc;
	} 
	
	/* 搜索DIV */
	.search{
		display:block;
		width:99.8%;
		height:40px;
		background-color:#ccc;
		margin:0px auto;
		font-size:12px;
	}
	
	.search p{
		height:30px;
	}
	
	.search p select{
		width:120px;
		height:24px;
		border:none;
		border-radius:6px;
		padding-left:6px;
	}
	
	.search p span{
		color:#333;
		font-size:14px;
		margin-left:20px; 
	}
	.search span input{
		width:62px;
	} 
	/* 搜索按钮 */
	#search_btn,
	#pay_btn,
	#export_btn{
		margin-top:8px;
		margin-left:20px;
		border:none;
		background-color:rgb(60,61,61);
		width:60px;
		height:24px;
		margin-right:6px;
		color:#fff;
		border-radius:4px;
	}
	#hh{
		width:60px;
		height:24px;
		line-height:24px;
		border-radius:4px;
		background-color:rgba(43,45,49,0.8);
		color:#fff;
		cursor:pointer;
		text-align:center;
		padding:0 4px;
	}

	nav li,
	select{
		height:24px;
		line-height:24px;
		border-radius:4px;
		background-color:rgba(43,45,49,0.8);
		color:#fff;
		cursor:pointer;
		text-align:center;
		padding:0 4px;
	}

	input{
	border-radius:4px;
		background-color:rgba(43,45,49,0.8);
		color:#fff;
		cursor:pointer;
		text-align:center;
		padding:0 4px;
	}
	
	@media screen and (max-width:1300px){
		
		.search{
			height:80px;
		}
		.search p{
			width:650px;
			padding-top:8px;
			height:60px;
		}
		
		
	}
	
	@media screen and (max-width:1270px){
		html,body{
			height:140%;
		}
		.mws-panel{
			width:98% !important;
			min-width:700px !important;
		}
	}
	
	@media screen and (max-width:1000px){
		html,body{
			height:156%;
		}
		
	}
		
</style>
<script>
    $(document).ready(function(){

		var xincreatetableCont = $('#xincreate_table_body table tr th'); //获取th
		var xincreatetableScroll = $('#xincreate_table_body'); //获取滚动条同级
		xincreatetableScroll.on('scroll', scrollHandlexincreate);

		function scrollHandlexincreate() {
			var scrollTop = xincreatetableScroll.scrollTop();
			// 当滚动距离大于0时设置top及相应的样式
			if (scrollTop > 0) {
				xincreatetableCont.css({
					"top" : scrollTop + 'px',
					"marginTop" : "-1px",
					"backgroundColor" : "#EBEBEB"
				})
			} else { // 当滚动距离小于0时设置top及相应的样式 
				xincreatetableCont.css({
					"top" : scrollTop + 'px',
					"marginTop" : "0",
					"backgroundColor" : "#EBEBEB"
				})
			}
		}
		

		var donetableCont = $('#done_table_body table tr th'); //获取th
		var donetableScroll = $('#done_table_body'); //获取滚动条同级
		donetableScroll.on('scroll', scrollHandledone);

		function scrollHandledone() {
			var scrollTop = donetableScroll.scrollTop();
			// 当滚动距离大于0时设置top及相应的样式
			if (scrollTop > 0) {
				donetableCont.css({
					"top" : scrollTop + 'px',
					"marginTop" : "-1px",
					"backgroundColor" : "#EBEBEB"
				})
			} else { // 当滚动距离小于0时设置top及相应的样式 
				donetableCont.css({
					"top" : scrollTop + 'px',
					"marginTop" : "0",
					"backgroundColor" : "#EBEBEB"
				})
			}
		}
	  
	    
    }); 
</script>

</head>
<body>
	<!--  右边主容器 start  -->
	<div id="" class="clearfix" > 

		<!--  内主容器   start-->
		
		<%-- <div class="mws-report-container clearfix">

			<p class="mws-report" href="#">
				<span class="mws-report-icon mws-ic" style="background:url(../images/yxgl/user.png) no-repeat center" ></span> <span
					class="mws-report-content"> <span class="mws-report-title"
					style="font-size: 18px;">供热用户</span> <span class="mws-report-value" id="gryh">${grYh}</span>
					<span class="mws-report-title">(户)</span>

				</span>
			</p>

			<p class="mws-report" href="#">
				<span class="mws-report-icon mws-ic" style="background:url(../images/yxgl/piece.png) no-repeat center" ></span> <span
					class="mws-report-content"> <span class="mws-report-title"
					style="font-size: 18px;">供热占比</span> <span

					class="mws-report-value down" id="grmj">${grmj}%</span>

				<!-- 	class="mws-report-value down" id='grmj'></span> -->

				</span>
			</p>

			<p class="mws-report" href="#">
				<span class="mws-report-icon mws-ic" style="background:url(../images/yxgl/tempout.png) no-repeat center"></span> <span
					class="mws-report-content"> <span class="mws-report-title"

					style="font-size: 18px;">室外温度</span> <span class="mws-report-value">${tqyb}</span>

				<!-- 	style="font-size: 18px;" >室外温度</span> <span class="mws-report-value" id='swwd'></span> -->

				</span>
			</p>

			<p class="mws-report" href="#">
				<span class="mws-report-icon mws-ic" style="background:url(../images/yxgl/tempin.png) no-repeat center"></span> <span
					class="mws-report-content"> <span class="mws-report-title"
					style="font-size: 18px;">平均室温</span> <span
					class="mws-report-value up" id="pjsw">${avgroom}</span>
					<!-- class="mws-report-value up" id='pjsw'></span> -->
				</span>
			</p>

			<p class="mws-report" href="#">
				<span class="mws-report-icon mws-ic" style="background:url(../images/yxgl/userno.png) no-repeat center"></span> <span
					class="mws-report-content"> <span class="mws-report-title"

					style="font-size: 18px;">未供热用户</span> <span class="mws-report-value" id="wgryh">${wgryh}</span>
					

					<!-- style="font-size: 18px;">未供热用户</span> <span class="mws-report-value" id='wgryh'></span> -->
			<!-- 		<span class="mws-report-title">(户)</span> -->

				</span>
			</p>
		</div> --%>
		
		<div class="mws-report-container clearfix">

			<p class="mws-report" href="#">
				<span class="mws-report-icon mws-ic" style="background:url(../images/yxgl/area.png) no-repeat center"></span> <span
					class="mws-report-content"> <span class="mws-report-title">供热面积</span><br/>
					<span class="mws-report-value" id='grmj'></span>
				</span>
			</p>
            <p class="mws-report" href="#">
				<span class="mws-report-icon mws-ic" style="background:url(../images/yxgl/piece.png) no-repeat center"></span> <span
					class="mws-report-content"> <span class="mws-report-title">供热比例</span><br/>
					<span class="mws-report-value" id='grbl'></span>
				</span>
			</p>
			<p class="mws-report" href="#">
				<span class="mws-report-icon mws-ic" style="background:url(../images/yxgl/user.png) no-repeat center"></span> <span
					class="mws-report-content"> <span class="mws-report-title">供热用户</span><br/>
					<span class="mws-report-value" id='gryh'></span>
				</span>
			</p>

			<p class="mws-report" href="#">
				<span class="mws-report-icon mws-ic" style="background:url(../images/yxgl/tempout.png) no-repeat center"></span> <span
					class="mws-report-content"> <span class="mws-report-title">室外温度</span><br/>
					<span class="mws-report-value" id='swwd'></span>
				</span>
			</p>

			<p class="mws-report" href="#">
				<span class="mws-report-icon mws-ic" style="background:url(../images/yxgl/tempin.png) no-repeat center"></span> <span
					class="mws-report-content"> <span class="mws-report-title">平均室温</span><br/>
					<span class="mws-report-value" id='pjsw'></span>
				</span>
			</p>

			
		</div>

<div class="mws-panel grid_8 "
			style="width: 98%; padding-left: 12px; margin: 0px 0px 10px 0px; min-width:650px">
			<div class="mws-panel-header">
				&nbsp;
				<span style="display:inline" id="xqmc"></span>
			</div>
			<div class="search">
				<p>
				    <span>选择公司：
					<select id="ssgs" style="width:150px"
						name="ssgs">
						
					</select>
					</span>
					<span>选择小区：
					<select id="xq" style="width:150px"
						name="xqName">
						
					</select>
					</span>
					<span>楼栋号：
						<select name="ldh" id="ldh" style="width:70px">
							<option value="" >楼栋</option>
					</select>
					</span>
					<span>单元号：
						<select name="dyh" id="dyh" style="width:70px">
							<option value="" >单元</option>
					</select>
					</span>
					<span>户号：
						<input type="text" name="hh" id="hh" size=6px
						value="" />
					</span>
					

					<input id="search_btn" type="submit" value="搜索" />
					<input id="export_btn" type="button" value="导出" />
				</p>
			</div>
			<div id="xincreate_table_body" class="mws-panel-body"

				style="overflow:scroll !important;height: 590px;">
				<table class="mws-table"  id="word_table">
							<!--  style="width:150%;"  -->
					<thead>
						<tr>
							<th class="table-th-css">用户姓名<span class="span-up"></span> <span class="span-down"></span></th>
						
							<th class="table-th-css">楼栋<span class="span-up"></span> <span class="span-down"></span></th>
							<th class="table-th-css">单元<span class="span-up"></span> <span class="span-down"></span></th>
							<th class="table-th-css">户号<span class="span-up"></span> <span class="span-down"></span></th>
							<th class="table-th-css">状态<span class="span-up"></span> <span class="span-down"></span></th>
							<th class="table-th-css">开度<span class="span-up"></span> <span class="span-down"></span></th>
							<th class="table-th-css">室温<span class="span-up"></span> <span class="span-down"></span></th>
							<th class="table-th-css">室外温度<span class="span-up"></span> <span class="span-down"></span></th>
							<th class="table-th-css">管道温度<span class="span-up"></span> <span class="span-down"></span></th>
							<th class="table-th-css">锁定<span class="span-up"></span> <span class="span-down"></span></th>
							<th class="table-th-css">抄表时间<span class="span-up"></span> <span class="span-down"></span></th>
							<th class="table-th-css">用户ID<span class="span-up"></span> <span class="span-down"></span></th>
							<th class="table-th-css">阀门地址<span class="span-up"></span> <span class="span-down"></span></th>
							<th class="table-th-css">传感器地址<span class="span-up"></span> <span class="span-down"></span></th>
							<th class="table-th-css">缴费状态<span class="span-up"></span> <span class="span-down"></span></th>
							<th class="table-th-css">面积<span class="span-up"></span> <span class="span-down"></span></th>
							<th class="table-th-css">区管ID<span class="span-up"></span> <span class="span-down"></span></th>
						</tr>
					</thead>
					<tbody id="xinword_body">
						
				
					</tbody>
				</table>
			</div>
		</div>

		
		<nav style="width:100%;">
            <ul style="width:550px;display:flex;justify-content:space-between;margin:0 auto;" >
            	
                <li id="first">首页</li>
                <li id="last">上一页</li>
                <li id="next">下一页</li>
                <li id="end">尾页</li>   
                <li id="curpage">当前第<span id="currentNum" ></span>页 /共<span id='pages'></span>页</li>
                <li>共<span id="num"></span></li>
                
                    <select name="" id="select" >
                        <option value="10">10</option>
                        <option value="15"  selected = "selected">15</option>
                        <option value="20" >20</option>
                        <option value="25">25</option>
                        <option value="30">30</option>
                    </select>
                     
            </ul>
         </nav>
         <br/>
         <div style="clear:both;"></div>
		<div class="mws-panel grid_8" style="width: 48%; float: left; min-width:500px">
			<div class="mws-panel-header">
				<span class="mws-i-24 i-graph" style="display:block;height:35px">小区开度100%比例曲线图</span>
				
				
			</div>
			<div class="mws-panel-body">
			<span>
				选择小区：

					<select id="kdline">
						
					</select>
				<input type="date" id="startTime1"  style="width:140px" value="" />-
                <input type="date" id="endTime1" style="width:140px" value="" />	
				<input type="submit"
						class="mws-button black" id="kd_search" value="搜索" />
				</span>
				<div class="mws-panel-content">
					<div id="mws-dashboard-chart-1" style="width: 100%; height: 315px;"></div>
				</div>
			</div>
		</div>



		<div class="mws-panel grid_8 " style="width: 48%; float: left; min-width:500px">
			<div class="mws-panel-header" >
				<span class="mws-i-24 i-graph" style="display:block;height:35px">小区平均室温与室外温度曲线图</span>
				
				
			</div>
			<div class="mws-panel-body">
			<span >
				选择小区：

					<select id="wdline">
						
					</select>
				<input type="date" id="startTime2"  style="width:140px" value="" />-
                <input type="date" id="endTime2" style="width:140px" value="" />	
				<input type="submit"
						class="mws-button black" id="wd_search" value="搜索" />
				</span>
				<div class="mws-panel-content">
					<div id="mws-dashboard-chart-2" style="width: 100%; height: 315px;"></div>
				</div>
			</div>
		</div>

		
	</div>



<script type="text/javascript" src="../js/echarts-3.5.3/highcharts.js"></script>
<script type="text/javascript">

var ssgs="<%=request.getSession().getAttribute("ssgs")%>"
if(ssgs!="null"){
	$("#ssgs").append("<option value='"+ssgs+"'>"+ssgs+"</option>");
}else{
	var gsList
	$.ajax({
			url : "<%=basePath%>user/getgs.action", 
			async : false,
			dataType : "json",
			data : {
			
			},
			success : function(data) {
				
				gsList=data.list;	   
				
               for(var i=0; i<gsList.length; i++){
					
					$("#ssgs").append("<option value='"+gsList[i]+"'>"+gsList[i]+"</option>");
					
				}
			}

		});
}

$.ajax({
	url : "<%=basePath%>xxgl/xtzl.action", 
	async : false,
	dataType : "json",
	data : {
	
	},
	success : function(data) {
		$('#gryh').html(data.gryh);
		$('#grmj').html(data.grmj);
		$('#pjsw').html(data.pjsw);
		$('#grbl').html(data.grbl);
		$('#swwd').html(data.tqyb);   
	}

});	
var time = new Date();
        var day = ("0" + time.getDate()).slice(-2);
        var month = ("0" + (time.getMonth() + 1)).slice(-2);
        var today = time.getFullYear() + "-" + (month) + "-" + (day);
        $('#endTime1').val(today);
        $('#endTime2').val(today);
        
                
                var month1 = ("0" + (time.getMonth() )).slice(-2);
                var today1 = time.getFullYear() + "-" + (month1) + "-" + (day);
                $('#startTime1').val(today1);
                $('#startTime2').val(today1);
	
var xq;

 $.ajax({
		url : "<%=basePath%>yhInfo/findXq.action", 
		async : false,
		dataType : "json",
		data : {
			
		},
		success : function(data) {
			
			var opt="";
			 xq=data.Xq;
			
			 for(var i=0; i<xq.length; i++){
				 if(xq[i].XqName.indexOf("嘉和广场")>-1)
					{
					$("#xq").append("<option value='"+xq[i].XqName+"' selected	>"+xq[i].XqName+"</option>");
					$("#wdline").append("<option value='"+xq[i].XqName+"' selected >"+xq[i].XqName+"</option>");
					$("#kdline").append("<option value='"+xq[i].XqName+"' selected >"+xq[i].XqName+"</option>");
					}else{
						$("#xq").append("<option value='"+xq[i].XqName+"'>"+xq[i].XqName+"</option>");
						$("#wdline").append("<option value='"+xq[i].XqName+"'>"+xq[i].XqName+"</option>");
						$("#kdline").append("<option value='"+xq[i].XqName+"'>"+xq[i].XqName+"</option>");
					}
					
					
				}
		}

	});
 $.ajax({
		url : "<%=basePath%>yhInfo/findLd.action", 
		async : false,
		dataType : "json",
		data : {
			"xqm" : $("#xq").val(),
		},
		success : function(data) {
			$("#ldh option:gt(0)").remove();
			$("#dyh option:gt(0)").remove();
			$("#hh option:gt(0)").remove();
			var ld=data.Ld;
			for(var i=0; i<ld.length; i++){
				 if(ld[i].BuildNo=="1"){
					 $("#ldh").append("<option value='"+ld[i].BuildNo+"' selected>"+ld[i].BuildNo+"</option>");
				 }else{
				$("#ldh").append("<option value='"+ld[i].BuildNo+"'>"+ld[i].BuildNo+"</option>");
				 }
			}	
		}

	});
 $("#xq").change(function(){
	 $.ajax({
			url : "<%=basePath%>yhInfo/findLd.action", 
			async : false,
			dataType : "json",
			data : {
				"xqm" : $("#xq").val(),
			},
			success : function(data) {
				$("#ldh option:gt(0)").remove();
				$("#dyh option:gt(0)").remove();
				$("#hh option:gt(0)").remove();
				var ld=data.Ld;
				for(var i=0; i<ld.length; i++){
					
					$("#ldh").append("<option value='"+ld[i].BuildNo+"'>"+ld[i].BuildNo+"</option>");
				}	
			}

		});
		
		
	});
 $.ajax({
		url : "<%=basePath%>yhInfo/findDy.action", 
		async : false,
		dataType : "json",
		data : {
			"xqm" : $("#xq").val(),
			"ldh" : $("#ldh").val(),
		},
		success : function(data) {
			$("#dyh option:gt(0)").remove();
			$("#hh option:gt(0)").remove();
			var dy=data.Dy;
			for(var i=0; i<dy.length; i++){
				if(dy[i].CellNo=="1"){
					$("#dyh").append("<option value='"+dy[i].CellNo+"' selected>"+dy[i].CellNo+"</option>");
				 }else{
					 $("#dyh").append("<option value='"+dy[i].CellNo+"'>"+dy[i].CellNo+"</option>");
				 }
				
			}	
		}

	});
 $("#ldh").change(function(){
	 $.ajax({
			url : "<%=basePath%>yhInfo/findDy.action", 
			async : false,
			dataType : "json",
			data : {
				"xqm" : $("#xq").val(),
				"ldh" : $("#ldh").val(),
			},
			success : function(data) {
				$("#dyh option:gt(0)").remove();
				$("#hh option:gt(0)").remove();
				var dy=data.Dy;
				for(var i=0; i<dy.length; i++){
					
					$("#dyh").append("<option value='"+dy[i].CellNo+"'>"+dy[i].CellNo+"</option>");
				}	
			}

		});
		
		
	});
 var list;

 $.ajax({
 		url : "<%=basePath%>yhInfo/findYh.action", 
 		async : false,
 		dataType : "json",
 		data : {
 			"xqm":$("#xq").val(),
 			"ldh":$('#ldh').val(),
			"dyh":$('#dyh').val(),
			
 		},
 		success : function(data) {
 			
 			list=data.list;	   
 		}

 	});
 </script>   
</body>
</html>