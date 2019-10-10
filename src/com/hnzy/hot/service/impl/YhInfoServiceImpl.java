package com.hnzy.hot.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hnzy.hot.dao.YhInfoDao;
import com.hnzy.hot.pojo.YhInfo;
import com.hnzy.hot.service.YhInfoService;


@Service
public class YhInfoServiceImpl implements YhInfoService{

	@Autowired
	private YhInfoDao yhnfoDao;

	@Override
	public List<Map<String, Object>> findXq() {
		// TODO Auto-generated method stub
		return yhnfoDao.findXq();
	}

	@Override
	public List<String> findLd(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return yhnfoDao.findLd(map);
	}

	@Override
	public List<String> findDy(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return yhnfoDao.findDy(map);
	}

	@Override
	public List<String> findHh(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return yhnfoDao.findHh(map);
	}

	@Override
	public List<String> find() {
		// TODO Auto-generated method stub
		return yhnfoDao.find();
	}

	@Override
	public void InsertXq(Map<String, Object> map) {
		// TODO Auto-generated method stub
		yhnfoDao.InsertXq(map);
	}

	@Override
	public void UpdateXq(Map<String, Object> map) {
		// TODO Auto-generated method stub
		yhnfoDao.UpdateXq(map);
	}

	@Override
	public void DeleteXq(String id) {
		// TODO Auto-generated method stub
		yhnfoDao.DeleteXq(id);
	}

	@Override
	public List<String> findYh(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return yhnfoDao.findYh(map);
	}

	@Override
	public void InsertFm(Map<String, Object> map) {
		// TODO Auto-generated method stub
		yhnfoDao.InsertFm(map);
	}

	@Override
	public void UpdateFm(Map<String, Object> map) {
		// TODO Auto-generated method stub
		yhnfoDao.UpdateFm(map);
	}

	@Override
	public void DeleteFm(String ValAd) {
		// TODO Auto-generated method stub
		yhnfoDao.DeleteFm(ValAd);
	}

	@Override
	public void InsertYh(Map<String, Object> map) {
		// TODO Auto-generated method stub
		yhnfoDao.InsertYh(map);
	}

	@Override
	public void UpdateYh(Map<String, Object> map) {
		// TODO Auto-generated method stub
		yhnfoDao.UpdateYh(map);
	}

	@Override
	public void DeleteYh(String id) {
		// TODO Auto-generated method stub
		yhnfoDao.DeleteYh(id);
	}

	@Override
	public Integer findFm(String ValAd) {
		// TODO Auto-generated method stub
		return yhnfoDao.findFm(ValAd);
	}

	@Override
	public List<String> findFmLs(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return yhnfoDao.findFmLs(map);
	}
	
	@Override
	public List<String> gdjl(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return yhnfoDao.gdjl(map);
	}

	@Override
	public List<String> findFmkdLs(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return yhnfoDao.findFmkdLs(map);
	}

	@Override
	public List<Map<String, Object>> findKdLs(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return yhnfoDao.findKdLs(map);
	}

	@Override
	public List<Map<String, Object>> findHisAvg(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return yhnfoDao.findHisAvg(map);
	}

	@Override
	public List<String> findTc(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return yhnfoDao.findTc(map);
	}

	@Override
	public List<Map<String, Object>> szt(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return yhnfoDao.szt(map);
	}

	@Override
	public void updateType(String type, String ValAd) {
		// TODO Auto-generated method stub
		yhnfoDao.updateType(type, ValAd);
	}

	@Override
	public Map<String, Object> geidz(String ValAd) {
		// TODO Auto-generated method stub
		return yhnfoDao.geidz(ValAd);
	}

	@Override
	public void updateCgqId(String idNum, String valAd) {
		// TODO Auto-generated method stub
		yhnfoDao.updateCgqId(idNum, valAd);
	}

	@Override
	public List<String> findYhNameList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return yhnfoDao.findYhNameList(map);
	}

	@Override
	public int findFamKdA(String xqName, int buildNo, int cellNo, String sfjf, String status) {
		// TODO Auto-generated method stub
		return yhnfoDao.findFamKdA(xqName, buildNo, cellNo, sfjf, status);
	}

	@Override
	public int findFamKdC(String xqName, int buildNo, int cellNo, String sfjf, String status) {
		// TODO Auto-generated method stub
		return yhnfoDao.findFamKdC(xqName, buildNo, cellNo, sfjf, status);
	}

	@Override
	public int findFamKdF(String xqName, int buildNo, int cellNo, String sfjf, String status) {
		// TODO Auto-generated method stub
		return yhnfoDao.findFamKdF(xqName, buildNo, cellNo, sfjf, status);
	}

	@Override
	public int chartSearchA(String xqName, int buildNo, int cellNo, String sfjf, String status) {
		// TODO Auto-generated method stub
		return yhnfoDao.chartSearchA(xqName, buildNo, cellNo, sfjf, status);
	}

	@Override
	public int chartSearchB(String xqName, int buildNo, int cellNo, String sfjf, String status) {
		// TODO Auto-generated method stub
		return yhnfoDao.chartSearchB(xqName, buildNo, cellNo, sfjf, status);
	}

	@Override
	public int chartSearchC(String xqName, int buildNo, int cellNo, String sfjf, String status) {
		// TODO Auto-generated method stub
		return yhnfoDao.chartSearchC(xqName, buildNo, cellNo, sfjf, status);
	}

	@Override
	public int chartSearchD(String xqName, int buildNo, int cellNo, String sfjf, String status) {
		// TODO Auto-generated method stub
		return yhnfoDao.chartSearchD(xqName, buildNo, cellNo, sfjf, status);
	}

	@Override
	public int chartSearchE(String xqName, int buildNo, int cellNo, String sfjf, String status) {
		// TODO Auto-generated method stub
		return yhnfoDao.chartSearchE(xqName, buildNo, cellNo, sfjf, status);
	}

	@Override
	public int chartSearchG(String xqName, int buildNo, int cellNo, String sfjf, String status) {
		// TODO Auto-generated method stub
		return yhnfoDao.chartSearchG(xqName, buildNo, cellNo, sfjf, status);
	}

	@Override
	public List<Map<String, Object>> findJfxx() {
		// TODO Auto-generated method stub
		return yhnfoDao.findJfxx();
	}

	@Override
	public void updateYhs(YhInfo yhInfo) {
		// TODO Auto-generated method stub
		yhnfoDao.updateYhs(yhInfo);
	}

	@Override
	public void updateYhSfjf(YhInfo yhInfo) {
		// TODO Auto-generated method stub
		yhnfoDao.updateYhSfjf(yhInfo);
	}

	@Override
	public List<Map<String, Object>> findJc(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return yhnfoDao.findJc(map);
	}

	@Override
	public void updateCjqTime(Integer id, String CjqTime,String CjqWz ) {
		// TODO Auto-generated method stub
		yhnfoDao.updateCjqTime(id, CjqTime,CjqWz);
	}

	
}
