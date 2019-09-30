package com.hnzy.hot.controller;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.hnzy.hot.pojo.Jf;
import com.hnzy.hot.pojo.TjfxHistory;
import com.hnzy.hot.pojo.TjfxKdHis;
import com.hnzy.hot.pojo.XqAvg;
import com.hnzy.hot.pojo.XqInfo;
import com.hnzy.hot.pojo.YhInfo;
import com.hnzy.hot.service.JfService;
import com.hnzy.hot.service.TjfxHistoryService;
import com.hnzy.hot.service.TjfxKdHisService;
import com.hnzy.hot.service.XqAvgService;
import com.hnzy.hot.service.XqInfoService;
import com.hnzy.hot.service.YhInfoService;
import com.hnzy.hot.socket.Tqxb;
import com.hnzy.hot.socket.util.DataSourceContextHolder;
import com.hnzy.hot.socket.util.DataSourceType;


@Controller
public class TimeSix
{
	@Autowired
	private YhInfoService yhInfoService;
	@Autowired
	private TjfxHistoryService tjfxHistoryService;
	@Autowired
	private TjfxKdHisService tjfxKdHisService;
	private List<String> yhInfoList;
	private  List<Map<String, Object>> yhList;
	@Autowired
	private XqInfoService xqInfoService;
	@Autowired
	private XqAvgService xqAvgService;
	private List<XqInfo> xqInfos;
	
	@Autowired
	private JfService jfService;
	private  Jf jf;
	PreparedStatement Oracleps;
	ResultSet Oraclerst;
	int Oraclers = 0;

	PreparedStatement Sqlps;
	ResultSet Sqlrst;
	int Sqlrs = 0;
	
