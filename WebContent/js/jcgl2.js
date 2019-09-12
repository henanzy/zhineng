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
			url : getRootPath()+"/yhInfo/findYh.action", 
			async : false,
			dataType : "json",
			data : {
				"xqm" : $("#xq").val(),
				"ldh" : $("#ldh").val(),
				"dyh" : $("#dyh").val(),
			},
			success : function(data) {
				var list=data.list;
				
				var row=Math.round(list.length/24)+1;
				console.log(list.length);
				console.log(row);
				var last=list.length%24;
				for(var i=0; i<row ;i++){
					$("#table_body").append("<tr id='"+i+"' class='cellone-body'>" +
							
							"</tr>");
					var a=i*24;
					if(i!=row-1){
						for(var y=0;y<24;y++){
							
							$("#"+i).append("<td><div class='body-hh'>"+list[a+y].HouseNO+"</div><div class='body-mj'>"+list[a+y].HeatArea+"</div><div class='body-lb'>居民</div></td>")
							
							
						}	
					}else{
                       for(var y=0;y<last;y++){
							
							$("#"+i).append("<td><div class='body-hh'>"+list[a+y].HouseNO+"</div><div class='body-mj'>"+list[a+y].HeatArea+"</div><div class='body-lb'>居民</div></td>")
							
							
						}
					}
					
				}
			}

		});
		
	}
$("#search_btn").click(function(){
	$("#table_body").empty();
	search();
		

	});

});






