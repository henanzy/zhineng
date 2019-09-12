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
										s=list.length-1;
										
									}else{
										s=y+size;
									}
									console.log(s+" "+list.length)
									
									console.log(list[s].HouseNO);
									
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
													$("#"+dy[i].CellNo+"_"+y).append("<td><div class='body-hh'>"+Clist[z].HouseNO+"</div><div class='body-mj'>"+Clist[z].HeatArea+"</div><div class='body-lb'>居民</div></td>")
												}
											}

										});
								}
							}

						});
						$("#"+dy[i].CellNo).prepend("<tr class='cellone-head'><td colspan='2'>"+dy[i].CellNo+"</td></tr>") 
					}	
				}

			});
		
	}
$("#search_btn").click(function(){
	$("#table_body").empty();
	search();
	});

});






