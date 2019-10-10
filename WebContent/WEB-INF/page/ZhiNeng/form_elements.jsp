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
<title>Insert title here</title>


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
<link rel="stylesheet" type="text/css"
	href="../plugins/elrte/css/elrte.full.css" media="screen" />
<link rel="stylesheet" type="text/css"
	href="../plugins/elfinder/css/elfinder.css" media="screen" />

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

<script type="text/javascript" src="../plugins/elrte/js/elrte.min.js"></script>
<script type="text/javascript"
	src="../plugins/elfinder/js/elfinder.min.js"></script>

<script type="text/javascript" src="../js/mws.js"></script>
<script type="text/javascript" src="../js/demo.js"></script>
<script type="text/javascript" src="../js/themer.js"></script>

<script type="text/javascript" src="../js/demo.formelements.js"></script>

<script type="text/javascript" src="../js/form_ele.js"></script>
<style type="text/css">
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
html,body{
	height:110%;
}

/* 固定表头 */
.table-th-css {
	position: relative !important;
	top: 0;
}

.mws-report {
	width: 98% !important;
	min-width: 170px;
	margin: 8px 1%;
	height: 80px;
	float: left;
	cursor: pointer;
	display: block;
	text-decoration: none;
	color: #323232;
}
th, td {
	white-space: nowrap;
}
.textinput{

border-radius: 5px !important;
height:22px
}
#sssj{
		height:24px;
		line-height:24px;
		border-radius:4px;
		background-color:rgba(43,45,49,0.8);
		color:#fff;
		cursor:pointer;
		text-align:center;
		padding:0 4px;
	}

