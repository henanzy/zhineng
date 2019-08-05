package com.hnzy.hot.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface YhInfoDao {

    public List<Map<String, Object>> findXq();
	
	public List<String> findLd(Map<String, Object> map);
	
	public List<String> findDy(Map<String, Object> map);
	
	public List<String> findHh(Map<String, Object> map);
	
    public List<String> find();
	
	public void InsertXq(Map<String, Object> map);
	
	public void UpdateXq(Map<String, Object> map);
	
	public void DeleteXq(String id);
	
	
    public List<String> findYh(Map<String, Object> map);
	
	public void InsertFm(Map<String, Object> map);
	
	public void UpdateFm(Map<String, Object> map);
	
	public void DeleteFm(String ValAd);
	
    public void InsertYh(Map<String, Object> map);
	
	public void UpdateYh(Map<String, Object> map);
	
	public void DeleteYh(String id);
	
	public Integer findFm(String ValAd);
	
	public List<String> findFmLs(Map<String, Object> map);
	
	public List<String> gdjl(Map<String, Object> map);
	
	public List<String> findFmkdLs(Map<String, Object> map);
	
	public List<Map<String, Object>> findKdLs(Map<String, Object> map);
	
	public List<Map<String, Object>> findHisAvg(Map<String, Object> map);
	
	public List<String> findTc(Map<String, Object> map);
	
	public List<Map<String, Object>> szt(Map<String, Object> map);
	
	public void updateType(@Param("type")String type,@Param("ValAd")String ValAd);
	
	public Map<String, Object> geidz(String ValAd);
	
	public void updateCgqId(@Param("idNum")String idNum,@Param("valAd")String valAd);
	
}
