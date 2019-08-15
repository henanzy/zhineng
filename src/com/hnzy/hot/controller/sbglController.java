package com.hnzy.hot.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hnzy.hot.service.JzqService;
import com.hnzy.hot.service.QgService;
import com.hnzy.hot.service.XxglService;
import com.hnzy.hot.service.YhInfoService;
import com.hnzy.hot.socket.server.ServerSessionMap;
import com.hnzy.hot.socket.util.CzUtil;
import com.hnzy.hot.socket.util.MapUtils;
import com.hnzy.hot.socket.util.MapUtilsDf;
import com.hnzy.hot.util.JSONSerializer;

import net.sf.json.JSONObject;
import net.sf.json.util.NewBeanInstanceStrategy;

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
		public JSONObject findYh(String xqm,String ldh,String dyh,String hh,String yhfl) throws UnsupportedEncodingException{
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
		
		
		public JSONObject kfm( String fmId, String qgId,int fmkd) {
			param = "kFm";
			String FsFmkd ;
			MapUtils.getMapUtils().add("param", param);
			MapUtils.getMapUtils().add("kfSuc", fmId);
			yhInfoService.updateType("操控开",fmId);
			// 根据阀门查找信息
			/*fm = fmService.findbyVad(fmId);
			//更新控制人员开
			
			int buildNo = fm.getYh().getBuildNO();
			int cellNo = fm.getYh().getCellNO();
			int houseNo = fm.getYh().getHouseNO();*/
			// 把FmID转换为int类型
			int fInteger = Integer.valueOf(fmId);
			// FmID十进制转换为十六进制
			String fmd = Integer.toHexString(fInteger);
			// FmID十进制转换为十六进制
			 FsFmkd = Integer.toHexString(fmkd);
			if(FsFmkd.length()==1){
				FsFmkd="0"+FsFmkd;
				}
			// 阀门ID
			/*fm = fmService.findJzq(fmId);*/
			// 区管ID
			String ip = jzqService.findIP(qgService.findJzq(qgId)).get(0).get("JzqIP").toString();  /*fm.getQg().getJzq().getJzqIp();*/
			// 端口号
			String port =jzqService.findIP(qgService.findJzq(qgId)).get(0).get("JzqPort").toString(); /*fm.getQg().getJzq().getJzqPort();*/
			// IP地址和端口号
			String pt = "/" + ip + ":" + port;
			// fmId十进制
			String ja = "F0160900" + qgId + "040" + fmd + "01"+FsFmkd+"FF01FFFFFF";
			System.out.println(pt);
			System.out.println(ja);
			boolean sessionmap = cz(ja, pt);
			try {
				Thread.sleep(3000);

			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			JSONObject jsonObject = new JSONObject();
			
			if (sessionmap == true &&  MapUtils.getMapUtils().get("kFm")!=null && MapUtils.getMapUtils().get("kFm").equals("success")) {
				MapUtils.getMapUtils().add("kFm", null);
				MapUtils.getMapUtils().add("sb", null);
				MapUtils.getMapUtils().add("cs", null);
				jsonObject.put("js", "0");
				//jsonObject.put("fmId", "阀门号:" + fmId + "楼栋号:" + buildNo + "单元号:" + cellNo + "户号:" + houseNo);
				
				return jsonObject;
			} else {
				MapUtils.getMapUtils().add("kFm", null);
				MapUtils.getMapUtils().add("sb", null);
				MapUtils.getMapUtils().add("cs", null);
				jsonObject.put("js", "2");
				//jsonObject.put("fmId", "阀门号:" + fmId + "楼栋号:" + buildNo + "单元号:" + cellNo + "户号:" + houseNo);
				return jsonObject;
			} 
		}
		String UppWdsd;
		String UppTjzq;
		String UppTjcs;
		@RequestMapping("FsCs")
		@ResponseBody
		public String FsCs(HttpSession session,String fmId, String qgId, String wdsd, String tjzq, String tjcs,String sdbs) throws UnsupportedEncodingException {
			
			//日志
			
			String	userName=(String) session.getAttribute("userName");
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
			// 阀门ID
			
			// 区管ID
			String ip = jzqService.findIP(qgService.findJzq(qgId)).get(0).get("JzqIP").toString();  /*fm.getQg().getJzq().getJzqIp();*/
			// 端口号
			String port =jzqService.findIP(qgService.findJzq(qgId)).get(0).get("JzqPort").toString();
			// IP地址和端口号
			String pt = "/" + ip + ":" + port;

			// fmId十进制
			String ja = "F0160900" + qgId + "040" + UppFmd + "FFFF"+sdbs+"FF" + UppWdsd + "" + UppTjzq + "" + UppTjcs
					+ "";
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
			kString = kfm( fmId, qgId,fmkds);
	    	
	    	String	userName=(String) session.getAttribute("userName");
	    	if(userName!=null){
	    	 userName=new String(userName.getBytes("ISO-8859-1"),"utf-8")+"";
	    	if(!userName.equals("hnzyxt")){
	    		
			
	    	}
			if(userName.equals("供热一处")||userName.equals("供热二处")||userName.equals("供热三处")){
				jsonObject.put("js", "5");
				return jsonObject;
			}else{
				Map map= yhInfoService.geidz(fmId);
				Date date=new Date();
				xxglService.InsertRz(userName, "开阀门 ：小区"+map.get("XqName")+"楼栋" +map.get("BuildNo")+"单元"+map.get("CellNo")
				+"户号"+map.get("HouseNo"), date);
			kString = kfm( fmId, qgId,fmkds);
			return kString;
			}

		}else{
			jsonObject.put("js", "5");
			return jsonObject;
		}
		}
		public JSONObject gf(String fmId, String qgId) {
			param = "gFm";
			MapUtils.getMapUtils().add("param", param);
			MapUtils.getMapUtils().add("gfSuc", fmId);
			// 根据阀门查找信息
			
			
			// 把FmID转换为int类型
			int fInteger = Integer.valueOf(fmId);
			// FmID十进制转换为十六进制
			String fmd = Integer.toHexString(fInteger);
			// 阀门ID
			
			// 区管ID
			String ip = jzqService.findIP(qgService.findJzq(qgId)).get(0).get("JzqIP").toString();  
			// 端口号
			String port =jzqService.findIP(qgService.findJzq(qgId)).get(0).get("JzqPort").toString();
			// IP地址和端口号
			
			String pt = "/" + ip + ":" + port;
			// fmId十进制
			String ja = "F0160900" + qgId + "040" + fmd + "00FFFF00FFFFFF";
			System.out.println(pt);
			System.out.println(ja);
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
			
			
			//kString = gf( fmId, qgId);
			
			JSONObject jsonObject=new JSONObject();
			
	    	//return kString;
	    	String	userName=(String) session.getAttribute("userName");
	    	if(userName!=null){
	    	 userName=new String(userName.getBytes("ISO-8859-1"),"utf-8")+"";
	    	if(!userName.equals("hnzyxt")){
	    		
			//日志
	    		
	    		
	    	}
			if(userName.equals("供热一处")||userName.equals("供热二处")||userName.equals("供热三处")){
				jsonObject.put("js", "5");
				return jsonObject;
			}else{
			
			kString = gf( fmId, qgId);
			Map map= yhInfoService.geidz(fmId);
			Date date=new Date();
			xxglService.InsertRz(userName, "关阀门 ：小区"+map.get("XqName")+"楼栋" +map.get("BuildNo")+"单元"+map.get("CellNo")
			+"户号"+map.get("HouseNo"), date);
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
			
	    	
	    	//根据阀门获取用户信息
			/*fm = fmService.findbyVad(ids);
			int buildNo = fm.getYh().getBuildNO();
			int cellNo = fm.getYh().getCellNO();
			int houseNo = fm.getYh().getHouseNO();
			f = fmService.findIDbyqgvd(ids);
			fmId = f.getValAd();
			qgId = f.getQgID();*/
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
			//log.info("读阀发送数据："+ja);
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
				//jsonObject.put("fmId", "阀门号:" + fmId + "楼栋号:" + buildNo + "单元号:" + cellNo + "户号:" + houseNo);
				return jsonObject;
			} else {
				MapUtilsDf.getMapUtils().add("dFm", null);
				jsonObject.put("js", "5");
				//jsonObject.put("fmId", "阀门号:" + fmId + "楼栋号:" + buildNo + "单元号:" + cellNo + "户号:" + houseNo);
				return jsonObject;
			}

		}
		
		 //修改无线传感器地址
	    @RequestMapping("XCgq")
	    @ResponseBody
	    public String XCgq(HttpSession session, String fmId, String CGQId,String qgId) throws UnsupportedEncodingException{

	    	
			String	userName=(String) session.getAttribute("userName");
			if(userName!=null){
			 //userName=new String(userName.getBytes("ISO-8859-1"),"utf-8")+"";
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
	    			// 阀门ID
	    			
	    			// 区管ID
	    			String ip = jzqService.findIP(qgService.findJzq(qgId)).get(0).get("JzqIP").toString();  
	    			// 端口号
	    			String port =jzqService.findIP(qgService.findJzq(qgId)).get(0).get("JzqPort").toString();
	    			// IP地址和端口号
	    			String pt = "/" + ip + ":" + port;

	    			// fmId十进制
	    			String ja = "F0155300"+qgId+"0"+UppFmd+"679A000"+Cgq+"";
	    			System.out.println(pt);
	    			System.out.println(ja);
	    			Map map= yhInfoService.geidz(fmId);
					Date date=new Date();
					xxglService.InsertRz(userName, "修改传感器地址 ：小区"+map.get("XqName")+"楼栋" +map.get("BuildNo")+"单元"+map.get("CellNo")
					+"户号"+map.get("HouseNo"), date);
	    			boolean sessionmap = cz(ja, pt);
	    			try {
	    				Thread.sleep(3000);

	    			} catch (InterruptedException e) {
	    				e.printStackTrace();
	    			}
	    			if (sessionmap == true &&  MapUtils.getMapUtils().get("Xcgq")!=null && MapUtils.getMapUtils().get("Xcgq").equals("success")) {
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
			
			//日志
			
			
			// 把FmID转换为int类型
			int fInteger = Integer.valueOf(fmId);
			// FmID十进制转换为十六进制
			String fmd = Integer.toHexString(fInteger);
			// 阀门ID
			
			// 区管ID
			String ip = jzqService.findIP(qgService.findJzq(qgId)).get(0).get("JzqIP").toString();  
			// 端口号
			String port =jzqService.findIP(qgService.findJzq(qgId)).get(0).get("JzqPort").toString();
			// IP地址和端口号
			String pt = "/" + ip + ":" + port;
			String ja = "F0115200" + qgId + "0" + fmd + "679A00";
			
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
}
