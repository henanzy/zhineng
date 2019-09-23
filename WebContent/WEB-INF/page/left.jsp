<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<script type="text/javascript" src="../plugins/flot/jquery.flot.min.js"></script>
<script type="text/javascript"
	src="../plugins/flot/jquery.flot.pie.min.js"></script>
<script type="text/javascript"
	src="../plugins/flot/jquery.flot.stack.min.js"></script>
<script type="text/javascript"
	src="../plugins/flot/jquery.flot.resize.min.js"></script>
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




<script type="text/javascript">

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
function jcgl(){// 
	window.open("<%=basePath%>user/jcgl.action","Conframe");
}
		</script>

<style>
ul.ac_kf li a {
	border-radius: 6px;
	cursor: pointer;
}

ul.ac_kf li a:hover {
	background-color: rgba(197, 213, 43, 0.1);
}
</style>
<body>
	<div id="mws-wrapper">
		<!--  必要的标记，不要删除 -->
		<div id="mws-sidebar-stitch"></div>
		<div id="mws-sidebar-bg"></div>
		<!-- 左边侧栏包装器 -->
		<div id="mws-navigation">
			<ul>

				<li class="active"><a href="#" class="mws-i-24 i-cassette">智能锁闭阀</a>
					<ul class="ac_kf">
						<c:if test="${fl=='nhjk'}">
							<li><a class="first-a taglist" onclick="yhgl()"
								target="Conframel">&nbsp;&nbsp;&nbsp;&nbsp;运行管理 </a></li>
							<li><a class="taglist" onclick="form_elements()"
								target="Conframel">&nbsp;&nbsp;&nbsp;&nbsp;问题协助</a></li>
							<li><a class="taglist" onclick="yunxzk()" target="Conframel">&nbsp;&nbsp;&nbsp;&nbsp;运行状况</a></li>
							<li><a class="taglist" onclick="tongjfx()"
								target="Conframel">&nbsp;&nbsp;&nbsp;&nbsp;统计分析</a></li>

							<!-- <li><a onclick="caidsz()" target="Conframel">&nbsp;&nbsp;&nbsp;&nbsp;菜单设置</a></li>
						<li><a onclick="xitsz()" target="Conframel">&nbsp;&nbsp;&nbsp;&nbsp;参数设置</a></li> -->


						</c:if>
						<c:if test="${fl=='nhfx'}">
							<ul>
								<li><a class="taglist" onclick="yunxzk()"
									target="Conframel">&nbsp;&nbsp;&nbsp;&nbsp;运行状况</a></li>
								<li><a class="taglist" onclick="tongjfx()"
									target="Conframel">&nbsp;&nbsp;&nbsp;&nbsp;统计分析</a></li>
							</ul>
						</c:if>
						<c:if test="${fl=='czrz'}">
							<li class="active"><a href="#"><nobr
										style="font-size: 20px;">+</nobr>&nbsp;日志管理</a>
								<ul>
									<li><a class="taglist" onclick="caozrz()"
										target="Conframel">&nbsp;&nbsp;&nbsp;>&nbsp;操作日志</a>
								</ul></li>
						</c:if>
						<c:if test="${fl=='bjgl'}">
							<li class="active"><a href="#"><nobr
										style="font-size: 20px;">+</nobr>&nbsp;故障管理</a>
								<ul>
									<li><a class="taglist" onclick="guzxx()"
										target="Conframel">&nbsp;&nbsp;&nbsp;>&nbsp;故障信息</a></li>
								</ul>
						</c:if>

						<c:if test="${fl=='xtsz'}">
							<li class="active"><a href="#"><nobr
										style="font-size: 20px;">+</nobr>&nbsp;系统设置</a>
								<ul>
									<li><a class="taglist" onclick="caidsz()"
										target="Conframel">&nbsp;&nbsp;&nbsp;&nbsp;菜单设置</a></li>
									<li><a class="taglist" onclick="xitsz()"
										target="Conframel">&nbsp;&nbsp;&nbsp;&nbsp;参数设置</a></li>
								</ul>
						</c:if>
					</ul></li>
				<c:if test="${fl=='nhjk'}">
					<li class="active"><a href="#"
						class="mws-i-24 i-address-book-2">数据报表</a>
						<ul class="ac_kf">

							<li><a class="taglist" onclick="yunxsj()" target="Conframel">&nbsp;&nbsp;&nbsp;&nbsp;运行数据</a></li>
							<li><a class="taglist" onclick="caozrz()" target="Conframel">&nbsp;&nbsp;&nbsp;&nbsp;操作日志</a></li>
							<li><a class="taglist" onclick="guzxx()" target="Conframel">&nbsp;&nbsp;&nbsp;&nbsp;故障信息</a></li>
							<li><a class="taglist" onclick="shuakjl()" target="Conframel">&nbsp;&nbsp;&nbsp;&nbsp;刷卡记录</a></li>
							<li><a class="taglist" onclick="jcgl()" target="Conframel">&nbsp;&nbsp;&nbsp;&nbsp;效果平面图</a></li>

						</ul></li>
				</c:if>

				<c:if test="${fl=='nhjk'}">
					<li class="active"><a href="#"
						class="mws-i-24 i-address-book-2">设备信息</a>
						<ul class="ac_kf">
						    <li><a class="taglist" onclick="shebgl()" target="Conframel">&nbsp;&nbsp;&nbsp;&nbsp;设备管理</a></li>
							<li><a class="taglist" onclick="jizqxx()" target="Conframel">&nbsp;&nbsp;&nbsp;&nbsp;集中器信息</a></li>
							
							<li><a class="taglist" onclick="qugxx()" target="Conframel">&nbsp;&nbsp;&nbsp;&nbsp;区管信息</a></li>
							 <li><a class="taglist" onclick="cgqdz()" target="Conframel">&nbsp;&nbsp;&nbsp;&nbsp;传感器地址</a></li> 
							<li><a class="taglist" onclick="rebxx()" target="Conframel">&nbsp;&nbsp;&nbsp;&nbsp;热表信息</a></li>

						</ul></li>
				</c:if>
				<c:if test="${fl=='nhjk'}">
					<li class="active"><a href="#"
						class="mws-i-24 i-address-book-2">用户信息</a>
						<ul class="ac_kf">

							<li><a class="taglist" onclick="xiaoqxx()" target="Conframel">&nbsp;&nbsp;&nbsp;&nbsp;小区信息</a></li>
							<li><a class="taglist" onclick="yezxx()" target="Conframel">&nbsp;&nbsp;&nbsp;&nbsp;业主信息</a></li>
							<li><a class="taglist" onclick="beizlb()" target="Conframel">&nbsp;&nbsp;&nbsp;&nbsp;备注类别</a></li>
                            
						</ul></li>
				</c:if>
				<li class="active"><a href="#"
					class="mws-i-24 i-address-book-2">知识库</a>
					<ul class="ac_kf">
						<li><a class="taglist" onclick="qiytl()" target="Conframel">&nbsp;&nbsp;&nbsp;&nbsp;企业条例</a></li>
						<li><a class="taglist" onclick="guojfg()" target="Conframel">&nbsp;&nbsp;&nbsp;&nbsp;国家法规</a></li>
						<li><a class="taglist" onclick="hangyzs()" target="Conframel">&nbsp;&nbsp;&nbsp;&nbsp;行业知识</a></li>
						<li><a class="taglist" onclick="xitsm()" target="Conframel">&nbsp;&nbsp;&nbsp;&nbsp;系统说明</a></li>
						<li><a class="taglist" onclick="wentjd()" target="Conframel">&nbsp;&nbsp;&nbsp;&nbsp;问题解答</a></li>

					</ul></li>



			</ul>

		</div>
	</div>

	<script type="text/javascript">
		$(".ac_kf li a").click(function(){
			$(".ac_kf li a").css("cssText","color:#fff !important;");
			$(this).css("cssText","color:#C5D52B !important;");
		});
	
	
</script>

</body>
</html>