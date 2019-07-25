function getRootPath(){      
	var curWwwPath=window.document.location.href;      
    var pathName=window.document.location.pathname;      
    var pos=curWwwPath.indexOf(pathName); 
    var localhostPaht=curWwwPath.substring(0,pos);      
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);      
    return(localhostPaht+projectName);  
} 

$(document).ready(function(){
//  表格

	var xinwordList =  [
		
	];
	
	

	//表格写入函数
	
	

	
	//分页样式
	$("nav li").click(function(){
		$("nav li").css("color","");
		$(this).css("color","#C5D52B");
		
	});
	

	

	

//	饼状图
	var optbar = {
			chart: {
					plotBackgroundColor: null,
					plotBorderWidth: null,
					plotShadow: false,
					type: 'pie'
			},
			title: {
					text: null
			},
			subtitle:{
				
			},
			tooltip: {
					pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
			},
			credits: { enabled: false },
			plotOptions: {
					pie: {
							allowPointSelect: true,
							cursor: 'pointer',
							dataLabels: {
									enabled: false
							},
							showInLegend: true
					}
			}
			
	};
	
	//供热饼图
	
	
	tgrbar(optbar,"","","","pie-1",0);
	
	
	//室温饼图

	
	twdbar(optbar,"","","","pie-2",0);
	
	
	//阀门开度饼图

	
	tfmbar(optbar,"","","","pie-3",0);
	
	

	 var options = {
       chart: {
           type: 'line'// 指定图表的类型，默认是折线图（line）
       },
       title:{
       	text:null
       },
       subtitle: {            // 标题
       },
       xAxis: {  // x 轴分类
	        title:{
	        		
	        	}
       },
       yAxis: {
           title: {
               text: null
               // y 轴标题
           }
       },
       credits: { enabled: false },
       plotOptions: {
   		line: {
   			dataLabels: {
   				// 开启数据标签
   				enabled: true          
   			}
   			// 关闭鼠标跟踪，对应的提示框、点击事件会失效
   			//enableMouseTracking: false
   		}
   	}
   };
	
//		平均温度曲线
		var homedata = [
			{name:"砥柱大厦",wd:[24,22,23,24,24,21,22,21,23,23,23,22]},
			{name:"金领时代",wd:[20.0, 21, 19, 20, 22, 18, 21, 19, 18,20,21, 19]},
			{name:"室外温度",wd:[6,10,6,8,11,12,12,15,15,13,11,12]}
		
			];
	
		 onesnwwd(options,homedata,"pjwdline",0);
		
		 
			// 工单搜索
			$("#search_btn").click(function(){
				var xq = $('#xq').val();
				var ld = $('#ldh').val();
				var dy = $('#dyh').val();
			
				
				
						tgrbar(optbar,xq,ld,dy,"pie-1",m);
				
				
						twdbar(optbar,xq,ld,dy,"pie-2",m);
				

						tfmbar(optbar,xq,ld,dy,"pie-3",m);
				
				for(var m = 0; m < homedata.length; m++){
					if(homedata[m].name == xq){
						 onesnwwd(options,homedata,"pjwdline",m);
					}
				}
				
			});
			
		 var xqList=[];
		 var dataList=[];
			 $.ajax({
					url : getRootPath()+"/yhInfo/findXq.action", 
					async : false,
					dataType : "json",
					data : {
						
					},
					success : function(data) {
						
						var opt="";
						
						for(var i=0; i<data.Xq.length; i++){
							xqList.push(data.Xq[i].XqName)
						}
						
						 for(var i=0; i<xqList.length; i++){
							 $.ajax({
									url : getRootPath()+"/xxgl/grbzt.action", 
									async : false,
									dataType : "json",
									data : {
										"xqm":xqList[i],
									},
									success : function(data) {
								    var map= data.grbzt;
									var arr =[];
									arr[0]=xqList[i];
									arr[1]=map.grmj;
									arr[2]=map.wgrmj;
									dataList.push(arr);
									}
								});
							}
					}

				});
			 var gryh=[];
			 var wgryh=[];
			 for(var i=0; i<dataList.length; i++){
				 var js=dataList[i][1];
				 var js1=dataList[i][2];
				 gryh.push(js);
				 wgryh.push(js1);
			 }
			 
		 
//柱状图
			
		 var chart = Highcharts.chart('container',{
		 	chart: {
		 		type: 'column'
		 	},
		 	title: {
		 		text: '缴费和未交费柱状图'
		 	},
		 	subtitle: {
		 		text: ''
		 	},
		 	xAxis: {

		 		categories: xqList,
		 		crosshair: true
		 	},
		 	yAxis: {
		 		min: 0,
		 		title: {
		 			text: '人数'
		 		}
		 	},
		 	tooltip: {
		 		// head + 每个 point + footer 拼接成完整的 table
		 		headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
		 		pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
		 		'<td style="padding:0"><b>{point.y:.1f} 人</b></td></tr>',
		 		footerFormat: '</table>',
		 		shared: true,
		 		useHTML: true
		 	},
//		 	plotOptions: {
//		 		column: {
//		 			borderWidth: 0
//		 		}
//		 	},
		 	plotOptions: {
				column: {
					// 关于柱状图数据标签的详细配置参考：https://api.hcharts.cn/highcharts#plotOptions.column.dataLabels
					dataLabels: {
						enabled: true,
						// verticalAlign: 'top', // 竖直对齐方式，默认是 center
						inside: true
					}
				}
			},

		 	series:  [{
		 		name: '供热用户',
		 		data: gryh
		 	}, {
		 		name: '未供热用户',
		 		data: wgryh
		 	}]
		 });
		 
	
});



