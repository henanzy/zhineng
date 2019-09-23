package com.hnzy.hot.dao;

import java.util.List;

import com.hnzy.hot.base.BaseDao;
import com.hnzy.hot.pojo.XqInfo;

public interface XqInfoDao extends BaseDao<XqInfo>
{
	//根据小区查找阀门的室内平均温度
	public List<XqInfo> findAvgWdByXqName();
	
	
}
