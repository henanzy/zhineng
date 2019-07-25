package com.hnzy.hot.socket;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.TimerTask;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.hnzy.hot.socket.util.DatabaseUtil;
import com.hnzy.hot.socket.util.oracleHelper;

public class ReplyTask extends TimerTask {
	PreparedStatement Oracleps;
	ResultSet Oraclerst;
	int Oraclers = 0;

	PreparedStatement Sqlps;
	ResultSet Sqlrst;
	int Sqlrs = 0;
	
	PreparedStatement ps;
	ResultSet rst;
	int rs = 0;
	
      //日志文件
      private static Log log = LogFactory.getLog(ReplyTask.class);
	@Override
	public void run() {	
		
		//执行的方法，实时更新数据库,连接三门峡缴费软件查找是否缴费
		
			doSomething();
			
	}	

	private void doSomething()  {
		System.out.println("oracle-------------");
					// 连接SQLServer数据库
					DatabaseUtil SqldbUtil = DatabaseUtil.getInstance();
					Connection Sqlconnc = SqldbUtil.getConnection();
					// 连接oracle数据库
					oracleHelper OracledbUtil = oracleHelper.getInstance();
					Connection Oracleconnc = OracledbUtil.getConnection();
					String sql="select YhName,xqName,buildNo,cellNo,houseNo from T_YhInfo";		
					//执行查询SQLserver
					Statement slqps;
					try
					{
						slqps = Sqlconnc .createStatement();
					
					Sqlrst=slqps.executeQuery(sql);
					ResultSetMetaData sData=Sqlrst.getMetaData();	
					String xqName;
					String buildNo;
					String cellNo;
					String houseNo;
					String LH;
					String DYH;
					String CS;
					String SH ="";
					String sh;
					while(Sqlrst.next()){	
						//查询sql数据库
						xqName =Sqlrst.getString("XqName");
						System.out.println("xqName------"+xqName);
						buildNo=Sqlrst.getString("BuildNO");
						cellNo=Sqlrst.getString("CellNO");
						houseNo=Sqlrst.getString("HouseNO");
//						if(xqName.equals("德馨苑廉租住房区")){
//							LH=buildNo;
//						}
						if(xqName.equals("嘉亿城市广场")){
							LH=buildNo;
						}else{
							LH=buildNo+"#";
						}					
						DYH=cellNo;
						if (houseNo.length()==3)
						{
							if(houseNo.substring(1,2).equals("0")){
								String[] str=houseNo.split("0");
								CS=str[0];
								SH=str[1];
							}else {
								CS=houseNo.substring(0, 1);
								SH=houseNo.substring(1);
							}
						}else{
							
							CS=houseNo.substring(0,2);
							sh=houseNo.substring(2);
							if(sh.substring(0, 1).equals("0")){
								SH=houseNo.substring(houseNo.length()-1);
							}else{
								SH=houseNo.substring(2);
							}
							
						}
						
		    
//						String oral="select YHKH,YHBM,JFZT,XQ,LH,DYH,SH,CS from SF_JMXX_V where XQ = '"+xqName+"' and LH='"+LH+"' and DYH='"+DYH+"' and CS='"+CS+"' and SH='"+SH+"'";
						String oral="select YHBM,JFZT,XQ,LH,DYH,SH,CS from SF_JMXX_V where XQ = '"+xqName+"' and LH='"+LH+"' and DYH='"+DYH+"' and CS='"+CS+"' and SH='"+SH+"'";
						
						Oracleps = Oracleconnc.prepareStatement(oral);
						Oraclerst = Oracleps.executeQuery();
						int jfzt =1;
						String yhbm ="";
						String xq =null;
						String sfjf="";
						String yhkh="";
						int col = Oraclerst.getMetaData().getColumnCount();
						while (Oraclerst.next())
						{
							System.out.println("jfzt---------"+jfzt);
						 	jfzt = Oraclerst.getInt("JFZT");
						 	xq=Oraclerst.getString("XQ");
						 	DYH = Oraclerst.getString("DYH");
						 	CS=Oraclerst.getString("CS");
						 	SH=Oraclerst.getString("SH");
						 	yhbm=Oraclerst.getString("YHBM");
//						 	yhkh=Oraclerst.getString("YHKH");
						}
						if (jfzt==0)
						{
							sfjf="是";
						}else{
							sfjf ="否";
						}
						
//						String update="update T_YhInfo set SFJF='"+sfjf+"',YHBM='"+yhbm+"',IDNum='"+yhkh+"'  where XqName='"+xqName+"' and BuildNO='"+buildNo+"' and CellNO='"+cellNo+"' and HouseNO='"+houseNo+"'";
						String update="update T_YhInfo set SFJF='"+sfjf+"',YHBM='"+yhbm+"' where XqName='"+xqName+"' and BuildNO='"+buildNo+"' and CellNO='"+cellNo+"' and HouseNO='"+houseNo+"'";
						ps = Sqlconnc.prepareStatement(update);
						rs = ps.executeUpdate();
					}
					Oracleps.close();
					Oracleconnc.close();
					Sqlrst.close();
					slqps.close();
					ps.close();
					Sqlconnc.close();
					} catch (SQLException e)
					{
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
		}
	}
