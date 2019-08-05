package com.hnzy.hot.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface HanderDao {
	
	
	public List<Map<String, Object>> fmxx(int ValAd);
	
	public void UpdateType(@Param("Type")String Type,@Param("ValAd")int ValAd);
	
	public void UpdateJfzt(@Param("YHBM")String YHBM,@Param("SFJF")String SFJF,@Param("IDNum")String IDNum);
	
	public List<Map<String, Object>> fmkg(String YHBM);
	
	public void InsertSkq(@Param("SkqSbh")String SkqSbh,@Param("Kh")String Kh,@Param("fmState")String fmState,
			@Param("skSuccess")String skSuccess,@Param("SfJf")String SfJf,@Param("DateTime")String DateTime);
	
	public void UpdateQg(@Param("QgStatus")String QgStatus,@Param("RecordTime")String RecordTime,@Param("QgID")String QgID);
	
	public void UpdateJzq(@Param("JzqIp")String JzqIp,@Param("JzqPort")String JzqPort,@Param("QgID")String QgID);
	
	public void UpdateJzqDk(@Param("JzqPort")String JzqPort,@Param("JzqIp")String JzqIp,@Param("Status")String Status,			
			@Param("UpdateTime")String UpdateTime,@Param("JzqID")String JzqID);
	
	public void InsertAlarmInfor(@Param("fmId")String fmId,@Param("ycString")String ycString,@Param("time")String time);
	
	public void UpdateAlarmInforsX(@Param("ErrInfor")String ErrInfor,@Param("time")String time,@Param("DeviceID")String DeviceID);
		
	public int getTqyb();
	
	public void UpdateFmInfo(Map<String, Object> map);
	
	public void InsertFmls(Map<String, Object> map);
	
	public int UpdateStatus(@Param("Status")String Status,@Param("ValAd")int ValAd);
	
	public int PlUpdateStatus(@Param("Status")String Status,@Param("QgID")String QgID);
}
