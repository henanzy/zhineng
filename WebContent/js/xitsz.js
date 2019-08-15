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
	var yhglList=[
		["hnzyxt",67896222],
		["xmrl",67896222],
		["dfrl",67896222],
		["hnzy",67896222],
		
		["admin",67896222],
		["123",67896222],
	];
	var qyjgList=[];
	function jsArrChange(json){
		for (var i = 0 ; i < json.length ; i ++) {
			var arr1 = [];
			arr1[0] = json[i].id;
			arr1[1] = json[i].name;
			if(json[i].sjgs!=null){
				arr1[2] = json[i].sjgs;
			}
			else{
				arr1[2] = "";
			}
			
			
		
			qyjgList.push(arr1);
		};
	}
	$.ajax({
		url : getRootPath()+"/user/selGsjg.action", 
		async : false,
		dataType : "json",
		data : {
			
		},
		success : function(data) {
			var list=data.list;
			jsArrChange(list);
		}

	});
	$("#word_increase_btn").click(function(){

		$("#increase_word").hide();
		$.ajax({
			url : getRootPath()+"/user/InsGsjg.action", 
			async : false,
			dataType : "json",
			data : {
				"name":$("#xzname").val(),
				"sjgs":$("#xzsjgs").val()
			},
			success : function(data) {
				alert("新增成功")
			}

		});
		csh();
	});
	
	$("#word_change_btn").click(function(){

		$("#change_word").hide();
		$.ajax({
			url : getRootPath()+"/user/updateGsjg.action", 
			async : false,
			dataType : "json",
			data : {
				"id":$("#id").val(),			
				"name":$("#xgname").val(),
				"sjgs":$("#xgsjgs").val()
			},
			success : function(data) {
				alert("修改成功")
			}

		});
		csh();
	});
	
	
	var yhhtml = "";
	for(var i = 0; i < yhglList.length; i++) {
			if(i%2 == 1){
				yhhtml += "<tr class='gradeX odd'>";
			}else if(i%2 == 0){
				yhhtml += "<tr class='gradeX even'>";
			}
	
			yhhtml += "<td><input type='checkbox' name='check'/></td>";
			for (var j = 0 ; j <yhglList[i].length ; j ++) {
				
				yhhtml += "<td>" + yhglList[i][j] + "</td>"
			}
		
	}
	yhgl_body.innerHTML = yhhtml;
	
	var qyhtml = "";
	for(var i = 0; i < qyjgList.length; i++) {
			if(i%2 == 1){
				qyhtml += "<tr class='gradeX odd'>";
			}else if(i%2 == 0){
				qyhtml += "<tr class='gradeX even'>";
			}
	
			
			for (var j = 0 ; j <qyjgList[i].length ; j ++) {
				if(j==0){

					qyhtml += "<td style='display:none;'>" + qyjgList[i][j] + "</td>";
					
				}else{
					qyhtml += "<td>" + qyjgList[i][j] + "</td>"
				}
				
			}
			qyhtml += "<td><input class='xinjgd_change'  type='button' value='修改' /><input class='xinjgd_del' type='button' value='删除' /></td></tr>";
	}
	qyjg_body.innerHTML = qyhtml;
	
	var qxszList=[
		["超级管理员","创建时间","修改时间"],
		["管理员","创建时间","修改时间"],
		["工作人员","创建时间","修改时间"],
		["供热管理员","创建时间","修改时间"],
	];
	
	var qxsztml = "";
	for(var i = 0; i < qxszList.length; i++) {
			if(i%2 == 1){
				qxsztml += "<tr class='gradeX odd'>";
			}else if(i%2 == 0){
				qxsztml += "<tr class='gradeX even'>";
			}
	
			qxsztml += "<td><input type='checkbox' name='check'/></td>";
			for (var j = 0 ; j <qxszList[i].length ; j ++) {
				
				qxsztml += "<td>" + qxszList[i][j] + "</td>"
			}
		
	}
	qxsz_body.innerHTML = qxsztml;
	
	var bbsjList=[
		["开发人员1","时间与界面的优化...","2019年3月13"],
		["开发人员2","时间与界面的优化...","2019年3月13"],
		["开发人员3","时间与界面的优化...","2019年3月13"],
		["开发人员4","时间与界面的优化...","2019年3月13"],
		["开发人员5","时间与界面的优化...","2019年3月13"],
		["开发人员1","时间与界面的优化...","2019年3月13"],
		["开发人员1","时间与界面的优化...","2019年3月13"],
		["开发人员1","时间与界面的优化...","2019年3月13"],
		["开发人员1","时间与界面的优化...","2019年3月13"],
		["开发人员1","时间与界面的优化...","2019年3月13"],
		["开发人员1","时间与界面的优化...","2019年3月13"],
		["开发人员1","时间与界面的优化...","2019年3月13"],
		["开发人员1","时间与界面的优化...","2019年3月13"],
		["开发人员1","时间与界面的优化...","2019年3月13"],
		["开发人员1","时间与界面的优化...","2019年3月13"],
		["开发人员1","时间与界面的优化...","2019年3月13"],
		["开发人员1","时间与界面的优化...","2019年3月13"],
		["开发人员1","时间与界面的优化...","2019年3月13"],
	];
	
	var bbsjtml = "";
	for(var i = 0; i < bbsjList.length; i++) {
			if(i%2 == 1){
				bbsjtml += "<tr class='gradeX odd'>";
			}else if(i%2 == 0){
				bbsjtml += "<tr class='gradeX even'>";
			}
	
			for (var j = 0 ; j <bbsjList[i].length ; j ++) {
				
				bbsjtml += "<td>" + bbsjList[i][j] + "</td>"
			}
		
	}
	bbsj_body.innerHTML = bbsjtml;
	
	var fwqList=["www","192.168.0.125","1455","sa","sa"];
	var fwqinp = $(".fwqinp");
	for(var i = 0; i < fwqList.length; i++) {
		fwqinp[i].value = fwqList[i];
	}
	
	var sjglList=["DB_Znsbf20170419","D:/数据库备份"];
	var sjglinp = $(".sjglinp");
	for(var i = 0; i < sjglList.length; i++) {
		sjglinp[i].value = sjglList[i];
	}
	
	var fwqList=["www","192.168.0.125","1455","sa","sa"];
	var fwqinp = $(".fwqinp");
	for(var i = 0; i < fwqList.length; i++) {
		fwqinp[i].value = fwqList[i];
	}
	
	var cbList=[1];
	var cbinp = $(".cbinp");
	for(var i = 0; i < cbList.length; i++) {
		cbinp[i].value = cbList[i];
	}
	
	$("#increase_btn").click(function(){

		$("#increase_word").show();
	});
	$(".xinjgd_del").click(function(){
		xin_del(this);
	});
	//修改按钮
	$(".xinjgd_change").click(function(){
		xin_change(this);
	});
	$(".close").click(function(){
		$("#increase_word").hide();
		$("#change_word").hide();
	});
	function xin_change(p){
		$("#change_word").show();
		var xintr = $(p).parent().parent().children();
		//修改数据
		var changewordList = [];
		var flag=[0,1]
		for(var x = 0 ; x < 2 ; x ++){
			if(flag.includes(x)){
				changewordList.push(xintr[x].innerHTML);
			}
			
		}
		
		var changeInput = $("#change_word .change_word_input");
		for(var i = 0;i < changeInput.length;i ++){
			
				$("#change_word .change_word_input")[i].value = changewordList[i];
			
			
		}
	}
	function xin_del(p){
		var xintr = $(p).parent().parent().children();
		var id=xintr[0].innerHTML
		
		 layer.confirm('确认删除么', function(index) {
			                 $.ajax({
			                     type: "post",
			                    url: getRootPath()+"/user/deleteGsjg.action",
			                      dataType:'json',
			                  	data:{	
			      					"id":id,
			      				},
			                     dataType: "json",
			                      success: function (data) {
			                    	   layer.close(index);
			                    	   csh();
			                   		
			                     },
			  
			                 })
			              });
	}
	function csh(){
		qyjgList.length=0;
		$.ajax({
   			url : getRootPath()+"/user/selGsjg.action", 
   			async : false,
   			dataType : "json",
   			data : {
   				
   			},
   			success : function(data) {
   				var list=data.list;
   				jsArrChange(list);
   			}

   		});
   		$("#qyjg_body").empty();
   		var qyhtml = "";
   		for(var i = 0; i < qyjgList.length; i++) {
   				if(i%2 == 1){
   					qyhtml += "<tr class='gradeX odd'>";
   				}else if(i%2 == 0){
   					qyhtml += "<tr class='gradeX even'>";
   				}
   		
   				
   				for (var j = 0 ; j <qyjgList[i].length ; j ++) {
   					if(j==0){

   						qyhtml += "<td style='display:none;'>" + qyjgList[i][j] + "</td>";
   						
   					}else{
   						qyhtml += "<td>" + qyjgList[i][j] + "</td>"
   					}
   					
   				}
   				qyhtml += "<td><input class='xinjgd_change'  type='button' value='修改' /><input class='xinjgd_del' type='button' value='删除' /></td></tr>";
   		}
   		qyjg_body.innerHTML = qyhtml;
   		$(".xinjgd_del").click(function(){
   			xin_del(this);
   		});
   		//修改按钮
   		$(".xinjgd_change").click(function(){
   			xin_change(this);
   		});
	}
});
