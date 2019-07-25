package com.hnzy.hot.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hnzy.hot.dao.JzqDao;
import com.hnzy.hot.service.JzqService;


@Service
public class JzqServiceImpl implements JzqService{

	@Autowired
	private JzqDao jzqDao;

	@Override
	public List<String> find() {
		// TODO Auto-generated method stub
		return jzqDao.find();
	}

	@Override
	public void Insert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		jzqDao.Insert(map);
	}

	@Override
	public void Update(Map<String, Object> map) {
		// TODO Auto-generated method stub
		jzqDao.Update(map);
	}

	@Override
	public void Delete(String id) {
		// TODO Auto-generated method stub
		jzqDao.Delete(id);
	}

	@Override
	public List<Map<String, Object>> findIP(String JzqID) {
		// TODO Auto-generated method stub
		return jzqDao.findIP(JzqID);
	}

	
}
