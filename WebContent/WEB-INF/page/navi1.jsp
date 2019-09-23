<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	
	
	String ip =request.getScheme()+ "://"+request.getServerName()+ ":" + request.getServerPort()+"/";
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta charset="utf-8" />
		<title>首页</title>
		<script src="../js/jquery-1.7.1.min.js"></script>
		
		<style>
			*{
				margin: 0;
				padding: 0;
			}
			html,body{
				width: 100%;
				height:100%;
			}
			#overall{
				width: 100%;
				height:100%;
				min-width: 1000px;
				min-height: 600px;
			}
			
			/*导航*/
			#navi{
				width: 100%;
				height: 62px;
				line-height: 62px;
				background: url(../images/navimap/header-bg.png) repeat-x;
				color: #FFFFFF;
				font-size: 16px;
				position: absolute;
				top: 0px;
				left: 0px;
			}
			#line{
				width: 100%;
				height: 4px;
				background-color: #C5D52B;
				margin-top: 58px;
			}
			#title,
			#login,
			#icon{
				display: inline-block;
				width: 200px;
				height: 60px;
				line-height: 60px;
			}
			#title{
				position: absolute;
				top: 0px;
				left: 10%;
				width: 430px;
				font-size: 30px;
				color: #C5D52B;
			}
			#login{
				position: absolute;
				top: 0px;
				right: 20px;
			}
			#icon{
				position: absolute;
				top: 0px;
				left: 40px;
			}
			#icon img{
				width: 26px;
				height: 26px;
				/* vertical-align: middle; */
				margin-top:16px;
			}
			.login_user img,
			.login_out img{
				width: 20px;
				height: 20px;
				vertical-align: middle;
				margin-right: 4px;
			}
			.login_out{
				cursor: pointer;
			}
			.login_interval{
				margin: 0 10px;
			}
			#content{
				width: 100%;
				height: 100%;
				overflow: hidden;
			}
			#mainIframe{
				width: 100%;
				height: 100%;
			}
			
			/*左*/
			#bannerleftopen{
				display: none;
				width: 25px;
				height: 80px;
				/*background: url(../images/dark-bg.png) no-repeat;
				background-size: 100% 100%;*/
				cursor: pointer;
				position: absolute;
				top: 30%;
				left: 0%;
				/*float: left;*/
				opacity: 0.8;
				background-color: black;
				border-right: 1px solid #AAAAAA;
				border-top: 1px solid #AAAAAA;
				border-bottom: 1px solid #AAAAAA;
				border-top-right-radius: 8px;
				border-bottom-right-radius: 8px;
			}
			#bannerleftopen img{
				display: block;
				margin: 28px auto;
			}
			
			#leftcontent{
				display: block;
				position: absolute;
				top: 90px;
				width: 280px;
				height: 420px;
				color: #fff;
				border: solid 1px #aaa;
				border-radius: 10px;
				text-align: center;
				max-height: 90%;
				margin-left: 1%;
				/*background: url(images/body-bg.png) repeat;*/
			/*	background-size: 100% 100%;*/
				filter: alpha(opacity=80);
				opacity: 0.8;
				background-color: black;
				font-size: 14px;
			}
			.main_left{
				width: 80%;
				height: 90%;
				margin: 30px auto;
			}
			.main_left p{
				width: 100%;
				height: 50px;
				line-height: 50px;
				text-align: left;
				border-bottom: 1px dashed #AAAAAA;
			}
			.main_left p label{
				display: inline-block;
				width: 50%;
			}
			.main_left p span.span_num{
				display: inline-block;
				width: 25%;
				height: 40px;
				text-align: center;
				border-bottom: 1px solid #AAAAAA;
			}
			.main_left p span.span_nuit{
				display: inline-block;
				width: 10%;
			}
			#bannerleftclose{
				width: 25px;
				height: 80px;
				background: url(../images/navimap/arrowleft.png) no-repeat;
				cursor: pointer;
				position: absolute;
				top: 40%;
				right: -26px;
				/*float: left;*/
				opacity: 0.8;
				background-color: black;
				border-right: 1px solid #AAAAAA;
				border-top: 1px solid #AAAAAA;
				border-bottom: 1px solid #AAAAAA;
				border-top-right-radius: 8px;
				border-bottom-right-radius: 8px;
				background-position-x: center;
				background-position-y: center;
			}
			
			.frame-bg-corner{
				position: absolute;
				width: 15px;
				height: 15px;
			}
			.frame-bg-lt {
			    top: 0;
			    left: 0px;
			    background: url("../images/navimap/frame-lt.png") no-repeat;
			}
			.frame-bg-lb {
			    bottom: 0;
			    left: 0px;
			    background: url("../images/navimap/frame-lb.png") no-repeat;
			}
			.frame-bg-rt {
			    top: 0;
			    right: 0px;
			    background: url("../images/navimap/frame-rt.png") no-repeat;
			}
			.frame-bg-rb {
			    bottom: 0;
			    right: 0px;
			    background: url("../images/navimap/frame-rb.png") no-repeat;
			}
			
			/*右上*/
			#bannerrightopenup{
				display: none;
				width: 25px;
				height: 80px;
				/*background: url(images/dark-bg.png) no-repeat;
				background-size: 100% 100%;*/
				cursor: pointer;
				position: absolute;
				top: 144px;
				right: 0%;
				/*float: left;*/
				opacity: 0.8;
				background-color: black;
				border-left: 1px solid #AAAAAA;
				border-top: 1px solid #AAAAAA;
				border-bottom: 1px solid #AAAAAA;
				border-top-left-radius: 8px;
				border-bottom-left-radius: 8px;
			}
			#bannerrightopenup img{
				display: block;
				margin: 28px auto;
			}
			
			#rightupcontent{
				display: block;
				position: absolute;
				right: 1%;
				top: 70px;
				width: 400px;
				height: 280px;
				color: #fff;
				border: solid 1px #aaa;
				border-radius: 10px;
				text-align: center;
				max-height: 90%;
				/*background: url(images/body-bg.png) repeat;*/
			/*	background-size: 100% 100%;*/
				filter: alpha(opacity=80);
				opacity: 0.8;
				background-color: black;
				font-size: 14px;
			}
			.main_rightup{
				width: 80%;
				height: 100%;
				margin: 0px auto;
				/*border: 1px solid #AAAAAA;*/
			}
			.main_rightup p{
				width: 100%;
				height: 50px;
				line-height: 50px;
				text-align: left;
				/*border-bottom: 1px dashed #AAAAAA;*/
			}
			.main_rightup h2{
				color:  #C5D52B;
				height: 50px;
				line-height: 50px;
				text-align: center;
				font-size:18px;
				font-weight: bold;
			}
			.main_rightup p:first-of-type{
				margin-top: 10px;
				/*border: none;*/
			}
			/*.main_rightup p:last-of-type{
				border: none;
			}*/
			.main_rightup p label{
				display: inline-block;
				width: 50%;
			}
			.main_rightup p span.span_num{
				display: inline-block;
				width: 25%;
				height: 40px;
				text-align: center;
				border-bottom: 1px solid #AAAAAA;
			}
			.main_rightup p span.span_nuit{
				margin-left: 30px;
			}
			#disnum{
				width: 210px;
				height: 50px;
				/*background-color: red;*/
				position: absolute;
				top: 70px;
				right: 86px;
			}
			.disimg{
				display: inline-block;
				width: 40px;
				height: 42px;
				border: 1px dashed #AAAAAA;
			}
			.disimg img{
				width: 40px;
				height: 42px;
			}
			.imgdot{
				width:30px;
				height: 50px;
				/*border: 1px dashed #AAAAAA;*/
			}
			.imgdot img{
				width: 18px;
				height: 18px;
			}
			#bannerrightcloseup{
				width: 25px;
				height: 80px;
				background: url(../images/navimap/arrow.png) no-repeat;
				cursor: pointer;
				position: absolute;
				top: 34%;
				left: -26px;
				/*float: left;*/
				opacity: 0.8;
				background-color: black;
				border-left: 1px solid #AAAAAA;
				border-top: 1px solid #AAAAAA;
				border-bottom: 1px solid #AAAAAA;
				border-top-left-radius: 8px;
				border-bottom-left-radius: 8px;
				background-position-x: center;
				background-position-y: center;
			}
			
			
			
			/*右下*/
			#bannerrightopendown{
				display: none;
				width: 25px;
				height: 80px;
				/*background: url(images/dark-bg.png) no-repeat;
				background-size: 100% 100%;*/
				cursor: pointer;
				position: absolute;
				top: 480px;
				right: 0%;
				/*float: left;*/
				opacity: 0.8;
				background-color: black;
				border-left: 1px solid #AAAAAA;
				border-top: 1px solid #AAAAAA;
				border-bottom: 1px solid #AAAAAA;
				border-top-left-radius: 8px;
				border-bottom-left-radius: 8px;
			}
			#bannerrightopendown img{
				display: block;
				margin: 28px auto;
			}
			
			#rightdowncontent{
				display: block;
				position: absolute;
				right: 1%;
				top: 380px;
				width: 400px;
				height: 40%;
				color: #fff;
				border: solid 1px #aaa;
				border-radius: 10px;
				text-align: center;
				max-height: 90%;
				/*background: url(images/body-bg.png) repeat;*/
			/*	background-size: 100% 100%;*/
				filter: alpha(opacity=80);
				opacity: 0.8;
				background-color: black;
			}
			.main_rightdown{
				width: 90%;
				height: 100%;
				margin: 0px auto;
				/*border: 1px solid #AAAAAA;*/
			}
			.main_rightdown p{
				width: 100%;
				height: 40px;
				line-height: 40px;
				text-align: left;
				font-size:14px;
				border-bottom: 1px dashed #AAAAAA;
			}
			.main_rightdown p:first-of-type{
				color:  #C5D52B;
				height: 50px;
				line-height: 50px;
				text-align: center;
				font-size:18px;
				font-weight: bold;
				border: none;
			}
			.alt_title{
				display: inline-block;
				width: 70%;
				
			}
			.alt_time{
				display: inline-block;
				width: 30%;
			}
			#bannerrightclosedown{
				width: 25px;
				height: 80px;
				background: url(../images/navimap/arrow.png) no-repeat;
				cursor: pointer;
				position: absolute;
				top: 40%;
				left: -26px;
				/*float: left;*/
				opacity: 0.8;
				background-color: black;
				border-left: 1px solid #AAAAAA;
				border-top: 1px solid #AAAAAA;
				border-bottom: 1px solid #AAAAAA;
				border-top-left-radius: 8px;
				border-bottom-left-radius: 8px;
				background-position-x: center;
				background-position-y: center;
			}
			


