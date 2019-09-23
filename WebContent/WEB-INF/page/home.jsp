<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	
	
	String ip =request.getScheme()+ "://"+request.getServerName()+ ":" + request.getServerPort()+"/";
	
%>


<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>智能锁闭阀</title>

<!-- Required Stylesheets -->
<link rel="stylesheet" type="text/css" href="../css/reset.css" media="screen" />
<!-- <link rel="stylesheet" type="text/css" href="../css/text.css" media="screen" /> -->
<link rel="stylesheet" type="text/css" href="../css/fonts/ptsans/stylesheet.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/fluid.css" media="screen" />

<link rel="stylesheet" type="text/css" href="../css/mws.style.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/icons/icons.css"  />
<link rel="stylesheet" type="text/css" href="../css/admin-all.css"media="screen" /> 


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
<link rel="stylesheet" type="text/css" href="../js/layer/2.4/skin/layer.css" media="screen" />
<script type="text/javascript" src="../js/layer/2.4/layer.js"></script>
<script type="text/javascript" src="../js/layui/layui.js"></script>
<script type="text/javascript" src="../js/layui/layui.all.js"></script>
<link rel="stylesheet" type="text/css" href="../js/layui/css/layui.css" media="screen" />
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

<!-- 选项卡 -->
<link rel="stylesheet" type="text/css" href="../tag/css/style.css" />
<link rel="stylesheet" type="text/css" href="../tag/css/tabstyle.css" />
<script type="text/javascript" src="../tag/js/tab.js"></script>



<!-- 侧边树状图 -->
<link rel="stylesheet" type="text/css" href="../css/treecss/jquery.treemenu.css" />
<script type="text/javascript" src="../js/treejs/jquery.treemenu.js"></script>


<style>
* {
	margin: 0px;
	padding: 0px;
}

#demo_m {
	display: block;
	width: 46px;
	height: 40px;
	position: fixed;
	bottom: 30px;
	left: 160px;
	z-index: 999;
}

#demo_m ul {
	width: 34px;
	height: 20px;
	position: absolute;
	top: 20px;
}

#demo_m ul li {
	list-style: none;
	padding: 0px;
	margin: 0px;
	display: inline-block;
	width: 6px;
	height: 6px;
	border-radius: 4px;
	background-color: rgba(255, 255, 255, 0.7);
}

#demo_menu1 {
	display: none;
	width: 80px;
	height: 140px;
	background-color: rgba(43, 45, 49, 0.9);
	text-align: center;
	padding: 10px;
	border-radius: 10px;
	box-shadow: 4px 4px 4px 4px rgba(0, 0, 0, 0.1);
	position: fixed;
	bottom: 30px;
	left: 204px;
	z-index: 998;
}

#demo_menu1 li a {
	color: #bbb;
	line-height: 27px;
}

#demo_menu1 li a:hover {
	color: #fff;
}

#demo_menu1::before {
	content: "";
	display: block;
	position: absolute;
	width: 0px;
	height: 0px;
	border: 10px solid transparent;
	left: -20px;
	bottom: 16px;
	border-right-color: rgba(43, 45, 49, 0.8);
}

	
#demo_menu2 {
	width: 36px;
	height: 32px;
	position: fixed;
	top: 20%;
	right: 0px;
	background-color: #2B2D31;
	border-radius: 4px;
	z-index: 11;
}

#demo_menu2 img {
	display: block;
	width: 28px;
	height: 22px;
	margin: 5px auto;
}

#demo_menu3 {
	display: none; 
	width : 160px;
	height: 106%;
	border-radius:10px;
	background-color: #444;
	position: absolute;
	top: 62px;
	right: 0px;
	z-index: 12;
}

.tree {
	color: #46CFB0;
	width: 146px;
	margin: 10px auto;
}

.tree li, .tree li>a, .tree li>span {
	padding: 4pt;
	border-radius: 4px;
}

.tree li a {
	color: #46CFB0;
	text-decoration:none;
	line-height: 20pt;
	border-radius: 4px;
}

