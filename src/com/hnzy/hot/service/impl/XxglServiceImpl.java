package com.hnzy.hot.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hnzy.hot.dao.XxglDao;
import com.hnzy.hot.service.XxglService;


@Service
public class XxglServiceImpl implements XxglService{

	@Autowired
	private XxglDao xxglDao;

	@Override
	public List<String> Search(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return xxglDao.Search(map);
	}

	@Override
	public List<String> skxx(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return xxglDao.skxx(map);
	}

	@Override
	public List<String> czrz(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return xxglDao.czrz(map);
	}

	@Override
	public Map<String, Object> grbzt(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return xxglDao.grbzt(map);
	}

	@Override
	public Map<String, Object> wdbzt(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return xxglDao.wdbzt(map);
	}

	@Override
	public Map<String, Object> kdbzt(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return xxglDao.kdbzt(map);
	}

	@Override
	public Integer grmj() {
		// TODO Auto-generated method stub
		return xxglDao.grmj();
	}

	@Override
	public Integer gryh() {
		// TODO Auto-generated method stub
		return xxglDao.gryh();
	}

	@Override
	public Integer wgryh() {
		// TODO Auto-generated method stub
		return xxglDao.wgryh();
	}

	@Override
	public Integer pjsw() {
		// TODO Auto-generated method stub
		return xxglDao.pjsw();
	}

	@Override
	public String grbl() {
		// TODO Auto-generated method stub
		return xxglDao.grbl();
	}

	@Override
	public void InsertRz(String czr, String cz, Date czsj) {
		// TODO Auto-generated method stub
		xxglDao.InsertRz(czr, cz, czsj);
	}

	@Override
	public void DeleteCgqDz(String id) {
		// TODO Auto-generated method stub
		xxglDao.DeleteCgqDz(id);
	}

	@Override
	public List<Map<String, Object>> cgqDz() {
		// TODO Auto-generated method stub
		return xxglDao.cgqDz();
	}


	
}
