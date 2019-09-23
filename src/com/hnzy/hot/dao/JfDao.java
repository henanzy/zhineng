package com.hnzy.hot.dao;


import org.apache.ibatis.annotations.Param;

import com.hnzy.hot.pojo.Jf;

public interface JfDao
{

	public Jf findJf(@Param("XQ")String XQ,@Param("LH")String lH,@Param("DYH")String dYH,@Param("CS")String cS,@Param("SH")String sH);
	
	public Jf findJfxx(@Param("XQ")String XQ,@Param("LH")String lH,@Param("DYH")String dYH,@Param("MP")String MP);
	public Jf findYhxxByKh(@Param("khId")String khId);
}
