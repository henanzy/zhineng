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

<script type="text/javascript" src="../js/mws.js"></script>
<script type="text/javascript" src="../js/demo.js"></script>
<script type="text/javascript" src="../js/themer.js"></script>

<!-- <script type="text/javascript" src="../js/demo.charts.js"></script> -->

<script type="text/javascript" src="../js/xitsz.js"></script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

.mws-panel-body{
 width:99.5%; 
 height:450px; 
 overflow:auto; 
 border: 1px solid #BCBCBC; 
}

.table-th-css {
	position: relative !important;
	top: 0;
}



</style>

<script>
    $(document).ready(function(){
		var bbsjtableCont = $('#bbsj_table_body table tr th'); //获取th
		var bbsjtableScroll = $('#bbsj_table_body'); //获取滚动条同级
		bbsjtableScroll.on('scroll', scrollHandlebbsj);
		
		function scrollHandlebbsj() {
			var scrollTop = bbsjtableScroll.scrollTop();
			// 当滚动距离大于0时设置top及相应的样式
			if (scrollTop > 0) {
				bbsjtableCont.css({
					"top" : scrollTop + 'px',
					"marginTop" : "-1px",
					"backgroundColor" : "#EBEBEB"
				})
			} else { // 当滚动距离小于0时设置top及相应的样式 
				bbsjtableCont.css({
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
          
               
             <div class="mws-panel grid_4" style="width: 54%;">
                    <div class="mws-tabs" >

                        <ul>
                            <li><a href="#tab-1">用户管理</a></li>
                            <li><a href="#tab-2">权限设置</a></li>
                            <li><a href="#tab-3">版本升级</a></li>
                        </ul>
                        
                        <div id="tab-1" style="height: 500px">
                          <button type="button" class="mws-button black" onClick="openEditRolePage()">添加</button>
                          <button type="button" class="mws-button gray" onClick="openEditRolePage()">分配角色</button>
                          <button type="button" class="mws-button black" onClick="openEditRolePage()">修改</button>
                          <button type="button" class="mws-button black" onClick="openEditRolePage()">删除</button>
                          
                       <hr>
                        
                  <div class="mws-panel grid_8"  >
                

                    <div id="yhgl_table_body" class="mws-panel-body"style="border: 1px solid #BCBCBC; " >

                        <table class="mws-table">
                            <thead >
                                <tr>
                                    <th class="table-th-css"></th>
                                    <th class="table-th-css">用户名</th>
                                    <th class="table-th-css">密码</th>
                                </tr>
                            </thead>
                            <tbody id="yhgl_body">
                               
                            </tbody>
                        </table>
                    </div>
                </div>
                
                             </div>
                        
<!-- ---分界线--- -->
                  <div id="tab-2" style="height: 500px">
                          <button type="button" class="mws-button black" onClick="openEditRolePage()">添加</button>
                          <button type="button" class="mws-button black" onClick="openEditRolePage()">修改</button>
                          <button type="button" class="mws-button black" onClick="openEditRolePage()">分配权限</button>
                          <button type="button" class="mws-button green" onClick="openEditRolePage()">查看当前角色下的用户</button>
                          <button type="button" class="mws-button red" onClick="openEditRolePage()">删除</button>
                           <hr>
                        
                  <div class="mws-panel grid_8"  >
                    <div id="qxsz_table_body" class="mws-panel-body" style="border: 1px solid #BCBCBC; ">

                        <table class="mws-table" >
                              <thead >
                                 <tr>
                                    <th class="table-th-css"></th>
                                    <th class="table-th-css">角色名字</th>
                                    <th class="table-th-css">创建时间</th>
                                    <th class="table-th-css">最后修改时间</th>
                                   
                                  
                                </tr>
                            </thead>
                            <tbody id="qxsz_body">
                               
                            </tbody>
                        </table>
                    </div>
                </div>
                
           </div>
<!-- ---分界线--- -->

                         <div id="tab-3" style=" height: 500px">
                  <div class="mws-panel grid_8"  >
                    <div id="bbsj_table_body" class="mws-panel-body" style="border: 1px solid #BCBCBC; ">

                        <table class="mws-table">
                            <thead >
                                <tr>
                                    <th class="table-th-css">升级人</th>
                                    <th class="table-th-css">升级内容</th>
                                    <th class="table-th-css">升级时间</th>
                                </tr>
                            </thead>
                            <tbody id="bbsj_body">
                               
                            </tbody>
                        </table>
                    </div>
                </div>
                           </div>
                    </div>
                </div>
             <div class="mws-panel grid_4" style="width: 42%; float: right;">
                    <div class="mws-tabs" >

                        <ul>
                            <li><a href="#tab-1">服务器设置</a></li>
                            <li><a href="#tab-2">数据管理</a></li>
                            <li><a href="#tab-3">抄表管理</a></li>
                        </ul>
                        
                   <div id="tab-1" style="height: 500px">
                        <div style="width: 100%; height: 100% ;">
                            <div style="width: 60%; height: 50%; margin:10% 25%">
                         
					        <table id="table" align="center">
				            
					        	<tr>
					        		<td align="right">服务器名称：</td>
					        		<td align="left"><input class="fwqinp" type="text" name="sname" value=""></td>
					        	</tr>
					        
					        	<tr>
					        		<td align="right">服务器IP:</td>
					        		<td align="left"><input class="fwqinp" type="text" name="sip" value=""></td>
					        	</tr>
					        	<tr>
					        		<td align="right">服务器端口：</td>
					        		<td align="left"><input class="fwqinp" type="text" name="sport" 	value=""></td>
					        	</tr>
					        	<tr>
					        		<td align="right">数据库登录名：</td>
					        		<td align="left"><input class="fwqinp" type="text" name="sqlname" value=""></td>
					        	</tr>
					        	<tr>
					        		<td align="right">数据库密码：</td>
					        		<td align="left"><input class="fwqinp" type="text" name="sqlpass" value=""></td>
					        	
					        </table>
					             <hr>
					             <div style=" margin-left: 35%;">
					        		<input type="submit" class="mws-button black" value="提交" />
					        	</div>
			                   </div>
                        </div>
                     </div>
                                            
                        <div id="tab-2" style="height: 500px">
                                       <div style="width: 100%; height: 100% ;">
                            <div style=" width: 60%; height: 50%; margin:10% 25%">
                         
					     <form action="backupData.action">
                          <table id="table" align="center">
				            
					        	<tr>
					        		<td align="right">备份文件名称：</td>
					        		<td align="left"><input class="sjglinp" type="text" name="sname" value=""></td>
					        	</tr>
					        
					        	<tr>
					        		<td align="right"> 备份地址：</td>
					        		<td align="left"><input class="sjglinp" type="text" name="sip" value=""></td>
					        	</tr>
					        	
					        </table>
					                  <hr>
					             <div style=" margin-left: 40%;">
					        		<input type="submit" class="mws-button black" value="备份数据" />
					        	</div>
					        
                  </form>
                                  
			                   </div>
                           </div>     
                       </div>

                         <div id="tab-3" style="height: 500px">
                        <div style="width: 100%; height: 100% ;">
                            <div style="width: 60%; height: 50%;  margin:10% 25%;">
                         
					        <table id="table" align="center">
				            
					        	<tr>
					        		<td align="right">抄表时间设置：</td>
					        		<td align="left"><input class="cbinp" type="text" name="sname" value=""></td>
					        	</tr>
					        
					        	
					        </table>
					             <hr>
					             <div style=" margin:35%;">
					        		<input type="submit" class="mws-button black" value="设置时间" />
					        	</div>
			                   </div>
                        </div>
                     </div>
                        
                    </div>
                </div>

                               
            </div>
            


</body>
</html>