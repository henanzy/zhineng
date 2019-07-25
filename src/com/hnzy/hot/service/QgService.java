package com.hnzy.hot.service;

import java.util.List;
import java.util.Map;

public interface QgService {
	public List<String> find();
	
	public void Insert(Map<String, Object> map);
	
	public void Update(Map<String, Object> map);
	
	public void Delete(String id);
	
	public String findJzq(String QgID);
}