#demo_menu1 {
	display: none;
	width: 80px;
	height: 240px;
	background-color: rgba(43, 45, 49,1);
	opacity: 1;
	text-align: center;
	padding: 16px;
	border-radius: 10px;
	box-shadow: 4px 4px 4px 4px rgba(0, 0, 0, 0.1);
	position: fixed;
	top: 48px;
	left: 10px;
	z-index: 998;
}
#demo_menu1 li{
	list-style-type: none;
}
#demo_menu1 li a {
	color: #bbb;
	line-height: 27px;
	text-decoration: none;
}

#demo_menu1 li a:hover {
	color: #fff;
}


		</style>
	</head>
	<body>
	
	
		<div id="overall">
			<div id="navi">
				<div id="icon"><img src="../images/navimap/moreicon.png" /></div>
				<div id="title"> ZYIS-H 智慧供热平台</div>
				<div id="login"><span class="login_user"><img src="../images/navimap/loginuser.png" /></span><span id="user" class="login_user"></sapn><span class="login_interval"> | </span><sapn class="login_out"><img src="../images/navimap/loginout.png" />退出</sapn></div>
				<div id="line"></div>
			</div>
			
			<div id="content">
				<iframe id="mainIframe" src="<%=basePath%>user/map.action"></iframe>
				<%--  <iframe  name="Conframe" id="Conframe"  src="<%=basePath%>YxglCon/dashboard.action" ></iframe> --%>
			</div>
			<!--左侧栏-->
			<div id="bannerleftopen"><img src="../images/navimap/arrow.png" /></div>
			<div id="leftcontent">
				<div id="bannerleftclose"></div>
				<div class="frame-bg-corner frame-bg-lt"></div>
				<div class="frame-bg-corner frame-bg-lb"></div>
				<div class="frame-bg-corner frame-bg-rt"></div>
				<div class="frame-bg-corner frame-bg-rb"></div>
				
				<div class="main_left">
					<p><label>换热站：</label><span class="span_num">92</span> <span class="span_nuit">座</span></p>
					<p><label>智慧供热用户：</label><span class="span_num">15323</span>  <span class="span_nuit">户</span></p>
					<p><label>热计量用户：</label><span class="span_num">6290</span> <span class="span_nuit">户</span></p>
					<p><label>其他用户：</label><span class="span_num">60596</span> <span class="span_nuit">户</span></p>
					<p><label>平均室温：</label><span class="span_num">21</span>  <span class="span_nuit">°C</span></p>
					<p><label>室外温度：</label><span class="span_num">10.2</span>  <span class="span_nuit">°C</span></p>
					<p><label>安全运行时间：</label><span class="span_num">923</span>  <span class="span_nuit">天</span></p>
				</div>
				
			</div>
			<!--右侧栏上-->
			<div id="bannerrightopenup"><img src="../images/navimap/arrowleft.png" /></div>
			<div id="rightupcontent">
				<div id="bannerrightcloseup"></div>
				<div class="frame-bg-corner frame-bg-lt"></div>
				<div class="frame-bg-corner frame-bg-lb"></div>
				<div class="frame-bg-corner frame-bg-rt"></div>
				<div class="frame-bg-corner frame-bg-rb"></div>
				
				<div class="main_rightup">
					<h2>2018-2019供热季</h2>
					<p><label>投运面积：</label><span class="span_num" style="border: none;"></span>  <span class="span_nuit">万m²</span></p>
					<p><label>目标能耗：</label><span class="span_num">0.29</span>  <span class="span_nuit"></span></p>
					<p><label>当前平均能耗：</label><span class="span_num">0.395</span> <span class="span_nuit"></span></p>
					<p><label>指标剩余热量：</label><span class="span_num">56290</span> <span class="span_nuit">GJ</span></p>
					<div id="disnum">
						<span class="disimg"><img src="../images/num/6.png" /></span>
						<span class="disimg"><img src="../images/num/5.png" /></span>
						<span class="disimg"><img src="../images/num/3.png" /></span>
						<span class="imgdot"><img src="../images/num/dot.png" /></span>
						<span class="disimg"><img src="../images/num/9.png" /></span>
					</div>
				</div>
				
			</div>
			
			<!--右侧栏下-->
			<div id="bannerrightopendown"><img src="../images/navimap/arrowleft.png" /></div>
			<div id="rightdowncontent">
				<div id="bannerrightclosedown"></div>
				<div class="frame-bg-corner frame-bg-lt"></div>
				<div class="frame-bg-corner frame-bg-lb"></div>
				<div class="frame-bg-corner frame-bg-rt"></div>
				<div class="frame-bg-corner frame-bg-rb"></div>
				
				<div class="main_rightdown">
					<p>新闻·公告</p>
					<p><span class="alt_title">不忘初心 ，砥砺前行 </span><span class="alt_time">2019-07-02</span></p>
					<p><span class="alt_title">喜获荣誉，再创佳绩 </span><span class="alt_time">2019-04-26</span></p>
					<p><span class="alt_title">关于缴费 </span><span class="alt_time">2018-08-08</span></p>
					<p><span class="alt_title">用暖须知 </span><span class="alt_time">2018-08-07</span></p>
					<p><span class="alt_title">(置顶)走进三联 </span><span class="alt_time">2017-11-01</span></p>
				</div>
			</div>
			
			
				<ul id="demo_menu1" class="sidebar-menu">
					  <li style="margin-left: 0px;"><a
						href="<%=ip%>xingxhrz/user/home.action?type=<%=request.getSession().getAttribute("type")%>&gs=<%=request.getSession().getAttribute("gs")%>">换热站管理</a></li>
						<li style="margin-left: 0px;"><a
						href="<%=basePath%>user/home.action?fl=nhjk&type=<%=request.getSession().getAttribute("type")%>">智能入户</a></li>
						<li style="margin-left: 0px;"><a
						href="http://192.144.169.217:8091/rebiao/user/home.action?type=<%=request.getSession().getAttribute("type")%>&gs=<%=request.getSession().getAttribute("gs")%>">热表集抄</a></li>
					<li style="margin-left: 0px;"><a
						href="<%=ip%>kfgl/user/home.action?type=<%=request.getSession().getAttribute("type")%>&gs=<%=request.getSession().getAttribute("gs")%>">客服管理</a></li>
					<li style="margin-left: 0px;"><a
						href="<%=ip%>jfgl/user/home.action?type=<%=request.getSession().getAttribute("type")%>&gs=<%=request.getSession().getAttribute("gs")%>">缴费管理</a></li>
						<li style="margin-left: 0px;"><a
						href="<%=basePath%>user/home.action?fl=nhfx">能耗分析</a></li>
						<li style="margin-left: 0px;"><a
						href="<%=basePath%>user/home.action?fl=czrz">操作日志</a></li>
						<li style="margin-left: 0px;"><a
						href="<%=basePath%>user/home.action?fl=bjgl">报警管理</a></li>
						<li style="margin-left: 0px;"><a
						href="<%=basePath%>user/home.action?fl=xtsz">系统设置</a></li>
				
				</ul>
		</div>
		
		<script>
		var user="<%=request.getSession().getAttribute("UserName")%>"
		var type1="<%=request.getSession().getAttribute("type")%>"
		var str;
		
		if (type1=="qyyh"){
			
			str="企业用户"
		}else{
			str="集团用户"
		}
		$("#user").html(user+"&nbsp;&nbsp;"+str);
		
			$(function(){
				$("#bannerleftopen").click(function(){
					$(this).hide();
					$("#leftcontent").show();
				})
				$("#bannerleftclose").click(function(){
					$("#leftcontent").hide();
					$("#bannerleftopen").show()
				})
				
				$("#bannerrightopenup").click(function(){
					$(this).hide();
					$("#rightupcontent").show();
				})
				$("#bannerrightcloseup").click(function(){
					$("#rightupcontent").hide();
					$("#bannerrightopenup").show()
				})
				
				$("#bannerrightopendown").click(function(){
					$(this).hide();
					$("#rightdowncontent").show();
				})
				$("#bannerrightclosedown").click(function(){
					$("#rightdowncontent").hide();
					$("#bannerrightopendown").show()
				})
				
				
				
			 	 $("#icon").mouseenter(function() {
					$("#demo_menu1").show();
				}).mouseleave(function() {
					/* $("#demo_menu1").hide(); */
				});
			
				$("#demo_menu1").mouseover(function() {
					$(this).show();
				}).mouseleave(function() {
					$(this).hide();
				});
			})
		</script>
	</body>
</html>