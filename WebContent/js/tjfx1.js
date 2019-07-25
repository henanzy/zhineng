$(document).ready(function(){
//  表格

	var xinwordList =  [
		["郭风林","砥柱大厦",1,1,401,'关',0,27.4,31,27,'否','2019-06-13 16:12:41',8004552,160900003,160900003,'是',72.72,"C8FDB6FE"],
		["张云湘","砥柱大厦",1,1,402,'关',0,27.4,31,27,'否','2019-06-13 16:12:41',8004552,160900003,160900003,'是',72.72,"C8FDB6FE"],
		["刘妍","砥柱大厦",2,1,101,'关',0,27.4,31,27,'否','2019-06-13 16:12:41',8004552,160900003,160900003,'是',72.72,"C8FDB6FE"],
		["张朝辉","砥柱大厦",2,1,403,'关',0,27.4,31,27,'否','2019-06-13 16:12:41',8004552,160900003,160900003,'是',72.72,"C8FDB6FE"],
		["席百兴","砥柱大厦",1,1,105,'关',0,27.4,31,27,'否','2019-06-13 16:12:41',8004552,160900003,160900003,'是',72.72,"C8FDB6FE"],
		["何伟","砥柱大厦",2,2,106,'关',0,27.4,31,27,'否','2019-06-13 16:12:41',8004552,160900003,160900003,'是',72.72,"C8FDB6FE"],
		["王涛","砥柱大厦",1,1,407,'关',0,27.4,31,27,'否','2019-06-13 16:12:41',8004552,160900003,160900003,'是',72.72,"C8FDB6FE"],
		["陈进芬","砥柱大厦",1,1,408,'关',0,27.4,31,27,'否','2019-06-13 16:12:41',8004552,160900003,160900003,'是',72.72,"C8FDB6FE"],
		["马明轩","砥柱大厦",1,1,409,'关',0,27.4,31,27,'否','2019-06-13 16:12:41',8004552,160900003,160900003,'是',72.72,"C8FDB6FE"],
		["赵晨语","砥柱大厦",1,1,410,'关',0,27.4,31,27,'否','2019-06-13 16:12:41',8004552,160900003,160900003,'是',72.72,"C8FDB6FE"],
		["师子贤","砥柱大厦",2,1,411,'关',0,27.4,31,27,'否','2019-06-13 16:12:41',8004552,160900003,160900003,'是',72.72,"C8FDB6FE"],
		["郭风林","砥柱大厦",2,1,401,'关',0,27.4,31,27,'否','2019-06-13 16:12:41',8004552,160900003,160900003,'是',72.72,"C8FDB6FE"],
		["张云湘","砥柱大厦",3,1,402,'关',0,27.4,31,27,'否','2019-06-13 16:12:41',8004552,160900003,160900003,'是',72.72,"C8FDB6FE"],
		["刘妍","砥柱大厦",3,1,101,'关',0,27.4,31,27,'否','2019-06-13 16:12:41',8004552,160900003,160900003,'是',72.72,"C8FDB6FE"],
		["张朝辉","砥柱大厦",1,1,403,'关',0,27.4,31,27,'否','2019-06-13 16:12:41',8004552,160900003,160900003,'是',72.72,"C8FDB6FE"],
		["席百兴","砥柱大厦",2,1,105,'关',0,27.4,31,27,'否','2019-06-13 16:12:41',8004552,160900003,160900003,'是',72.72,"C8FDB6FE"],
		["何伟","砥柱大厦",3,1,106,'关',0,27.4,31,27,'否','2019-06-13 16:12:41',8004552,160900003,160900003,'是',72.72,"C8FDB6FE"],
		["王涛","砥柱大厦",1,1,407,'关',0,27.4,31,27,'否','2019-06-13 16:12:41',8004552,160900003,160900003,'是',72.72,"C8FDB6FE"],
		["陈进芬","砥柱大厦",1,1,408,'关',0,27.4,31,27,'否','2019-06-13 16:12:41',8004552,160900003,160900003,'是',72.72,"C8FDB6FE"],
		["马明轩","砥柱大厦",1,1,409,'关',0,27.4,31,27,'否','2019-06-13 16:12:41',8004552,160900003,160900003,'是',72.72,"C8FDB6FE"],
		["赵晨语","砥柱大厦",2,1,410,'关',0,27.4,31,27,'否','2019-06-13 16:12:41',8004552,160900003,160900003,'是',72.72,"C8FDB6FE"],
		["师子贤","砥柱大厦",3,1,411,'关',0,27.4,31,27,'否','2019-06-13 16:12:41',8004552,160900003,160900003,'是',72.72,"C8FDB6FE"],
		["郭风林","金领时代",1,1,401,'关',0,27.4,31,27,'否','2019-06-13 16:12:41',8004552,160900003,160900003,'是',72.72,"C8FDB6FE"],
		["张云湘","金领时代",1,1,402,'关',0,27.4,31,27,'否','2019-06-13 16:12:41',8004552,160900003,160900003,'是',72.72,"C8FDB6FE"],
		["刘妍","金领时代",1,1,101,'关',0,27.4,31,27,'否','2019-06-13 16:12:41',8004552,160900003,160900003,'是',72.72,"C8FDB6FE"],
		["张朝辉","金领时代",1,1,403,'关',0,27.4,31,27,'否','2019-06-13 16:12:41',8004552,160900003,160900003,'是',72.72,"C8FDB6FE"],
		["席百兴","金领时代",1,1,105,'关',0,27.4,31,27,'否','2019-06-13 16:12:41',8004552,160900003,160900003,'是',72.72,"C8FDB6FE"],
		["何伟","金领时代",1,1,106,'关',0,27.4,31,27,'否','2019-06-13 16:12:41',8004552,160900003,160900003,'是',72.72,"C8FDB6FE"],
		["王涛","金领时代",1,1,407,'关',0,27.4,31,27,'否','2019-06-13 16:12:41',8004552,160900003,160900003,'是',72.72,"C8FDB6FE"],
		["陈进芬","金领时代",1,1,408,'关',0,27.4,31,27,'否','2019-06-13 16:12:41',8004552,160900003,160900003,'是',72.72,"C8FDB6FE"],
		["马明轩","金领时代",1,1,409,'关',0,27.4,31,27,'否','2019-06-13 16:12:41',8004552,160900003,160900003,'是',72.72,"C8FDB6FE"],
		["赵晨语","金领时代",1,1,410,'关',0,27.4,31,27,'否','2019-06-13 16:12:41',8004552,160900003,160900003,'是',72.72,"C8FDB6FE"],
		["师子贤","金领时代",1,1,411,'关',0,27.4,31,27,'否','2019-06-13 16:12:41',8004552,160900003,160900003,'是',72.72,"C8FDB6FE"]
	];
	
	

	//表格写入函数
	tbodydis("",xinwordList);
	

	
	//分页样式
	$("nav li").click(function(){
		$("nav li").css("color","");
		$(this).css("color","#C5D52B");
		
	});
	

	// 小区楼栋选择
	$("#xqNameId").change(function(){
		ldselect(xinwordList);
	});
	$("#buildNoId").change(function(){
		dyselect(xinwordList);
	});
	
	$("#buildNoId").click(function(){
		var xq = $('#xqNameId  option:selected').val();
		if(xq == ""){
			alert("请先选择小区名称");
		}
	});
	$("#cellNoId").click(function(){
		var xq = $('#xqNameId  option:selected').val();
		var ld = $('#buildNoId  option:selected').val();
		if(xq == ""){
			alert("请先选择小区名称");
			return;
		}
		if(ld == ""){
			alert("请先选择楼栋号");
		}
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
	var grbardata = [
		{name:"砥柱大厦",grmj:9842,wgrmj:7634},
		{name:"金领时代",grmj:13000,wgrmj:1540}
	];
	
	tgrbar(optbar,grbardata,"pie-1",0);
	
	
	//室温饼图
	var wdbardata = [
		{name:"砥柱大厦",w1:168,w2:2167,w3:13548,w4:3914},
		{name:"金领时代",w1:214,w2:2834,w3:15849,w4:4035}
	];
	
	twdbar(optbar,wdbardata,"pie-2",0);
	
	
	//阀门开度饼图
	var fmbardata = [
		{name:"砥柱大厦",kd1:3810,kd2:2840,kd3:9837},
		{name:"金领时代",kd1:3581,kd2:3018,kd3:9462}
	];
	
	tfmbar(optbar,fmbardata,"pie-3",0);
	
	

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
				var xq = $('#xqNameId').val();
				var ld = $('#buildNoId').val();
				var dy = $('#cellNoId').val();
				var compareWordList = [];
				for(var j = 0;j < xinwordList.length;j ++){
					compareWord(xq,ld,dy,xinwordList,j,compareWordList);
				};
				
				$("#xinword_body").empty(compareWordList);
				tbodydis(xinwordList,compareWordList);
				
				for(var m = 0; m < grbardata.length; m++){
					if(grbardata[m].name == xq){
						tgrbar(optbar,grbardata,"pie-1",m);
					}
				}
				for(var m = 0; m < wdbardata.length; m++){
					if(wdbardata[m].name == xq){
						twdbar(optbar,wdbardata,"pie-2",m);
					}
				}
				for(var m = 0; m < fmbardata.length; m++){
					if(fmbardata[m].name == xq){
						tfmbar(optbar,fmbardata,"pie-3",m);
					}
				}
				for(var m = 0; m < homedata.length; m++){
					if(homedata[m].name == xq){
						 onesnwwd(options,homedata,"pjwdline",m);
					}
				}
				
			});
			
		 
		 
		 
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
//		 		categories: ['供热用户','未供热用户'],
		 		categories: ['金领小区','砥柱大厦'],
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
//		 	series: [{
//		 		name: '金领小区',
//		 		data: [113,416]
//		 	}, {
//		 		name: '枫桥水岸',
//		 		data: [112,203]
//		 	}, {
//		 		name: '砥柱大厦',
//		 		data: [331,102]
//		 	}, {
//		 		name: '宏江广场',
//		 		data: [552,113]
//		 	}]
		 	series: [{
		 		name: '供热用户',
		 		data: [9815,6815]
		 	}, {
		 		name: '未供热用户',
		 		data: [1354,3815]
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



function tfmbar(optbar,fmbardata,pie,m){
			 optbar.subtitle.text = fmbardata[m].name + "室内温度图";
				optbar.series = [{
					name: 'Brands',
					colorByPoint: true,
					data: [{
						name: '开度:0%',
						y: fmbardata[m].kd1
					},{
						name: '开度：0-15%(含)',
						y: fmbardata[m].kd2
					},{
						name: '开度：100%',
						y: fmbardata[m].kd3,
						sliced: true,
						selected: true
					}]
				}];
				var chart = Highcharts.chart(pie, optbar);
}

//室内温度饼图
function twdbar(optbar,wdbardata,pie,m){

				 optbar.subtitle.text = wdbardata[m].name + "室内温度图";
					optbar.series = [{
						name: 'Brands',
						colorByPoint: true,
						data: [{
							name: '温度小于15°C(含)',
							y: wdbardata[m].w1
						},{
							name: '温度15°C-18°C',
							y: wdbardata[m].w2
						},{
							name: '温度18°C(含)-22°C(含)',
							y: wdbardata[m].w3,
							sliced: true,
							selected: true
						},{
							name: '温度大于22°C(含)',
							y: wdbardata[m].w4
						}]
					}];
					var chart = Highcharts.chart(pie, optbar);
	
}


//供热面积饼图
function tgrbar(optbar,grbardata,pie,m){
	
				 optbar.subtitle.text = grbardata[m].name + "供热面积图";
					optbar.series = [{
						name: 'Brands',
						colorByPoint: true,
						data: [{
								name: '供热面积',
								y: grbardata[m].grmj ,
								sliced: true,
								selected: true
						}, {
								name: '未供热面积',
								y:   grbardata[m].wgrmj
						}]
					}];
					var chart = Highcharts.chart(pie, optbar);
		
	
}


//表格写入函数
function tbodydis(oldlist,newlist){

	var opt = [];
	for(var i = 0; i < newlist.length; i++) {
		for (var j = 0 ; j <newlist[i].length ; j ++) {
			if(j == 1){
				if( opt.indexOf(newlist[i][1]) == -1){
					opt.push(newlist[i][1]);
				}
			}
		}
	}
	for(var i = 0; i < opt.length; i++) {
		$("#xqNameId").append("<option>"+opt[i]+"</option>");
	}
	
	
	var current = 1;

	function pageInit(currentPage, pagesize) {
		current = currentPage; //将当前页存储全局变量
		pageCount = Math.ceil(newlist.length / pagesize); //一共分多少页
		currentNum.innerHTML = currentPage;
		num.innerHTML = newlist.length + "条";
		pages.innerHTML = pageCount;
		var startRow = (currentPage - 1) * pagesize; //开始显示的行
		var endRow = currentPage * pagesize - 1; //结束显示的行
		var endRow = (endRow > newlist.length) ? newlist.length : endRow; //如果结束行数大于总数目，显示总数目，否则结束行
		
		var html = "";
		for(var i = 0; i < newlist.length; i++) {
			if(i >= startRow && i <= endRow) { //通过间隔分隔数组
				if(i%2 == 1){
					html += "<tr class='gradeX odd'>";
				}else if(i%2 == 0){
					html += "<tr class='gradeX even'>";
				}
		

				for (var j = 0 ; j <newlist[i].length ; j ++) {
					
                    html += "<td>" + newlist[i][j] + "</td>"
				}
			
			}
		}
		xinword_body.innerHTML = html;

	
		
	
		var classname = "";
		$("table tbody td").hover(function() {
			classname = $(this).parent().attr("class");
			$(this).parent().removeClass(classname).addClass("blue");
			$("table tbody tr").find('td:eq(' + $(this).index() + ')').addClass('blue')
		}, function() {
			$(this).parent().removeClass("blue").addClass(classname);
			$("table tbody tr").find('td:eq(' + $(this).index() + ')').removeClass('blue')
		});
		
	}
	
	select.onchange = function(ev) {
		pageInit(1, this.value)
	}
	first.onclick = function() {
		pageInit(1, select.value)
	}
	end.onclick = function() {
		pageInit(pageCount, select.value)
	}

	next.onclick = function() {
		var curr = current + 1;
		if(curr > pageCount) {
			return
		}
		pageInit(curr, select.value)
	}

	last.onclick = function() {
		var curr = current - 1;
		if(curr < 1) {
			return
		}
		pageInit(curr, select.value)
	}
	pageInit(1, 15);

}

function fDateTime(num){
	var curDate = new Date();
	var nowTimeDay = new Date(curDate - 24*60*60*1000*num).getDate();
	var nowTimeMonth = new Date(curDate - 24*60*60*1000*num).getMonth()+1;
	var nowTime = nowTimeMonth + "-" + nowTimeDay;
return nowTime;
}


//楼栋选择
function ldselect(xinwordList){
	 // 获取被选中的option标签
	 var xq = $('#xqNameId  option:selected').val();
	 $("#buildNoId").html("<option value='' disabled selected hidden>--选择楼栋号--</option>");
	 $("#cellNoId").html("<option value='' disabled selected hidden>--选择单元号--</option>");
	 $("homeNoId").html("<option value='' disabled selected hidden>--选择户号--</option>");

	 var opt = [];
	 for(var i = 0 ; i < xinwordList.length ; i ++){
		 if( xq == xinwordList[i][1] && opt.indexOf(xinwordList[i][2]) == -1){
				opt.push(xinwordList[i][2]);
		 }
	 }
	
	 for(var j = 0; j < opt.length; j++) {
			$("#buildNoId").append("<option value="+opt[j]+">"+opt[j]+"</option>");
	}
	 
	 
}


function dyselect(xinwordList){
	 // 获取被选中的option标签
	 var xq = $('#xqNameId  option:selected').val();
	 var ld = $('#buildNoId  option:selected').val();
	 $("#cellNoId").html("<option value='' disabled selected hidden>--选择单元号--</option>");
	 var opt = [];
	 for(var i = 0 ; i < xinwordList.length ; i ++){
		 if( xq == xinwordList[i][1] && ld == xinwordList[i][2] && opt.indexOf(xinwordList[i][3]) == -1){
				opt.push(xinwordList[i][3]);
		 }
	 }
	 for(var j = 0; j < opt.length; j++) {
			$("#cellNoId").append("<option>"+opt[j]+"</option>");
	}
	 
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
