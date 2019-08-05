package com.hnzy.hot.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hnzy.hot.service.YhInfoService;

import net.sf.json.JSONObject;


@Controller
@RequestMapping("yhInfo")
public class YhInfoController {
	@Autowired
	private YhInfoService yhInfoService;

	@RequestMapping("findXq")
	@ResponseBody
	public JSONObject findXq(){
		JSONObject json=new JSONObject();
		
		json.put("Xq", yhInfoService.findXq());
		return json;
	}
	
	@RequestMapping("/yezxx")
    public String yezxx(){
    	return "ZhiNeng/yonghu/yezxx";
    }
	//查询楼栋
	@RequestMapping("findLd")
	@ResponseBody
	public JSONObject findLd(String xqm) throws UnsupportedEncodingException{
		JSONObject json=new JSONObject();
		Map<String, Object> map = new HashMap<String, Object>();
		xqm=new String(xqm.getBytes("ISO-8859-1"),"utf-8");
		
		map.put("xqm", xqm);
		json.put("Ld", yhInfoService.findLd(map));
		return json;
	}

	
	
	@RequestMapping("findDy")
	@ResponseBody
	public JSONObject findDy(String xqm,String ldh) throws UnsupportedEncodingException{
		JSONObject json=new JSONObject();
		//xqm=new String(xqm.getBytes("ISO-8859-1"),"utf-8");
		Map<String, Object> map = new HashMap<String, Object>();
		xqm=new String(xqm.getBytes("ISO-8859-1"),"utf-8");
		map.put("xqm", xqm);
		map.put("ldh", ldh);
		
		json.put("Dy", yhInfoService.findDy(map));
		return json;
	}
	
	@RequestMapping("findHh")
	@ResponseBody
	public JSONObject findHh(Map<String, Object> map) throws UnsupportedEncodingException{
		JSONObject json=new JSONObject();
		//xqm=new String(xqm.getBytes("ISO-8859-1"),"utf-8");
		json.put("Hh", yhInfoService.findHh(map));
		return json;
	}
	
	@RequestMapping("/xiaoqxx")
    public String xiaoqxx(){
    	return "ZhiNeng/yonghu/xiaoqxx";
    }
	
	
	@RequestMapping("find")
	@ResponseBody
	public JSONObject find(){
		JSONObject json=new JSONObject();
		
		json.put("list", yhInfoService.find());
		return json;
	}
	
	@RequestMapping("InsertXq")
	
	public String InsertXq(String XqName,String LxrName,String LxrPhone,
			String NHPrice,String AreaPrice1,String AreaPrice2,String HESName,String Jd,String Wd,String Place){
		
	Map<String, Object> map =new  HashMap<String, Object>();
	map.put("LxrName", LxrName);
	map.put("LxrPhone", LxrPhone);
	if(XqName!=null){
		map.put("XqName", XqName);
	}
	
	
	map.put("NHPrice", NHPrice);
	map.put("AreaPrice1", AreaPrice1);
	map.put("AreaPrice2", AreaPrice2);
	map.put("HESName", HESName);
	map.put("Jd", Jd);
	map.put("Wd", Wd);
	map.put("Place", Place);
	yhInfoService.InsertXq(map);
		return "redirect:xiaoqxx.action";
		
	}
	
@RequestMapping("UpdateXq")
	
	public String UpdateXq(String XqName,String LxrName,String LxrPhone,
			String NHPrice,String AreaPrice1,String AreaPrice2,String HESName,String Jd,String Wd,String Place,String id){
		
	Map<String, Object> map =new  HashMap<String, Object>();
	map.put("LxrName", LxrName);
	map.put("LxrPhone", LxrPhone);
	if(XqName!=null){
		map.put("XqName", XqName);
	}
	
	
	map.put("NHPrice", NHPrice);
	map.put("AreaPrice1", AreaPrice1);
	map.put("AreaPrice2", AreaPrice2);
	map.put("HESName", HESName);
	map.put("Jd", Jd);
	map.put("Wd", Wd);
	map.put("Place", Place);
	map.put("id", id);
	System.out.println("id"+id+"    xq"+XqName);
	yhInfoService.UpdateXq(map);
		return "redirect:xiaoqxx.action";
		
	}

   @RequestMapping("DeleteXq")
   @ResponseBody
   public JSONObject DeleteXq(String id){
	JSONObject json=new JSONObject();
	
	yhInfoService.DeleteXq(id);
	return json;
   }
   
