package com.hnzy.hot.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hnzy.hot.service.JzqService;

import net.sf.json.JSONObject;


@Controller
@RequestMapping("jzq")
public class JzqController {
	@Autowired
	private JzqService jzqService;

	@RequestMapping("/jizqxx")
    public String jizqxx(HttpSession session){
		String type =(String) session.getAttribute("type");
		if("jtyh".equals(type)){
			return "ZhiNeng/shebei/jizqxx_jt";
		}
    	return "ZhiNeng/shebei/jizqxx";
    }
	
	@RequestMapping("find")
	@ResponseBody
	public JSONObject findXq(){
		JSONObject json=new JSONObject();
		
		json.put("list", jzqService.find());
		return json;
	}
	
	@RequestMapping("Insert")
	
	public String Insert(String JzqID,String JzqIp,String JzqPort,String XqName,String HESName,String InstallAd){
		
	Map<String, Object> map =new  HashMap<String, Object>();
	map.put("JzqID", JzqID);
	map.put("JzqIp", JzqIp);
	if(XqName!=null){
		map.put("XqName", XqName);
	}
	map.put("JzqPort", JzqPort);
	map.put("HESName", HESName);
	map.put("InstallAd", InstallAd);
	
	jzqService.Insert(map);
		return "redirect:jizqxx.action";
		
	}
	
@RequestMapping("Update")
	
	public String Update(String JzqID,String JzqIp,String JzqPort,String XqName,String HESName,String InstallAd,String id){
		
	Map<String, Object> map =new  HashMap<String, Object>();
	map.put("JzqID", JzqID);
	map.put("JzqIp", JzqIp);
	if(XqName!=null){
		map.put("XqName", XqName);
	}
	
	map.put("JzqPort", JzqPort);
	map.put("HESName", HESName);
	map.put("InstallAd", InstallAd);
	map.put("id", id);
	jzqService.Update(map);
		return "redirect:jizqxx.action";
		
	}

@RequestMapping("Delete")
@ResponseBody
public JSONObject Delete(String id){
	JSONObject json=new JSONObject();
	
	jzqService.Delete(id);
	return json;
}
}