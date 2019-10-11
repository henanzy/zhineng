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
<script type="text/javascript" src="../js/layer/2.4/layer.js"></script>
<script type="text/javascript" src="../js/layui/layui.js"></script>
<script type="text/javascript" src="../js/layui/layui.all.js"></script>
<link rel="stylesheet" type="text/css" href="../js/layui/css/layui.css" media="screen" />

<!-- <script type="text/javascript" src="../plugins/flot/jquery.flot.min.js"></script> -->
<!-- <script type="text/javascript"
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
 <script type="text/javascript" src="../js/jcgl.js"></script>

 
 <style>
 select{
		height:24px;
		line-height:24px;
		border-radius:4px;
		background-color:rgba(43,45,49,0.8);
		color:#fff;
		cursor:pointer;
		text-align:center;
		padding:0 4px;
		list-style-type:none;
	}
 *{
	margin:0;
	padding:0;
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
#khxx p{
	display:block;
	width:100%;
	height:50px;
}
#khxx p label{
	display:inline-block;
	width:24%;
	text-align:center;
}
#khxx p label span{
display:inline-block;
	width:30%;
}
#khxx p label .khxx_input{
	margin-left:10px;
	width:60%;
	height:18px;
}
#khxx p label select.khxx_input{
	height:24px;
}
#khxx div.khxx_div{
	display:block;
	width:100%;
	height:100px;
}
#khxx div.khxx_div div.htpz_title,
#khxx div.khxx_div div.htpz_content{
	display:block;
	height:92px;
	float:left;
}
#khxx div.khxx_div div.htpz_title{
text-align:right;
	width:80px;
}
#khxx div.khxx_div div.htpz_content{
	width:90%;
	background-color:#fff;
/* 	text-align:center; */
}

#khxx div.khxx_div div.htpz_content img{
display:block;
	width:50px;
	height:46px;
	margin:20px auto;
 	filter:alpha(opacity=50);  
    -moz-opacity:0.5;  
    -khtml-opacity: 0.5;  
    opacity: 0.5;  
}

#subbtn,
#delbtn{
	border:none;
	background-color:rgb(60,61,61);
	width:60px;
	height:24px;
	margin-right:6px;
	color:#fff;
	border-radius:3px;
}
.tablediv{
	width:100%;
}
table{
	border:1px solid #333;
	 /* border-collapse: collapse; */
	 width:100%;
	 
}
table th{
	 text-align:center;
	border:1px solid #333;
}
		tr{  
  
  white-space: nowrap;
} 
table td{
	border-top:1px solid #333;
	height:30px;
	line-height:30px;
	 text-align:center;
	 padding:6px;
	
} 
/* table tr{border-top:1px solid #333;
} */

.cell_div table{
	float:left;
	margin-left:10px;
	width:19%;
}
.cellone .cellone-head{
	height:30px;
	background-color:rgb(224,234,245)
}
.cellone .cellone-body{
	height:50px;
}
.body-hh{
border:1px;
	font-weight:bold;
	float:left;
}
.body-mj{
width:51px;
	float:right;
}
.body-lb{
	float:right;
	margin-top:10px;
}
.warning{
	background-color:rgb(255,150,150)
}

.normal{
	background-color:rgb(185,210,241)
}

 </style>
 

