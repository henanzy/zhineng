function getRootPath(){      
	var curWwwPath=window.document.location.href;      
    var pathName=window.document.location.pathname;      
    var pos=curWwwPath.indexOf(pathName); 
    var localhostPaht=curWwwPath.substring(0,pos);      
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);      
    return(localhostPaht+projectName);  
} 

$(document).ready(function(){
	
	
	
	
	
	function search(){
		var xq = $('#xq').val();
		var ld = $('#ldh').val();
		var dy = $('#dyh').val();
		var hh = $('#hh').val();
		if(ld==""){
			alert("请选择楼栋")
			return;
		}
		 $.ajax({
				url : getRootPath()+"/yhInfo/findDy.action", 
				async : false,
				dataType : "json",
				data : {
					"xqm" : $("#xq").val(),
					"ldh" : $("#ldh").val(),
				},
				success : function(data) {
					$("#dyh option:gt(0)").remove();
					$("#hh option:gt(0)").remove();
					var dy=data.Dy;
					for(var i=0; i<dy.length; i++){
						
						/*$("#dyh").append("<option value='"+dy[i].CellNo+"'>"+dy[i].CellNo+"</option>");*/
						$("#table_body").append("<table border='1' cellspacing='0' cellpadding='0'>" +
								"<tbody class='cellone' id='"+dy[i].CellNo+"'>" +
								
										"</tbody></table>");
						$.ajax({
							url : getRootPath()+"/yhInfo/findYh.action", 
							async : false,
							dataType : "json",
							data : {
								"xqm" : $("#xq").val(),
								"ldh" : $("#ldh").val(),
								"dyh" : dy[i].CellNo,
							},
							success : function(data) {
								var list=data.list;
								var size=0;
								
								for(var y=0; y<list.length; y=y+size){
									/*$("#"+dy[i].CellNo).append("<tr class='cellone-body'>" +
											"<td><div class='body-hh'>"+list[y].HouseNO+"</div><div class='body-mj'>"+list[y].HeatArea+"</div><div class='body-lb'>居民</div></td>" +
											"<td><div class='body-hh'>"+list[y+1].HouseNO+"</div><div class='body-mj'>"+list[y+1].HeatArea+"</div><div class='body-lb'>居民</div></td>" +
											"</tr>");*/
									var s;
									if(y+size>=list.length){
										return;
										
									}else{
										s=y+size;
									}
									
									
									 $.ajax({
											url : getRootPath()+"/yhInfo/findTc.action", 
											async : false,
											dataType : "json",
											data : {
												"xqm" : $("#xq").val(),
												"ldh" : $("#ldh").val(),
												"dyh" : dy[i].CellNo,
												"hh" : list[s].HouseNO,
											},
											success : function(data) {
												var Clist=data.list;
												size=Clist.length;
												$("#"+dy[i].CellNo).prepend("<tr class='cellone-body' id='"+dy[i].CellNo+"_"+y+"'></tr>");
												for(var z=0; z<Clist.length; z++){
													/*$("#"+dy[i].CellNo+"_"+y).append("<td><div class='body-hh'>"+Clist[z].HouseNO+"</div><div class='body-mj'>"+Clist[z].HeatArea+"</div><div class='body-lb'>居民</div></td>")*/
													var hh="";
													
													if(Clist[z].SFJF=="是"){
														hh="<th colspan='2' style='font-weight:bold;background-color:#33FF33;'>"+Clist[z].HouseNO+"</th>"
													}else{
														hh="<th colspan='2' style='font-weight:bold;'>"+Clist[z].HouseNO+"</th>"
													}
													var wd=""
														if(Clist[z].SFJF=="是"&&Clist[z].RoomTemp<18){
															wd=" <th rowspan='2' style='background-color:red;width:68px;font-size:16px;'>"+Clist[z].RoomTemp+"℃</th> <th>"+Clist[z].ValTemp+"℃</th>"
														}else{
															wd=" <th rowspan='2' style='width:68px;font-size:16px;'>"+Clist[z].RoomTemp+"℃</th> <th>"+Clist[z].ValTemp+"℃</th>"
														}
													$("#"+dy[i].CellNo+"_"+y).append("<td><table style='width:100px'><tr>" +
															hh +
															"</tr><tr>" +
															wd +
															" </tr><tr>" +
															"<th>"+Clist[z].FamKd+"%</th>" +
															" </tr></table></td>")
												}
											}

										});
								}
							}

						});
						$("#"+dy[i].CellNo).prepend("<tr class='cellone-head'><td colspan='2'>"+dy[i].CellNo+"单元</td></tr>") 
					}	
				}

			});
		
	}
$("#search_btn").click(function(){
	$("#table_body").empty();
	search();
	});
search();
});






