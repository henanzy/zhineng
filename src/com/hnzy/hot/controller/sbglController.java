package com.hnzy.hot.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hnzy.hot.service.JzqService;
import com.hnzy.hot.service.QgService;
import com.hnzy.hot.service.XxglService;
import com.hnzy.hot.service.YhInfoService;
import com.hnzy.hot.socket.server.ServerHandler;
import com.hnzy.hot.socket.server.ServerSessionMap;
import com.hnzy.hot.socket.util.CzUtil;
import com.hnzy.hot.socket.util.MapUtils;
import com.hnzy.hot.socket.util.MapUtilsDf;
import com.hnzy.hot.util.JSONSerializer;

import net.sf.json.JSONObject;

@RequestMapping("sbglCon")
@Controller
public class sbglController {
	
	@Autowired
	private YhInfoService yhInfoService;
	
	@Autowired
	private QgService qgService;
	
	@Autowired
	private JzqService jzqService;
	
	@Autowired
	private XxglService xxglService;
	
	private final static Logger log = LoggerFactory.getLogger(sbglController.class);
	/*设备管理*/
	@RequestMapping("/shebgl")
	public String sbgl(HttpSession session){
		String type =(String) session.getAttribute("type");
		if("jtyh".equals(type)){
			return "ZhiNeng/shebgl_jt";
		}
		
		return "ZhiNeng/shebgl";
	}
	String param = null;
	
	
	    @RequestMapping("findYh")
		@ResponseBody
		public JSONObject findYh(String xqm,String ldh,String dyh,String hh,String yhfl,String sfjf) throws UnsupportedEncodingException{
			JSONObject json=new JSONObject();
			Map<String, Object> map = new HashMap<String, Object>();
			if(xqm!=null){
				xqm=new String(xqm.getBytes("ISO-8859-1"),"utf-8");
			}
			if(yhfl!=null){
				yhfl=new String(yhfl.getBytes("ISO-8859-1"),"utf-8");
			}
			if(sfjf!=null){
				sfjf=new String(sfjf.getBytes("ISO-8859-1"),"utf-8");
			}
			
			map.put("xqm", xqm);
			map.put("ldh", ldh);
			map.put("dyh", dyh);
			map.put("hh", hh);
			map.put("yhfl", yhfl);
			map.put("sfjf", sfjf);
			String list=JSONSerializer.serialize( yhInfoService.findYh(map));
			json.put("list",list);
			return json;
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

		
		//单元
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
		//查找户号
		@RequestMapping("findHh")
		@ResponseBody
		public JSONObject findHh(Map<String, Object> map) throws UnsupportedEncodingException{
			JSONObject json=new JSONObject();
			//xqm=new String(xqm.getBytes("ISO-8859-1"),"utf-8");
			json.put("Hh", yhInfoService.findHh(map));
			return json;
		}
		
		//更新传感器时间
		@RequestMapping("updateCjqTime")
		@ResponseBody
		public void updateCjqTime(Integer upid,String CjqTime ,String CjqWz){
			yhInfoService.updateCjqTime(upid, CjqTime,CjqWz);
		}
		
		public JSONObject kfm( String fmId, String qgId,int fmkd,String userName) {
			param = "kFm";
			String FsFmkd ;
			MapUtils.getMapUtils().add("param", param);
			MapUtils.getMapUtils().add("kfSuc", fmId);
//			yhInfoService.updateType("操控开",fmId);
			// 把FmID转换为int类型
			int fInteger = Integer.valueOf(fmId);
			// FmID十进制转换为十六进制
			String fmd = Integer.toHexString(fInteger);
			// FmID十进制转换为十六进制
			 FsFmkd = Integer.toHexString(fmkd);
			if(FsFmkd.length()==1){
				FsFmkd="0"+FsFmkd;
				}
			// 区管ID
			String ip = jzqService.findIP(qgService.findJzq(qgId)).get(0).get("JzqIP").toString();  /*fm.getQg().getJzq().getJzqIp();*/
			// 端口号
			String port =jzqService.findIP(qgService.findJzq(qgId)).get(0).get("JzqPort").toString(); /*fm.getQg().getJzq().getJzqPort();*/
			// IP地址和端口号
			String pt = "/" + ip + ":" + port;
			// fmId十进制
			String ja = "F0160900" + qgId + "040" + fmd + "01"+FsFmkd+"FF01FFFFFF";
			log.info("开阀门指令-------------"+ja);
			boolean sessionmap = cz(ja, pt);
			try {
				Thread.sleep(3000);

			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			JSONObject jsonObject = new JSONObject();
			
			if (sessionmap == true &&  MapUtils.getMapUtils().get("kFm")!=null && MapUtils.getMapUtils().get("kFm").equals("success")) {
			
				Date date=new Date();
		    	if(!userName.equals("hnzyxt")){
		    		//日志
		    		Map map= yhInfoService.geidz(fmId);
					xxglService.InsertRz(userName, "开阀门 ：小区"+map.get("XqName")+"楼栋" +map.get("BuildNo")+"单元"+map.get("CellNo")
					+"户号"+map.get("HouseNo"), date);
	             }
				MapUtils.getMapUtils().add("kFm", null);
				MapUtils.getMapUtils().add("sb", null);
				MapUtils.getMapUtils().add("cs", null);
				jsonObject.put("js", "0");
				return jsonObject;
			} else {
				MapUtils.getMapUtils().add("kFm", null);
				MapUtils.getMapUtils().add("sb", null);
				MapUtils.getMapUtils().add("cs", null);
				jsonObject.put("js", "2");
				return jsonObject;
			} 
		}
		String UppWdsd;
		String UppTjzq;
		String UppTjcs;
		@RequestMapping("FsCs")
		@ResponseBody
		public String FsCs(HttpSession session,String fmId, String qgId, String wdsd, String tjzq, String tjcs,String sdbs) throws UnsupportedEncodingException {
			
			String	userName=(String) session.getAttribute("UserName");
			if(userName!=null){
			 userName=new String(userName.getBytes("ISO-8859-1"),"utf-8")+"";
			if(userName.equals("供热一处")||userName.equals("供热二处")|| userName.equals("供热三处")){
				return "5";
			}else {
			if(wdsd!=""&& tjzq!=""&&tjcs!=""){
			// 参数十进制转换为十六进制
			int WDsd=Integer.valueOf(wdsd);
			int TJzq=Integer.valueOf(tjzq);
			int TJcs=Integer.valueOf(tjcs);
			String Wdsd = "00" + Integer.toHexString(WDsd);
			String subwdsd = Wdsd.substring(Wdsd.length() - 2);
			String Tjzq = "00" + Integer.toHexString(TJzq);
			String subtjzq = Tjzq.substring(Tjzq.length() - 2);
			String Tjcs = "00" + Integer.toHexString(TJcs);
			String subtjcs = Tjcs.substring(Tjcs.length() - 2);
			 UppWdsd = CzUtil.Uppercase(subwdsd).toString();
			 UppTjzq = CzUtil.Uppercase(subtjzq).toString();
			 UppTjcs = CzUtil.Uppercase(subtjcs).toString();
			}else{
				UppWdsd="FF";
				UppTjzq="FF";
				UppTjcs="FF";
			}
			param = "FsCs";
			MapUtils.getMapUtils().add("param", param);
			// 根据fmID查找阀门状态
			if(sdbs.equals("02")){
				sdbs="FF";
			}
			// 把FmID转换为int类型
			int fInteger = Integer.valueOf(fmId);
			// FmID十进制转换为十六进制
			String fmd = Integer.toHexString(fInteger);
			String UppFmd = CzUtil.Uppercase(fmd).toString();
			// 区管ID
			String ip = jzqService.findIP(qgService.findJzq(qgId)).get(0).get("JzqIP").toString();  /*fm.getQg().getJzq().getJzqIp();*/
			// 端口号
			String port =jzqService.findIP(qgService.findJzq(qgId)).get(0).get("JzqPort").toString();
			// IP地址和端口号
			String pt = "/" + ip + ":" + port;

			// fmId十进制
			String ja = "F0160900" + qgId + "040" + UppFmd + "FFFF"+sdbs+"FF" + UppWdsd + "" + UppTjzq + "" + UppTjcs;
			log.info("发送参数");
			Map map= yhInfoService.geidz(fmId);
			Date date=new Date();
			xxglService.InsertRz(userName, "发送参数 ：小区"+map.get("XqName")+"楼栋" +map.get("BuildNo")+"单元"+map.get("CellNo")
			+"户号"+map.get("HouseNo"), date);
			boolean sessionmap = cz(ja, pt);
			try {
				Thread.sleep(3000);

			} catch (InterruptedException e) {
				e.printStackTrace();
			}

			if (sessionmap == true &&  MapUtils.getMapUtils().get("FsCs")!=null && MapUtils.getMapUtils().get("FsCs").equals("success")) {
				MapUtils.getMapUtils().add("FsCs", null);
				MapUtils.getMapUtils().add("sb", null);
				MapUtils.getMapUtils().add("cs", null);
				return "0";
			}  else {
				MapUtils.getMapUtils().add("FsCs", null);
				MapUtils.getMapUtils().add("sb", null);
				MapUtils.getMapUtils().add("cs", null);
				return "1";
			}
			}
			}else{
				return "5";
			}

		}
		@RequestMapping("kFm")
		@ResponseBody
		public JSONObject KFm( HttpSession session, String fmId, String qgId,String fmkd) throws UnsupportedEncodingException {
			
			JSONObject kString = null;
			int fmkds=0;
			if(fmkd.equals("")){
				fmkds=255;
			}else{
				 fmkds=Integer.valueOf(fmkd);
			}
			JSONObject jsonObject=new JSONObject();
//			kString = kfm( fmId, qgId,fmkds);
	    	
	    	String	userName=(String) session.getAttribute("UserName");
	    	if(userName!=null){
	    	 userName=new String(userName.getBytes("ISO-8859-1"),"utf-8")+"";

			if(userName.equals("供热一处")||userName.equals("供热二处")||userName.equals("供热三处")){
				jsonObject.put("js", "5");
				return jsonObject;
			}else{
				
			kString = kfm( fmId, qgId,fmkds,userName);
			return kString;
			}

		}else{
			jsonObject.put("js", "5");
			return jsonObject;
		}
		}
		public JSONObject gf(String fmId, String qgId,String userName) {
			param = "gFm";
			MapUtils.getMapUtils().add("param", param);
			MapUtils.getMapUtils().add("gfSuc", fmId);
			// 把FmID转换为int类型
			int fInteger = Integer.valueOf(fmId);
			// FmID十进制转换为十六进制
			String fmd = Integer.toHexString(fInteger);
			// 区管ID
			String ip = jzqService.findIP(qgService.findJzq(qgId)).get(0).get("JzqIP").toString();  
			// 端口号
			String port =jzqService.findIP(qgService.findJzq(qgId)).get(0).get("JzqPort").toString();
			// IP地址和端口号
			
			String pt = "/" + ip + ":" + port;
			// fmId十进制
			String ja = "F0160900" + qgId + "040" + fmd + "00FFFF00FFFFFF";
			log.info("关阀门发送数据-----------"+ja);
			boolean sessionmap = cz(ja, pt);

			try {
				Thread.sleep(3000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			JSONObject jsonObject = new JSONObject();
			if (sessionmap == true && MapUtils.getMapUtils().get("gFm")!=null && MapUtils.getMapUtils().get("gFm").equals("success")) {
				MapUtils.getMapUtils().add("gFm", null);
				MapUtils.getMapUtils().add("cs", null);
				MapUtils.getMapUtils().add("sb", null);
				if(!userName.equals("hnzyxt")){
					//日志
					Map map= yhInfoService.geidz(fmId);
					Date date=new Date();
					xxglService.InsertRz(userName, "关阀门 ：小区"+map.get("XqName")+"楼栋" +map.get("BuildNo")+"单元"+map.get("CellNo")
					+"户号"+map.get("HouseNo"), date);	
			    	}
				jsonObject.put("js", "0");
				return jsonObject;
			}else {
				MapUtils.getMapUtils().add("sb", null);
				MapUtils.getMapUtils().add("gFm", null);
				MapUtils.getMapUtils().add("cs", null);
				
				jsonObject.put("js", "1");
				return jsonObject;
			}

		}
		
		@RequestMapping("gFm")
		@ResponseBody
		public JSONObject gFm( HttpSession session, String fmId, String qgId) throws UnsupportedEncodingException {
			JSONObject kString = null;
			JSONObject jsonObject=new JSONObject();
	    	
	    	String	userName=(String) session.getAttribute("UserName");
	    	if(userName!=null){
	    	 userName=new String(userName.getBytes("ISO-8859-1"),"utf-8")+"";
	    	
			if(userName.equals("供热一处")||userName.equals("供热二处")||userName.equals("供热三处")){
				jsonObject.put("js", "5");
				return jsonObject;
			}else{
			
			kString = gf( fmId, qgId,userName);
			
			return kString;
			}

		}else{
			jsonObject.put("js", "5");
			return jsonObject;
		}
		}
		
		// 读阀
		@ResponseBody
		@RequestMapping("dFm")
		public JSONObject duFm(HttpSession session ,HttpServletRequest request, String fmId, String qgId) {
			MapUtilsDf.getMapUtils().add("dFmParam", fmId);
			
			// 把FmID转换为int类型
			int fInteger = Integer.valueOf(fmId);
			// FmID十进制转换为十六进制
			String fmd = Integer.toHexString(fInteger);
			// 阀门ID
			
			// 区管ID
			String ip = jzqService.findIP(qgService.findJzq(qgId)).get(0).get("JzqIP").toString();  
			// 端口号
			String port =jzqService.findIP(qgService.findJzq(qgId)).get(0).get("JzqPort").toString();
			// // IP地址和端口号
			String pt = "/" + ip + ":" + port;
			// fmId十进制
			String ja = "F00F0400" + qgId + "040" + fmd;
			log.info("读阀门发送数据--------"+ja);
			boolean sessionmap = cz(ja, pt);
			try {
				Thread.sleep(3000);

			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			JSONObject jsonObject = new JSONObject();
			if (sessionmap == true && MapUtilsDf.getMapUtils().get("dFm")!=null && MapUtilsDf.getMapUtils().get("dFm").equals("success")) {
				MapUtilsDf.getMapUtils().add("dFm", null);
				jsonObject.put("js", "0");
				return jsonObject;
			} else {
				MapUtilsDf.getMapUtils().add("dFm", null);
				jsonObject.put("js", "5");
				return jsonObject;
			}

		}
		
		 //修改无线传感器地址
	    @RequestMapping("XCgq")
	    @ResponseBody
	    public String XCgq(HttpSession session, String fmId, String CGQId,String qgId) throws UnsupportedEncodingException{

	    	
			String	userName=(String) session.getAttribute("UserName");
			if(userName!=null){
			if( userName.equals("供热一处")||userName.equals("供热二处")||userName.equals("供热三处")){
				return"5";
			}else {
	    			// 把FmID转换为int类型
	    			int fInteger = Integer.valueOf(fmId);
	    			// FmID十进制转换为十六进制
	    			String fmd = Integer.toHexString(fInteger);
	    			String UppFmd = CzUtil.Uppercase(fmd).toString();
	    			//传感器地址转换为int
	    			int cgqId=Integer.valueOf(CGQId);
	    			//十进制转换为十六进制
	    			String Cgq=Integer.toHexString(cgqId);
	    			// 区管ID
	    			String ip = jzqService.findIP(qgService.findJzq(qgId)).get(0).get("JzqIP").toString();  
	    			// 端口号
	    			String port =jzqService.findIP(qgService.findJzq(qgId)).get(0).get("JzqPort").toString();
	    			// IP地址和端口号
	    			String pt = "/" + ip + ":" + port;

	    			// fmId十进制
	    			String ja = "F0155300"+qgId+"0"+UppFmd+"679A000"+Cgq;
	    			
	    			log.info("修改无线传感器地址发送数据--------"+ja);
	    			
	    			boolean sessionmap = cz(ja, pt);
	    			try {
	    				Thread.sleep(3000);

	    			} catch (InterruptedException e) {
	    				e.printStackTrace();
	    			}
	    			if (sessionmap == true &&  MapUtils.getMapUtils().get("Xcgq")!=null && MapUtils.getMapUtils().get("Xcgq").equals("success")) {
	    				//日志
	    				Map map= yhInfoService.geidz(fmId);
						Date date=new Date();
						xxglService.InsertRz(userName, "修改传感器地址 ：小区"+map.get("XqName")+"楼栋" +map.get("BuildNo")+"单元"+map.get("CellNo")
						+"户号"+map.get("HouseNo"), date);
	    				
						MapUtils.getMapUtils().add("Xcgq", null);
	    				//修改传感器地址成功后更改数据库传感器地址---------------------------------
	    		    	yhInfoService.updateCgqId(CGQId, fmId);
	    				return "0";
	    			} else {
	    				MapUtils.getMapUtils().add("Xcgq", null);
	    				return "1";
	    			}
			}
			}else{
				return"5";
			}
	    }
	    @RequestMapping("cgqads")
		@ResponseBody
		public String cgqads(HttpSession session,String fmId, String qgId) {
			
			// 把FmID转换为int类型
			int fInteger = Integer.valueOf(fmId);
			// FmID十进制转换为十六进制
			String fmd = Integer.toHexString(fInteger);
		
			// 区管ID
			String ip = jzqService.findIP(qgService.findJzq(qgId)).get(0).get("JzqIP").toString();  
			// 端口号
			String port =jzqService.findIP(qgService.findJzq(qgId)).get(0).get("JzqPort").toString();
			// IP地址和端口号
			String pt = "/" + ip + ":" + port;
			String ja = "F0115200" + qgId + "0" + fmd + "679A00";
			log.info("读传感器地址---------"+ja);
			boolean sessionmap = cz(ja, pt);
			try {
				Thread.sleep(4000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}	
			if(sessionmap==true){
				return "0";
			}else{
				return "1";
			}
		}
	    
		@RequestMapping("PlKf")
		@ResponseBody
		public String PlKf(HttpSession session,String qgId) throws UnsupportedEncodingException {
			//日志
			
			
			String userName=(String) session.getAttribute("UserName");
			if(userName!=null){
				userName=new String(userName.getBytes("ISO-8859-1"),"utf-8")+"";
			}
			
			if(userName!=null && userName.equals("供热一处")||userName!=null && userName.equals("供热二处")||userName!=null && userName.equals("供热三处")){
				return "5";
			}else {
			xxglService.InsertRz(userName,"批量开阀门,区管地址为:"+qgId , new Date());
			
			String ip = jzqService.findIP(qgService.findJzq(qgId)).get(0).get("JzqIP").toString();
			String port = jzqService.findIP(qgService.findJzq(qgId)).get(0).get("JzqPort").toString();
			String sta=plKf(ip, port, qgId);
			return sta;
			}

		}

		@RequestMapping("PlGf")
		@ResponseBody
		public String PlGf(HttpSession session,String qgId) throws UnsupportedEncodingException {
			//日志
			
			String userName=(String) session.getAttribute("UserName");
			if(userName!=null){
				userName=new String(userName.getBytes("ISO-8859-1"),"utf-8")+"";
			}
			if(userName!=null && userName.equals("供热一处")||userName!=null && userName.equals("供热二处")||userName!=null && userName.equals("供热三处")){
				return "5";
			}else {
				xxglService.InsertRz(userName,"批量关阀门,区管地址为:"+qgId , new Date());
				String ip = jzqService.findIP(qgService.findJzq(qgId)).get(0).get("JzqIP").toString();
				String port = jzqService.findIP(qgService.findJzq(qgId)).get(0).get("JzqPort").toString();
			String sta= PlGf(ip, port, qgId);
			return sta;
			}
		}
		public String plKf(String ip, String port, String qgId) {
			param = "PlKFm";
			MapUtils.getMapUtils().add("param", param);
			MapUtils.getMapUtils().add("PlKf", qgId);
			// IP地址和端口号
			String pt = "/" + ip + ":" + port;
			
			String ja = "F00B2000" + qgId + "00";
			log.info("批量开阀门发送数据----"+ja);
			boolean sessionmap = cz(ja, pt);
			
			try {
				Thread.sleep(4000);

			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			if (sessionmap == true && MapUtils.getMapUtils().get("PlKFm")!=null && MapUtils.getMapUtils().get("PlKFm").equals("success")) {
				MapUtils.getMapUtils().add("PlKFm", null);
				MapUtils.getMapUtils().add("sb", null);
				MapUtils.getMapUtils().add("cs", null);
				return "0";
			} else if (sessionmap == true && MapUtils.getMapUtils().get("sb")!=null && MapUtils.getMapUtils().get("sb") .equals("fail")
					&& MapUtils.getMapUtils().get("PlKFm") != null) {
				MapUtils.getMapUtils().add("PlKFm", null);
				MapUtils.getMapUtils().add("sb", null);
				MapUtils.getMapUtils().add("cs", null);
				return "2";
			} else if (sessionmap == true && MapUtils.getMapUtils().get("cs")!=null && MapUtils.getMapUtils().get("cs").equals("超时") 
					|| sessionmap == true && MapUtils.getMapUtils().get("PlKFm") == null) {
				MapUtils.getMapUtils().add("PlKFm", null);
				MapUtils.getMapUtils().add("sb", null);
				MapUtils.getMapUtils().add("cs", null);
				return "3";
			} else if (sessionmap == false) {
				MapUtils.getMapUtils().add("PlKFm", null);
				MapUtils.getMapUtils().add("sb", null);
				MapUtils.getMapUtils().add("cs", null);
				
				return "4";
			} else {
				MapUtils.getMapUtils().add("PlKFm", null);
				MapUtils.getMapUtils().add("sb", null);
				MapUtils.getMapUtils().add("cs", null);
				return "1";
			}

		}
		public String PlGf(String ip, String port, String qgId) {
			param = "PlGfm";
			MapUtils.getMapUtils().add("param", param);
			MapUtils.getMapUtils().add("PlGf", qgId);
			// IP地址和端口号
			String pt = "/" + ip + ":" + port;
			String ja = "F00B2100" + qgId + "01";
			log.info("批量关阀门----"+ja);
			boolean sessionmap = cz(ja, pt);
			try {
				Thread.sleep(4000);

			} catch (InterruptedException e) {
				e.printStackTrace();
			}

			if (sessionmap == true  && MapUtils.getMapUtils().get("PlGfm")!=null && MapUtils.getMapUtils().get("PlGfm").equals("success")) {
				MapUtils.getMapUtils().add("PlGfm", null);
				MapUtils.getMapUtils().add("sb", null);
				MapUtils.getMapUtils().add("cs", null);
				return "0";
			} else if (sessionmap == true  && MapUtils.getMapUtils().get("sb")!=null && MapUtils.getMapUtils().get("sb").equals("fail") 
					&& MapUtils.getMapUtils().get("PlGfm") != null) {
				MapUtils.getMapUtils().add("PlGfm", null);
				MapUtils.getMapUtils().add("sb", null);
				MapUtils.getMapUtils().add("cs", null);
				return "2";
			} else if (sessionmap == true   && MapUtils.getMapUtils().get("cs")!=null && MapUtils.getMapUtils().get("cs") .equals("超时")
					|| sessionmap == true && MapUtils.getMapUtils().get("PlGfm") == null) {
				MapUtils.getMapUtils().add("PlGfm", null);
				MapUtils.getMapUtils().add("sb", null);
				MapUtils.getMapUtils().add("cs", null);
				return "3";
			} else if (sessionmap == false) {
				MapUtils.getMapUtils().add("PlGfm", null);
				MapUtils.getMapUtils().add("sb", null);
				MapUtils.getMapUtils().add("cs", null);
				
				return "4";
			} else {
				MapUtils.getMapUtils().add("PlGfm", null);
				MapUtils.getMapUtils().add("sb", null);
				MapUtils.getMapUtils().add("cs", null);
				return "1";
			}
		}
		public boolean cz(String ja, String pt) {

			// 把十六进制数，转换为十进制相加
			int jia = CzUtil.FsZh(ja);
			// 十进制转换为十六进制
			String hex = Integer.toHexString(jia);
			// 截取相加结果后两位
			String je = null;
			for (int j = 0; j < hex.length() - 1; j++) {
				je = hex.charAt(hex.length() - 2) + "" + hex.charAt(hex.length() - 1);
			}
			String[] keys = new String[] { pt };
			String mString = ja + je + "FF";
			// 解码
			byte[] b = CzUtil.jm(mString);
			ServerSessionMap sessionMap = ServerSessionMap.getInstance();
			boolean sessionmap = sessionMap.sendMessage(keys, b);
			return sessionmap;

		}
		
		@RequestMapping("ssj")
		@ResponseBody
		public String ssj(HttpSession session,String qgId) {
			String ip = jzqService.findIP(qgService.findJzq(qgId)).get(0).get("JzqIP").toString();
			String port = jzqService.findIP(qgService.findJzq(qgId)).get(0).get("JzqPort").toString();
			String  pString = sj(ip, port, qgId);
			return pString;
		}
		public String sj(String ip, String port, String qgId) {
			boolean sessionmap = false;
			MapUtilsDf.getMapUtils().add("PlDF", "sj");
//			 IP地址和端口号
			String pt = "/" + ip + ":" + port;
			// fmId十进制
			String ja = "F00A0800" + qgId;
		    log.info("批量读阀门----"+ja);
			sessionmap = cz(ja, pt);
			
			try {
				Thread.sleep(4000);
			} catch (InterruptedException e1) {
				e1.printStackTrace();
			}
			if (sessionmap == true && MapUtilsDf.getMapUtils().get("PldFm")!=null && MapUtilsDf.getMapUtils().get("PldFm").equals("success")) {
				MapUtils.getMapUtils().add("PldFm", null);
				MapUtils.getMapUtils().add("dFm", null);
				return "0";
			}else if (sessionmap == true && MapUtils.getMapUtils().get("dFm")!=null && MapUtils.getMapUtils().get("dFm").equals("fail")) {
				MapUtils.getMapUtils().add("PldFm", null);
				MapUtils.getMapUtils().add("dFm", null);
				return "1";
			} else if (sessionmap == false) {
				
				return "3";
			}else{
				MapUtils.getMapUtils().add("PldFm", null);
				MapUtils.getMapUtils().add("dFm", null);
				return "2";
			}
			
		}
}
