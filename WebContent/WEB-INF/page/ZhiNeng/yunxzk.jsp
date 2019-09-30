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

<script type="text/javascript" src="../js/yunxzk.js"></script>
<style type="text/css">
html,body{
	height:130%;

   
}
input{
	border-radius:4px;
		background-color:rgba(43,45,49,0.8);
		color:#fff;
		cursor:pointer;
		text-align:center;
		padding:0 4px;
	}
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
	

</style>


<body >

	<div id="" class="clearfix" >

		<div class="mws-report-container clearfix" >

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
		
	
		
		<div class="mws-panel grid_8" style="min-width:600px;">
			<div class="mws-panel-header">
				<span class="mws-i-24 i-graph">室内温度曲线图</span>
				<span style="position:absolute;top:10px;left:180px;">
				选择公司：
					<select id="ssgs" style="width:150px"
						name="ssgs">
						
					</select>
				
				<select id="xq"
						name="xqName">
							<option value="">全部</option>
					</select>&nbsp;&nbsp;&nbsp;
					<input type="date" id="startTime2"  style="width:140px" value="" />-
                <input type="date" id="endTime2" style="width:140px" value="" />	
				<input type="submit"
						class="mws-button black" id="wd_search" value="搜索" />
				</span>
			</div>
			<div class="mws-panel-body">
				<div class="mws-panel-content">
					<!-- <div id="mws-line-chart" style="width:100%; height:300px; "></div> -->
					<div id="mws-dashboard-chart-2" style="min-width: 400px; height: 350px"></div>
				</div>
			</div>
		</div>
		
		<div class="mws-panel grid_8" style="min-width:600px;">
			<div class="mws-panel-header">
				<span class="mws-i-24 i-graph" style="display:inline" >小区开度100%比例曲线图
				
				</span>
				
				
			</div>
			<div class="mws-panel-body">
				<div class="mws-panel-content">
					<div id="mws-dashboard-chart-1" style="min-width: 400px; height: 350px;"></div>
				</div>
			</div>
		</div>
		

		<div class="mws-panel grid_4 piediv" style="width: 31%;">
			<div class="mws-panel-header">
				<span class="mws-i-24 i-chart">供热面积饼状图</span>
				
			</div>
			<div class="mws-panel-body">
				<div class="mws-panel-content">
					<div id="pie-1" style="width: 100%; height: 300px;"></div>
				</div>
			</div>
		</div>

		<div class="mws-panel grid_4 piediv" style="width: 31%;">
			<div class="mws-panel-header">
				<span class="mws-i-24 i-chart-2">室内温度饼状图</span>
				
			</div>
			<div class="mws-panel-body">
				<div class="mws-panel-content">
					<div id="pie-2" style="width: 100%; height: 300px;"></div>
				</div>
			</div>
		</div>

		<div class="mws-panel grid_4 piediv" style="width: 31%;">
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
				<span class="mws-i-24 i-bar-graph">室温散点图</span>
				
			</div>
			<div class="mws-panel-body">
				<div class="mws-panel-content">
					<div id="containers_swsdt" style="width: 100%; height: 300px;"></div>
				</div>
			</div>
		</div> 

	</div>
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
					}else{
						$("#xq").append("<option value='"+xq[i].XqName+"'>"+xq[i].XqName+"</option>");
					}
					
					
				}
		}

	});
 


 </script>   
<script type="text/javascript" src="../js/echarts-3.5.3/highcharts.js"></script>
<script type="text/javascript" src="../js/echarts-3.5.3/exporting.js"></script>
<script type="text/javascript" src="../js/echarts-3.5.3/highcharts-zh_CN.js"></script>
</body>
</html>