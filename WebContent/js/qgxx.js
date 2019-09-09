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

	var qgxxList=[];
	function jsArrChange(json){
		for (var i = 0 ; i < json.length ; i ++) {
			var arr1 = [];
			arr1[0] = json[i].ID;
			arr1[1] = json[i].QgID;
			arr1[2] = json[i].JzqID;
			arr1[3] = json[i].XqName;
			arr1[4] = json[i].InstallAd;
			arr1[5] = json[i].QgStatus;
			arr1[6] = json[i].Version;
			arr1[7] = json[i].Mode;
			arr1[8] = json[i].ReadCycle;
			arr1[9] = json[i].VALstID;
			arr1[10] = json[i].VALedID;
			if(json[i].SkqSbh==null){
				arr1[11]=""
			}else{
				arr1[11] = json[i].SkqSbh;
			}
			
			arr1[12] = json[i].Time;
		
			qgxxList.push(arr1);
		};
	}
	jsArrChange(list);
	tbodydis("",qgxxList)
	$("#plkf").click(function(){
		
		 $('input[name="check"]:checked').each(function (index, item) {
			 var row=$(this).parent("td").parent("tr");
			 var td = row.find("td");
			
			 var qgid=td[2].innerHTML;
			 
			 
			          $.ajax({
		                     type: "post",
		                    url: getRootPath()+"/sbglCon/PlKf.action",
		                      dataType:'json',
		                      async:false,
		                  	data:{	
		      					
		      					"qgId":qgid,
		      				},
		                     dataType: "json",
		                      success: function (data) {
		                    	   if(data=="0"){
		                    		   alert("发送成功");
		                    		   location.reload();
		                    	   }else{
		                    		   alert("发送失败 ")
		                    	   }
		                     },
		  
		                 })
		                 
			    });			 
   		              
});
	
	$("#plgf").click(function(){
		 $('input[name="check"]:checked').each(function (index, item) {
			 
			 var row=$(this).parent("td").parent("tr");
			 var td = row.find("td");
			
			 var qgid=td[2].innerHTML;
			 
			 
			          $.ajax({
		                     type: "post",
		                    url: getRootPath()+"/sbglCon/PlGf.action",
		                      dataType:'json',
		                      async:false,
		                  	data:{	
		      					
		      					"qgId":qgid,
		      				},
		                     dataType: "json",
		                      success: function (data) {
		                    	   if(data=="0"){
		                    		   alert("发送成功");
		                    		   location.reload();
		                    	   }else{
		                    		   alert("发送失败 ");
		                    	   }
		                     },
		  
		                 })
		                 
			    });			 
  		              
});	
});


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
		for(var i = 0; i < opt.length; i++) {
			$("#xq").append("<option>"+opt[i]+"</option>");
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
				
				html += "<td><input type='checkbox' value='"+newlist[i][0]+"' name='check'/></td>";
				for (var j = 0 ; j <newlist[i].length ; j ++) {
					if(j==0){

						html += "<td style='display:none;'>" + newlist[i][j] + "</td>";
    					
    				}else{
                  html += "<td>" + newlist[i][j] + "</td>"
    				}
				}
				html += "<td><input class='xinjgd_change'  type='button' value='修改' /><input class='xinjgd_del' type='button' value='删除' /></td></tr>";
			}
		}
		qgxx_body.innerHTML = html;

	
		
	
		var classname = "";
		$("table tbody td").hover(function() {
			classname = $(this).parent().attr("class");
			$(this).parent().removeClass(classname).addClass("blue");
			$("table tbody tr").find('td:eq(' + $(this).index() + ')').addClass('blue')
		}, function() {
			$(this).parent().removeClass("blue").addClass(classname);
			$("table tbody tr").find('td:eq(' + $(this).index() + ')').removeClass('blue')
		});
		
		$("#increase_btn").click(function(){

			$("#increase_word").show();
		});
		//修改按钮
		$(".xinjgd_change").click(function(){
			xin_change(this);
		});
		$(".xinjgd_del").click(function(){
			xin_del(this);
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
	
	
	$("#word_increase_btn").click(function(){
		//获取到新增表单的信息
	alert("增加成功")
		
		/*alert(increaseValue);*/
		$("#increase_word").hide();
	});
	//关闭新增
	$(".close").click(function(){
		$("#increase_word").hide();
		$("#change_word").hide();
	});
	$("#increase_btn").click(function(){

		$("#increase_word").show();
	});
	//修改按钮
	$(".xinjgd_change").click(function(){
		xin_change(this);
	});
	$(".xinjgd_del").click(function(){
		xin_del(this);
	});
	$("#word_change_btn").click(function(){
        alert("修改成功")
		
		/*alert(increaseValue);*/
		$("#change_word").hide(); 
	});
	
	function xin_change(p){
		$("#change_word").show();
		var xintr = $(p).parent().parent().children();
		//修改数据
		var changewordList = [];
		var flag=[0,1,2,3,4,9,10,11]
		for(var x = 0 ; x < 12 ; x ++){
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
			                    url: "Delete.action",
			                      dataType:'json',
			                  	data:{	
			      					"id":id,
			      				},
			                     dataType: "json",
			                      success: function (data) {
			                    	   layer.close(index);
			                          window.location.reload();
			                     },
			  
			                 })
			              });
	}
}
