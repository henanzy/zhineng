package com.hnzy.hot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hnzy.hot.dao.XqInfoDao;
import com.hnzy.hot.pojo.XqInfo;

@Service
public class XqInfoServiceImpl implements XqInfoService
{

	@Autowired
	private XqInfoDao xqInfoDao;

	

	@Override
	public List<XqInfo> findAvgWdByXqName()
	{
		return xqInfoDao.findAvgWdByXqName();
	}

}
