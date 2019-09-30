package com.hnzy.hot.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.hnzy.hot.pojo.YhInfo;

public interface YhInfoService {
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
	
	public List<String> findYhNameList(Map<String, Object> map);
	
	public int findFamKdA(@Param("xqName")String xqName,@Param("buildNo")int buildNo,@Param("cellNo")int cellNo,@Param("sfjf")String sfjf,@Param("status")String status);	
	public int findFamKdC(@Param("xqName")String xqName,@Param("buildNo")int buildNo,@Param("cellNo")int cellNo,@Param("sfjf")String sfjf,@Param("status")String status);
	public int findFamKdF(@Param("xqName")String xqName,@Param("buildNo")int buildNo,@Param("cellNo")int cellNo,@Param("sfjf")String sfjf,@Param("status")String status);
	
	public int chartSearchA(@Param("xqName")String xqName,@Param("buildNo")int buildNo,@Param("cellNo")int cellNo,@Param("sfjf")String sfjf,@Param("status")String status);
    //根据搜索条件进行查询温度温度小于16度
	public int chartSearchB(@Param("xqName")String xqName,@Param("buildNo")int buildNo,@Param("cellNo")int cellNo,@Param("sfjf")String sfjf,@Param("status")String status);
	//根据搜索条件进行查询温度温度18-20度
	public int chartSearchC(@Param("xqName")String xqName,@Param("buildNo")int buildNo,@Param("cellNo")int cellNo,@Param("sfjf")String sfjf,@Param("status")String status);
	//根据搜索条件进行查询温度温度20-22度
	public int chartSearchD(@Param("xqName")String xqName,@Param("buildNo")int buildNo,@Param("cellNo")int cellNo,@Param("sfjf")String sfjf,@Param("status")String status);
	//根据搜索条件进行查询温度温度22-24度
	public int chartSearchE(@Param("xqName")String xqName,@Param("buildNo")int buildNo,@Param("cellNo")int cellNo,@Param("sfjf")String sfjf,@Param("status")String status);
	//根据搜索条件进行查询温度温度24-26度
	
	//根据搜索条件进行查询温度温度为0
	public int chartSearchG(@Param("xqName")String xqName,@Param("buildNo")int buildNo,@Param("cellNo")int cellNo,@Param("sfjf")String sfjf,@Param("status")String status);

	public List<Map<String, Object>> findJfxx();
	public void updateYhs(YhInfo yhInfo);
	//更新温度传感器地址

	//在缴费系统中查找不到用户则用户缴费状态为否
	public void updateYhSfjf(YhInfo yhInfo);
	
	public List<Map<String, Object>> findJc(Map<String, Object> map);
}
