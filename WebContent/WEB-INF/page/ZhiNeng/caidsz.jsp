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
	height: 70px;
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
</style>

<script>
    $(document).ready(function(){
		var shuakatableCont = $('#shuaka_table_body table tr th'); //获取th
		var shuakatableScroll = $('#shuaka_table_body'); //获取滚动条同级
		shuakatableScroll.on('scroll', scrollHandleshuaka);
		
		function scrollHandleshuaka() {
			var scrollTop = shuakatableScroll.scrollTop();
			// 当滚动距离大于0时设置top及相应的样式
			if (scrollTop > 0) {
				shuakatableCont.css({
					"top" : scrollTop + 'px',
					"marginTop" : "-1px",
					"backgroundColor" : "#EBEBEB"
				})
			} else { // 当滚动距离小于0时设置top及相应的样式 
				shuakatableCont.css({
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
                    	
                        <span class="mws-report-content" style="margin-top: 5px;">
	                            <input type="submit" class="mws-button black"  value="添加菜单"/>
                                <input type="submit" class="mws-button black"  value="修改"/>
                                <input type="submit" class="mws-button black"  value="删除"/>                            
                          </span>
                   </p>
                </div>
                

     	       <div class="mws-panel grid_8"  >
                	<div class="mws-panel-header">
                    	<span class="mws-i-24 i-table-1">数据显示</span>
                    </div>

                    <div class="mws-panel-body" style="width:99.5%; height:450px;overflow:auto;">
                      <div id="caidsz_table_body" style="min-width: 1550px;">
                        <table class="mws-table">
                            <thead >
                                <tr>
                                    <th>主菜单</th>
                                    <th>子菜单</th>
                                    
                                </tr>
                            </thead>
                            <tbody id="caidsz_body">
                                <tr class="gradeX">
                                    <td class="center">
                                        <input type="checkbox" value="1" id="1"/>
		  				                <input type="hidden"  value="#" />
		  				                <label for="1">换热站管理</label>
                                    </td>
                                    <td>
                                      <input type="checkbox" value="17" id="17"/><label for="17">运行总览</label>
		                		      <input type="hidden" value="#"/>
		                		       <input type="checkbox" value="17" id="17"/><label for="17">运行设备</label>
		                		      <input type="hidden" value="#"/>
		                		       <input type="checkbox" value="17" id="17"/><label for="17">大表集抄</label>
		                		      <input type="hidden" value="#"/>
		                		       <input type="checkbox" value="17" id="17"/><label for="17">能耗分析</label>
		                		      <input type="hidden" value="#"/>
		                		       <input type="checkbox" value="17" id="17"/><label for="17">在线数据分析</label>
		                		      <input type="hidden" value="#"/>
		                		       <input type="checkbox" value="17" id="17"/><label for="17">实时数据</label>
		                		      <input type="hidden" value="#"/>
		                		       <input type="checkbox" value="17" id="17"/><label for="17">报警信息</label>
		                		      <input type="hidden" value="#"/>
		                		       <input type="checkbox" value="17" id="17"/><label for="17">参数设置</label>
		                		      <input type="hidden" value="#"/>
		                		      <input type="checkbox" value="17" id="17"/><label for="17">日报表</label>
		                		      <input type="hidden" value="#"/>
		                		      <input type="checkbox" value="17" id="17"/><label for="17">周报表</label>
		                		      <input type="hidden" value="#"/>
		                		      <input type="checkbox" value="17" id="17"/><label for="17">月报表</label>
		                		      <input type="hidden" value="#"/>
		                		      <input type="checkbox" value="17" id="17"/><label for="17">能源设备信息库</label>
		                		      <input type="hidden" value="#"/>
		                		      <input type="checkbox" value="17" id="17"/><label for="17">管网结构树形图</label>
		                		      <input type="hidden" value="#"/>
		                		      <input type="checkbox" value="17" id="17"/><label for="17">备品备件信息库</label>
		                		      <input type="hidden" value="#"/>
		                		      
                                    </td>
                                </tr>
                                <tr class="gradeC">
                                     <td class="center">
                                        <input type="checkbox" value="2" id="2"/>
		  				                <input type="hidden" value="#" />
		  				                <label for="2">客服管理</label>
                                     </td>
                                    <td>
                                        <input type="checkbox" value="13" id="13"/><label for="13">报修登记</label>
		                		        <input type="hidden" value="#"/>
		                		        <input type="checkbox" value="13" id="13"/><label for="13">客户资料</label>
		                		        <input type="hidden" value="#"/>
		                		        <input type="checkbox" value="13" id="13"/><label for="13">新建工单</label>
		                		        <input type="hidden" value="#"/>
		                		        <input type="checkbox" value="13" id="13"/><label for="13">工单审核</label>
		                		        <input type="hidden" value="#"/>
		                		        <input type="checkbox" value="13" id="13"/><label for="13">工单监控</label>
		                		        <input type="hidden" value="#"/>
		                		        <input type="checkbox" value="13" id="13"/><label for="13">统计分析</label>
		                		        <input type="hidden" value="#"/>
		                		        <input type="checkbox" value="14" id="14"/><label for="14">申请安装</label>
		                		        <input type="hidden" value="#"/>
		                		        <input type="checkbox" value="15" id="15"/><label for="15">通讯录</label>
		                		        <input type="hidden" value="#"/>
		                		        <input type="checkbox" value="71" id="71"/><label for="71">公司公告 </label>
		                		        <input type="hidden" value="#"/>
                                   </td>
                                </tr>
                                <tr class="gradeA">
                                     <td class="center">
                                        <input type="checkbox" value="3" id="3"/>
		  				                <input type="hidden"  value="#"  />
		  				                <label for="3">统计分析</label>
                                     </td>
                                    <td>
                                          <input type="checkbox" value="34" id="34"/><label for="34">供热面积分析</label>
		                		            <input type="hidden" value="#"/>
		                		            <input type="checkbox" value="35" id="35"/><label for="35">室内温度分析</label>
		                		            <input type="hidden" value="#"/>
		                		            <input type="checkbox" value="36" id="36"/><label for="36">阀门开度分析</label>
		                		            <input type="hidden" value="#"/>
		                		            <input type="checkbox" value="37" id="37"/><label for="37">室温散点图</label>
		                		            <input type="hidden" value="#"/>
		                		            <input type="checkbox" value="50" id="50"/><label for="50">用户室温分析</label>
		                		            <input type="hidden" value="#"/>
		                		            <input type="checkbox" value="56" id="56"/><label for="56">小区实时温度</label>
		                		            <input type="hidden" value="#"/>
		                		            <input type="checkbox" value="62" id="62"/><label for="62">室温历史分析 </label>
		                		            <input type="hidden" value="#"/>
		                		            <input type="checkbox" value="63" id="63"/><label for="63">开度历史分析</label>
		                		            <input type="hidden" value="#"/>
		                		            <input type="checkbox" value="65" id="65"/><label for="65"> 小区历史温度</label>
		                		            <input type="hidden" value="#"/>
		                		            <input type="checkbox" value="66" id="66"/><label for="66">综合分析温度</label>
		                		            <input type="hidden" value="#"/>
		                		            <input type="checkbox" value="67" id="67"/><label for="67">小区温度分析</label>
		                		            <input type="hidden" value="#"/>
		                		            <input type="checkbox" value="68" id="68"/><label for="68">锁闭阀异常</label>
		                		            <input type="hidden" value="#"/>
		                		            <input type="checkbox" value="69" id="69"/><label for="69">开度异常</label>
		                		            <input type="hidden" value="#"/>
		                		            <input type="checkbox" value="70" id="70"/><label for="70">温控器异常</label>
		                		            <input type="hidden" value="#"/>
		                	      </td>
                                </tr>
                                <tr class="gradeA">
                                     <td class="center">
                                        <input type="checkbox" value="4" id="4"/>
		  				                <input type="hidden"  value="#"  />
		  				                <label for="4">数据报表</label>
                                     </td>
                                    <td>
                                      <input type="checkbox" value="16" id="16"/><label for="16">数据报表</label>
		                       		  <input type="hidden" value="#"/>
                                    </td>
                                </tr>
                                
                                <tr class="gradeA">
                                     <td class="center">
                                        <input type="checkbox" value="5" id="5"/>
		  				                <input type="hidden"  value="#"  />
		  				                <label for="5">信息管理</label>
                                     </td>
                                    <td>
                                          <input type="checkbox" value="20" id="20"/><label for="20">设备信息</label>
		                		          <input type="hidden" value="#"/>
		                		          <input type="checkbox" value="21" id="21"/><label for="21">用户信息</label>
		                		          <input type="hidden" value="#"/>
		                		          <input type="checkbox" value="22" id="22"/><label for="22">故障信息</label>
		                		          <input type="hidden" value="#"/>
		                		          <input type="checkbox" value="23" id="23"/><label for="23">日志信息</label>
		                		          <input type="hidden" value="#"/>
		                		          <input type="checkbox" value="53" id="53"/><label for="53">刷卡信息</label>
		                		          <input type="hidden" value="#"/>
                                    </td>
                                    
                                </tr>
                                <tr class="gradeA">
                                     <td class="center">
                                        <input type="checkbox" value="6" id="6"/>
		  				                <input type="hidden" value="#" />
		  				                <label for="6">缴费管理</label>
                                     </td>
                                    <td>
		                		       <input type="checkbox" value="38" id="38"/><label for="38">入网登记</label>
		                		       <input type="hidden" />
		                		       <input type="checkbox" value="39" id="39"/><label for="39">批量录入</label>
		                		       <input type="hidden" />
		                		       <input type="checkbox" value="38" id="38"/><label for="38">入网审核</label>
		                		       <input type="hidden" />
		                		       <input type="checkbox" value="39" id="39"/><label for="39">入网合同</label>
		                		       <input type="hidden" />
		                		       <input type="checkbox" value="39" id="39"/><label for="39">合同模板</label>
		                		       <input type="hidden" />
		                		       <input type="checkbox" value="39" id="39"/><label for="39">合同查询</label>
		                		       <input type="hidden" />
		                		       <input type="checkbox" value="39" id="39"/><label for="39">柜台收费</label>
		                		       <input type="hidden" />
		                		       <input type="checkbox" value="39" id="39"/><label for="39">银行代收查询</label>
		                		       <input type="hidden" />
		                		       <input type="checkbox" value="39" id="39"/><label for="39">微信代收查询</label>
		                		       <input type="hidden" />
		                		       <input type="checkbox" value="39" id="39"/><label for="39">退费查询</label>
		                		       <input type="hidden" />
		                		       <input type="checkbox" value="39" id="39"/><label for="39">离线查询</label>
		                		       <input type="hidden" />
		                		       <input type="checkbox" value="39" id="39"/><label for="39">稽查管理</label>
		                		       <input type="hidden" />
		                		       <input type="checkbox" value="39" id="39"/><label for="39">清欠中心</label>
		                		       <input type="hidden" />
		                		       <input type="checkbox" value="39" id="39"/><label for="39">采暖变更</label>
		                		       <input type="hidden" />
		                		       <input type="checkbox" value="39" id="39"/><label for="39">报表管理</label>
		                		       <input type="hidden" />
		                		       <input type="checkbox" value="39" id="39"/><label for="39">统计图表</label>
		                		       <input type="hidden" />
		                		       <input type="checkbox" value="39" id="39"/><label for="39">系统设置</label>
		                		       <input type="hidden" />
                                    </td>
                                   
                                </tr>
                                <tr class="gradeA">
                                      <td class="center">
                                        <input type="checkbox" value="7" id="7"/>
		  				                <input type="hidden" value="#" />
		  				                <label for="7">能耗分析</label>
                                      </td>
                                    <td></td>
                                   
                                </tr>
                                <tr class="gradeA">
                                    <td class="center">
                                       <input type="checkbox" value=" 8" id="8"/>
		  				               <input type="hidden" value="#" />
		  				               <label for="8">系统管理</label>                                   
                                    </td>
                                    <td>
                                       <input type="checkbox" value="9" id="9"/><label for="9">用户管理</label>
                                       <input type="hidden" value="#" />
		                		       <input type="checkbox" value="10" id="10"/><label for="10">服务器设置</label>
		                		       <input type="hidden" value="#" />
		                		       <input type="checkbox" value="12" id="12"/><label for="12">数据管理</label>
		                		       <input type="hidden" value="#" />
		                		       <input type="checkbox" value="18" id="18"/><label for="18">权限管理</label>
		                		       <input type="hidden" value="#" />
		                		       <input type="checkbox" value="19" id="19"/><label for="19">菜单管理</label>
		                		       <input type="hidden" value="#" />
		                		       <input type="checkbox" value="51" id="51"/><label for="51">抄表设置</label>
		                		       <input type="hidden" value="#" />
		                		       <input type="checkbox" value="52" id="52"/><label for="52">版本升级</label>
		                		       <input type="hidden" value="#" />
                                         
                                    </td>
                                   
                                </tr>
                                <tr class="gradeA">
                                      <td class="center">
                                         <input type="checkbox" value=" 9" id="9"/>
		  				                 <input type="hidden" value="#" />
		  				                 <label for="9">设备管理</label>
                                      </td>
                                    <td>
		                		       <input type="checkbox" value="46" id="46"/><label for="46">阀门管理</label>
		                		       <input type="hidden" value="#" />
		                		       <input type="checkbox" value="49" id="49"/><label for="49">区管管理</label>
		                		       <input type="hidden" value="#" />
		                		       <input type="checkbox" value="55" id="55"/><label for="55">刷卡器管理</label>
		                		       <input type="hidden" value="#" />
		                		       <input type="checkbox" value="57" id="57"/><label for="57">读传感器信息</label>
		                		       <input type="hidden" value="#" />
		                		       <input type="checkbox" value="73" id="73"/><label for="73">集中器管理 </label>
		                		       <input type="hidden" value="#" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        </div>
                    </div>
                </div>
         
            
     
                
        
                 
</div>           
        
</body>
</html>