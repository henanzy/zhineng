package com.hnzy.hot.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hnzy.hot.dao.YxglDao;
import com.hnzy.hot.service.YxglService;

@Service
public class YxglServiceImpl implements YxglService {
	@Autowired
	public YxglDao yxglDao;

	@Override
	public Map<String, Object> findGrYh() {
		// TODO Auto-generated method stub
		return yxglDao.findGrYh();
	}

	@Override
	public Map<String, Object> findWGrYh() {
		// TODO Auto-generated method stub
		return yxglDao.findWGrYh();
	}

	@Override
	public Float findGrMj() {
		// TODO Auto-generated method stub
		return yxglDao.findGrMj();
	}

	@Override
	public Map<String, Object> findAvgRoom() {
		// TODO Auto-generated method stub
		return yxglDao.findAvgRoom();
	}

	@Override
	public Map<String, Object> findSWd() {
		// TODO Auto-generated method stub
		return yxglDao.findSWd();
	}

	@Override
	public List<Map<String, Object>> findXqAvgWd() {
		// TODO Auto-generated method stub
		return yxglDao.findXqAvgWd();
	}

	@Override
	public List<Map<String, Object>> findXqAvgKd() {
		// TODO Auto-generated method stub
		return yxglDao.findXqAvgKd();
	}

}
