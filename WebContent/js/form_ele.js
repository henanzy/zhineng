function getRootPath(){      
	var curWwwPath=window.document.location.href;      
    var pathName=window.document.location.pathname;      
    var pos=curWwwPath.indexOf(pathName); 
    var localhostPaht=curWwwPath.substring(0,pos);      
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);      
    return(localhostPaht+projectName);  
} 
$(function () {
	 $("#wdbj").change(function(){
		 var json;
		var xq = $('#xq').val();
		var ld = $('#ldh').val();
		var dy = $('#dyh').val();
		var cs 
		 if($('#wdbj').val()=="tc"){
			 cs = $('#hh').val();
		 }
		
		 $.ajax({
				url : getRootPath()+"/yhInfo/findTc.action", 
				async : false,
				dataType : "json",
				data : {
					"xqm":xq,
					"ldh":ld,
					"dyh":dy,
					"hh":cs,
				},
				success : function(data) {
				 json=data.list;
				
				}
			});
		 var bjList=[]
			for (var i = 0 ; i < json.length ; i ++) {
				var arr1 = [];
				/*arr1[0] = json[i].id;*/
				arr1[0] = json[i].BuildNO;
				arr1[1] = json[i].CellNO;
				arr1[2] = json[i].HouseNO;
				arr1[3] = json[i].FamKd;
				arr1[4] = json[i].RoomTemp;
				arr1[5] = json[i].ValTemp;
				arr1[6] = json[i].Tqyb;
				arr1[7] = json[i].SFJF;
				arr1[8] = json[i].RecordTime;
				
				bjList.push(arr1);
			};
			wdbj(bjList);
			
		});
    //用户信息
	// 工单搜索
	$("#search_btn").click(function(){
		$("#jc_body").empty();
		var xq = $('#xq').val();
		var ld = $('#ldh').val();
		var dy = $('#dyh').val();
		var hh = $('#hh').val();
		var json;
		
		if(dyh==""||hh==null||hh==""){
			alert("请填写完整信息")
			return;
		}
		$("#record_body").empty();
		var jcList=[];
		$.ajax({
			url : getRootPath()+"/yhInfo/findJc.action", 
			async : false,
			dataType : "json",
			data : {
				"xqm":xq,
				"ldh":ld,
				"dyh":dy,
				"hh":hh,
				
			},
			success : function(data) {
			var json=data.list;
			 for (var i = 0 ; i < json.length ; i ++) {
					var arr1 = [];
					/*arr1[0] = json[i].id;*/
					arr1[0] = json[i].JCQK;
					arr1[1] = json[i].JCWT;
					arr1[2] = json[i].JCRQ;
					arr1[3] = json[i].JCR;
					arr1[4] = json[i].JCBZ;
					arr1[5] = json[i].CLQK;
					arr1[6] = json[i].CLJG;
					arr1[7] = json[i].CLBZ;
					
					jcList.push(arr1);
				};
			}
		});
		var xq1 = $('#xq').val();
		var ld1 = $('#ldh').val();
		var dy1 = $('#dyh').val();
		var cs1
		 if($('#wdbj').val()=="tc"){
			 cs1 = $('#hh').val();
		 }
		var jc_body = document.getElementById("jc_body");
		for(var i = 0;i < jcList.length;i ++){
			var questionTr = document.createElement("tr");
			if(i%2 == 1){
				questionTr.className = "gradeX odd";
			}else if(i%2 == 0){
				questionTr.className = "gradeX even";
			}
			for(var j = 0;j < jcList[i].length;j ++){

				jcList[i][j] = jcList[i][j]+"";
								
				questionTr.innerHTML += "<td>" + jcList[i][j] + "</td>";
			
			}		
			
			$("#jc_body").empty();
			jc_body.appendChild(questionTr);		
		}
		$.ajax({
			url : getRootPath()+"/yhInfo/findTc.action", 
			async : false,
			dataType : "json",
			data : {
				"xqm":xq1,
				"ldh":ld1,
				"dyh":dy1,
				"hh":cs1,
				
			},
			success : function(data) {
			 json=data.list;
			
			}
		});
		
		var gdls
		
		var fmls
		$.ajax({
			url : getRootPath()+"/yhInfo/findFmLs.action", 
			async : false,
			dataType : "json",
			data : {
				"xqm":xq,
				"ldh":ld,
				"dyh":dy,
				"hh":hh,
				
				
			},
			success : function(data) {
				gdls=data.gdls;
				fmls=data.fmls;
			
			}
		});
		
		
		var bjList=[]
		for (var i = 0 ; i < json.length ; i ++) {
			var arr1 = [];
			/*arr1[0] = json[i].id;*/
			arr1[0] = json[i].BuildNO;
			arr1[1] = json[i].CellNO;
			arr1[2] = json[i].HouseNO;
			arr1[3] = json[i].FamKd;
			arr1[4] = json[i].RoomTemp;
			arr1[5] = json[i].ValTemp;
			arr1[6] = json[i].Tqyb;
			arr1[7] = json[i].SFJF;
			arr1[8] = json[i].RecordTime;
			bjList.push(arr1);
		};
		wdbj(bjList);
		var gdlsList = [];
		
			for (var i = 0 ; i < gdls.length ; i ++) {
				var arr2 = [];
				/*arr1[0] = json[i].id;*/
				arr2[0] = gdls[i].slsj;
				arr2[1] = gdls[i].Problem;
				arr2[2] = gdls[i].jdsj;
				arr2[3] = gdls[i].JS_Name;
				arr2[4] = gdls[i].wxsj;
				arr2[5] = gdls[i].WC_Name;
				if(gdls[i].BZ==null){
				arr2[6] = "";
				}else{
					arr2[6] = gdls[i].BZ;	
				}
				
				
				gdlsList.push(arr2);
			};
			
			
		
		var record_body = document.getElementById("record_body");
		for(var i = 0;i < gdlsList.length;i ++){
			var questionTr = document.createElement("tr");
			if(i%2 == 1){
				questionTr.className = "gradeX odd";
			}else if(i%2 == 0){
				questionTr.className = "gradeX even";
			}
			for(var j = 0;j < gdlsList[i].length;j ++){

				gdlsList[i][j] = gdlsList[i][j]+"";
								
				questionTr.innerHTML += "<td>" + gdlsList[i][j] + "</td>";
			
			}		
			
			$("#record_body").empty();
			record_body.appendChild(questionTr);		
		}
		var kdwd;
		$.ajax({
			url : getRootPath()+"/yhInfo/findFmkdLs.action", 
			async : false,
			dataType : "json",
			data : {
				"xqm":xq,
				"ldh":ld,
				"dyh":dy,
				"hh":hh,
				"startTime":$("#startTime").val(),
				"endTime":$("#endTime").val(),
				
				
			},
			success : function(data) {
				
				kdwd=data.list;
			}
			
          
		});
		 var kd = [];
		 var wd = [];
		 var roomwd = [];
		 var valwd = [];
		 var cbtime=[];
			for (var i = 0 ; i < kdwd.length ; i ++) {
				var arr = [];
				/*arr1[0] = json[i].id;*/
				kd.push(kdwd[i].FamKd);
				wd.push(kdwd[i].Tqyb);
				roomwd.push(kdwd[i].RoomTemp);
				valwd.push(kdwd[i].ValTemp);
				cbtime.push(kdwd[i].time);
			};	
			monthdata=[{kd:kd,wd:wd,roomwd:roomwd,valwd:valwd}]
			daydata=[{kd:kd.slice(0,27),wd:wd.slice(0,27),roomwd:roomwd.slice(0,27),valwd:valwd.slice(0,27)}]
			$("#sssj").val("一个月")
			//$(".tabletitle").html("一个月实时数据");
			$(".linetitle").html("一个月开度 温度曲线图");
			console.log(monthdata)
			linechar("一个月",monthdata,options,cbtime);
			timeList=cbtime;
	});
	
	

	var timeList=[];
	var monthdata=[];
	var daydata=[];
	
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
                text: null,
               
            },
        tickPositions: [-10,0, 20, 50, 100],
        }
    };
	 
	
	
	
	$("#sssj").change(function(){
		var sssjv=$("#sssj").val();
		if(sssjv == "7天"){
			//$(".tabletitle").html("7天实时数据");
			$(".linetitle").html("7天开度 温度曲线图");
			
			linechar("7天",daydata,options,timeList.slice(0,27));
		}else if(sssjv == "一个月"){
			//$(".tabletitle").html("一个月实时数据");
			$(".linetitle").html("一个月开度 温度曲线图");
			
			linechar("一个月",monthdata,options,timeList);
		}
	});
	
	
	
	
});

