package com.hnzy.hot.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.hnzy.hot.pojo.User;

public interface UserDao {

public User findUserByNameAndMD5(@Param("userName") String userName, @Param("passWord")String passWord);
	
	public String findUserPass(@Param("ID") Integer ID);
	
	public void update(User  user);
	//根据用户名查找是否存在
	public User findByName(String userName);
	//插入用户名和密码
	public void InsUsePass(@Param("userName") String userName, @Param("password")String password, @Param("type")String type);
	
	public List<String> getgs();
	
	public List<Map<String, Object>> selGsjg();
	
	public void InsGsjg(@Param("name") String name, @Param("sjgs")String sjgs);
	
	public void updateGsjg(@Param("name") String name, @Param("sjgs")String sjgs,@Param("id")String id);
	
	public void deleteGsjg(@Param("id")String id);
}