	PreparedStatement ps;
	ResultSet rst;
	int rs = 0;
	
	
	public void print(){
		Tqxb tqxb=new Tqxb();
		Map<String, String>  map =null;
		try
		{
			map = tqxb.getTodayWeather1("101181701");
		} catch (NullPointerException | IOException e1)
		{
			e1.printStackTrace();
		}
		//室外温度
		int wd=Integer.valueOf(map.get("wd"));
		TjfxHistory tjfxHistory=new TjfxHistory();

		yhInfoList=yhInfoService.findYhNameList(null);
		for(int i=0;i<yhInfoList.size();i++){
		//大于26
		int A=yhInfoService.chartSearchA(yhInfoList.get(i), 0,0,"是","--选择阀门状态--");
		//15-18
		int C=yhInfoService.chartSearchC(yhInfoList.get(i), 0,0,"是","--选择阀门状态--");
		//18-22
		int D=yhInfoService.chartSearchD(yhInfoList.get(i), 0,0,"是","--选择阀门状态--");
		//22-26
		int E=yhInfoService.chartSearchE(yhInfoList.get(i), 0,0,"是","--选择阀门状态--");
		//0
		int G=yhInfoService.chartSearchG(yhInfoList.get(i), 0,0,"是","--选择阀门状态--");
		//0-15
		int B=yhInfoService.chartSearchB(yhInfoList.get(i), 0,0,"是","--选择阀门状态--");
		int cout=A+C+D+E+G+B;
		if(cout!=0){
		float jlA=((float)A/cout)*100;
		float jlC=((float)C/cout)*100;
		float jlD=((float)D/cout)*100;
		float jlE=((float)E/cout)*100;
		float jlG=((float)G/cout)*100;
		float jlB=((float)B/cout)*100;
		String a = String .format("%.1f",jlA);
		String c = String .format("%.1f",jlC);
		String d = String .format("%.1f",jlD);
		String e = String .format("%.1f",jlE);
		String g = String .format("%.1f",jlG);
		String b = String .format("%.1f",jlB);
		tjfxHistory.setXqName(yhInfoList.get(i));
		tjfxHistory.setZerot(g+"%");
		tjfxHistory.setzFift(b+"%");
		tjfxHistory.setFiftOct(c+"%");
		tjfxHistory.setOctTw(d+"%");
		tjfxHistory.setTwSix(e+"%");
		tjfxHistory.setTwentySix(a+"%");
		tjfxHistory.setDate(new Date());
		//插入室内温度
		tjfxHistory.setTqyb(wd);
		tjfxHistoryService.InTjfx(tjfxHistory);
		//开度3-15
		int kdc=yhInfoService.findFamKdC(yhInfoList.get(i), 0, 0, "是", "--选择阀门状态--");
		//0度
		int kdf=yhInfoService.findFamKdF(yhInfoList.get(i), 0, 0, "是", "--选择阀门状态--");
		//100度
		int kda=yhInfoService.findFamKdA(yhInfoList.get(i), 0, 0, "是", "--选择阀门状态--");
		int kdCout=kdc+kdf+kda;
		if(kdCout!=0){
		float kdC=((float)kdc/kdCout)*100;
		float kdF=((float)kdf/kdCout)*100;
		float kdA=((float)kda/kdCout)*100;
		
		String kC = String .format("%.1f",kdC);
		String kF = String .format("%.1f",kdF);
		String kA = String .format("%.1f",kdA);
		TjfxKdHis tjfxKdHis=new TjfxKdHis();
		tjfxKdHis.setXqName(yhInfoList.get(i));
		tjfxKdHis.setKdLd(kF+"%");
		tjfxKdHis.setKdSW(kC+"%");
		tjfxKdHis.setKdYb(kA+"%");
		tjfxKdHis.setDate(new Date());
		tjfxKdHis.setDate(new Date());
		//插入室内温度
		tjfxKdHis.setTqyb(wd);
		tjfxKdHisService.InKd(tjfxKdHis);
		}
			}
		}	
		//小区平均温度
		xqInfos=xqInfoService.findAvgWdByXqName();
		for(int i=0;i<xqInfos.size();i++){
			XqAvg avg=new XqAvg();
			avg.setAvg(xqInfos.get(i).getAvgWd());
			avg.setXqName(xqInfos.get(i).getXqName());
			avg.setDate(new Date());
			try
			{
				map = tqxb.getTodayWeather1("101181701");
			} catch (NullPointerException | IOException e)
			{
				e.printStackTrace();
			}
			
			//更新时间
			String date=map.get("date");
			avg.setTqyb(wd);
			avg.setTqybDate(date);
			//插叙平均温度计
			xqAvgService.InTAvg(avg);
			
		}
	}
	int Sh=0;
	int Gw=0;
	
