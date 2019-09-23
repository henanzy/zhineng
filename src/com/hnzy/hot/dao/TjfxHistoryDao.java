package com.hnzy.hot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hnzy.hot.pojo.TjfxHistory;

public interface TjfxHistoryDao
{
 public void InTjfx(TjfxHistory tjfxHistory);
 public List<TjfxHistory>findTjfx();
 public List<TjfxHistory>searchInfo( @Param("xqName")String xqName,@Param("recordTime1") String recordTime1,@Param("recordTime2") String recordTime2);
 //查出金领的室温历史数据
 public List<TjfxHistory> findSwJl();
 public void InsertTq(@Param("wd") int wd,@Param("date")  String date);
}
