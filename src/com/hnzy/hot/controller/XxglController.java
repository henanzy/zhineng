package com.hnzy.hot.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hnzy.hot.service.XxglService;
import com.hnzy.hot.service.YxglService;

import net.sf.json.JSONObject;


@Controller
@RequestMapping("xxgl")
public class XxglController {
	@Autowired
	public YxglService yxglService;
	@Autowired
	private XxglService XxglService;
	 @RequestMapping("/caozrz")
 	public String caozrz(){
 		return "ZhiNeng/Shuju/caozrz";
 	}

	@RequestMapping("/guzxx")
	public String guzxx(){
		return "ZhiNeng/Shuju/guzxx";
	}
	@RequestMapping("gzcx")
	@ResponseBody
	public JSONObject gzcx(String xqm,String ldh,String dyh,String hh) throws UnsupportedEncodingException{
		JSONObject json=new JSONObject();
		Map<String, Object> map = new HashMap<String, Object>();
		if(xqm!=null){
			xqm=new String(xqm.getBytes("ISO-8859-1"),"utf-8");
		}
		
		
		map.put("xqm", xqm);
		map.put("ldh", ldh);
		map.put("dyh", dyh);
		map.put("hh", hh);
		json.put("list", XxglService.Search(map));
		return json;
	}
	
	@RequestMapping("/shuakjl")
	    public String shuakjl(){
	    	return "ZhiNeng/Shuju/shuakjl";
	}
	
	@RequestMapping("skxx")
	@ResponseBody
	public JSONObject skxx(String xqm,String ldh,String dyh,String hh,String startTime,String endTime) throws UnsupportedEncodingException{
		JSONObject json=new JSONObject();
		Map<String, Object> map = new HashMap<String, Object>();
		if(xqm!=null){
			xqm=new String(xqm.getBytes("ISO-8859-1"),"utf-8");
		}
		
		
		map.put("xqm", xqm);
		map.put("ldh", ldh);
		map.put("dyh", dyh);
		map.put("hh", hh);
		map.put("startTime", startTime);
		map.put("endTime", endTime);
		json.put("list", XxglService.skxx(map));
		return json;
	}
	
	
	@RequestMapping("czrz")
	@ResponseBody
	public JSONObject czrz(String czr,String cz,String startTime,String endTime) throws UnsupportedEncodingException{
		JSONObject json=new JSONObject();
		Map<String, Object> map = new HashMap<String, Object>();
		if(czr!=null){
			czr=new String(czr.getBytes("ISO-8859-1"),"utf-8");
		}
		
		if(cz!=null){
			cz=new String(cz.getBytes("ISO-8859-1"),"utf-8");
		}
		
		
		map.put("czr", czr);
		map.put("cz", cz);
		map.put("startTime", startTime);
		map.put("endTime", endTime);
		json.put("list", XxglService.czrz(map));
		return json;
	}
	
	
	@RequestMapping("grbzt")
	@ResponseBody
	public JSONObject grbzt(String xqm,String ldh,String dyh) throws UnsupportedEncodingException{
		JSONObject json=new JSONObject();
		Map<String, Object> map = new HashMap<String, Object>();
		if(xqm!=null){
			xqm=new String(xqm.getBytes("ISO-8859-1"),"utf-8");
		}
		
		
		map.put("xqm", xqm);
		map.put("ldh", ldh);
		map.put("dyh", dyh);
		
		json.put("grbzt", XxglService.grbzt(map));
		return json;
	}
	
	@RequestMapping("wdbzt")
	@ResponseBody
	public JSONObject wdbzt(String xqm,String ldh,String dyh) throws UnsupportedEncodingException{
		JSONObject json=new JSONObject();
		Map<String, Object> map = new HashMap<String, Object>();
		if(xqm!=null){
			xqm=new String(xqm.getBytes("ISO-8859-1"),"utf-8");
		}
		
		
		map.put("xqm", xqm);
		map.put("ldh", ldh);
		map.put("dyh", dyh);
		
		json.put("grbzt", XxglService.wdbzt(map));
		return json;
	}
	
	@RequestMapping("kdbzt")
	@ResponseBody
	public JSONObject kdbzt(String xqm,String ldh,String dyh) throws UnsupportedEncodingException{
		JSONObject json=new JSONObject();
		Map<String, Object> map = new HashMap<String, Object>();
		if(xqm!=null){
			xqm=new String(xqm.getBytes("ISO-8859-1"),"utf-8");
		}
		map.put("xqm", xqm);
		map.put("ldh", ldh);
		map.put("dyh", dyh);
		
		json.put("grbzt", XxglService.kdbzt(map));
		return json;
	}
	
	@RequestMapping("xtzl")
	@ResponseBody
	public JSONObject xtzl() throws UnsupportedEncodingException{
		JSONObject json=new JSONObject();
		Map<String, Object> map = new HashMap<String, Object>();
		Integer tqyb=(Integer) yxglService.findSWd().get("Tqyb");
		
		json.put("grmj", XxglService.grmj());
		json.put("gryh", XxglService.gryh());
		json.put("grbl", XxglService.grbl().substring(0, 4)+"%");
		json.put("pjsw", XxglService.pjsw()+"°C");
		json.put("tqyb", tqyb+"°C");
		return json;
	}
	
	@RequestMapping("cgqDz")
	@ResponseBody
	public JSONObject cgqDz() throws UnsupportedEncodingException{
		JSONObject json=new JSONObject();
		json.put("list", XxglService.cgqDz());
		return json;
	}
	
	
	@RequestMapping("DeleteCgqDz")
	@ResponseBody
	public JSONObject DeleteCgqDz(String id) throws UnsupportedEncodingException{
		JSONObject json=new JSONObject();
		 XxglService.DeleteCgqDz(id);
		return json;
	}
}