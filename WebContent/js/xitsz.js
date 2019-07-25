$(document).ready(function(){
//  表格
	var yhglList=[
		["hnzy",67896222],
		["admin",67896222],
		["123",67896222],
	];
	
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
	
	
});