.tree li a:hover {
	background-color: #34BC9D;
	color: #fff;
}

.active {
	background-color: #34495E;
	color: white;
}

.active a {
	color: #fff;
}

.tree li a.active:hover {
	background-color: #34BC9D;
}
	
.xqname,.ldname,.dyname{
	background:url("../images/background/cir.png") no-repeat left center;
}

.xqname:hover,.ldname:hover,.dyname:hover{
	background:url("../images/background/cirf.png") no-repeat left center;}
	
	
	#demo_menu1{
		display:none;
		width:80px;
		height:140px;
		background-color:rgba(43,45,49,0.9);
		text-align:center;
		padding:10px;
		border-radius:10px;
		box-shadow:4px 4px 4px 4px rgba(0,0,0,0.1);
		position:fixed;
		bottom:10px;
		left:204px;
		z-index:999;
	}
	
	#demo_menu1::before{
		content: "";
  		display: block;
  		position: absolute;
  		width: 0px;
  		height: 0px;
  		border: 10px solid transparent;
  		left: -20px;
  		bottom:16px;
  		border-right-color: rgba(43,45,49,0.8);
	}

	#demo_menu2 {
	width: 36px;
	height: 32px;
	position: fixed;
	top: 10%;
	right: 0px;
	background-color: #2B2D31;
	border-radius: 4px;
	z-index: 999;
}

#demo_menu2 img {
	display: block;
	width: 28px;
	height: 22px;
	margin: 5px auto;
}

#demo_menu3 {
	display: none; 
	width : 160px;
	height: 107%;
	border-radius:10px;
	background-color: #444;
	position: absolute;
	top: 62px;
	right: 0px;
	z-index: 999;
}

.tree {
	color: #46CFB0;
	width: 146px;
	margin: 10px auto;
}

.tree li, .tree li>a, .tree li>span {
	padding: 4pt;
	border-radius: 4px;
	margin-left: 0px;
}

.tree li a {
	color: #46CFB0;
	text-decoration: none;
	line-height: 20pt;
	border-radius: 4px;
}

.tree li a:hover {
	background-color: #34BC9D;
	color: #fff;
}

.active {
	background-color: #34495E;
	color: white;
}

.active a {
	color: #fff;
}

.tree li a.active:hover {
	background-color: #34BC9D;
}
	
.xqname,.ldname,.dyname{
	background:url("../images/background/cir.png") no-repeat left center;
}

.xqname:hover,.ldname:hover,.dyname:hover{
	background:url("../images/background/cirf.png") no-repeat left center;
}

</style>
 <script type="text/html" id="pswModel">
    <form id="pswForm" class="layui-form model-form" action="" method="PUT">

     
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input style="width:200px" autocomplete="off" id="username" readonly="readonly" name="username" value="${UserName}" class="layui-input" maxlength="12"
                       lay-verify="required" required/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">旧密码</label>
            <div class="layui-input-block">
                <input style="width:200px" autocomplete="off" id="oldpassword" name="oldpassword" placeholder="请输入旧密码" type="password" class="layui-input" maxlength="12"
                       lay-verify="required" required/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">新密码</label>
            <div class="layui-input-block">
                <input style="width:200px" autocomplete="off" id="newpassword" name="newpassword" placeholder="请输入新密码" type="password" class="layui-input" maxlength="12"
                       lay-verify="required|pass" required/>
            </div>
        </div>
        
        <div class="layui-form-item model-form-footer" style="margin-left:130px">
            <button class="layui-btn layui-btn-primary" type="button" id="pswCancel">取消</button>
            <button class="layui-btn layui-btn-normal" type="button" id="pswSubmit" >修改</button>
        </div>
    </form>

</script>

<script type="text/html" id="YhModel">

