function getRootPath(){      
	var curWwwPath=window.document.location.href;      
    var pathName=window.document.location.pathname;      
    var pos=curWwwPath.indexOf(pathName); 
    var localhostPaht=curWwwPath.substring(0,pos);      
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);      
    return(localhostPaht+projectName);  
} 

$(function () {


	
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
	        xAxis: {  // x 轴分类
		       
	        },
	        yAxis: {
	            title: {
	                text: null
	                // y 轴标题
	            }
	        }
	    };
	var kdzb=[];
	$.ajax({
		url : getRootPath()+"/yhInfo/findXqKdLs.action", 
		async : false,
		dataType : "json",
		data : {
			"xqm":$("#xq").val(),
			"startTime":$("#startTime2").val(),
			"endTime":$("#endTime2").val(),
		},
		success : function(data) {
			
			kdzb=data.list;
		}
	});
	 var kd = [];
	 var time = [];
	 
	 for (var i = 0 ; i < kdzb.length ; i ++) {
			var arr = [];
			/*arr1[0] = json[i].id;*/
			kd.push(parseFloat(kdzb[i].KdYb.replace("%","")));
			
			time.push(kdzb[i].time);
			
		};
		


	var xqdata = {name:$("#xq").val(),kd:kd};
//	 allwd(options,xqdata,'mws-dashboard-chart-1')
	onewd(options,xqdata,'mws-dashboard-chart-1',time)
//	 阀门开度与室外温度曲线
		
var wdzb=[];
	$.ajax({
		url : getRootPath()+"/yhInfo/findHisAvg.action", 
		async : false,
		dataType : "json",
		data : {
			"xqm":$("#xq").val(),
			"startTime":$("#startTime2").val(),
			"endTime":$("#endTime2").val(),
		},
		success : function(data) {
			
			wdzb=data.list;
		}
	});
	 var wd = [];
	 var sw = [];
	 var wdtime = [];
	 var data=[];
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
		onesw(options,wddata,'mws-dashboard-chart-2',wdtime)
		
		 
		 $("#wd_search").click(function(){
			 if($("#xq").val()==""){
				 var xqavgList=[];
				 var xqkdList=[];
				 $.ajax({
						url : getRootPath()+"/yhInfo/findAllAvg.action", 
						async : false,
						dataType : "json",
						data : {
							
							"startTime":$("#startTime2").val(),
							"endTime":$("#endTime2").val(),
						},
						success : function(data) {
							
							xqavgList=data.xqavgList;
						}
					});
				 
				 var series=[];
				 var wdtime = [];
				 var tqyb = [];
				 for( var j = 0 ; j < xqavgList[0].length ; j ++){
		        	 
		        	 tqyb.push(xqavgList[0][j].Tqyb);
		         }
				 for (var i = 0 ; i < xqavgList.length ; i ++) {
					 if(xqavgList[i].length==0){
						 continue;
					 }
					 var avg=[]
					 for( var j = 0 ; j < xqavgList[i].length ; j ++){
			        	 avg.push(parseFloat(xqavgList[i][j].Avg))
			        	 wdtime.push(xqavgList[i][j].time);
			        	 
			         }
					 var xq;
					 
					 if(xqavgList[i].length==0){
						 xq=""
					 }else{
						 xq=xqavgList[i][0].XqName;
					 }
					 series.push({
						 marker: {

				             enabled: false,
				         },
							 name:xq+"室内温度",
							 data:avg,
							 tooltip: {
				                  valueSuffix: '°C'
				              }
				         
				         
					 });
					};
					series.push({
						 marker: {

				             enabled: false,
				         },
							 name:"室外温度",
							 data:tqyb,
							 tooltip: {
				                  valueSuffix: '°C'
				              }
				         
				         
					 });
					allsw(options,'mws-dashboard-chart-2',wdtime,series)
					 $.ajax({
							url : getRootPath()+"/yhInfo/findAllKdLs.action", 
							async : false,
							dataType : "json",
							data : {
								
								"startTime":$("#startTime2").val(),
								"endTime":$("#endTime2").val(),
							},
							success : function(data) {
								
								xqkdList=data.xqkdList;
							}
						});
					 
					 var kdseries=[];
					 var kdtime = [];
					 
					 
					 for (var i = 0 ; i < xqkdList.length ; i ++) {
						 if(xqkdList[i].length==0){
							 continue;
						 }
						 var kd = [];
						 for( var j = 0 ; j < xqkdList[i].length ; j ++){
							 kd.push(parseFloat(xqkdList[i][j].KdYb.replace("%","")))
				        	 kdtime.push(xqkdList[i][j].time);
				        	 
				         }
						 var kdxq;
						 
							 kdxq=xqkdList[i][0].XqName;
						 
						 kdseries.push({
							 marker: {

					             enabled: false,
					         },
								 name:kdxq+"开度100%占比",
								 data:kd,
								 tooltip: {
					                  valueSuffix: '%'
					              }
					         
					         
						 });
						};
					allwd(options,"mws-dashboard-chart-1",kdtime,kdseries)
			 }else{
				 $.ajax({
						url : getRootPath()+"/yhInfo/findHisAvg.action", 
						async : false,
						dataType : "json",
						data : {
							"xqm":$("#xq").val(),
							"startTime":$("#startTime2").val(),
							"endTime":$("#endTime2").val(),
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
							
							
							wd1.push(parseFloat(wdzb[i].Tqyb));
							sw1.push(parseFloat(wdzb[i].Avg));
							wdtime1.push(wdzb[i].time);
							
						};
						var wddata = [
							{name:$("#xq").val().replace("（智慧供热区域）",""),sw:sw1},
							{name:"室外温度",wd:wd1}
						];
						onesw(options,wddata,'mws-dashboard-chart-2',wdtime1)
						$.ajax({
			url : getRootPath()+"/yhInfo/findXqKdLs.action", 
			async : false,
			dataType : "json",
			data : {
				"xqm":$("#xq").val(),
				"startTime":$("#startTime2").val(),
				"endTime":$("#endTime2").val(),
			},
			success : function(data) {
				
				kdzb=data.list;
			}
		});
		 var kd1 = [];
		 var time1 = [];
		 
		 for (var i = 0 ; i < kdzb.length ; i ++) {
				var arr = [];
				/*arr1[0] = json[i].id;*/
				kd1.push(parseFloat(kdzb[i].KdYb.replace("%","")));
				
				time1.push(kdzb[i].time);
				
			};
			var xqname=$("#xq").val().replace("（智慧供热区域）","");
			var data={name:xqname,kd:kd1};
			onewd(options,data,'mws-dashboard-chart-1',time1)
			 }
			
			 
					
					
			
		 });

		var sdwd=[]
		var valad=[]
		 $.ajax({
				url : getRootPath()+"/yhInfo/findYh.action", 
				async : false,
				dataType : "json",
				data : {
					"xqm":$("#xq").val(),
					
				},
				success : function(data) {
					
					var list=data.list;
					for(var i=0;i<list.length;i++){
						var arr=[ parseInt(list[i].ValAd),list[i].RoomTemp];
						sdwd.push(arr);
						valad.push(list[i].ValAd);
					}
				}
			});
		
		var swsdt = {name:$("#xq").val(),wd:sdwd};
	
		
		
		
		
		
		oneswsdt("containers_swsdt",swsdt,valad);
		
		
//		饼状图
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

		tgrbar(optbar,"","","","pie-1",0);
		
		
		//室温饼图

		
		twdbar(optbar,"","","","pie-2",0);
		
		
		//阀门开度饼图

		
		tfmbar(optbar,"","","","pie-3",0);
		$("#xq").change(function(){
			var xq = $('#xq').val();
			
					tgrbar(optbar,xq,"","","pie-1",0);
					twdbar(optbar,xq,"","","pie-2",0);
					tfmbar(optbar,xq,"","","pie-3",0);
					//散点图
					if(xq!=""/*1==1*/){
					var ser_sdwd=[];
					var ser_valad=[];
					$.ajax({
						url : getRootPath()+"/yhInfo/findYh.action", 
						async : false,
						dataType : "json",
						data : {
							"xqm":$("#xq").val(),
							
						},
						success : function(data) {
							
							var list=data.list;
							for(var i=0;i<list.length;i++){
								var arr=[parseInt(list[i].ValAd),list[i].RoomTemp];
								ser_sdwd.push(arr);
								ser_valad.push(list[i].ValAd);
							}
						}
					});
					
					var ser_swsdt = {name:$("#xq").val(),wd:ser_sdwd};
					oneswsdt("containers_swsdt",ser_swsdt,ser_valad);
					}
		});				
 });

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





function onewd(options,xqdata,con,time){
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
	options.series = [];
	
			 options.series.push({
				 name:xqdata.name+"小区开度100占比",
				 data:xqdata.kd,
				 tooltip : {
						valueSuffix : '%'
					}	,marker: {

			             enabled: false,
			         },		 
			 })
			

	
	// 图表初始化函数
	var chart = Highcharts.chart(con, options);
}

function allwd(options,con,time,series){
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
	options.series = series;
	
			
			

	
	// 图表初始化函数
	var chart = Highcharts.chart(con, options);
}

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
			 name:"室内温度",
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
function allsw(options,con,time,series){

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
	
	options.series = series;

	
	// 图表初始化函数
	var chart = Highcharts.chart(con, options);
}

function getdz(valad){
	var dz;
	$.ajax({
		url : getRootPath()+"/yhInfo/getDz.action", 
		async : false,
		dataType : "json",
		data : {
			"ValAd":valad,
		},
		success : function(data) {
		 dz=data.map;
		
		}
	});
	return "小区:"+dz.XqName+ "楼栋号:"+dz.BuildNo+"   单元号:"+dz.CellNo+"   户号:"+dz.HouseNo;
}
//室温散点图--一个小区
function oneswsdt(containers,swsdt,valad){
	var optsd = {
			chart: {
				type: 'scatter',
				zoomType: 'xy'
			},
			title: {
				text: '室内平均温度散点图'
			},
			subtitle: {
				text: ''
			},
			xAxis: {
				
				 labels: {
		                enabled: false
		            } 
				
			},
			
			yAxis: {
				title: {
					text: '温度'
				},
				plotLines:[{
			        color:'red',           //线的颜色，定义为红色
			        dashStyle:'shortdot',     //默认值，这里定义为实线
			        value:20,               //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
			        width:2                //标示线的宽度，2px
			    }]
			},
			legend: {
				layout: 'vertical',
				align: 'left',
				verticalAlign: 'top',
				x: 100,
				y: 70,
				floating: true,
				backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF',
				borderWidth: 1
			},
			plotOptions: {
				scatter: {
					marker: {
						radius: 3,
						states: {
							hover: {
								enabled: true,
								lineColor: 'rgb(100,100,100)'
							}
						}
					},
					states: {
						hover: {
							marker: {
								enabled: false
							}
						}
					},
					tooltip: {
						headerFormat: '<b>{series.name}</b><br>',
						pointFormatter: 
							function() {
						    return '<tr><td style="color: {series.color}">'+ getdz(this.x)  +' </td></tr>' +
					        '<tr><td style="text-align: right"><b>'+ this.y +'℃</b></td></tr>'
						},
					}
				}
			}
			
		}; 
	optsd.subtitle.text = "室内温度",
	
		optsd.series = [ {
			name :  "室内温度",
			data : swsdt.wd
		} ];
	
	var chart = Highcharts.chart(containers, optsd);
}

function fDateTime(num){
		var curDate = new Date();
		var nowTimeDay = new Date(curDate - 24*60*60*1000*num).getDate();
		var nowTimeMonth = new Date(curDate - 24*60*60*1000*num).getMonth()+1;
		var nowTime = nowTimeMonth + "-" + nowTimeDay;
	return nowTime;
}

