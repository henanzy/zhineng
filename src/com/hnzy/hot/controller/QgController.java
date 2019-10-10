package com.hnzy.hot.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hnzy.hot.service.QgService;

import net.sf.json.JSONObject;


@Controller
@RequestMapping("qg")
public class QgController {
	@Autowired
	private QgService qgService;

	@RequestMapping("/qugxx")
    public String qugxx(HttpSession session){
		String type =(String) session.getAttribute("type");
		if("jtyh".equals(type)){
			return "ZhiNeng/shebei/qugxx_jt";
		}
    	return "ZhiNeng/shebei/qugxx";
    }
	
	@RequestMapping("find")
	@ResponseBody
	public JSONObject findXq(){
		JSONObject json=new JSONObject();
		
		json.put("list", qgService.find());
		return json;
	}
	
	@RequestMapping("Insert")
	
	public String Insert(String qgID,String jzqID,String xqName,String vALstID,String vALedID,String installAd,String SkqSbh,String skqWz){
		
	Map<String, Object> map =new  HashMap<String, Object>();
	map.put("qgID", qgID);
	map.put("jzqID", jzqID);
	if(xqName!=null){
		map.put("xqName", xqName);
	}
	
	map.put("vALstID", vALstID);
	map.put("vALedID", vALedID);
	map.put("installAd", installAd);
	map.put("SkqSbh", SkqSbh);
	map.put("skqWz", skqWz);
	qgService.Insert(map);
		return "redirect:qugxx.action";
		
	}
	
@RequestMapping("Update")
	
	public String Update(String qgID,String jzqID,String xqName,String vALstID,String vALedID,String installAd,String id,String SkqSbh,String skqWz){
		
	Map<String, Object> map =new  HashMap<String, Object>();
	map.put("qgID", qgID);
	map.put("jzqID", jzqID);
	if(xqName!=null){
		map.put("xqName", xqName);
	}
	
	map.put("vALstID", vALstID);
	map.put("vALedID", vALedID);
	map.put("installAd", installAd);
	map.put("SkqSbh", SkqSbh);
	map.put("skqWz", skqWz);
	map.put("id", id);
	qgService.Update(map);
		return "redirect:qugxx.action";
		
	}

@RequestMapping("Delete")
@ResponseBody
public JSONObject Delete(String id){
	JSONObject json=new JSONObject();
	
	qgService.Delete(id);
	return json;
}
}