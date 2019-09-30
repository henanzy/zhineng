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
	
	var xq = $('#xq').val();
	var ld = $('#ldh').val();
	var dy = $('#dyh').val();
	tgrbar(optbar,xq,ld,dy,"pie-1",0);
	
	
	//室温饼图

	
	twdbar(optbar,xq,ld,dy,"pie-2",0);
	
	
	//阀门开度饼图

	
	tfmbar(optbar,xq,ld,dy,"pie-3",0);
	
	

	 var options = {
       chart: {
           type: 'line'// 指定图表的类型，默认是折线图（line）
       },
       title:{
       	text:null
       },
       tooltip: {
			crosshairs: [{
				width: 1,
				color:'#aaaaaa'
			}],
			shared: true
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
   				enabled: false          
   			}
   			// 关闭鼠标跟踪，对应的提示框、点击事件会失效
   			//enableMouseTracking: false
   		}
   	}
   };
	
//		平均温度曲线
		
		var wdzb=[];
		$.ajax({
			url : getRootPath()+"/yhInfo/findHisAvg.action", 
			async : false,
			dataType : "json",
			data : {
				"xqm":$("#xq").val(),
				"startTime":$("#startTime1").val(),
				"endTime":$("#endTime1").val(),
			},
			success : function(data) {
				
				wdzb=data.list;
			}
		});
		 var wd = [];
		 var sw = [];
		 var wdtime = [];
		
		 for (var i = 0 ; i < wdzb.length ; i ++) {
				
				/*arr1[0] = json[i].id;*/
				wd.push(parseFloat(wdzb[i].Tqyb));
				sw.push(parseFloat(wdzb[i].Avg));
				wdtime.push(wdzb[i].time);
				
			};
			var wddata = [
				{name:$("#xq").val().replace("（智慧供热区域）",""),sw:sw},
				{name:"室外温度",wd:wd}
			];
			onesw(options,wddata,'pjwdline',wdtime)
		
		
		 $("#wd_search").click(function(){
			 $.ajax({
					url : getRootPath()+"/yhInfo/findHisAvg.action", 
					async : false,
					dataType : "json",
					data : {
						"xqm":$("#xq").val(),
						"startTime":$("#startTime1").val(),
						"endTime":$("#endTime1").val(),
					},
					success : function(data) {
						
						wdzb=data.list;
					}
				});
				 var wd1 = [];
				 var sw1 = [];
				 var wdtime1 = [];
				 var data=[];
				 for (var i = 0 ; i < wdzb.length ; i ++) {
						
						/*arr1[0] = json[i].id;*/
						wd1.push(parseFloat(wdzb[i].Tqyb));
						sw1.push(parseFloat(wdzb[i].Avg));
						wdtime1.push(wdzb[i].time);
						
					};
					var wddata = [
						{name:$("#xq").val().replace("（智慧供热区域）",""),sw:sw1},
						{name:"室外温度",wd:wd1}
					];
					onesw(options,wddata,'pjwdline',wdtime1)
		 });
			// 工单搜索
			$("#search_btn").click(function(){
				var xq = $('#xq').val();
				var ld = $('#ldh').val();
				var dy = $('#dyh').val();
			
				
				
						tgrbar(optbar,xq,ld,dy,"pie-1",0);
				
				
						twdbar(optbar,xq,ld,dy,"pie-2",0);
				

						tfmbar(optbar,xq,ld,dy,"pie-3",0);
				
						 $.ajax({
								url : getRootPath()+"/yhInfo/findHisAvg.action", 
								async : false,
								dataType : "json",
								data : {
									"xqm":$("#xq").val(),
									"startTime":$("#startTime1").val(),
									"endTime":$("#endTime1").val(),
								},
								success : function(data) {
									
									wdzb=data.list;
								}
							});
							 var wd1 = [];
							 var sw1 = [];
							 var wdtime1 = [];
							 var data=[];
							 for (var i = 0 ; i < wdzb.length ; i ++) {
									
									/*arr1[0] = json[i].id;*/
									wd1.push(parseFloat(wdzb[i].Tqyb));
									sw1.push(parseFloat(wdzb[i].Avg));
									wdtime1.push(wdzb[i].time);
									
								};
								var wddata = [
									{name:$("#xq").val().replace("（智慧供热区域）",""),sw:sw1},
									{name:"室外温度",wd:wd1}
								];
								onesw(options,wddata,'pjwdline',wdtime1)
				
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

function onesw(options,wddata,con,time){

	options.xAxis = {
			title: {
				text: '时间'
			},
			categories: time,
			tickInterval: 10,
			labels: {
			    formatter:function(){
			     return this.value.substring(0,10);
			    }
			  }
		};
	
	options.series = [
		
		 { marker: {

             enabled: false,
         },
			 name:wddata[0].name+"室内温度",
			 data:wddata[0].sw,
			 tooltip: {
                  valueSuffix: '°C'
              }
		 },{marker: {

             enabled: false,
         },
			 name:"室外温度",
			 data:wddata[1].wd,
			 tooltip: {
                  valueSuffix: '°C'
              }
		 }
	 ];
	// 图表初始化函数
	var chart = Highcharts.chart(con, options);
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
