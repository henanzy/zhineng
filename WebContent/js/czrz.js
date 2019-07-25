$(document).ready(function(){
//  表格

	var doneList=[];
	
	function jsArrChange(json){
		for (var i = 0 ; i < json.length ; i ++) {
			var arr1 = [];
			arr1[0] = json[i].czr;
			arr1[1] = json[i].cz;
			arr1[2] = json[i].time;
			doneList.push(arr1);
		};
	}
	jsArrChange(list);
	
	tbodydis("",doneList);
	
	$("#search_btn").click(function(){
		var compareWordList = [];
		
		
		
			compareWord(compareWordList);
			doneList=compareWordList;
		$("#done_body").empty();

		for(var x = 0;x < compareWordList.length;x ++){
			
			var newWordElemnet = "";
			if(x%2 == 1){
				newWordElemnet = "<tr class='gradeX odd'>";
			}else if(x%2 == 0){
				newWordElemnet = "<tr class='gradeX even'>";
			}
		
			for(var y = 0;y < compareWordList[x].length;y ++){
				
				

					newWordElemnet += "<td>" + compareWordList[x][y] + "</td>"
				
			}
			
			
			$("#done_body").append(newWordElemnet);
			
		}
		
		tbodydis(doneList,compareWordList);
		
		


		
	});
	
	var wordExport = document.getElementById("export_btn");
	wordExport.onclick=function(){
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
        let str = '<tr><td>操作人</td><td>操作</td>'+
        '<td>操作时间</td>'+
        
        '</tr>';
        //循环遍历，每行加入tr标签，每个单元格加td标签
        for(let i = 0 ; i < doneList.length ; i++ ){
        	
          str+='<tr>';
         
          for(let item in doneList[i]){
              //增加\t为了不让表格显示科学计数法或者其他格式
        	  
        		  str+=`<td>${ doneList[i][item] + '\t'}</td>`;
        	  
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
        window.location.href = uri + base64(template)
      }
      //输出base64编码
      function base64 (s) { return window.btoa(unescape(encodeURIComponent(s))) }
});

function compareWord(compareWordList){
	
	var json;
	compareWordList.length=0;
	$.ajax({
		url : "czrz.action", 
		async : false,
		dataType : "json",
		data : {
			"czr":$('#czr').val(),
			"cz":$('#cz').val(),
			"startTime":$('#startTime').val(),
			"endTime":$('#endTime').val(),
		},
		success : function(data) {
		 json=data.list;
		
		}
	});

	for (var i = 0 ; i < json.length ; i ++) {
		var arr1 = [];
		arr1[0] = json[i].czr;
		arr1[1] = json[i].cz;
		arr1[2] = json[i].time;
		
		compareWordList.push(arr1);
	};
	
}	

//表格写入函数带分页
function tbodydis(oldlist,newlist){
	
	if(oldlist == ""){
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
		
	}
	
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
					
               html += "<td>" + newlist[i][j] + "</td>"
				}
			
			}
		}
		done_body.innerHTML = html;

	
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

