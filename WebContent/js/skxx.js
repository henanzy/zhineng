 $(document).ready(function(){
//  表格

	var shuakaList=[
		[630001,47200001,"在线","天鹅堡","天鹅堡换热站","无"],
		[630001,47200001,"在线","天鹅堡","天鹅堡换热站","无"],
		[630001,47200001,"在线","天鹅堡","天鹅堡换热站","无"],
		[630001,47200001,"在线","天鹅堡","天鹅堡换热站","无"],
		[630001,47200001,"在线","天鹅堡","天鹅堡换热站","无"],
		[630001,47200001,"在线","天鹅堡","天鹅堡换热站","无"],
		[630001,47200001,"在线","天鹅堡","天鹅堡换热站","无"],
		[630001,47200001,"在线","天鹅堡","天鹅堡换热站","无"],
		[630001,47200001,"在线","天鹅堡","天鹅堡换热站","无"],
		[630001,47200001,"在线","天鹅堡","天鹅堡换热站","无"],
		[630001,47200001,"在线","天鹅堡","天鹅堡换热站","无"],
		[630001,47200001,"在线","天鹅堡","天鹅堡换热站","无"],
		[630001,47200001,"在线","天鹅堡","天鹅堡换热站","无"],
		[630001,47200001,"在线","天鹅堡","天鹅堡换热站","无"],
		[630001,47200001,"在线","天鹅堡","天鹅堡换热站","无"],
		[630001,47200001,"在线","天鹅堡","天鹅堡换热站","无"],
		[630001,47200001,"在线","天鹅堡","天鹅堡换热站","无"],
		[630001,47200001,"在线","天鹅堡","天鹅堡换热站","无"],
		[630001,47200001,"在线","天鹅堡","天鹅堡换热站","无"],
		[630001,47200001,"在线","天鹅堡","天鹅堡换热站","无"],
		[630001,47200001,"在线","天鹅堡","天鹅堡换热站","无"],
		[630001,47200001,"在线","天鹅堡","天鹅堡换热站","无"],
		[630001,47200001,"在线","天鹅堡","天鹅堡换热站","无"]
	];
	
	tbodydis("",shuakaList)
	
	//删除按钮
	$("#del_btn").click(function(){
		var checkBox=  $("input[type='checkbox']:checked");
		if(checkBox.length == 0){
			alert("请勾选信息");
			return;
		}
	});
	
	//新增按钮
	$("#increase_btn").click(function(){
		$("#increase_word").show();
	});

	
	//关闭新增
	$(".close").click(function(){
		$("#increase_word").hide();
		$("#change_word").hide();
	});
	
	//修改按钮
	$("#change_btn").click(function(){
		var arr = [];
		var checkBox=  $("input[type='checkbox']:checked");
		if(checkBox.length != 1){
			alert("请勾选一组信息");
			return;
		}
		checkBox.each(function(i, n){
			var td =  $(this).parent().parent().children();
			for(var i = 1; i < td.length; i ++){
				arr.push(td[i].innerHTML);
			}
		});
		
		change(arr);
	});
	
});
 

//修改
function change(arr){
	$("#change_word").show();
	
	var inpchange = $(".change_word_input");
	for(var i = 0 ; i < inpchange.length ; i++){
		inpchange[i].value = arr[i];
	}
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
		
				html += "<td><input type='checkbox' value='' name='check'/></td>";
				for (var j = 0 ; j <newlist[i].length ; j ++) {
					
                   html += "<td>" + newlist[i][j] + "</td>"
				}
			
			}
		}
		shuaka_body.innerHTML = html;

	
		
	
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
