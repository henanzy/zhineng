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

<script type="text/javascript" src="../js/tjfx.js"></script>
<style type="text/css">
*{
	margin:0;
	padding:0;
}
input{
	border-radius:4px;
		background-color:rgba(43,45,49,0.8);
		color:#fff;
		cursor:pointer;
		text-align:center;
		padding:0 4px;
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
 credits: {
                enabled:false
            }
.table-th-css {
	position: relative !important;
	top: 0;
}

/* td悬停样式 */
/* 	.blue {
		background: #ccc;
	} */
	
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
	
	
	nav li,
	select{
		height:24px;
		line-height:24px;
		list-style-type:none;
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
		
    }); 
</script>


</head>
<body>


	<div id="" class="clearfix">

		<div class="mws-report-container clearfix">
			
			<p class="mws-report" href="#" style="font-size: 14px;">
				<span class="mws-report-icon mws-ic" style="background:url(../images/yxgl/search.png) no-repeat center"></span> 
				<span class="mws-report-content" style="margin-top: 10px;"> 
				<span class="mws-report-title">
				<span>选择公司:
					<select id="ssgs" style="width:150px"
						name="ssgs">
						
					</select>
				</span> 
						 
						 小区:
					<select id="xq"
						name="xqName">
							
					</select> &nbsp;&nbsp;&nbsp; 
					
					楼栋号: <select name="ldh" id="ldh">
							<option value="" >--选择楼栋--</option>
					</select> &nbsp;&nbsp;&nbsp; 
					
					单元号: <select name="dyh" id="dyh">
							<option value="" >--选择单元--</option>
					</select> &nbsp;&nbsp;&nbsp; 
					<input type="submit" class="mws-button black" id="search_btn" value="搜索" />
				</span>
				</span>
			</p>
			
		</div>




		<div class="mws-panel grid_4" style="width: 31%;">
			<div class="mws-panel-header">
				<span class="mws-i-24 i-chart">供热面积饼状图</span>
			</div>
			<div class="mws-panel-body">
				<div class="mws-panel-content">
					<div id="pie-1" style="width: 100%; height: 300px;"></div>
				</div>
			</div>
		</div>

		<div class="mws-panel grid_4" style="width: 32%;">
			<div class="mws-panel-header">
				<span class="mws-i-24 i-chart-2">室内温度饼状图</span>
			</div>
			<div class="mws-panel-body">
				<div class="mws-panel-content">
					<div id="pie-2" style="width: 100%; height: 300px;"></div>
				</div>
			</div>
		</div>

		<div class="mws-panel grid_4" style="width: 31%;">
			<div class="mws-panel-header">
				<span class="mws-i-24 i-chart-2">阀门开度饼状图</span>
			</div>
			<div class="mws-panel-body">
				<div class="mws-panel-content">
					<div id="pie-3" style="width: 100%; height: 300px;"></div>
				</div>
			</div>
		</div>
		


		<div class="mws-panel grid_8" style="min-width:600px;">
			<div class="mws-panel-header">
				<span class="mws-i-24 i-graph">平均温度曲线图</span>
				<span style="position:absolute;top:10px;left:200px;">
				
					<input type="date" id="startTime1"  style="width:140px" value="" />-
                <input type="date" id="endTime1" style="width:140px" value="" />	
				<input type="submit"
						class="mws-button black" id="wd_search" value="搜索" />
				</span>
			</div>
			
			<div class="mws-panel-body">
				<div class="mws-panel-content">
					<div id="pjwdline" style="width: 100%; height: 300px;"></div>
				</div>
			</div>
		</div>
		<div class="mws-panel grid_8" style="min-width:600px;">
			<div class="mws-panel-header">
				<span class="mws-i-24 i-bar-graph">缴费和未交费柱状图</span>
			</div>
			<div class="mws-panel-body">
				<div class="mws-panel-content">
					<div id="container" style="width: 100%; height: 300px;"></div>
				</div>
			</div>
		</div>

	</div>
	
<script type="text/javascript" src="../js/echarts-3.5.3/highcharts.js"></script>
<script type="text/javascript" src="../js/echarts-3.5.3/highcharts-zh_CN.js"></script>
<script type="text/javascript">

</script>
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
						}else{
							$("#xq").append("<option value='"+xq[i].XqName+"'>"+xq[i].XqName+"</option>");
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
 
 var time = new Date();
         var day = ("0" + time.getDate()).slice(-2);
         var month = ("0" + (time.getMonth() + 1)).slice(-2);
         var today = time.getFullYear() + "-" + (month) + "-" + (day);
         $('#endTime1').val(today);
        
         
                 
                 var month1 = ("0" + (time.getMonth() )).slice(-2);
                 var today1 = time.getFullYear() + "-" + (month1) + "-" + (day);
                 $('#startTime1').val(today1);
                 
 </script>

</body>
</html>