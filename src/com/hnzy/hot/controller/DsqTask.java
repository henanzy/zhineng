package com.hnzy.hot.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import org.apache.log4j.Logger;

import com.hnzy.hot.socket.ISCSynAllData;
import com.hnzy.hot.socket.server.ServerSessionMap;
import com.hnzy.hot.socket.util.CzUtil;
import com.hnzy.hot.socket.util.DatabaseUtil;

public class DsqTask {
	String qgId = null;
	String JzqIP = null;
	int QgFl=0;
	int JzqPort = 0;
	private static Logger log = Logger.getLogger(DsqTask.class);
	
	public void doSomething() throws SQLException {
		//连接数据库
		  DatabaseUtil dbUtil = DatabaseUtil.getInstance();   
	      Connection connc = dbUtil.getConnection(); 
	      Connection conncg=dbUtil.getConnection();
	      ResultSet rstqg = null;
	      ResultSet rst;
	      PreparedStatement psqg = null;
	      PreparedStatement ps;
		String sqlcx = "select distinct T_JzqInfo.JzqID,T_QgInfo.QgID from T_JzqInfo,T_QgInfo where T_JzqInfo.JzqID=T_QgInfo.JzqID and (QgFl=0 or QgFl=2)  order by T_QgInfo.QgID";
		 ps=connc.prepareStatement(sqlcx);
		  rst = ps.executeQuery();
		int col = rst.getMetaData().getColumnCount();
		while (rst.next()) {
			qgId = rst.getString("QgID");
			String jzqid = rst.getString("JzqID");
			//根据区管ID查询阀门总数
			String sqlqg="select Count(ValAd)  as fmCount from T_FmInfo where  QgID='"+qgId+"'";
		     psqg=connc.prepareStatement(sqlqg);
			 rstqg = psqg.executeQuery();
			 int rowCount = 0;      
			 if(rstqg.next())      
			 {      
			    rowCount = rstqg.getInt(1);  
			 }   
			//输出日志
			 log.info(qgId+"区管下阀门数量"+rowCount);  
				// 获取区管下的IP地址和端口号
				String iprt = "select distinct T_JzqInfo.jzqIP,T_JzqInfo.jzqport from T_JzqInfo where JzqID='" +jzqid+ "'";
				psqg = conncg.prepareStatement(iprt);
				rstqg = psqg.executeQuery();
				if (rstqg.next()) {
					JzqIP = rstqg.getString("jzqIP");
					JzqPort = rstqg.getInt("jzqport");
				}
			// IP地址和端口号
			String pt = "/" + JzqIP + ":" + JzqPort;
				//根据阀门总数设置停留时间
				try {
					Thread.sleep(rowCount*600);

				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				String ja = "F00A0800" + qgId;
				String je=CzUtil.getTimerJe(ja);
				String[] keys = new String[] { pt };
				String mString = ja + "" + je + "FF";
				//输出日志
				 log.info("抄表发送数据"+mString+"---------时间----"+new Date());  
				// 解码
				byte[] b = CzUtil.jm(mString);
				ServerSessionMap sessionMap = ServerSessionMap.getInstance();
				boolean sessionmap = sessionMap.sendMessage(keys, b);
		}
		try
		{
			
			DatabaseUtil.close(rst,ps, connc);
			DatabaseUtil.close(rstqg ,psqg, conncg);
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}
}
