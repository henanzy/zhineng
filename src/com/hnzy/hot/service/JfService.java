package com.hnzy.hot.service;

import org.apache.ibatis.annotations.Param;

import com.hnzy.hot.pojo.Jf;

public interface JfService
{
	public Jf findJf(@Param("XQ")String XQ,@Param("LH")String lH,@Param("DYH")String dYH,@Param("CS")String cS,@Param("SH")String sH);
	public Jf findJfxx(@Param("XQ")String XQ,@Param("LH")String lH,@Param("DYH")String dYH,@Param("mp")String mp);
	public Jf findYhxxByKh(@Param("khId")String khId);
}