   @RequestMapping("findYh")
	@ResponseBody
	public JSONObject findYh(String xqm,String ldh,String dyh,String hh,String yhfl,String FamKd1,String FamKd2,String RoomTemp1,
			String RoomTemp2,String ValTemp1,String ValTemp2) throws UnsupportedEncodingException{
		JSONObject json=new JSONObject();
		Map<String, Object> map = new HashMap<String, Object>();
		if(xqm!=null){
			xqm=new String(xqm.getBytes("ISO-8859-1"),"utf-8");
		}
		if(yhfl!=null){
			yhfl=new String(yhfl.getBytes("ISO-8859-1"),"utf-8");
		}
		
		
		map.put("xqm", xqm);
		map.put("ldh", ldh);
		map.put("dyh", dyh);
		map.put("hh", hh);
		map.put("yhfl", yhfl);
		map.put("FamKd1", FamKd1);
		map.put("FamKd2", FamKd2);
		map.put("RoomTemp1", RoomTemp1);
		map.put("RoomTemp2", RoomTemp2);
		map.put("ValTemp1", ValTemp1);
		map.put("ValTemp2", ValTemp2);
		
		
		json.put("list", yhInfoService.findYh(map));
		return json;
	}
   
   
   @RequestMapping("InsertYh")
	
	public String InsertYh(String YhName,String XqName,String BuildNO,String yhfl,
			String CellNO,String HouseNO,String ValAd,String Bz,String QgID){
		
	Map<String, Object> map =new  HashMap<String, Object>();
	map.put("YhName", YhName);
	map.put("XqName", XqName);
	
	map.put("BuildNO", BuildNO);
	map.put("yhfl", yhfl);
	
	
	map.put("CellNO", CellNO);
	map.put("HouseNO", HouseNO);
	map.put("ValAd", ValAd);
	map.put("Bz", Bz);
	Map<String, Object> map1 =new  HashMap<String, Object>();
	map1.put("ValAd", ValAd);
	map1.put("QgID", QgID);
	yhInfoService.InsertYh(map);
	yhInfoService.InsertFm(map1);
		return "redirect:yezxx.action";
		
	}
   
   
   @RequestMapping("UpdateYh")
	
	public String UpdateYh(String YhName,String XqName,String BuildNO,String yhfl,
			String CellNO,String HouseNO,String ValAd,String Bz,String QgID,String id){
		
	Map<String, Object> map =new  HashMap<String, Object>();
	map.put("YhName", YhName);
	map.put("XqName", XqName);
	
	map.put("BuildNO", BuildNO);
	
	map.put("yhfl", yhfl);
	
	map.put("CellNO", CellNO);
	map.put("HouseNO", HouseNO);
	map.put("ValAd", ValAd);
	map.put("id", id);
	map.put("Bz", Bz);
	Map<String, Object> map1 =new  HashMap<String, Object>();
	map1.put("ValAd", ValAd);
	map1.put("QgID", QgID);
	yhInfoService.UpdateYh(map);
	yhInfoService.UpdateFm(map1);
		return "redirect:yezxx.action";
		
	}
   
   
   @RequestMapping("findFm")
	@ResponseBody
	public JSONObject findFm(String ValAd) throws UnsupportedEncodingException{
		JSONObject json=new JSONObject();
		
			json.put("flag", yhInfoService.findFm(ValAd));
		
		
		return json;
	}
   
   @RequestMapping("DeleteYh")
   @ResponseBody
   public JSONObject DeleteYh(String id){
	JSONObject json=new JSONObject();
	
	yhInfoService.DeleteYh(id);
	yhInfoService.DeleteFm(id);
	return json;
   }
   
   @RequestMapping("findFmLs")
   @ResponseBody
	public JSONObject findFmLs(String xqm,String ldh,String dyh,String hh) throws UnsupportedEncodingException{
		JSONObject json=new JSONObject();
		Map<String, Object> map = new HashMap<String, Object>();
		if(xqm!=null){
			xqm=new String(xqm.getBytes("ISO-8859-1"),"utf-8");
		}
		
		
		map.put("xqm", xqm);
		map.put("ldh", ldh);
		map.put("dyh", dyh);
		map.put("hh", hh);
		json.put("fmls", yhInfoService.findFmLs(map));
		
		json.put("gdls", yhInfoService.gdjl(map));
		return json;
	}
   
   
   @RequestMapping("findFmkdLs")
   @ResponseBody
	public JSONObject findFmkdLs(String xqm,String ldh,String dyh,String hh) throws UnsupportedEncodingException{
		JSONObject json=new JSONObject();
		Map<String, Object> map = new HashMap<String, Object>();
		if(xqm!=null){
			xqm=new String(xqm.getBytes("ISO-8859-1"),"utf-8");
		}
		
		
		map.put("xqm", xqm);
		map.put("ldh", ldh);
		map.put("dyh", dyh);
		map.put("hh", hh);
		
		json.put("list", yhInfoService.findFmkdLs(map));
		
		
		return json;
	}
   
   
   @RequestMapping("findXqKdLs")
   @ResponseBody
	public JSONObject findKdLs(String xqm,String startTime,String endTime) throws UnsupportedEncodingException{
		JSONObject json=new JSONObject();
		Map<String, Object> map = new HashMap<String, Object>();
		if(xqm!=null){
			xqm=new String(xqm.getBytes("ISO-8859-1"),"utf-8");
		}
		
		
		map.put("xqm", xqm);
		map.put("startTime", startTime);
		map.put("endTime", endTime);
		
		json.put("list", yhInfoService.findKdLs(map));
		
		
		return json;
	}
   
