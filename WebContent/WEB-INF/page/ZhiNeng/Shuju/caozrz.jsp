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
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>

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
.table-th-css {
	position: relative !important;
	top: 0;
}

.mws-report
{
		width:98% !important;
	min-width:170px;
	margin:8px 1%;
	height:100px;
	float:left;
	cursor:pointer;
	display:block;
	text-decoration:none;
	color:#323232;
	
	-webkit-box-sizing: border-box; /* Safari/Chrome, other WebKit */
	-moz-box-sizing: border-box;    /* Firefox, other Gecko */
	box-sizing: border-box;         /* Opera/IE 8+ */
	
	background:#ffffff;
	border:1px solid #cccccc;
	
	/* CSS 3 */
	
	-webkit-border-radius:6px;
	-o-border-radius:6px;
	-moz-border-radius:6px;
	-khtml-border-radius:6px;
	border-radius:6px;
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

</style>
<script>

    $(document).ready(function(){
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
 <script type="text/javascript">
var list;



$.ajax({
		url : "<%=basePath%>xxgl/czrz.action", 
		async : false,
		dataType : "json",
		data : {
		
		},
		success : function(data) {
			
			list=data.list;	   
		}

	});

</script>
<body>
    <div id="" class="clearfix">
      
            	<div class="mws-report-container clearfix">
            	
                	<p class="mws-report" href="#" style="font-size: 14px;"> 
                    	<!-- <span class="mws-report-icon mws-ic ic-building"style="font-size: 10px; line-height: 170px;">操作日志</span> -->
                    	<span class="mws-report-icon mws-ic " style="background:url(../images/yxgl/search.png) no-repeat center"></span>
                        <span class="mws-report-content" style="margin-top: 5px;">
                        	<span class="mws-report-title" >
	                                                          操作人:<input type="text" name="houseNo" id="czr" size=10px value=""  /> &nbsp;&nbsp;&nbsp;
	                                                          操作内容模糊查询:<input type="text" name="houseNo" id="cz" size=6px value=""  /> &nbsp;&nbsp;&nbsp;
                                </span>
                          </span>
                        
                                <!--  ------分开线------- -->
                           <span class="mws-report-content">
                             <span class="mws-report-title" >
                                 <label for="readMTime">选择时间:</label>
		 						 <input type="text" id="recordTime1" name="recordTime1" id="startTime" class="startTime" onfocus="WdatePicker();" />
								-<input type="text" id="recordTime2"  name="recordTime2" id="endTime" class="endTime" onfocus="WdatePicker();" />	
                              
                           <input type="submit" id="search_btn" class="mws-button black"  value="搜索"/>
                            <input type="submit" id="export_btn" class="mws-button black"  value="导出"/>
                              </span>
                          </span>
                   </p>
                </div>
                

     	  	<div class="mws-panel grid_8" >
                	<div class="mws-panel-header">
                    	<span class="mws-i-24 i-table-1">数据显示</span>
                    </div>

                    <div id="done_table_body" class="mws-panel-body"
				style="overflow: auto !important; height: 600px;">
				<table class="mws-table">
					<thead>
						<tr>
							
							<th class="table-th-css">操作人</th>
							<th class="table-th-css">操作</th>
							<th class="table-th-css">操作时间</th>
							
						</tr>
					</thead>
					<tbody id="done_body">
						
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
<script type="text/javascript" src="../js/czrz.js"></script>        
</body>
</html>