//平均温度曲线图
function onesnwwd(options,homedata,container,m) {
	
	options.xAxis.categories = [ fDateTime(12), fDateTime(11),fDateTime(10), fDateTime(9), fDateTime(8), fDateTime(7),
			fDateTime(6), fDateTime(5), fDateTime(4), fDateTime(3),fDateTime(2), fDateTime(1), fDateTime(0) ];
	options.xAxis.title.text = "day";
	options.series = [];
	for(var i = 0;i < homedata.length;i++){
		if( homedata[i].name == homedata[m].name){
			 options.subtitle.text = homedata[i].name + "小区信息";
			 options.series.push({
				 name:homedata[i].name+"平均温度",
				 data:homedata[i].wd,
				 tooltip : {
						valueSuffix : '°C'
					}
			 })
		}else if( homedata[i].name == "室外温度"){
			options.series.push({
				 name:"室外温度",
				 data:homedata[i].wd,
				 tooltip : {
						valueSuffix : '°C'
					}
			 })
		}
	}
	
		var chart = Highcharts.chart(container, options);
}     



function tfmbar(optbar,xq,ld,dy,pie,m){
	var map;
	$.ajax({
		url : getRootPath()+"/xxgl/kdbzt.action", 
		async : false,
		dataType : "json",
		data : {
			"xqm":xq,
			"ldh":ld,
			"dyh":dy,
			
			
		},
		success : function(data) {
		 map=data.grbzt;
		
		}
	});
				 optbar.subtitle.text = xq + "阀门开度饼状图";
					optbar.series = [{
						name: 'Brands',
						colorByPoint: true,
						data: [{
								name: '开度0%',
								y: map.dy0 ,
								/*sliced: true,
								selected: true*/
						}, {
								name: '开度0%-15%（含）',
								y:   map.d0x15
						}, {
							name: '开度100%',
							y:   map.dy100
					    }
						]
					}];
					var chart = Highcharts.chart(pie, optbar);
		
	
}
//室内温度饼图
function twdbar(optbar,xq,ld,dy,pie,m){
	var map;
	$.ajax({
		url : getRootPath()+"/xxgl/wdbzt.action", 
		async : false,
		dataType : "json",
		data : {
			"xqm":xq,
			"ldh":ld,
			"dyh":dy,
			
			
		},
		success : function(data) {
		 map=data.grbzt;
		
		}
	});
				 optbar.subtitle.text = xq + "室内温度饼状图";
					optbar.series = [{
						name: 'Brands',
						colorByPoint: true,
						data: [{
								name: '温度小于15℃（含）',
								y: map.xy15 ,
								/*sliced: true,
								selected: true*/
						}, {
								name: '温度15℃-18℃（含）',
								y:   map.d15x18
						}, {
							name: '温度18℃-22℃（含）',
							y:   map.d18x22
					    }
						, {
							name: '温度大于22℃',
							y:   map.dy22,
							
					    }
						]
					}];
					var chart = Highcharts.chart(pie, optbar);
		
	
}


//供热面积饼图
function tgrbar(optbar,xq,ld,dy,pie,m){
	var map;
	$.ajax({
		url : getRootPath()+"/xxgl/grbzt.action", 
		async : false,
		dataType : "json",
		data : {
			"xqm":xq,
			"ldh":ld,
			"dyh":dy,
			
			
		},
		success : function(data) {
		 map=data.grbzt;
		
		}
	});
				 optbar.subtitle.text = xq + "供热面积图";
					optbar.series = [{
						name: 'Brands',
						colorByPoint: true,
						data: [{
								name: '供热面积',
								y: map.grmj ,
								/*sliced: true,
								selected: true*/
						}, {
								name: '未供热面积',
								y:   map.wgrmj
						}]
					}];
					var chart = Highcharts.chart(pie, optbar);
		
	
}


//表格写入函数


function fDateTime(num){
	var curDate = new Date();
	var nowTimeDay = new Date(curDate - 24*60*60*1000*num).getDate();
	var nowTimeMonth = new Date(curDate - 24*60*60*1000*num).getMonth()+1;
	var nowTime = nowTimeMonth + "-" + nowTimeDay;
return nowTime;
}








function compareWord(xq,ld,dy,wordList,j,compareWordList){

	if(xq==""){
		compareWordList.push(wordList[j]);
	}
	if(xq != "" && ld == ""){
			if(wordList[j][1] == xq){
				compareWordList.push(wordList[j]);
			}
	}
	if(xq != "" && ld != "" && dy == "" ){
			if(wordList[j][1] == xq && wordList[j][2] == ld){
			
				compareWordList.push(wordList[j]);
			}
	}
	if(xq != "" && ld != "" && dy != ""){
		if(wordList[j][1] == xq && wordList[j][2] == ld && wordList[j][3] == dy){
			
			compareWordList.push(wordList[j]);
		}
	}

	
	
}	