	public void  tqyb(){
		Tqxb tqxb=new Tqxb();
		Map<String, String>  map =null;
			try
			{
				map = tqxb.getTodayWeather1("101181701");
			} catch (NullPointerException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		if(map!=null && map.get("wd")!=null){
			
		int wd=Integer.valueOf(map.get("wd"));
		String date=map.get("date");
		//插入室外温度
		//DataSourceContextHolder.setDbType(DataSourceType.dse);
		tjfxHistoryService.InsertTq(wd,date);
		}
	}
	public void doSomething(){
		String xqName =null;
		String xqNameLc=null;
		String houseNo;
		Integer buildNo;
		Integer cellNo;
		String sfjf;
		String LH = null;
		String DYH;
		String hh;
		try {
			Thread.sleep(500);

		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		DataSourceContextHolder.setDbType(DataSourceType.dse);
		yhList=yhInfoService.findJfxx();
		for(int i=0;i<yhList.size();i++){
			xqName=(String) yhList.get(i).get("XqName");
			
			hh=houseNo= yhList.get(i).get("HouseNO")+"";
			if(xqName.equals("三和铝厂")){
				xqNameLc="枢纽局西苑.铝厂小区（智慧供热区域）";
			}
			buildNo=(Integer) yhList.get(i).get("BuildNO");
			cellNo=(Integer) yhList.get(i).get("CellNO");
			if(xqName.equals("嘉亿城市广场（智慧供热区域）")){
				LH=(String) yhList.get(i).get("BuildNO").toString();
			}else if(xqName.equals("天鹅堡")||xqName.equals("联通小区")){
				LH=(Integer) yhList.get(i).get("BuildNO")+"#（智慧供热区域）";
			}else if(xqName.equals("枢纽局西苑.铝厂小区（智慧供热区域）")){
				LH=(String) yhList.get(i).get("BuildNO").toString();
				if(LH.equals("35")){
					LH="西苑5#（35#）";
				}else if(LH.equals("36")){
					LH="西苑7#（36#）";
				}else if(LH.equals("37")){
					LH="西苑8#（37#）";
				}else if(LH.equals("38")){
					LH="西苑9#（38#）";
					if(hh.equals("11102")){
						hh="1102";
					}else if(hh.equals("21102")){
						hh="1102";
					}else if(hh.equals("11101")){
						hh="1101";
					}else if(hh.equals("21101")){
						hh="1101";
					}

				}else{
					LH=(String) yhList.get(i).get("BuildNO").toString();
				}
			}else if(xqName.equals("三和铝厂")){
				LH="铝厂"+(Integer) yhList.get(i).get("BuildNO")+"#";
			}else if(xqName.equals("金盾苑")){
				LH=(Integer) yhList.get(i).get("BuildNO")+"#智慧供热区域";
			}else if(xqName.equals("建业壹号城邦小区")){
				LH=(String) yhList.get(i).get("BuildNO").toString();
			    if(LH.equals("13")||LH.equals("15")||LH.equals("16")){
			 	 LH=LH+"#";
			   }else{
				 LH=LH+"#（智慧供热区域）";
			   }
			}else {
				LH=(Integer) yhList.get(i).get("BuildNO")+"#";
			}					
			DYH=(String) yhList.get(i).get("BuildNO").toString();
			
			try {
				Thread.sleep(100);

			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			DataSourceContextHolder.setDbType(DataSourceType.ds);
			if(xqName.equals("三和铝厂")){
				xqNameLc="枢纽局西苑.铝厂小区（智慧供热区域）";
				
				 jf =jfService.findJfxx(xqNameLc, LH, DYH, hh);
			}else{
				
				 jf =jfService.findJfxx(xqName, LH, DYH, hh);
			}
			DataSourceContextHolder.setDbType(DataSourceType.dse);
			YhInfo yhInfo =new YhInfo();
			if(jf!=null){
			int sFJF=jf.getJfzt();//是否缴费
			String yhbm=jf.getYhbm();//用户面积
			String lxdh=jf.getLxdh();//联系电话
			String yhmc=jf.getYhmc();//用户名称
			String yhkh=jf.getYhkh();//用户卡号
			double Sfmj=jf.getSfmj();//收费面积
			Date date=jf.getJfsj();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss") ; //使用了默认的格式创建了一个日期格式化对象。
			String jfsj ="";
			
				jfsj = dateFormat.format(date);
			
			
			
			if(sFJF==0){
				sfjf="是";
			}else{
				sfjf="否";
			}
		
			yhInfo.setYhbm(yhbm);
			yhInfo.setYhName(yhmc);
			yhInfo.setTelephone(lxdh);
			yhInfo.setHeatArea(Sfmj);
			yhInfo.setSfjf(sfjf);
			yhInfo.setXqName(xqName);
			yhInfo.setBuildNo(buildNo);
			yhInfo.setCellNo(cellNo);
			yhInfo.setHouseNo(Integer.valueOf(houseNo));
			yhInfo.setIdNum(yhkh);
			yhInfo.setJfsj(jfsj);
			yhInfoService.updateYhs(yhInfo);
			
			}else{
				yhInfo.setSfjf("否");
				yhInfo.setXqName(xqName);
				yhInfo.setBuildNo(buildNo);
				yhInfo.setCellNo(cellNo);
				yhInfo.setHouseNo(Integer.valueOf(houseNo));
				
				yhInfoService.updateYhSfjf(yhInfo);	
			}
			
		}
	}

	
	
}
