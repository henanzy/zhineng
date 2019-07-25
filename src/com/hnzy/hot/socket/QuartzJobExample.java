package com.hnzy.hot.socket;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.Logger;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.hnzy.hot.socket.server.ServerSessionMap;
import com.hnzy.hot.socket.util.CzUtil;
import com.hnzy.hot.socket.util.DatabaseUtil;

public class QuartzJobExample implements Job {
	// 定时执行任务的类
	private static Logger log = Logger.getLogger(ISCSynAllData.class);
	String qgId = null;
	String JzqIP = null;
	int QgFl = 0;
	int JzqPort = 0;
    @Override
    public void execute(JobExecutionContext arg0) throws JobExecutionException {
    	//连接数据库
		  DatabaseUtil dbUtil = DatabaseUtil.getInstance();   
	      Connection connc = dbUtil.getConnection(); 
	      Connection conncg=dbUtil.getConnection();
	      ResultSet rstqg = null;
	      ResultSet rst;
	      PreparedStatement psqg = null;
	      PreparedStatement ps;
		String sqlcx = "select distinct T_JzqInfo.JzqID,T_QgInfo.QgID from T_JzqInfo,T_QgInfo where T_JzqInfo.JzqID=T_QgInfo.JzqID and (QgFl=0 or QgFl=2)  order by T_QgInfo.QgID";
		 try {
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
				
				String ja = "F00A0800" + qgId;
				String je=CzUtil.getTimerJe(ja);
				String[] keys = new String[] { pt };
				String mString = ja + "" + je + "FF";
			
				// 解码
				byte[] b = CzUtil.jm(mString);
				ServerSessionMap sessionMap = ServerSessionMap.getInstance();
				boolean sessionmap = sessionMap.sendMessage(keys, b);
				//输出日志
				 log.info("抄表发送数据"+mString+"-------------"+sessionmap);  
				if(sessionmap==false){
					try {
						Thread.sleep(1000);

					} catch (InterruptedException e) {
						e.printStackTrace();
					}
					 sessionmap = sessionMap.sendMessage(keys, b);
					 if(sessionmap==false){
							try {
								Thread.sleep(1000);

							} catch (InterruptedException e) {
								e.printStackTrace();
							}
							 sessionmap = sessionMap.sendMessage(keys, b);
					 }
				}
				//根据阀门总数设置停留时间
				try {
					Thread.sleep(rowCount*600);

				} catch (InterruptedException e) {
					e.printStackTrace();
				}
		}
		try
		{
			
			DatabaseUtil.close(rst,ps, connc);
			DatabaseUtil.close(rstqg ,psqg, conncg);
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		 } catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	}
    }
