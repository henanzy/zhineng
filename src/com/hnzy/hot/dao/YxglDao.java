package com.hnzy.hot.dao;

import java.util.List;
import java.util.Map;

public interface YxglDao {
	//供热用户
	public Map<String,Object> findGrYh();
	//未供热用户
	public Map<String,Object> findWGrYh();
	//供热面积
	public Float findGrMj();
	//平均室内温度
	public Map<String,Object>findAvgRoom();
	//室外温度
	public Map<String,Object>findSWd();
	//平均温度
	public List<Map<String,Object>>findXqAvgWd();
	//平均开度
	public List<Map<String,Object>>findXqAvgKd();
}