<form id="addYhForm" class="layui-form model-form" action="" method="PUT">

    
       <div class="layui-form-item">
           <label class="layui-form-label">用户名</label>
           <div class="layui-input-block">
               <input style="width:200px" autocomplete="off" id="username" name="username" placeholder="请输入用户名" value="" class="layui-input" maxlength="12"
                      lay-verify="required" required/>
           </div>
       </div>

       <div class="layui-form-item">
           <label class="layui-form-label">密码</label>
           <div class="layui-input-block">
               <input style="width:200px" autocomplete="off" id="password" name="password" placeholder="请输入新密码" type="password" class="layui-input" maxlength="12"
                      lay-verify="required|pass" required/>
           </div>
       </div>

      <div class="layui-form-item">
           <label class="layui-form-label">用户级别</label>
           <div class="layui-input-inline" style="width:200px;">
               <select style="width:200px"  id="type"  class="layui-input-inline">
                <option value='企业用户'>企业用户</option>
                <option value='集团用户'>集团用户</option>
               </select>
           </div>
       </div>
      <div class="layui-form-item">
           <label class="layui-form-label">所属公司</label>
           <div class="layui-input-inline" style="width:200px;">
               <select style="width:200px"  id="ssgs"  class="layui-input-inline">
                <option value=''>总公司</option>
                <option value='登封热力'>登封热力</option>
                <option value='新密热力'>新密热力</option>
               </select>
           </div>
       </div>

      <div class="layui-form-item">
           <label class="layui-form-label">用户角色</label>
           <div class="layui-input-inline" style="width:200px;">
               <select style="width:200px"  id="ssgs"  class="layui-input-inline">
                <option value=''>超级管理员</option>
                <option value=''>管理员</option>
                <option value=''>供热管理员</option>
                <option value=''>工作人员</option>
               </select>
           </div>
       </div>
       
       <div class="layui-form-item model-form-footer" style="margin-left:130px">
           <button class="layui-btn layui-btn-primary" type="button" id="adYhCancel">取消</button>
           <button class="layui-btn layui-btn-normal" id="addYhSubmit" >添加</button>
       </div>
   </form>
</script>
<script type="text/javascript">
function doit(){
	$('#Conframel').contents().find(".ac_kf li a").tab();
}


function yhgl(){//   
	    window.open("<%=basePath%>YxglCon/dashboard.action","Conframe");
	} 
<%-- function wtxz(){// 
	    window.open("<%=basePath%>user/error.action","Conframe");
	} 
function charts(){// 
	    window.open("<%=basePath%>user/charts.action","Conframe");
	}  --%>
function form_elements(){// 
	    window.open("<%=basePath%>user/form_elements.action","Conframe");
	}
function yunxzk(){// 
	    window.open("<%=basePath%>user/yunxzk.action","Conframe");
	} 
function tongjfx(){// 
	    window.open("<%=basePath%>user/tongjfx.action","Conframe");
	} 
function yunxsj(){// 
	    window.open("<%=basePath%>user/yunxsj.action","Conframe");
	}
function caozrz(){// 
	    window.open("<%=basePath%>xxgl/caozrz.action","Conframe");
	}
function guzxx(){// 
	    window.open("<%=basePath%>xxgl/guzxx.action","Conframe");
	}
function shuakjl(){// 
	    window.open("<%=basePath%>xxgl/shuakjl.action","Conframe");
	}
function jizqxx(){// 
	    window.open("<%=basePath%>jzq/jizqxx.action","Conframe");
	}
function qugxx(){// 
	    window.open("<%=basePath%>qg/qugxx.action","Conframe");
	}
function rebxx(){// 
	    window.open("<%=basePath%>user/rebxx.action","Conframe");
	}
function shuakaxx(){// 
	    window.open("<%=basePath%>user/shuakaxx.action","Conframe");
	}
function xiaoqxx(){// 
	    window.open("<%=basePath%>yhInfo/xiaoqxx.action","Conframe");
	}
function yezxx(){// 
	    window.open("<%=basePath%>yhInfo/yezxx.action","Conframe");
	}
function beizlb(){// 
	    window.open("<%=basePath%>user/beizlb.action","Conframe");
	}
function shebgl(){// 
	    window.open("<%=basePath%>sbglCon/shebgl.action","Conframe");
	}
function xitsz(){// 
	    window.open("<%=basePath%>user/xitsz.action","Conframe");
	}