.mws-form .mws-form-inline .mws-form-row label{
	width:100px;
}
.mws-form .mws-form-inline .mws-form-row input{
	width:86% !important;
}

	@media screen and (max-width:1100px){
		html,body{
			height:150%;
		}
		.mws-panel{
			width:98% !important;
			min-width:700px !important;
		}
	}
	input{
	border-radius:4px;
		background-color:rgba(43,45,49,0.8);
		color:#fff;
		cursor:pointer;
		text-align:center;
		padding:0 4px;
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

</style>
<script>
$(document).ready(function(){
	

	var recordtableCont = $('#record_table_body table tr th'); //获取th
	var recordtableScroll = $('#record_table_body'); //获取滚动条同级
	recordtableScroll.on('scroll', scrollHandlerecord);

	function scrollHandlerecord() {
	
		var scrollTop = recordtableScroll.scrollTop();
		// 当滚动距离大于0时设置top及相应的样式
		if (scrollTop > 0) {
			recordtableCont.css({
				"top" : scrollTop + 'px',
				"marginTop" : "-1px",
				"backgroundColor" : "#EBEBEB"
			})
		} else { // 当滚动距离小于0时设置top及相应的样式 
			recordtableCont.css({
				"top" : scrollTop + 'px',
				"marginTop" : "0",
				"backgroundColor" : "#EBEBEB"
			})
		}
	}
  	
	var twentyfourtableCont = $('#twentyfour_table_body table tr th'); //获取th
	var twentyfourtableScroll = $('#twentyfour_table_body'); //获取滚动条同级
	twentyfourtableScroll.on('scroll', scrollHandletwentyfour);

	function scrollHandletwentyfour() {
	
		var scrollTop = twentyfourtableScroll.scrollTop();
		// 当滚动距离大于0时设置top及相应的样式
		if (scrollTop > 0) {
			twentyfourtableCont.css({
				"top" : scrollTop + 'px',
				"marginTop" : "-1px",
				"backgroundColor" : "#EBEBEB"
			})
		} else { // 当滚动距离小于0时设置top及相应的样式 
			twentyfourtableCont.css({
				"top" : scrollTop + 'px',
				"marginTop" : "0",
				"backgroundColor" : "#EBEBEB"
			})
		}
	}
	
	var seventableCont = $('#seven_table_body table tr th'); //获取th
	var seventableScroll = $('#seven_table_body'); //获取滚动条同级
	seventableScroll.on('scroll', scrollHandleseven);

	function scrollHandleseven() {
	
		var scrollTop = seventableScroll.scrollTop();
		// 当滚动距离大于0时设置top及相应的样式
		if (scrollTop > 0) {
			seventableCont.css({
				"top" : scrollTop + 'px',
				"marginTop" : "-1px",
				"backgroundColor" : "#EBEBEB"
			})
		} else { // 当滚动距离小于0时设置top及相应的样式 
			seventableCont.css({
				"top" : scrollTop + 'px',
				"marginTop" : "0",
				"backgroundColor" : "#EBEBEB"
			})
		}
	}
	
	var bjCont = $('#bj_table_body table tr th'); //获取th
	var bjScroll = $('#bj_table_body'); //获取滚动条同级
	bjScroll.on('scroll', bjseven);

	function bjseven() {
	
		var scrollTop = bjScroll.scrollTop();
		// 当滚动距离大于0时设置top及相应的样式
		if (scrollTop > 0) {
			bjCont.css({
				"top" : scrollTop + 'px',
				"marginTop" : "-1px",
				"backgroundColor" : "#EBEBEB"
			})
		} else { // 当滚动距离小于0时设置top及相应的样式 
			bjCont.css({
				"top" : scrollTop + 'px',
				"marginTop" : "0",
				"backgroundColor" : "#EBEBEB"
			})
		}
	}
	
}); 
</script>
<body>
	<div id="" class="clearfix">

		<div class="mws-report-container clearfix">

			<p class="mws-report" href="#" style="font-size: 14px;">
				<span class="mws-report-icon mws-ic" style="background:url(../images/yxgl/search.png) no-repeat center"></span> <span
					class="mws-report-content" style="margin-top: 10px;">
					<span>选择公司：
					<select id="ssgs" style="width:150px"
						name="ssgs">
						
					</select>
					</span>
					
					 <span
					class="mws-report-title"> 选择小区 ：<select id="xq"
						name="xqName">
							<option value="" >--选择小区--</option>
					</select>
					
					<span>楼栋号：
						<select name="ldh" id="ldh">
							<option value="" >--选择楼栋--</option>
					</select>
					</span>
					<span>单元号：
						<select name="dyh" id="dyh">
							<option value="" >--选择单元--</option>
					</select>
					</span>
					<span>户号：
						<!-- <select name="hh" id="hh">
							<option value="" >--选择户号--</option>
					</select> -->
					<input name="hh" id="hh" />
					</span> &nbsp;&nbsp;&nbsp; 
						 <input type="submit" class="mws-button black" id="search_btn" value="搜索" />
				</span> 
				</span>
			</p>
		</div>
		
		<div class="mws-panel grid_8" style="width: 98%; float: left;">
			<div class="mws-panel-header">
				<span class="mws-i-24 i-graph linetitle">24小时开度 温度曲线图</span>
				
				<span style="position:absolute;top:10px;right:30px;">
				<input type="date" id="startTime"  style="width:140px" value="" />-
                <input type="date" id="endTime" style="width:140px" value="" />
					<!-- <select id="sssj">
					    <option value="一个月" >一个月</option>
						<option value="7天" >7天</option>												
					</select> -->
				</span>
			</div>
			<div class="mws-panel-body">
				<div class="mws-panel-content">
					<div id="mws-dashboard-chart-1" style="width: 100%; height: 340px;"></div>
				</div>
			</div>
		</div>


		<div class="mws-panel grid_4"
			style="width: 98%; float: left;">
			<div class="mws-panel-header">
				<span class="mws-i-24 i-table-1">横向比较</span>
				<span style="position:absolute;top:10px;left:130px;">
					<select id="wdbj">
						<option value="tc" >同层</option>
						<option value="tdy" >同单元</option>
						
					</select>
				</span>
			</div>
			<div id="bj_table_body" class="mws-panel-body"
				style="overflow: auto !important; height: 420px;">
				<table class="mws-table">
					<thead>
						<tr>
							<th class="table-th-css">楼栋</th>
							<th class="table-th-css">单元</th>
							<th class="table-th-css">户号</th>
							<th class="table-th-css">开度</th>
							<th class="table-th-css">温度</th>
							<th class="table-th-css">管道温度</th>
							<th class="table-th-css">室外温度</th>
							<th class="table-th-css">是否缴费</th>
							<th class="table-th-css">采集器安装位置</th>
							<th class="table-th-css">采集器安装时间</th>
							<th class="table-th-css">采集时间</th>
						</tr>
					</thead>
					<tbody id="bj_body">

					</tbody>
				</table>
			</div>
		</div>


		<div class="mws-panel grid_8 "
			style="width: 98%; float: left;">
			<div class="mws-panel-header">
				<span class="mws-i-24 i-table-1">工单记录</span>
				
			</div>
			<div id="record_table_body" class="mws-panel-body"
				style="overflow: auto !important; height: 420px;">
				<table class="mws-table">
					<thead>
						<tr>
						    
							<th class="table-th-css">受理时间</th>
							<th class="table-th-css">问题</th>
							<th class="table-th-css">接单时间</th>
							<th class="table-th-css">接单人</th>
							<th class="table-th-css">维修时间</th>
							<th class="table-th-css">维修人</th>
							<th class="table-th-css">备注</th>
							
						</tr>
					</thead>
					<tbody id="record_body">

					</tbody>
				</table>
			</div>
		</div>
		
		<div class="mws-panel grid_8 "
			style="width: 58%; float: left;">
			<div class="mws-panel-header">
				<span class="mws-i-24 i-table-1">稽查记录</span>
				
			</div>
			<div id="record_table_body" class="mws-panel-body"
				style="overflow: auto !important; height: 420px;">
				<table class="mws-table">
					<thead>
						<tr>
						    
							<th class="table-th-css">稽查情况</th>
							<th class="table-th-css">稽查问题</th>
							<th class="table-th-css">稽查时间</th>
							<th class="table-th-css">稽查人</th>
							<th class="table-th-css">稽查备注</th>
							<th class="table-th-css">处理情况</th>
							<th class="table-th-css">处理结果</th>
							<th class="table-th-css">处理备注</th>
							
						</tr>
					</thead>
					<tbody id="jc_body">

					</tbody>
				</table>
			</div>
		</div>
		
		<div class="mws-panel grid_8 "
			style="width: 35%; float: left;">
			<div class="mws-panel-header">
				<span class="mws-i-24 i-table-1">催缴记录</span>
				
			</div>
			<div id="record_table_body" class="mws-panel-body"
				style="overflow: auto !important; height: 420px;">
				<table class="mws-table">
					<thead>
						<tr>
						    
							<th class="table-th-css">催缴时间</th>
							<th class="table-th-css">催缴人</th>
							<th class="table-th-css">催缴结果</th>
							<th class="table-th-css">催缴备注</th>
							
						</tr>
					</thead>
					<tbody id="jc_body">

					</tbody>
				</table>
			</div>
		</div>
		
	<div style="clear:both;"></div>


		


		

	</div>
<script type="text/javascript" src="../js/echarts-3.5.3/highcharts.js"></script>
<script type="text/javascript">
var ssgs="<%=request.getSession().getAttribute("ssgs")%>"
console.log(ssgs)
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
					
					$("#xq").append("<option value='"+xq[i].XqName+"'>"+xq[i].XqName+"</option>");
					
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
 
 $("#dyh").change(function(){
	 $.ajax({
			url : "<%=basePath%>yhInfo/findHh.action", 
			async : false,
			dataType : "json",
			data : {
				"xqm" : $("#xq").val(),
				"ldh" : $("#ldh").val(),
				"dyh" : $("#dyh").val(),
			},
			success : function(data) {
				
				$("#hh option:gt(0)").remove();
				var hh=data.Hh;
				for(var i=0; i<hh.length; i++){
					
					$("#hh").append("<option value='"+hh[i].name+"'>"+hh[i].name+"</option>");
				}	
			}

		});
		
		
	});

 </script>   
</body>
</html>