   @RequestMapping("findAllKdLs")
   @ResponseBody
	public JSONObject findAllKdLs(String startTime,String endTime) throws UnsupportedEncodingException{
	   JSONObject json=new JSONObject();
		Map<String, Object> map = new HashMap<String, Object>();
	List<Map<String, Object>> list = yhInfoService.findXq();
	List<List<Map<String, Object>>> xqkdList=new ArrayList<List<Map<String, Object>>>();
	for (int i = 0; i < list.size(); i++) {
		map.clear();
		map.put("xqm", list.get(i).get("XqName"));
		map.put("startTime", startTime);
		map.put("endTime", endTime);
		Map<Object, Object> xqavg = new HashMap<>();
		
		xqkdList.add(yhInfoService.findKdLs(map));
	}
		json.put("xqkdList", xqkdList);
		
		
		return json;
	}
   
   @RequestMapping("findHisAvg")
   @ResponseBody
	public JSONObject findHisAvg(String xqm,String startTime,String endTime) throws UnsupportedEncodingException{
		JSONObject json=new JSONObject();
		Map<String, Object> map = new HashMap<String, Object>();
		if(xqm!=null){
			xqm=new String(xqm.getBytes("ISO-8859-1"),"utf-8");
		}
		
		
		map.put("xqm", xqm);
		map.put("startTime", startTime);
		map.put("endTime", endTime);
		
		json.put("list", yhInfoService.findHisAvg(map));
		
		
		return json;
	}
   @RequestMapping("findAllAvg")
   @ResponseBody
	public JSONObject findAllAvg(String startTime,String endTime) throws UnsupportedEncodingException{
		JSONObject json=new JSONObject();
		Map<String, Object> map = new HashMap<String, Object>();
	List<Map<String, Object>> list = yhInfoService.findXq();
	List<List<Map<String, Object>>> xqavgList=new ArrayList<List<Map<String, Object>>>();
	for (int i = 0; i < list.size(); i++) {
		map.clear();
		map.put("xqm", list.get(i).get("XqName"));
		map.put("startTime", startTime);
		map.put("endTime", endTime);
		Map<Object, Object> xqavg = new HashMap<>();
		
		xqavgList.add(yhInfoService.findHisAvg(map));
	}
		json.put("xqavgList", xqavgList);
		
		
		return json;
	}
   
   @RequestMapping("findTc")
	@ResponseBody
	public JSONObject findTc(String xqm,String ldh,String dyh,String hh) throws UnsupportedEncodingException{
		JSONObject json=new JSONObject();
		Map<String, Object> map = new HashMap<String, Object>();
		if(xqm!=null){
			xqm=new String(xqm.getBytes("ISO-8859-1"),"utf-8");
		}
		map.put("xqm", xqm);
		map.put("ldh", ldh);
		map.put("dyh", dyh);
		if(hh!=null){
			if(hh.length()==3){
				hh=hh.substring(0, 1);
			}else{
				hh=hh.substring(0, 2);
			}
		}		
		map.put("hh", hh);

		json.put("list", yhInfoService.findTc(map));
		return json;
	}
   
   @RequestMapping("szt")
	@ResponseBody
	public JSONObject szt(){
		JSONObject json=new JSONObject();
		
		json.put("list", yhInfoService.szt(null));
		return json;
	}
   
   
   @RequestMapping("getDz")
   @ResponseBody
	public JSONObject getDz(String ValAd) throws UnsupportedEncodingException{
		JSONObject json=new JSONObject();
		json.put("map", yhInfoService.geidz(ValAd));
		
		
		return json;
	}
   
}