package com.hnzy.hot.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hnzy.hot.dao.QgDao;
import com.hnzy.hot.service.QgService;


@Service
public class QgServiceImpl implements QgService{

	@Autowired
	private QgDao qgDao;

	@Override
	public List<String> find() {
		// TODO Auto-generated method stub
		return qgDao.find();
	}

	@Override
	public void Insert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		qgDao.Insert(map);
	}

	@Override
	public void Update(Map<String, Object> map) {
		// TODO Auto-generated method stub
		qgDao.Update(map);
	}

	@Override
	public void Delete(String id) {
		// TODO Auto-generated method stub
		qgDao.Delete(id);
	}

	@Override
	public String findJzq(String QgID) {
		// TODO Auto-generated method stub
		return qgDao.findJzq(QgID);
	}

	
}
