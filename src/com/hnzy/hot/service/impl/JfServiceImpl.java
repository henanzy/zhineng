package com.hnzy.hot.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hnzy.hot.dao.JfDao;
import com.hnzy.hot.pojo.Jf;
import com.hnzy.hot.service.JfService;

@Service
public class JfServiceImpl implements JfService
{
	@Autowired
	private JfDao jfDao;

	@Override
	public Jf findJf(String XQ, String lH, String dYH, String cS, String sH)
	{
		
		return jfDao.findJf(XQ, lH, dYH, cS, sH);
	}

	@Override
	public Jf findJfxx(String XQ, String lH, String dYH, String mp)
	{
		
		return jfDao.findJfxx(XQ, lH, dYH, mp);
	}

	@Override
	public Jf findYhxxByKh(String khId)
	{
		
		return jfDao.findYhxxByKh(khId);
	}

}
