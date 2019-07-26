package com.hnzy.hot.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface XxglDao {

   public List<String> Search(Map<String, Object> map);
   
   public List<String> skxx(Map<String, Object> map);
   
   public List<String> czrz(Map<String, Object> map);
   
   public Map<String, Object> grbzt(Map<String, Object> map);
   
   public Map<String, Object> wdbzt(Map<String, Object> map);
   
   public Map<String, Object> kdbzt(Map<String, Object> map);
   
   public Integer grmj();
   
   public Integer gryh();
   
   public Integer wgryh();
   
   public Integer pjsw();
   
   public String grbl();
   
   public void InsertRz(@Param("czr")String czr,@Param("cz")String cz,@Param("czsj")Date czsj);
   
   public void DeleteCgqDz(String id);
   
   public List<Map<String, Object>> cgqDz();
}
