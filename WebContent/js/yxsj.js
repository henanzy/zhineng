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

	var xinwordList = [];
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
			arr1[7] = json[i].FamKd;
			arr1[8] = json[i].RoomTemp;
			arr1[9] = json[i].Tqyb;
			arr1[10] = json[i].ValTemp;
			arr1[11] = json[i].LockSt;
			arr1[12] = json[i].RecordTime;
			arr1[13] = json[i].IDNum;
			arr1[14] = json[i].ValAd;
			arr1[15] = json[i].WCAd;
			arr1[16] = json[i].SFJF;
			arr1[17] = json[i].HeatArea;
			arr1[18] = json[i].QgID;
			xinwordList.push(arr1);
		};
	}
	jsArrChange(list);
	
	tbodydis("",xinwordList)
	
	
	var wordExport = document.getElementById("export_btn");
	wordExport.onclick = function(){
		var aID =  this.parentNode.getAttribute("id");
		tableToExcel();
	}
	
	//base64转码
    var base64 = function (s) {
        return window.btoa(unescape(encodeURIComponent(s)));
    };
    //替换table数据和worksheet名字
    var format = function (s, c) {
        return s.replace(/{(\w+)}/g,
            function (m, p) {
                return c[p];
            });
    }
    function tableToExcel(){
        //要导出的json数据
     
        //列标题
        let str = '<tr><td>用户名</td><td>小区名称</td>'+
        '<td>楼栋号</td><td>单元号</td><td>户号</td>'+
        '<td>状态</td><td>开度</td><td>室温</td>'+
        '<td>室外温度</td><td>管道温度</td><td>锁定</td>'+
        '<td>抄表时间</td><td>用户ID</td>'+
        '<td>阀门ID</td><td>传感器ID</td><td>缴费状态</td>'+
        '<td>面积</td><td>区管ID</td>'+
        '</tr>';
        //循环遍历，每行加入tr标签，每个单元格加td标签
        for(let i = 0 ; i < xinwordList.length ; i++ ){
        	
          str+='<tr>';
         
          for(let item in xinwordList[i]){
              //增加\t为了不让表格显示科学计数法或者其他格式
        	  if(item!=0){
        		  str+=`<td>${ xinwordList[i][item] + '\t'}</td>`;
        	  }  
          }
          str+='</tr>';
        	
        }
        //Worksheet名
        let worksheet = 'Sheet1'
        let uri = 'data:application/vnd.ms-excel;base64,';
   
        //下载的表格模板数据
        let template = `<html xmlns:o="urn:schemas-microsoft-com:office:office" 
        xmlns:x="urn:schemas-microsoft-com:office:excel" 
        xmlns="http://www.w3.org/TR/REC-html40">
        <head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet>
          <x:Name>${worksheet}</x:Name>
          <x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet>
          </x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]-->
          </head><body><table>${str}</table></body></html>`;
        //下载模板
//        window.location.href = uri + base64(template)
      }
      //输出base64编码
      function base64 (s) { return window.btoa(unescape(encodeURIComponent(s))) }

	// 工单搜索
	$("#search_btn").click(function(){
		
		var xq = $('#xq').val();
		var ld = $('#ldh').val();
		var dy = $('#dyh').val();
		var hh = $('#hh').val();
		var compareWordList = [];
		compareWord(xq,ld,dy,hh,compareWordList);
		xinwordList=compareWordList;		
		
	
		tbodydis(xinwordList,compareWordList);

	});
	
	var tableObject = $('#display_table_body table'); //获取id为xincreate_table_body的table对象
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
			var table = $('#display_table_body table'); 
			var body = table.children('tbody'); 
			var bodytr = body.find('tr');
			checkColumnValue(thisIndex,table,bodytr);
		});
	});

	//对表格排序
	function checkColumnValue(index,table,bodytr) {
		var trsValue = new Array();
		console.log(index);
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
function tbodydis(oldlist,newlist){
	
	
	
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
		

				for (var j = 0 ; j <newlist[i].length ; j ++) {
					
					if(j==0){

						html += "<td style='display:none;'>" + newlist[i][j] + "</td>";
    					
    				}else{
                  html += "<td>" + newlist[i][j] + "</td>"
    				}
				}
			
			}
		}
		display_body.innerHTML = html;

	
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



function compareWord(xq,ld,dy,hh,compareWordList){

	var json;
	compareWordList.length=0;
	$.ajax({
		url : getRootPath()+"/yhInfo/findYh.action", 
		async : false,
		dataType : "json",
		data : {
			"xqm":xq,
			"ldh":ld,
			"dyh":dy,
			"hh":hh,
			
			"FamKd1":$('#fmkd_start').val(),
			"FamKd2":$('#fmkd_end').val(),
			"RoomTemp1":$('#snwd_start').val(),
			"RoomTemp2":$('#snwd_end').val(),
			"ValTemp1":$('#gdwd_start').val(),
			"ValTemp2":$('#gdwd_end').val(),
			
			
			
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
		arr1[7] = json[i].FamKd;
		arr1[8] = json[i].RoomTemp;
		arr1[9] = json[i].Tqyb;
		arr1[10] = json[i].ValTemp;
		arr1[11] = json[i].LockSt;
		arr1[12] = json[i].RecordTime;
		arr1[13] = json[i].IDNum;
		arr1[14] = json[i].ValAd;
		arr1[15] = json[i].WCAd;
		arr1[16] = json[i].SFJF;
		arr1[17] = json[i].HeatArea;
		arr1[18] = json[i].QgID;
		compareWordList.push(arr1);
	};

}	