function caidsz(){// 
	    window.open("<%=basePath%>user/caidsz.action","Conframe");
	}
function cgqdz(){// 
    window.open("<%=basePath%>user/cgqdz.action","Conframe");
}
function jcgl(){// 
	window.open("<%=basePath%>user/jcgl.action","Conframe");
}
/* 知识库 */
function qiytl(){// 
    window.open("<%=basePath%>ZskCon/getQytl.action?type=企业条例", "Conframe");
} 
function guojfg(){// 
	window.open("<%=basePath%>ZskCon/getQytl.action?type=国家法规", "Conframe");
} 
function hangyzs(){// 
	window.open("<%=basePath%>ZskCon/getQytl.action?type=行业知识", "Conframe");
} 
function xitsm(){// 
	window.open("<%=basePath%>ZskCon/getQytl.action?type=系统说明", "Conframe");
} 
function wentjd(){// 
	window.open("<%=basePath%>ZskCon/getQytl.action?type=问题解答", "Conframe");
} 
 	/* 员工定位 */
function shisdw(){// 
	window.open("<%=basePath%>user/shisdw.action","Conframe");
} 
function lisgj(){// 
	window.open("<%=basePath%>user/lisgj.action","Conframe");
} 

function xzyh(flag){
	var form = layui.form
   
	if(flag=="1"){
		layer.msg("用户名已存在");
	}
	 layer.open({
	        type: 1,
	        title: "新增用户",
	        area: ['400px', '500px'] ,
	        offset: '120px',
	        content: $("#YhModel").html()
	    });
	 form.render();
	 $("#addYhForm")[0].reset();
	    $("#adYhCancel").click(function () {
	        layer.closeAll();
	    });
	    
	    $("#addYhSubmit").click(function () {
	    	var username = $('#username').val();
			var password = $('#password').val();
			var type = $('#type').val();
			var ssgs = $('#ssgs').val();
			
			if(username==""||password==""){
				alert("用户名或密码不为空!");
				return false;
			}
				$.ajax({
					url : "<%=basePath%>user/addYh.action", 
					async : false,
					dataType : "json",
					data : {
						"username" : username,
						"password" : password,
						"type" : type,
						"ssgs" : ssgs,
					},
					success : function(data) {
	
						msg = data.msg
						if(msg=="1"){
							setTimeout(function () {
								alert("添加成功");
		                    }, 2500);
							
						}else{
								setTimeout(function () {
									alert("用户名已存在!");
			                    }, 2000);
								layer.closeAll();
								//xzyh(1)
						}
					}

				});
	    });
}