function linechar(sssjv,data,options,xz){
	 if(sssjv == "7天"){

	 	options.xAxis = {
			title: {
				text: '时间'
			},
			categories: xz,
			tickInterval: 3
		};
		options.series = [
			 {marker: {

	             enabled: false,
	         },
				 name:"用户开度",
				 data:data[0].kd,
				 tooltip: {
	                   valueSuffix: '%'
	               }
			 },{marker: {

	             enabled: false,
	         },
				 name:"室外温度",
				 data:data[0].wd,
				 tooltip: {
	                   valueSuffix: '°C'
	               }
			 }
			 
			 ,{marker: {

	             enabled: false,
	         },
				 name:"室内温度",
				 data:data[0].roomwd,
				 tooltip: {
	                   valueSuffix: '°C'
	               }
			 }
			 
			 ,{marker: {

	             enabled: false,
	         },
				 name:"管道温度",
				 data:data[0].valwd,
				 tooltip: {
	                   valueSuffix: '°C'
	               }
			 }
		 ];
	}else if(sssjv == "一个月"){
		options.xAxis = {
				title: {
					text: '时间'
				},
				categories: xz,
				tickInterval:7
			};
		options.series = [
			 {marker: {

	             enabled: false,
	         },
				 name:"用户开度",
				 data:data[0].kd,
				 tooltip: {
	                   valueSuffix: '%'
	               }
			 },{marker: {

	             enabled: false,
	         },
				 name:"室外温度",
				 data:data[0].wd,
				 tooltip: {
	                   valueSuffix: '°C'
	               }
			 }, {marker: {

	             enabled: false,
	         },
				 name:"室内温度",
				 data:data[0].roomwd,
				 tooltip: {
	                   valueSuffix: '°C'
	               }
			 }
			 
			 ,{marker: {

	             enabled: false,
	         },
				 name:"管道温度",
				 data:data[0].valwd,
				 tooltip: {
	                   valueSuffix: '°C'
	               }
			 }
		 ];
	
	}
    

	// 图表初始化函数
	var chart = Highcharts.chart('mws-dashboard-chart-1', options);
}



function wdbj(List){
	var html = "";
	for(var i = 0; i < List.length; i++) {
			if(i%2 == 1){
				html += "<tr class='gradeX odd'>";
			}else if(i%2 == 0){
				html += "<tr class='gradeX even'>";
			}
	

			for (var j = 0 ; j <List[i].length ; j ++) {
				
				html += "<td>" + List[i][j] + "</td>"
			}
		
	}
	bj_body.innerHTML = html;
}

function hourTime(num){
	var curDate = new Date();
	var nowTimeHour = new Date(curDate - 2*60*60*1000*num).getHours();
	return nowTimeHour;
}

function fDateTime(num){
	var curDate = new Date();
	var nowTimeDay = new Date(curDate - 24*60*60*1000*num).getDate();
	var nowTimeMonth = new Date(curDate - 24*60*60*1000*num).getMonth()+1;
	var nowTime = nowTimeMonth + "-" + nowTimeDay;
	return nowTime;
}


//楼栋选择


