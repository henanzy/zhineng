package com.hnzy.hot.service;

import java.util.List;
import java.util.Map;

public interface XxglService {
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
}