function xgmm(flag) {
	 if(flag=="1"){
		layer.msg("原密码输入错误");
	} 
    layer.open({
        type: 1,
        title: "修改密码",
        area: '400px',
        offset: '120px',
        content: $("#pswModel").html()
    });
    $("#pswForm")[0].reset();
    $("#pswCancel").click(function () {
        layer.closeAll();
    });
    
    $("#pswSubmit").click(function () {
    	var username = $('#username').val();
		var oldpassword = $('#oldpassword').val();
		var newpassword = $('#newpassword').val();
		if(oldpassword==""||oldpassword==""){
			alert("密码不能为空!");
			return false;
		}
		var id=$('#id').val();
			$.ajax({
				url : "<%=basePath%>user/updapwd.action", 
				async : false,
				dataType : "json",
				data : {
					"oldpassword" : oldpassword,
					"newpassword" : newpassword,
					"username" : username,
					
				},
				success : function(data) {
					
					msg = data
					if(msg=="0"){				
							alert("修改成功!");	
							window.location.href="<%=basePath%>user/toLogin.action"; 
					}else{
					alert("原密码输入错误");

							//xgmm(0);
						
					}
				}

			});
    });
    
    
    
}
</script>
</head>
<body onload="doit()" style="height:100%;" >
	 <!--   模块连接 -->
      	<div>
      	<div id="demo_m">
      			<ul>
      				<li></li>
      				<li></li>
      				<li></li>
      			</ul>
      		</div>
			<ul id="demo_menu1" class="sidebar-menu">
			<li style="margin-left: 0px;"><a
				href="<%=ip%>xingxhrz/user/home.action">换热站管理</a></li>
					<li style="margin-left: 0px;"><a
				href="http://192.144.169.217:8091/rebiao/user/home.action">热表集抄</a></li>
				<li style="margin-left: 0px;"><a
				href="<%=ip%>zhineng/user/home.action?fl=nhjk">智能入户</a></li>
			  <li style="margin-left: 0px;"><a
				href="<%=ip%>kfgl/user/home.action">客服系统</a></li>
			<li style="margin-left: 0px;"><a
				href="<%=ip%>zykt/user/home.action">缴费管理</a></li>
			
				<!-- <li style="margin-left: 0px;">
					<a href="http://localhost:8080/zhishi/user/home.action">知识库</a>
				</li> -->
			</ul>
			
			
		<div id="demo_menu2">
			<img src="../images/background/menu.png" />
		</div>

		<div id="demo_menu3">
			<ul class="tree">

			</ul>
		</div>
			
			
		</div>
  <!-- 头部 -->

	<div id="mws-header" class="clearfix" style="width:100%;">
    	<div id="mws-logo-container" style="width:60%;">
        	<div id="mws-logo-wrap" style="width:100%;float:right;">
            	<!-- <img src="../images/mws-logo.png" alt="mws admin" style="width:300px;height:34px;float:right;margin-top:10px;" /> -->
            	<p style="width:450px;height:34px;float:left;font-size:30px;color:#C5D52B;line-height:60px">ZYIS-H 智慧供热平台</p>
			</div>
        </div>
      
        <!-- 登录头像 -->
        <div id="mws-user-tools" class="clearfix">
            <div id="mws-user-info" class="mws-inset">
            	<div id="mws-user-photo">
                	<img src="../example/profile.jpg" alt="User Photo" />
                </div>
                <div id="mws-user-functions">
                    <div id="mws-username">
                       
                    </div>
                    <ul>
                        <li><a href="#" onclick="xgmm(0)">更改密码</a></li>
                        <li><a href="#" onclick="xzyh(0)">用户注册</a></li>
                        <li><a href="<%=ip%>zhineng/user/toLogin.action">登录</a></li>
						<li><a href="<%=ip%>zhineng/user/toLogin.action">退出</a></li>
						<li><a href="<%=ip%>zhineng/user/ZHome.action">退到主页面</a></li>
                       
                    </ul>
                </div>
            </div>
        </div>
    </div>
    

    
   <!-- 下面内容 start-->
   <div id="mws-wrapper" >
       <!--  必要的标记，不要删除 -->
           <div id="mws-sidebar-stitch"></div>
           <div id="mws-sidebar-bg"></div>

           <!-- 左边侧栏包装器 -->
           <div id="mws-sidebar">
           	
               <!--  搜索框-->
               <div id="mws-searchbox" class="mws-inset">
                   <form action="https://www.baidu.com/">
                       <input type="text" class="mws-search-input" />
                       <input type="submit" class="mws-search-submit" />
                   </form>
               </div>
       
                 <iframe  width="100%"   name="Conframel" id="Conframel" src="<%=basePath%>user/left.action?fl=${fl}" frameborder="0" onload="this.height=0;var fdh=(this.Document?this.Document.body.scrollHeight:this.contentDocument.body.offsetHeight);this.height=(fdh>1700?fdh:950)"></iframe>
           		 
           </div>
          <!-- 左边侧栏包装器  End -->

          <!--  右边主容器 start  -->
    
	  <div id="mws-container" class="clearfix">
		
	     <div class="Conframe" style="height:90%;overflow-x:auto;"> 
	     	<div id="page-tab">
					<button class="tab-btn" id="page-prev"></button>
					<nav id="page-tab-content">
						<div id="menu-list">                </div>
					</nav>
					<button class="tab-btn" id="page-next"></button>
					
				</div>
	        <iframe  name="Conframe" id="Conframe"   src="<%=basePath%>YxglCon/dashboard.action" ></iframe>
	     </div> 
	  </div>

  </div>


	<script type="text/javascript">
	
	var UserName="<%=request.getSession().getAttribute("UserName")%>"
	var type="<%=request.getSession().getAttribute("type")%>"
	
	var str;
	
	if (type=="qyyh"){
		
		str="企业用户"
	}else{
		str="集团用户"
	}
	if(UserName!="null"){
		
		$("#mws-username").html("Hello,"+UserName +"&nbsp;"+str);
	}
	var list;
	$.ajax({
		url : "<%=basePath%>yhInfo/szt.action", 
		async : false,
		dataType : "json",
		data : {
		},
		success : function(data) {
			list=data.list;
			
		}

	});
		
	//侧面树图
	 var xqlilst = [];
	 for(var i = 0 ; i < list.length ; i ++){
		 if(xqlilst.indexOf(list[i].xqm) == -1){
			 xqlilst.push(list[i].xqm);
		 }
	 }
	 for(var j = 0; j < xqlilst.length; j++) {
			$(".tree").append("<li class='xq xqli"+j+"'><a class='xqname' href='#'>&nbsp;&nbsp;"+xqlilst[j]+"</a></li>");
	}
	

	 var ldlist = [];
	 var ldl = [];
	 for(var x = 0 ; x < xqlilst.length ; x ++){
		 for(var i = 0 ; i < list.length ; i ++){
			 if( xqlilst[x] == list[i].xqm && ldl.indexOf(list[i].ldh) == -1){
				 ldl.push(list[i].ldh);
			 }
		 }
		 ldlist.push(ldl);
		 ldl = [];
	 }
	 
	 for(var j = 0; j < ldlist.length; j++) {
		 $(".xqli"+j).append("<ul></ul>");
		 for(var i = 0; i < ldlist[j].length; i++){
			 $(".xqli"+j).children("ul").append("<li class='ld'><a class='ldname' href='#'>&nbsp;&nbsp;&nbsp;"+ldlist[j][i]+"</a></li>");
		 }
	 } 
	
	 var dylist = [];
	 var ldlic = $(".ld");
	 $(".ld").each(function(i){
		$(this).addClass("ldli"+i);
		 
	 });
	 for(var y = 0 ; y < ldlic.length ; y ++){
		 var xqlddy = [];
		 var aldhtml = $(".ldli"+y).children("a.ldname").html();
		 aldhtml = aldhtml.replace(/&nbsp;/ig, "");
		 var axqhtml = $(".ldli"+y).parent().parent().children("a.xqname").html();
		 axqhtml = axqhtml.replace(/&nbsp;/ig, "");
		 for(var i = 0 ; i < list.length ;i ++){
			 if(axqhtml == list[i].xqm && aldhtml == list[i].ldh && xqlddy.indexOf(list[i].dyh) == -1){
				 xqlddy.push(list[i].dyh);
			 }
		 }
		 if(xqlddy.length > 0){
			 $(".ldli"+y).append("<ul></ul>"); 
			 for(var a = 0 ; a < xqlddy.length ;a ++){
				 $(".ldli"+y).children("ul").append("<li class='dy'><a class='dyname' href='#'>&nbsp;&nbsp;&nbsp;&nbsp;"+xqlddy[a]+"</a></li>");
			 }
		 }
		
	 } 
	
	 /*  var hhlist = [];
	 var dylic = $(".dy");
	 $(".dy").each(function(i){
		$(this).addClass("dyli"+i);
		 
	 });
	 for(var y = 0 ; y < ldlic.length ; y ++){
		 var xqlddyhh = [];
		 var adyhtml = $(".dyli"+y).children("a.dyname").html();
		 adyhtml = adyhtml.replace(/&nbsp;/ig, "");
		 var aldhtml = $(".dyli"+y).parent().parent().children("a.ldname").html();
		 aldhtml = aldhtml.replace(/&nbsp;/ig, "");
		 
		 var axqhtml = $(".dyli"+y).parent().parent().parent().parent().children("a.xqname").html();
		 axqhtml = axqhtml.replace(/&nbsp;/ig, "");
		 
		 for(var i = 0 ; i < list.length ;i ++){
			 if(axqhtml == list[i].xqm && aldhtml == list[i].ldh && adyhtml == list[i].dyh &&  xqlddyhh.indexOf(list[i].hh) == -1 ){
				 xqlddyhh.push(list[i].hh);
			 }
		 }
		
		 if(xqlddyhh.length > 0){
			 $(".dyli"+y).append("<ul></ul>"); 
			 for(var a = 0 ; a < xqlddyhh.length ;a ++){
				 $(".dyli"+y).children("ul").append("<li class='hh'><a class='hhname' href='#'>&nbsp;&nbsp;&nbsp;&nbsp;"+xqlddyhh[a]+"</a></li>");
			 }
		 }
		
	 }  */
	  
	
	$("#demo_menu2").mouseenter(function() {
		$("#demo_menu3").fadeIn(500);
	});
	
	$("#demo_menu3").mouseleave(function(){
		$("#demo_menu3").fadeOut(500);
	});
        
	$(".tree").treemenu({
		delay: 300
	}).openActive();
	
        

  $("#demo_m").mouseenter(function() {
		$("#demo_m ul").css("transform", "rotate(90deg)");
		$("#demo_m ul li").css("background-color", "#C5D52B");
		$("#demo_menu1").show();
	}).mouseleave(function() {
		$("#demo_m ul").css("transform", "rotate(360deg)");
		$("#demo_m ul li").css("background-color","rgba(255,255,255,0.7)");
		$("#demo_menu1").hide();
	});

	$("#demo_menu1").mouseover(function() {
		$("#demo_m ul").css("transform", "rotate(90deg)");
		$("#demo_m ul li").css("background-color", "#C5D52B");
		$(this).show();
	}).mouseleave(function() {
		$("#demo_m ul").css("transform", "rotate(360deg)");
		$("#demo_m ul li").css("background-color","rgba(255,255,255,0.7)");
		$(this).hide();
	});

	var xq;
	var ld;
	var dy;
	
	
	/* 楼栋 */
	$("a.xqname").click(function(){
		
		$('#Conframel').contents().find(".ac_kf li a").css("cssText","color:#fff !important;");
		
		xq = $(this).html();
		xq = xq.replace(/&nbsp;/ig, "");
		
	});	 
	
	/* 楼栋 */
	$("a.ldname").click(function(){
		
		$('#Conframel').contents().find(".ac_kf li a").css("cssText","color:#fff !important;");
		
		ld = $(this).html();
		ld = ld.replace(/&nbsp;/ig, "");
		xq = $(this).parents("li.xq").children("a.xqname").html();
		xq = xq.replace(/&nbsp;/ig, "");
		
	});	 
	
	/* 单元 */
	$("a.dyname").click(function(){
		
		$('#Conframel').contents().find(".ac_kf li a").css("cssText","color:#fff !important;");
		
		dy = $(this).html();
		dy = dy.replace(/&nbsp;/ig, "");
		ld = $(this).parents("li.ld").children("a.ldname").html();
		ld = ld.replace(/&nbsp;/ig, "");
		xq = $(this).parents("li.xq").children("a.xqname").html();
		xq = xq.replace(/&nbsp;/ig, "");
		
	});	 
	
	 
	$.ajax({
		url : "<%=basePath%>user/getgs.action", 
		async : false,
		dataType : "json",
		data : {
		
		},
		success : function(data) {
			
			gsList=data.list;	   
			
           for(var i=0; i<gsList.length; i++){
				if(gsList[i]=="总公司"){
					$("#ssgs").append("<option value=''>"+gsList[i]+"</option>");
				}else{
					$("#ssgs").append("<option value='"+gsList[i]+"'>"+gsList[i]+"</option>");
				}
				
				
			}
           var form = layui.form
           form.render();
		}

	});
        
  </script>



</body>


</html>