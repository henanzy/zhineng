function getRootPath(){      
	var curWwwPath=window.document.location.href;      
    var pathName=window.document.location.pathname;      
    var pos=curWwwPath.indexOf(pathName); 
    var localhostPaht=curWwwPath.substring(0,pos);      
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);      
    return(localhostPaht+projectName);  
} 

$(document).ready(function(){
	var shebList = [];
	function jsArrChange(json){
		for (var i = 0 ; i < json.length ; i ++) {
			var arr1 = [];
			arr1[0] = json[i].id;
			arr1[1] = json[i].YhName;
			arr1[2] = json[i].XqName;
			arr1[3] = json[i].BuildNO;
			arr1[4] = json[i].CellNO;
			arr1[5] = json[i].HouseNO;
			arr1[6] = json[i].Status;
			arr1[7] = json[i].SFJF;
			arr1[8] = json[i].FamKd;
			arr1[9] = json[i].RoomTemp;
			arr1[10] = json[i].ValTemp;
			arr1[11] = json[i].LockSt;
			arr1[12] = json[i].CjqTime;
			arr1[13] = json[i].RecordTime;
			arr1[14] = json[i].ValAd;
			arr1[15] = json[i].WCAd;
			arr1[16] = json[i].CjqWz;
			arr1[17] = json[i].MTemSet;
			arr1[18] = json[i].LTemSet;
			arr1[19] = json[i].QgID;
			
			shebList.push(arr1);
		};
	}
	var YhList;
	$.ajax({
			url : "findYh.action", 
			async : false,
			dataType : "json",
			data : {
				"xqm":$('#xq').val(),
			},
			success : function(data) {
				
				YhList=data.list;
				jsArrChange(YhList);
			}

		});

	tbodydis("",shebList,1)
	
	$("#kf").click(function(){
			 $('input[name="check"]:checked').each(function (index, item) {
				 var row=$(this).parent("td").parent("tr");
				 var td = row.find("td");
				 var valad=td[15].innerHTML;
				 var qgid=td[20].innerHTML;
				 /*var fmkd=td[10].innerHTML;*/
				 var fmkd=$("#fmkd").val();
				          $.ajax({
			                     type: "post",
			                    url: getRootPath()+"/sbglCon/kFm.action",
			                      dataType:'json',
			                      async:false,
			                  	data:{	
			      					"fmId":valad,
			      					"qgId":qgid,
			      					"fmkd":fmkd,
			      				},
			                     dataType: "json",
			                      success: function (data) {
			                    	   if(data.js=="0"){
			                    		   alert("开阀成功");
			                    		   var page=$("#currentNum").html();
			                    		    search(page);
			                    	   }else{
			                    		   alert("开阀失败 ")
			                    		   
			                    	   }
			                     },
			  
			                 })
			                
			                 
				    });			 
             		              
	});
	
	$("#df").click(function(){
		 $('input[name="check"]:checked').each(function (index, item) {
			 var row=$(this).parent("td").parent("tr");
			 var td = row.find("td");
			 var valad=td[15].innerHTML;
			 var qgid=td[20].innerHTML;
		/*	 var fmkd =td[9].innerHTML;*/
			          $.ajax({
		                     type: "post",
		                    url: getRootPath()+"/sbglCon/dFm.action",
		                      dataType:'json',
		                      async:false,
		                  	data:{	
		      					"fmId":valad,
		      					"qgId":qgid,
		      					
		      				},
		                     dataType: "json",
		                      success: function (data) {
		                    	   if(data.js=="0"){
		                    		   alert("读阀成功");
		                    		   var page=$("#currentNum").html();
		                    		    search(page);
		                    	   }else{
		                    		   alert("读阀失败 ");
		                    	   }
		                     },
		  
		                 })
		                 
			    });			 
});

	$("#gf").click(function(){
		 $('input[name="check"]:checked').each(function (index, item) {
			 var row=$(this).parent("td").parent("tr");
			 var td = row.find("td");
			 var valad=td[15].innerHTML;
			 var qgid=td[20].innerHTML;
			          $.ajax({
		                     type: "post",
		                    url: getRootPath()+"/sbglCon/gFm.action",
		                      dataType:'json',
		                      async:false,
		                  	data:{	
		      					"fmId":valad,
		      					"qgId":qgid,
		      				},
		                     dataType: "json",
		                      success: function (data) {
		                    	   if(data.js=="0"){
		                    		   alert("关阀成功");
		                    		   var page=$("#currentNum").html();
		                    		    search(page);
		                    	   }else{
		                    		   alert("关阀失败 ")
		                    	   }
		                     },
		  
		                 })
		                 
			    });			 
     		              
});
	
	$("#dcgq").click(function(){
		 $('input[name="check"]:checked').each(function (index, item) {
			 var row=$(this).parent("td").parent("tr");
			 var td = row.find("td");
			 var valad=td[15].innerHTML;
			 var qgid=td[20].innerHTML;
			 
			          $.ajax({
		                     type: "post",
		                    url: getRootPath()+"/sbglCon/cgqads.action",
		                      dataType:'json',
		                      async:false,
		                  	data:{	
		      					"fmId":valad,
		      					"qgId":qgid,
		      				},
		                     dataType: "json",
		                      success: function (data) {
		                    	   if(data=="0"){
		                    		   alert("读传感器地址成功");
		                    		   var page=$("#currentNum").html();
		                    		    search(page);
		                    	   }else{
		                    		   alert("读传感器地址失败 ")
		                    	   }
		                     },
		  
		                 })
		                 
			    });			 
     		              
});
	
	$("#xgcgq").click(function(){
		 $('input[name="check"]:checked').each(function (index, item) {
			 var row=$(this).parent("td").parent("tr");
			 var td = row.find("td");
			 var valad=td[15].innerHTML;
			 var qgid=td[20].innerHTML;
			 var CGQId=$("#Cgqdz").val();
			 if(CGQId==""){
					alert("请填写新的传感器地址");
					return false;
				}
				if(CGQId.length<9){
					alert("地址为九位正整数!!!")
					return false;
				}
				if(CGQId.length>9){
					alert("地址为九位正整数!!！")
					return false;
				}
			          $.ajax({
		                     type: "post",
		                    url: getRootPath()+"/sbglCon/XCgq.action",
		                      dataType:'json',
		                      async:false,
		                  	data:{	
		      					"fmId":valad,
		      					"qgId":qgid,
		      					"CGQId":CGQId,
		      				},
		                     dataType: "json",
		                      success: function (data) {
		                    	   if(data=="0"){
		                    		   alert("修改成功");
		                    		   var page=$("#currentNum").html();
		                    		    search(page);
		                    	   }else{
		                    		   alert("修改失败 ");
		                    	   }
		                     },
		  
		                 })
		                 
			    });			 

});
	$("#fscs").click(function(){
		 $('input[name="check"]:checked').each(function (index, item) {
			 var row=$(this).parent("td").parent("tr");
			 var td = row.find("td");
			 var valad=td[15].innerHTML;
			 var qgid=td[20].innerHTML;
			 
			          $.ajax({
		                     type: "post",
		                    url: getRootPath()+"/sbglCon/FsCs.action",
		                      dataType:'json',
		                      async:false,
		                  	data:{	
		      					"fmId":valad,
		      					"qgId":qgid,
		      					"wdsd":$("#wdsd").val(),
		      					"tjzq":$("#tjzq").val(),
		      					"tjcs":$("#tjcs").val(),
		      					"sdbs":$("#sdbs").val(),
		      					
		      					
		      				},
		                     dataType: "json",
		                      success: function (data) {
		                    	   if(data=="0"){
		                    		   alert("发送成功");
		                    		   var page=$("#currentNum").html();
		                    		    search(page);
		                    	   }else{
		                    		   alert("发送失败 ")
		                    	   }
		                     },
		  
		                 })
		                 
			    });			 
    		              
});
	
	$("#word_change_btn").click(function(){
			 var upid=$("#upid").val();
			 var CjqTime=$("#CjqTime").val();
			 var CjqWz=$("#CjqWz").val();
			          $.ajax({
		                     type: "post",
		                    url: getRootPath()+"/sbglCon/updateCjqTime.action",
		                      dataType:'json',
		                      async:false,
		                  	data:{	
		      					"upid":upid,
		      					"CjqTime":CjqTime,
		      					"CjqWz":CjqWz,
		      				},
		                     dataType: "json",
		                      success: function (data) {
		                    	
		                    		   var page=$("#currentNum").html();
		                    		    search(page);
		                    		    $("#change_word").hide();
		                     },
		  
		                 })		 
     		              
});
	
	function search(page){
		var xq = $('#xq').val();
		var ld = $('#ldh').val();
		var dy = $('#dyh').val();
		var hh = $('#hh').val();
		var compareWordList = [];
		compareWord(xq,ld,dy,hh,compareWordList);
		shebList=compareWordList;		
		
	
		tbodydis(shebList,compareWordList,page);
	}

	//新增按钮
	$("#change_word_btn").click(function(){
		xin_change(this);
	});

	/*//修改按钮
	$(".xinjgd_change").click(function(){
		xin_change(this);
	});*/
	//关闭新增
	$(".close").click(function(){
		$("#change_word").hide();
	});
$("#search_btn").click(function(){
	search(1);
		

	});

	var tableObject = $('#sheb_table_body table'); //获取id为xincreate_table_body的table对象
	var tbHead = tableObject.children('thead'); //获取table对象下的thead
	var tbHeadTh = tbHead.find('tr th'); //获取thead下的tr下的th
	var tbBody = tableObject.children('tbody'); //获取table对象下的tbody
	var tbBodyTr = tbBody.find('tr'); //获取tbody下的tr

	var sortIndex = 1;

	tbHeadTh.each(function() { //遍历thead的tr下的th
		var thisIndex = tbHeadTh.index($(this))+1; //获取th所在的列号

		var type ="";
		$(this).click(function() { //给当前表头th增加点击事件
			tbHeadTh.find("span").show();
			if(sortIndex%2 == 1){//奇数偶数显示
				$(this).find(".span-up").show();
				$(this).find(".span-down").hide();
			}else{
				$(this).find(".span-up").hide();
				$(this).find(".span-down").show();
			}
			var table = $('#sheb_table_body table'); 
			var body = table.children('tbody'); 
			var bodytr = body.find('tr');
			checkColumnValue(thisIndex,table,bodytr);
		});
	});

	//对表格排序
	function checkColumnValue(index,table,bodytr) {
		var trsValue = new Array();
		
		bodytr.each(function() {
			var tds = $(this).find('td');
			//获取行号为index列的某一行的单元格内容与该单元格所在行的行内容添加到数组trsValue中
			var data = $(tds[index]).html();//parseFloat($(tds[index]).html()) || 
			if(isNaN(data)&&!isNaN(Date.parse(data))){
			type = "string";
			}else if (parseFloat(data)) {
				type = "number";
			}else{
				type = "string";
			}
			
			trsValue.push(type + ".separator" + $(tds[index]).html() + ".separator" + $(this).html());
			$(this).html("");
		});
		
		var len = trsValue.length;
		
		if(sortIndex%2 == 0) {
			//如果已经排序了则直接倒序
			trsValue.reverse();
		} else {
			for(var i = 0; i < len; i++) {
				//split() 方法用于把一个字符串分割成字符串数组
				//获取每行分割后数组的第一个值,即此列的数组类型,定义了字符串\数字\Ip
				type = trsValue[i].split(".separator")[0];
				for(var j = i + 1; j < len; j++) {
					//获取每行分割后数组的第二个值,即文本值
					value1 = trsValue[i].split(".separator")[1];
					//获取下一行分割后数组的第二个值,即文本值
					value2 = trsValue[j].split(".separator")[1];
					//接下来是数字\字符串等的比较
					if(type == "number") {
						value1 = value1 == "" ? 0 : value1;
						value2 = value2 == "" ? 0 : value2;
						if(parseFloat(value1) > parseFloat(value2)) {
							var temp = trsValue[j];
							trsValue[j] = trsValue[i];
							trsValue[i] = temp;
						}
					} else {
						if(value1.localeCompare(value2) > 0) { //该方法不兼容谷歌浏览器
							var temp = trsValue[j];
							trsValue[j] = trsValue[i];
							trsValue[i] = temp;
						}
					}
				}
			}
		}

		for(var i = 0; i < len; i++) {
			table.find("tbody tr:eq(" + i + ")").html(trsValue[i].split(".separator")[2]);
		}

		sortIndex += 1;
	}
});

