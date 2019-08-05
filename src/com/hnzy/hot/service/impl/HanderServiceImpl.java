package com.hnzy.hot.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hnzy.hot.dao.HanderDao;
import com.hnzy.hot.service.HanderService;


@Service
public class HanderServiceImpl implements HanderService{

	@Autowired
	private HanderDao handerDao;

	@Override
	public List<Map<String, Object>> fmxx(int ValAd) {
		// TODO Auto-generated method stub
		return handerDao.fmxx(ValAd);
	}

	@Override
	public void UpdateType(String Type, int ValAd) {
		// TODO Auto-generated method stub
		handerDao.UpdateType(Type, ValAd);
	}

	@Override
	public void UpdateJfzt(String YHBM, String SFJF, String IDNum) {
		// TODO Auto-generated method stub
		handerDao.UpdateJfzt(YHBM, SFJF, IDNum);
	}

	@Override
	public List<Map<String, Object>> fmkg(String YHBM) {
		// TODO Auto-generated method stub
		return handerDao.fmkg(YHBM);
	}

	@Override
	public void InsertSkq(String SkqSbh, String Kh, String fmState, String skSuccess, String SfJf, String DateTime) {
		// TODO Auto-generated method stub
		handerDao.InsertSkq(SkqSbh, Kh, fmState, skSuccess, SfJf, DateTime);
	}

	@Override
	public void UpdateQg(String QgStatus, String RecordTime, String QgID) {
		// TODO Auto-generated method stub
		handerDao.UpdateQg(QgStatus, RecordTime, QgID);
	}

	@Override
	public void UpdateJzq(String JzqIp, String JzqPort, String QgID) {
		// TODO Auto-generated method stub
		handerDao.UpdateJzq(JzqIp, JzqPort, QgID);
	}

	@Override
	public void UpdateJzqDk(String JzqPort, String JzqIp, String Status, String UpdateTime, String JzqID) {
		// TODO Auto-generated method stub
		handerDao.UpdateJzqDk(JzqPort, JzqIp, Status, UpdateTime, JzqID);
	}

	@Override
	public void InsertAlarmInfor(String fmId, String ycString, String time) {
		// TODO Auto-generated method stub
		handerDao.InsertAlarmInfor(fmId, ycString, time);
	}

	@Override
	public void UpdateAlarmInforsX(String ErrInfor, String time, String DeviceID) {
		// TODO Auto-generated method stub
		handerDao.UpdateAlarmInforsX(ErrInfor, time, DeviceID);
	}

	@Override
	public int getTqyb() {
		// TODO Auto-generated method stub
		return handerDao.getTqyb();
	}

	@Override
	public void UpdateFmInfo(Map<String, Object> map) {
		// TODO Auto-generated method stub
		handerDao.UpdateFmInfo(map);
	}

	@Override
	public void InsertFmls(Map<String, Object> map) {
		// TODO Auto-generated method stub
		handerDao.InsertFmls(map);
	}

	@Override
	public int UpdateStatus(String Status, int ValAd) {
		// TODO Auto-generated method stub
		return handerDao.UpdateStatus(Status, ValAd);
	}

	@Override
	public int PlUpdateStatus(String Status, String QgID) {
		// TODO Auto-generated method stub
		return handerDao.PlUpdateStatus(Status, QgID);
	}

	


}
