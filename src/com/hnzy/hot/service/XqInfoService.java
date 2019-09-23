package com.hnzy.hot.service;

import java.util.List;

import com.hnzy.hot.pojo.XqInfo;

public interface XqInfoService
{
	
	
	//根据小区查找阀门的室内平均温度
	public List<XqInfo> findAvgWdByXqName();
}

