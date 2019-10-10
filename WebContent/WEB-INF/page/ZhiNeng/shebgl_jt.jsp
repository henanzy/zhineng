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
<link rel="stylesheet" type="text/css" href="../css/reset.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/text.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/fonts/ptsans/stylesheet.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/fluid.css" media="screen" />

<link rel="stylesheet" type="text/css" href="../css/mws.style.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/icons/icons.css" media="screen" />

<!-- Demo and Plugin Stylesheets -->
<link rel="stylesheet" type="text/css" href="../css/demo.css" media="screen" />

<link rel="stylesheet" type="text/css" href="../plugins/colorpicker/colorpicker.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../plugins/jimgareaselect/css/imgareaselect-default.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../plugins/fullcalendar/fullcalendar.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../plugins/fullcalendar/fullcalendar.print.css" media="print" />
<link rel="stylesheet" type="text/css" href="../plugins/tipsy/tipsy.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../plugins/sourcerer/Sourcerer-1.2.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../plugins/jgrowl/jquery.jgrowl.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../plugins/spinner/spinner.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/jui/jquery.ui.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../plugins/elrte/css/elrte.full.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../plugins/elfinder/css/elfinder.css" media="screen" />

<!-- Theme Stylesheet -->
<link rel="stylesheet" type="text/css" href="../css/mws.theme.css" media="screen" />

<!-- JavaScript Plugins -->

<script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>

<script type="text/javascript" src="../plugins/jimgareaselect/jquery.imgareaselect.min.js"></script>
<script type="text/javascript" src="../plugins/jquery.dualListBox-1.3.min.js"></script>
<script type="text/javascript" src="../plugins/jgrowl/jquery.jgrowl.js"></script>
<script type="text/javascript" src="../plugins/jquery.filestyle.js"></script>
<script type="text/javascript" src="../plugins/fullcalendar/fullcalendar.min.js"></script>
<script type="text/javascript" src="../plugins/jquery.dataTables.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="../plugins/flot/excanvas.min.js"></script>
<![endif]-->
<script type="text/javascript" src="../plugins/flot/jquery.flot.min.js"></script>
<script type="text/javascript" src="../plugins/flot/jquery.flot.pie.min.js"></script>
<script type="text/javascript" src="../plugins/flot/jquery.flot.stack.min.js"></script>
<script type="text/javascript" src="../plugins/flot/jquery.flot.resize.min.js"></script>
<script type="text/javascript" src="../plugins/colorpicker/colorpicker.js"></script>
<script type="text/javascript" src="../plugins/tipsy/jquery.tipsy.js"></script>
<script type="text/javascript" src="../plugins/sourcerer/Sourcerer-1.2.js"></script>
<script type="text/javascript" src="../plugins/jquery.placeholder.js"></script>
<script type="text/javascript" src="../plugins/jquery.validate.js"></script>
<script type="text/javascript" src="../plugins/jquery.mousewheel.js"></script>
<script type="text/javascript" src="../plugins/spinner/ui.spinner.js"></script>
<script type="text/javascript" src="../js/jquery-ui.js"></script>


<script type="text/javascript" src="../plugins/elrte/js/elrte.min.js"></script>
<script type="text/javascript" src="../plugins/elfinder/js/elfinder.min.js"></script>

<script type="text/javascript" src="../js/mws.js"></script>
<script type="text/javascript" src="../js/demo.js"></script>
<script type="text/javascript" src="../js/themer.js"></script>

<script type="text/javascript" src="../js/demo.formelements.js"></script>
<script type="text/javascript" src="../js/sbgl.js"></script>
<style type="text/css">
input{
	border-radius:4px;
		background-color:rgba(43,45,49,0.8);
		color:#fff;
		cursor:pointer;
		text-align:center;
		padding:0 4px;
	}
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
}

.table-th-css {
	position: relative !important;
	top: 0;
}

