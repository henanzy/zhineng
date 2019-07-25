
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

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

<style type="text/css">
.mws-report {
	width: 98% !important;
	min-width: 170px;
	margin: 8px 1%;
	height: 220px;
	float: left;
	cursor: pointer;
	display: block;
	text-decoration: none;
	color: #323232;
	-webkit-box-sizing: border-box; /* Safari/Chrome, other WebKit */
	-moz-box-sizing: border-box; /* Firefox, other Gecko */
	box-sizing: border-box; /* Opera/IE 8+ */
	background: #ffffff url(../../images/core/mws-report-bg.png) repeat-x;
	border: 1px solid #cccccc;
	/* CSS 3 */
	-webkit-border-radius: 6px;
	-o-border-radius: 6px;
	-moz-border-radius: 6px;
	-khtml-border-radius: 6px;
	border-radius: 6px;
}

</style>
 <script type="text/javascript">

        $(function () {
            $("#list").hide();
            $("#menu").hover(function () {
                $("#list").show();
            }, function () {
                $("#list").hide();
            })
            // 鼠标移动到list的div上的时候list div不会被隐藏
            $("#list").hover(function () {
                $("#list").show();
            }, function () {
                $("#list").hide();
            })
        });
        $(function () {
            $("#ts").hide();
            $("#dj").hover(function () {
                $("#ts").show();
            }, function () {
                $("#ts").hide();
            })
            // 鼠标移动到list的div上的时候list div不会被隐藏
            $("#ts").hover(function () {
                $("#ts").show();
            }, function () {
                $("#ts").hide();
            })
        });
        
    </script>

<body>
	<div id="" class="clearfix">

		<div class="mws-report-container clearfix">
			
			<!-- <p style="margin-left: 20px;margin-top: 20px;">
                	            <input type="submit" class="mws-button black"  value="添加"/>
                                <input type="submit" class="mws-button black"  value="修改"/>
                                <input type="submit" class="mws-button black"  value="删除"/> 
                   </p> -->
			<p class="mws-report" href="#" style="font-size: 14px;">
				<span class="mws-report-icon mws-ic" style="background:url(../images/yxgl/submit.png) no-repeat center"></span> 
				<span class="mws-report-content" style="margin-top: 10px;"> 
				   <span class="mws-report-title"> 
			        	<label for="xqNameId">选择小区</label>
						<select id="xqNameId" name="xqName">
							<option value="">--选择小区名称--</option>
							<option value="枫桥水岸（智慧供热区域）">枫桥水岸（智慧供热区域）</option>
							<option value="砥柱大厦（智慧供热区域）">砥柱大厦（智慧供热区域）</option>
							<option value="宏江中央广场（智慧供热）">宏江中央广场（智慧供热）</option>
							<option value="嘉和广场（智慧供热区域）">嘉和广场（智慧供热区域）</option>
							<option value="天鹅堡">天鹅堡</option>
							<option value="嘉亿城市广场（智慧供热区域）">嘉亿城市广场（智慧供热区域）</option>
							<option value="金盾苑">金盾苑</option>
							<option value="金领小区（智慧供热区域）">金领小区（智慧供热区域）</option>
							<option value="枢纽局西苑.铝厂小区（智慧供热区域）">枢纽局西苑.铝厂小区（智慧供热区域）</option>
							<option value="三和铝厂">三和铝厂</option>
							<option value="越海华府">越海华府</option>
							<option value="联通小区">联通小区</option>
							<option value="建业壹号城邦小区">建业壹号城邦小区</option>
                        </select> &nbsp;
                     <label for="">楼栋号</label>
					   <select name="" id="">
							<option value=0>--选择楼栋号--</option>
					   </select> &nbsp;
					<label for="">单元号</label> 
					   <select name="" id="">
							<option value=0>--选择单元号--</option>
					  </select>&nbsp;
					  户号：<input type="text" name="" id="" value=""onblur="obr()" /> &nbsp;
					用户类别: <select id="yhlb" name="">
							<option value="">--选择用户类别--</option>
							<option value="普通用户">普通用户</option>
							<option value="重点监控">重点监控</option>
							<option value="特殊情况">特殊情况</option>
							<option value="退费停暖">退费停暖</option>
					</select> &nbsp;
					<input type="submit" class="mws-button black" value="提交" />
					<!--  <span id="menu"><font color="red">*操作提示</font></span>
      		 <span id="list" >
              <font color="red">:选择小区、楼栋、单元、户号、用户类别可以更新用户的类别</font> 
       		</span> -->

					  

				</span>
				</span>
				
				<span class="mws-report-content" > 
				   <span class="mws-report-title"> 
				   备注内容:<input type="text" id="bz" size=60px/>
  	<input type="submit" class="mws-button black" value="提交" />
 <!--  	<span id="dj"><font color="red">*操作提示</font></span>
      		 <span id="ts" >
              <font color="red">:选择小区、楼栋、单元、户号、备注内容 可以更新用户的备注</font> 
       		</span>
				    -->
				   	</span>
				</span>
				<span class="mws-report-content" > 
				   <span class="mws-report-title"> 
				         <textarea rows="5" cols="90" id="SearchId" style="resize:none"  >
  	
                       		</textarea>
				   	</span>
				</span>
				
				
				
			</p>
		</div>









	</div>

</body>
</html>