//表格写入函数带分页
function tbodydis(oldlist,newlist,page){

	var current = 1;
	function pageInit(currentPage, pagesize) {
		current = currentPage; // 将当前页存储全局变量
		pageCount = Math.ceil(newlist.length / pagesize); // 一共分多少页
		currentNum.innerHTML = currentPage;
		num.innerHTML = newlist.length + "条";
		pages.innerHTML = pageCount;
		var startRow = (currentPage - 1) * pagesize; // 开始显示的行
		var endRow = currentPage * pagesize - 1; // 结束显示的行
		var endRow = (endRow > newlist.length) ? newlist.length : endRow; // 如果结束行数大于总数目，显示总数目，否则结束行
		
		var html = "";
		for(var i = 0; i < newlist.length; i++) {
			if(i >= startRow && i <= endRow) { // 通过间隔分隔数组
				if(i%2 == 1){
					html += "<tr class='gradeX odd'>";
				}else if(i%2 == 0){
					html += "<tr class='gradeX even'>";
				}
		
				html += "<td><input type='checkbox' value='"+newlist[i][0]+"' name='check'/></td>";
				for (var j = 0 ; j <newlist[i].length ; j ++) {
					if(j==0){

						html += "<td style='display:none;'>" + newlist[i][j] + "</td>";
    					
    				}else{
    					 html += "<td>" + newlist[i][j] + "</td>"
    				}
                 
				}
			
			}
		}
		sheb_body.innerHTML = html;

	
		
	
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
	pageInit(page, 15);

}

function xin_change(p){
	$("#change_word").show();
	  var ckbs=$("#sheb_body input[type=checkbox]:checked");
		if(ckbs.length==0){
			alert("请选择要发送的阀门");
			return false;
		}
		if(ckbs.length>1){
			alert("对不起一次只能读取一个");
			return false;
		}
		var id=ckbs.val();
		var cgqId=ckbs.parent().next().next().next().next().next().next().next().next().next().next().next().next().next().next().next().text();
		var CjqWz=ckbs.parent().next().next().next().next().next().next().next().next().next().next().next().next().next().next().next().next().next().text();
		var cjqTime=ckbs.parent().next().next().next().next().next().next().next().next().next().next().next().next().next().text();
		$("#change_word .change_word_input")[0].value = id;
		$("#change_word .change_word_input")[1].value = cgqId;
		$("#change_word .change_word_input")[2].value = CjqWz;
		$("#change_word .change_word_input")[3].value = cjqTime;
}

function compareWord(xq,ld,dy,hh,compareWordList){

	var json;
	compareWordList.length=0;
	$.ajax({
		url : getRootPath()+"/sbglCon/findYh.action", 
		async : false,
		dataType : "json",
		data : {
			"sfjf":$("#sfjf").val(),
			"xqm":xq,
			"ldh":ld,
			"dyh":dy,
			"hh":hh,
		},
		success : function(data) {
		 json=data.list;
		
		}
	});

	for (var i = 0 ; i < json.length ; i ++) {
		var arr1 = [];
		arr1[0] = json[i].id;
		arr1[1] = json[i].YhName;
		arr1[2] = json[i].XqName;
		arr1[3] = json[i].BuildNO;
		arr1[4] = json[i].CellNO;
		arr1[5] = json[i].HouseNO;
		arr1[6] = json[i].Status;
		arr1[7] = json[i].SFJF;
		arr1[8] = json[i].FamKd;
		arr1[9] = json[i].RoomTemp;
		arr1[10] = json[i].ValTemp;
		arr1[11] = json[i].LockSt;
		arr1[12] = json[i].CjqTime;
		arr1[13] = json[i].RecordTime;
		arr1[14] = json[i].ValAd;
		arr1[15] = json[i].WCAd;
		arr1[16] = json[i].CjqWz;
		arr1[17] = json[i].MTemSet;
		arr1[18] = json[i].LTemSet;
		arr1[19] = json[i].QgID;
		compareWordList.push(arr1);
	};

}	