</head>
<body>

	<div id="increasedis" class="clearfix" >
		
		
		
		<div class="mws-panel grid_8 "
			style="width: 98%; padding-left: 12px; margin: 0px 0px 30px 0px; min-width:1000px">
			<div class="mws-panel-header">
				<span class="mws-i-24 i-table-1">稽查管理 &nbsp;&nbsp; 选择小区：
						<select id="xq" style="width:150px"
						name="xqName">
						&nbsp;&nbsp; 
					</select>楼栋号：
						<select name="ldh" id="ldh" style="width:70px">
							<option value="" >楼栋</option>
					</select>&nbsp;&nbsp; 
					<input type="submit" class="mws-button black" id="search_btn" value="搜索" />
					</span>
				
			</div>
			
			<div id="khxx" class="mws-panel-body" style="height:3200px; width:1600px;padding:10px;">
			 
				<!-- <div class="tablediv">
					<table border="1" cellspacing="0" cellpadding="0">
						<thead></thead>
						<tbody>
							<tr>
								<td rowspan="2" style="line-height:60px">用热状态</td>
								<td>总户数</td>
								<td>正常</td>
								<td>报停</td>
								<td>强停</td>
								<td>未供</td>
								<td rowspan="2" style="line-height:60px">稽查情况</td>
								<td>未稽查</td>
								<td>稽查正常</td>
								<td>稽查问题</td>
							</tr>
							<tr style="color:red;">
								<td>69</td>
								<td>62</td>
								<td>4</td>
								<td>3</td>
								<td>0</td>
								<td>50</td>
								<td>10</td>
								<td>9</td>
							</tr>
						</tbody>
					</table>
				</div> -->
				
				<div  class="tablediv cell_div" id="table_body">
					
		
					
					
					
				</div>
			
				
			</div>
		</div>
		
		
		<div class="mws-panel grid_8 jcfk"
			style="width:70%; padding-left: 12px; margin: 0px 0px 30px 0px; min-width:500px;position:absolute;top:50px;left:10%;display:none;">
			<div class="mws-panel-header">
				<span class="mws-i-24 i-table-1">稽查反馈</span>
			</div>
			
			<div id="khxx" class="mws-panel-body" style="height:600px; padding:10px;">
				<p class="khxx_p">
					<label></label>
					<label><input type="checkbox"  />正常</label>
					<label><input type="checkbox"  />存在问题</label>
					<label></label>
				</p>
				<p class="khxx_p">
				<label></label>
					<label>
						<span>稽查问题:</span>
						<select  class="khxx_input">
							<option value="私改暖气设备">私改暖气设备</option>
							<option value="其他">其他</option>
						</select>
					</label>
					
					<label></label>
					<label></label>
					
				</p>
				<p class="khxx_p">
				<label></label>
					<label><span>稽查日期:</span><input type="date" class="khxx_input" id="jcrq" value="" readonly="readonly" /></label>
					<label><span>稽查人:</span><select class="khxx_input">
							<option value="张婷婷">张婷婷</option>
							<option value="李璇">李璇</option>
						</select></label>
						<label></label>
				</p>
				<p class="khxx_p">
					<label></label>
					<label style="width:50%;"><span>备注：</span>
						<textarea style="width:100%;height:60px;"  class="khxx_input" rows="" cols=""></textarea>
					</label>
					<label></label>
					<label></label>
				</p>
				
				<hr style="margin-top:60px;"></hr>
				
				<p class="khxx_p">
					<label></label>
					<label style="width:50%;">处理结果登记</label>
					<label></label>
				</p>
				<p class="khxx_p">
				<label></label>
					<label>
						<span>处理情况:</span>
						<select  class="khxx_input">
							<option value="处理完成">处理完成</option>
							<option value="未完成">未完成</option>
						</select>
					</label>
					
					<label></label>
					<label></label>
					
				</p>
				<p class="khxx_p">
				<label></label>
				<label><span>处理结果:</span><select class="khxx_input">
							<option value="封条">封条</option>
							<option value="其他">其他</option>
						</select></label>
					<label><span>稽查日期:</span><input type="date" class="khxx_input" id="jcrq" value="" readonly="readonly" /></label>
					
						<label></label>
				</p>
				<p class="khxx_p">
					<label></label>
					<label style="width:50%;"><span>备注：</span>
						<textarea style="width:100%;height:60px;"  class="khxx_input" rows="" cols=""></textarea>
					</label>
					<label></label>
					<label></label>
				</p>
				<p class="khxx_p" style="text-align:center;margin-top:50px;">
					<input style="width:80px;" type="button" alt="" id="subbtn" value="确认" />
					<input style="width:80px;" type="button" alt="" id="delbtn" value="取消" />
				</p>
			</div>
		</div>
		
	</div>
<script type="text/javascript">

	
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

 </script>
<script>
$(document).ready(function(){
	
	$("#jcfkclick").click(function(){
		$(".jcfk").show();
	});
	$("#delbtn").click(function(){
		$(".jcfk").hide();
	});
	
		var time = getTIME();
		$("#jcrq").val(time);
	function getTIME(){
		var newtime = new Date();
		var y = newtime.getFullYear();
		var m = newtime.getMonth()+1;
		var d = newtime.getDate();
		if(m<10){
			m = "0"+m;
		}
		if(d<10){
			d = "0"+m;
		}
		return y+'-'+m+'-'+d;
	}
	
})
</script>

</body>

</html>