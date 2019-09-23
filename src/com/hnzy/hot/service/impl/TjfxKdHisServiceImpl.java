package com.hnzy.hot.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hnzy.hot.dao.TjfxKdHisDao;
import com.hnzy.hot.pojo.TjfxKdHis;
import com.hnzy.hot.service.TjfxKdHisService;
@Service
public class TjfxKdHisServiceImpl implements TjfxKdHisService
{

	@Autowired
	private TjfxKdHisDao  tjfxKdHisDao;
	@Override
	public void InKd(TjfxKdHis tjfxKdHis)
	{
		tjfxKdHisDao.InKd(tjfxKdHis);
	}
	@Override
	public List<TjfxKdHis> findKd()
	{
		return tjfxKdHisDao.findKd();
	}
	@Override
	public List<TjfxKdHis> searchInfo(String xqName, String recordTime1, String recordTime2)
	{
		return tjfxKdHisDao.searchInfo(xqName, recordTime1, recordTime2);
	}
	@Override
	public List<TjfxKdHis> findKdJl()
	{
		return tjfxKdHisDao.findKdJl();
	}

}