.mws-report {
	width: 98% !important;
	min-width: 170px;
	margin: 8px 1%;
	height: 150px;
	float: left;
	cursor: pointer;
	display: block;
	text-decoration: none;
	color: #323232;
	-webkit-box-sizing: border-box; /* Safari/Chrome, other WebKit */
	-moz-box-sizing: border-box; /* Firefox, other Gecko */
	box-sizing: border-box; /* Opera/IE 8+ */
	background: #ffffff;
	border: 1px solid #cccccc;
	/* CSS 3 */
	-webkit-border-radius: 6px;
	-o-border-radius: 6px;
	-moz-border-radius: 6px;
	-khtml-border-radius: 6px;
	border-radius: 6px;
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
		list-style-type:none;
	}
		th,td{  
  
  white-space: nowrap;
} 
</style>

<script>
    $(document).ready(function(){
		var shebtableCont = $('#sheb_table_body table tr th'); //获取th
		var shebtableScroll = $('#sheb_table_body'); //获取滚动条同级
		shebtableScroll.on('scroll', scrollHandlesheb);
		
		function scrollHandlesheb() {
			var scrollTop = shebtableScroll.scrollTop();
			// 当滚动距离大于0时设置top及相应的样式
			if (scrollTop > 0) {
				shebtableCont.css({
					"top" : scrollTop + 'px',
					"marginTop" : "-1px",
					"backgroundColor" : "#EBEBEB"
				})
			} else { // 当滚动距离小于0时设置top及相应的样式 
				shebtableCont.css({
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
                    	<span class="mws-report-icon mws-ic ic-building"></span>
                        <span class="mws-report-content" style="margin-top: 5px;">
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
					
					户号：<input type="text" name="hh" id="hh" size=6px
						value="" /> &nbsp;&nbsp;&nbsp;  
	                               <label >选择缴费状态：</label> 
		                     <select>
			                     <option selected="selected">--选择缴费状态--</option>
			                     <option>是</option>
			                     <option>否</option>
		                     </select>
		                     <input type="submit" id="search_btn" class="mws-button black"  value="查询"/>
                                </span>
                          </span>
                         <!--  ------分开线------- -->
                           
                          
                         
                    </p>
                </div>
                

     	  	<div class="mws-panel grid_8" >
                	<div class="mws-panel-header">
                    	<span class="mws-i-24 i-table-1">数据显示</span>
                    </div>

                    
                    <div id="sheb_table_body" class="mws-panel-body" style="width:99.5%; height:580px; overflow:auto;">

                        <table class="mws-table">
                            <thead >
                                <tr>
                                    <th class="table-th-css"></th>
                                    <th class="table-th-css">用户姓名<span class="span-up"></span> <span class="span-down"></span></th>
	            					<th class="table-th-css">小区名称<span class="span-up"></span> <span class="span-down"></span></th>
	            					<th class="table-th-css">楼栋<span class="span-up"></span> <span class="span-down"></span></th>
	            					<th class="table-th-css">单元<span class="span-up"></span> <span class="span-down"></span></th>
	            					<th class="table-th-css">户号<span class="span-up"></span> <span class="span-down"></span></th>
						            <th class="table-th-css">状态<span class="span-up"></span> <span class="span-down"></span></th>
						            <th class="table-th-css">缴费<span class="span-up"></span> <span class="span-down"></span></th>
						            <th class="table-th-css">开度<span class="span-up"></span> <span class="span-down"></span></th>
						            <th class="table-th-css">室度<span class="span-up"></span> <span class="span-down"></span></th>
						            <th class="table-th-css">管道温度<span class="span-up"></span> <span class="span-down"></span></th>
						            <th class="table-th-css">标识<span class="span-up"></span> <span class="span-down"></span></th>
						            <th class="table-th-css">更新时间<span class="span-up"></span> <span class="span-down"></span></th>
						            <th class="table-th-css">阀门地址<span class="span-up"></span> <span class="span-down"></span></th>
						            <th class="table-th-css">传感器地址<span class="span-up"></span> <span class="span-down"></span></th>
						            
						            <th class="table-th-css">设定温度<span class="span-up"></span> <span class="span-down"></span></th>
						            <th class="table-th-css">设定参数<span class="span-up"></span> <span class="span-down"></span></th>
						            <th class="table-th-css">区管ID<span class="span-up"></span> <span class="span-down"></span></th>
                                </tr>
                            </thead>
					<tbody id="sheb_body" >
						
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
              
</div>            
</body>
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

 </script>
</html>