package com.hnzy.hot.controller;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hnzy.hot.service.YxglService;
import com.hnzy.hot.util.JSONSerializer;

@Controller
@RequestMapping("YxglCon")
public class YxglController {
	@Autowired
	public YxglService yxglService;
	
	//运行管理

	@RequestMapping("/dashboard")
	public String dashboard(HttpServletRequest request){
	//供热用户
	Integer grYh=(Integer) yxglService.findGrYh().get("GrYh");
	//室外天气
	Integer tqyb=(Integer) yxglService.findSWd().get("Tqyb");
	//供热面积
	Float grmj= yxglService.findGrMj();
	//未供热面积
	Integer wgrYh=(Integer) yxglService.findWGrYh().get("HeatArea");
	//平均室温
	String avgroom="";
	if(yxglService.findAvgRoom()!=null){
		avgroom=(String.format("%.2f",(BigDecimal) yxglService.findAvgRoom().get("RoomTemp")));
	}
	 String findXqAvgKd="";
	 if(yxglService.findXqAvgKd()!=null&&"".equals(yxglService.findXqAvgKd())==false){
		  findXqAvgKd = JSONSerializer.serialize(yxglService.findXqAvgKd());
	 }
	 String findXqAvgWd = "";
	 if(yxglService.findXqAvgWd()!=null&&"".equals(yxglService.findXqAvgWd())==false){
		 findXqAvgWd = JSONSerializer.serialize(yxglService.findXqAvgWd());
	 }
	
	
	
	
	request.setAttribute("findXqAvgKd", findXqAvgKd);
	request.setAttribute("findXqAvgWd", findXqAvgWd);
	request.setAttribute("grYh", grYh);
	request.setAttribute("tqyb", tqyb);
	Integer grzb=0;
	if(grmj!=null){
		grzb=(int) (grmj*100);
	}
	
	request.setAttribute("grmj", grzb);
	request.setAttribute("wgryh",wgrYh);
	request.setAttribute("avgroom", avgroom);

		return "ZhiNeng/yxgl";
	}
	
	
	
}
