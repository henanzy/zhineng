package com.hnzy.hot.socket.server;

import java.net.SocketAddress;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.mina.core.future.CloseFuture;
import org.apache.mina.core.future.IoFuture;
import org.apache.mina.core.future.IoFutureListener;
import org.apache.mina.core.service.IoHandlerAdapter;
import org.apache.mina.core.session.IdleStatus;
import org.apache.mina.core.session.IoSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.hnzy.hot.dao.HanderDao;
import com.hnzy.hot.service.HanderService;
import com.hnzy.hot.socket.util.CzUtil;
import com.hnzy.hot.socket.util.DatabaseUtil;
import com.hnzy.hot.socket.util.MapUtils;
import com.hnzy.hot.socket.util.MapUtilsDf;
import com.hnzy.hot.socket.util.MapUtilsSkq;
import com.hnzy.hot.socket.util.Utils;
import com.hnzy.hot.socket.util.oracleHelper;

public class ServerHandler2 extends IoHandlerAdapter {

	PreparedStatement ps;

	PreparedStatement pss;

	PreparedStatement psC;
	ResultSet rstC;
	PreparedStatement psq;
	ResultSet rstq;
	int rsq = 0;
	PreparedStatement psK;
	ResultSet rstK;
	int rsK = 0;
	PreparedStatement pswK;
	ResultSet rstwK;
	int rswK = 0;
	PreparedStatement pswG;
	ResultSet rstwG;
	int rswG = 0;
	PreparedStatement psG;
	ResultSet rstG;
	PreparedStatement psJ;
	ResultSet rstJ;
	int rsJ = 0;
	PreparedStatement psS;
	ResultSet rstS;
	int rs = 0;
	int rsC = 0;
	ResultSet rsts;
	int rss = 0;
	PreparedStatement Oracleps;
	ResultSet Oraclerst;
	int Oraclers = 0;
	String kfSt;
	String gfSt;
	String SJtring;
	String jaString;
	String dfStatus;
	boolean sessionmap;
	String param;
	private final static Logger log = LoggerFactory.getLogger(ServerHandler2.class);
	ServerSessionMap sessionMap = ServerSessionMap.getInstance();
	// 日志文件
	private static Log logs = LogFactory.getLog(ServerHandler2.class);

	@Autowired
	private HanderService handerService;
	/**
	 * 当一个新客户端连接后触发此方法
	 * 
	 */
	@Override
	public void sessionCreated(IoSession session) {
		logs.info("服务器创建链路成功!" + session.getRemoteAddress());
	}

	/**
	 * 当连接打开时调用
	 */
	@Override
	public void sessionOpened(IoSession session) throws Exception {
		logs.info("服务器打开了的连接，Session ID为" + session.getRemoteAddress() + session.getId());
		SocketAddress remoteAddress = (SocketAddress) session.getRemoteAddress();
		if (remoteAddress != null) {
			String clientIp = remoteAddress.toString();

			sessionMap.add(clientIp, session);


				String mString = "F00A0100AAAAAAAAA3FF";
				// 解码
				byte[] b = CzUtil.jm(mString);
				String[] keys = new String[] { clientIp };
				logs.info("集中器ID不存在发送数据" + mString);
				// 发送数据
				sessionMap.sendMessage(keys, b);
				try {
					Thread.sleep(2000);

				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				// 当动态IP和端口号连接是发送查找区管地址指令
				String SetQgID = "F00A0500AAAAAAAAB4FF";// 改为区管地址 F0 0A 05 00 AA
														// AA
														// AA AA XX FF
				// 解码
				byte[] bQg = CzUtil.jm(SetQgID);
				// 给所有区管发送数据
				sessionMap.sendMessage(keys, bQg);
			}
//			DatabaseUtil.close(rsts, pss, conncs);
//
//		}
	}

	/**
	 * 当实现IOHandlerer的类抛出异常时调用
	 */
	@Override
	public void exceptionCaught(IoSession session, Throwable cause) throws Exception {
		cause.printStackTrace();
		logs.info("{}出现异常{}" + session.getRemoteAddress() + cause);
		// 新增关闭session
		if (session != null) {
			session.close(true);
		}
		sessionMap.remove(session);

	}

	/**
	 * 当接受了一个消息时调用
	 */
	@Override
	public void messageReceived(IoSession session, Object message) {
		SocketAddress remoteAddress = (SocketAddress) session.getRemoteAddress();
		String clientIp = remoteAddress.toString();
		DatabaseUtil dbUtil = DatabaseUtil.getInstance();
		Connection connc = dbUtil.getConnection();
		DatabaseUtil dbUtilS = DatabaseUtil.getInstance();
		Connection conncS = dbUtilS.getConnection();
		byte[] base = (byte[]) message;
		String stringMR = Utils.bytesToHexString(base);

		// System.out.println(stringMR.length());
		String md = null;
		// 接收数据不能为空并且长度大于15
		if (stringMR != null && stringMR.length() > 15) {
			try {
		
					md = stringMR.substring(4, 6);
				
				// 开关阀门，批量开关
				if (md.equals("09")) {
					kg(base);

				} else if (md.equals("04")) // 读阀
				{
					df(base);
				} else if (md.equals("52")) // 读传感器地址
				{
					dcgq(base, connc);
				} else if (md.equals("0f")) // 阀门故障查询
				{
					gzcx(base);
				} else if (md.equals("01")) // 集中器查询状态
				{
					jzqCx(base, clientIp);
				} else if (md.equals("05")) // 区管查询
				{
					qgCx(base, clientIp);
				} else if (md.equals("03")) // 更新区管ID
				{
					UpQg(base);
				} else if (md.equals("1C")) {
					// 添加阀门ID
					tjfmId(base);
				} else if (md.equals("29")) {
					// 读取阀门ID
					DqfmId(base);
				} else if (md.equals("3b")) {
					DkQ(base, session, message, clientIp, conncS);
				} else if (md.equals("3a")) {
					DkqJs(base);
				} else if (md.equals("53")) {// 修改无线传感器地址
					XCgq(base);
				} else if (md.equals("02")) {
					// CqRb(base, connc);
				} else if (md.equals("11")) {// 微信开
					KfWx(base);

				} else if (md.equals("12")) {// 微信关
					GfWx(base);
				}

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					DatabaseUtil.close(rsts, ps, connc);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	// 抽取相同部分
	public boolean cz(String ja, String pt) {

		// 把十六进制数，转换为十进制相加
		int jia = CzUtil.FsZh(ja);
		// 十进制转换为十六进制
		String hex = Integer.toHexString(jia);
		// 截取相加结果后两位
		String je = null;
		for (int j = 0; j < hex.length() - 1; j++) {
			je = hex.charAt(hex.length() - 2) + "" + hex.charAt(hex.length() - 1);
		}
		String[] keys = new String[] { pt };
		String mString = ja + je + "FF";
		// 转换为大写
		String stringsj = CzUtil.Uppercase(mString).toString();
		// 解码
		byte[] b = CzUtil.jm(stringsj);
		ServerSessionMap sessionMap = ServerSessionMap.getInstance();
		boolean sessionmap = sessionMap.sendMessage(keys, b);
		return sessionmap;
	}

	public String CzUtils(String jaString) {
		// 把十六进制数，转换为十进制相加
		int jia = CzUtil.FsZh(jaString);
		// 十进制转换为十六进制
		String hex = Integer.toHexString(jia);
		// 截取相加结果后两位
		String jeq = null;
		for (int j = 0; j < hex.length() - 1; j++) {
			jeq = hex.charAt(hex.length() - 2) + "" + hex.charAt(hex.length() - 1);
		}

		String stringSJ = jaString + jeq + "FF";
		// 转换为大写
		String stringsj = CzUtil.Uppercase(stringSJ).toString();
		return stringsj;
	}

	String jzqPort;
	String qgID;
	String JzqIP;

	String hTemSet;
	String mTemSet;
	String lTemSet;

	public void KfWx(byte[] base) {
		
		// 接收数据
		String stringH = Utils.bytesToHexString(base);
		String varAd = stringH.substring(6, 14);
		// 转换十进制
		int Fms = Integer.parseInt("" + varAd + "", 16);
		// 根据阀门地址查找区管地址,IP地址端口号
		// 更新
		
		handerService.UpdateType("微信开", Fms);
		

		
		Map<String, Object> map=handerService.fmxx(Fms).get(0);
		
		
		
			jzqPort = (String) map.get("jzqPort");
			qgID = (String) map.get("QgID");
			JzqIP = (String) map.get("JzqIP");
			hTemSet = (String) map.get("HTemSet");
			mTemSet = (String) map.get("MTemSet");
			lTemSet = (String) map.get("LTemSet");
		
		// 参数十进制转换为十六进制
		int WDsd = Integer.valueOf(hTemSet);
		int TJzq = Integer.valueOf(mTemSet);
		int TJcs = Integer.valueOf(lTemSet);
		String Wdsd = "00" + Integer.toHexString(WDsd);
		String subwdsd = Wdsd.substring(Wdsd.length() - 2);
		String Tjzq = "00" + Integer.toHexString(TJzq);
		String subtjzq = Tjzq.substring(Tjzq.length() - 2);
		String Tjcs = "00" + Integer.toHexString(TJcs);
		String subtjcs = Tjcs.substring(Tjcs.length() - 2);
		String UppWdsd = CzUtil.Uppercase(subwdsd).toString();
		String UppTjzq = CzUtil.Uppercase(subtjzq).toString();
		String UppTjcs = CzUtil.Uppercase(subtjcs).toString();
		String ja = "F0160900" + qgID + "04" + varAd + "01FFFF01" + UppWdsd + "" + UppTjzq + "" + UppTjcs + "";
		// 微信开阀门
		// String ja = "F0160900" + qgID + "04" + varAd + "01FFFF01FFFFFF";
		// IP地址和端口号
		String pt = "/" + JzqIP + ":" + jzqPort;
		log.info("微信开阀门发送数据：" + ja);
		boolean sessionmap = cz(ja, pt);
		try {
			Thread.sleep(9000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		// fmId十进制
		String jas = "F00F0400" + qgID + "04" + varAd;
		log.info("微信读阀发送数据：" + jas);
		boolean sessionmap1 = cz(jas, pt);
		
	}

	public void GfWx(byte[] base) {
		
		// 接收数据
		String stringH = Utils.bytesToHexString(base);
		String varAd = stringH.substring(6, 14);
		// 转换十进制
		int Fms = Integer.parseInt("" + varAd + "", 16);
		

		handerService.UpdateType("微信关", Fms);
		
		
		Map<String, Object> map=handerService.fmxx(Fms).get(0);
		
		
		
		jzqPort = (String) map.get("jzqPort");
		qgID = (String) map.get("QgID");
		JzqIP = (String) map.get("JzqIP");
		hTemSet = (String) map.get("HTemSet");
		mTemSet = (String) map.get("MTemSet");
		lTemSet = (String) map.get("LTemSet");
		// 参数十进制转换为十六进制
		int WDsd = Integer.valueOf(hTemSet);
		int TJzq = Integer.valueOf(mTemSet);
		int TJcs = Integer.valueOf(lTemSet);
		String Wdsd = "00" + Integer.toHexString(WDsd);
		String subwdsd = Wdsd.substring(Wdsd.length() - 2);
		String Tjzq = "00" + Integer.toHexString(TJzq);
		String subtjzq = Tjzq.substring(Tjzq.length() - 2);
		String Tjcs = "00" + Integer.toHexString(TJcs);
		String subtjcs = Tjcs.substring(Tjcs.length() - 2);
		String UppWdsd = CzUtil.Uppercase(subwdsd).toString();
		String UppTjzq = CzUtil.Uppercase(subtjzq).toString();
		String UppTjcs = CzUtil.Uppercase(subtjcs).toString();
		// fmId十进制
		String ja = "F0160900" + qgID + "04" + varAd + "00FFFF00" + UppWdsd + "" + UppTjzq + "" + UppTjcs + "";
		// 微信关阀门
		// String ja = "F0160900" + qgID + "04" + varAd + "00FFFF00FFFFFF";
		// IP地址和端口号
		String pt = "/" + JzqIP + ":" + jzqPort;
		log.info("微信关阀门发送数据：" + ja);
		boolean sessionmap = cz(ja, pt);
		try {
			Thread.sleep(9000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		// fmId十进制
		String jas = "F00F0400" + qgID + "04" + varAd;
		log.info("微信读阀发送数据：" + jas);
		boolean sessionmap1 = cz(jas, pt);
		

	}

	// 取卡器信息
	public void DkqJs(byte[] base) {
		logs.info("点击读卡器接收数据：" + Utils.bytesToHexString(base));
		// 接收的数据
		String stringH = Utils.bytesToHexString(base);
		// 转换为大写
		String stringHandler = CzUtil.Uppercase(stringH).toString();
		// 截取效验数据
		String jy = CzUtil.getJy(stringHandler);
		// 判断开始和结束
		String start = null;
		String end = null;
		start = stringHandler.charAt(0) + "" + stringHandler.charAt(1);
		end = stringHandler.charAt(stringHandler.length() - 2) + "" + stringHandler.charAt(stringHandler.length() - 1);
		// 判断和校验
		String je = CzUtil.getJe(stringHandler);
		if (start.equals("F0") && end.equals("FF") && je.equals("" + jy + "")) {
			logs.info("读卡成功：" + stringHandler);
			MapUtilsSkq.getMapUtils().add("Dskq", "success");
			logs.info("读卡成功");
		}
	}

	// 读卡
	public void DkQ(byte[] base, IoSession session, Object message, String clientIp, Connection connc) {
		try {
			logs.info("刷卡器接收数据：" + Utils.bytesToHexString(base));
			// 接收的数据
			String stringH = Utils.bytesToHexString(base);
			// 转换为大写
			String stringHandler = CzUtil.Uppercase(stringH).toString();
			// 截取效验数据
			String jy = CzUtil.getJy(stringHandler);
			// 判断开始和结束
			String start = null;
			String end = null;
			start = stringHandler.charAt(0) + "" + stringHandler.charAt(1);
			end = stringHandler.charAt(stringHandler.length() - 2) + ""
					+ stringHandler.charAt(stringHandler.length() - 1);
			String je = CzUtil.getJe(stringHandler);
			if (start.equals("F0") && end.equals("FF") && je.equals("" + jy + "")) {
				// 截取读卡器ID号,用户编码
				String DkqId = stringHandler.substring(8, 16);
				// 截取卡片卡号
				String KhId = stringHandler.substring(16, 24);
				String khId = stringHandler.substring(17, 24);
				String Oraclesql = "select distinct YHBM,JFZT   from sf_jmxx_v where   CNQ='2018-2019' and JFZT=0 and YHKH='"
						+ khId + "'";
				// 连接oracle数据库
				oracleHelper OracledbUtil = oracleHelper.getInstance();
				Connection Oracleconnc = OracledbUtil.getConnection();
				// 执行查询oracle

				Oracleps = Oracleconnc.prepareStatement(Oraclesql);
				Oraclerst = Oracleps.executeQuery();
				// 获得数据oracle
				int col = Oraclerst.getMetaData().getColumnCount();

				String YHBM = null;
				String Yhfl = null;
				int JFZT = 2;
				String fmID;
				while (Oraclerst.next()) {
					// 用户编码
					YHBM = Oraclerst.getString("YHBM");
					// 缴费状态
					JFZT = Oraclerst.getInt("JFZT");
				}

				if (YHBM != null) {
					String jfzt = null;
					if (JFZT == 0) {
						jfzt = "是";
					} else {
						jfzt = "否";
					}
					// 更新数据库
					
					handerService.UpdateJfzt(YHBM, jfzt, khId);
					// 执行更新sqlserver
					
					
					logs.info("卡号----------：" + khId);
					// 查找阀门是否开关
					
					// 执行查询sql
					
					
					String valAd = null;
					String qgID = null;
					String SFJF = null;
					double roomTemp = 0;
					Map<String, Object> map =handerService.fmkg(YHBM).get(0);
					
						valAd = (String) map.get("ValAd");
						qgID = (String) map.get("QgID");
						Yhfl = (String) map.get("Yhfl");
						roomTemp = (Double) map.get("RoomTemp");
						SFJF = (String) map.get("SFJF");
					
					if (valAd != null) {
						logs.info("刷卡器阀门地址--------：" + valAd);
						MapUtilsSkq.getMapUtils().add("skqfmid", valAd);
						// 把FmID转换为int类型
						int fInteger = Integer.valueOf(valAd);
						// FmID十进制转换为十六进制
						String fmd = CzUtil.Uppercase(Integer.toHexString(fInteger)).toString();
						// 发送读阀门指令
						SJtring = "F00F0400" + qgID + "040" + fmd;
						logs.info("读阀发送指令数据----------：" + SJtring + "----ip,port" + clientIp);
						sessionmap = cz(SJtring, clientIp);
						try {
							Thread.sleep(3000);
						} catch (InterruptedException e) {
							e.printStackTrace();
						}
						// 读阀门是否成功
						dfStatus = MapUtilsSkq.getMapUtils().get("df");
						fmID = MapUtilsSkq.getMapUtils().get("fmID");
						// 如果读阀门失败
						if (dfStatus == null) {
							// 发送读阀门指令
							SJtring = "F00F0400" + qgID + "040" + fmd;
							logs.info("读阀发送指令数据：" + SJtring);
							sessionmap = cz(SJtring, clientIp);
							try {
								Thread.sleep(2000);
							} catch (InterruptedException e) {
								e.printStackTrace();
							}
							dfStatus = MapUtilsSkq.getMapUtils().get("df");
							fmID = MapUtilsSkq.getMapUtils().get("fmID");
							if (dfStatus == null) {
								// 发送读阀门指令
								// fmId十进制
								SJtring = "F00F0400" + qgID + "040" + fmd;
								logs.info("读阀发送指令数据：" + SJtring);

								sessionmap = cz(SJtring, clientIp);
								try {
									Thread.sleep(2000);
								} catch (InterruptedException e) {
									e.printStackTrace();
								}
								dfStatus = MapUtilsSkq.getMapUtils().get("df");
								fmID = MapUtilsSkq.getMapUtils().get("fmID");
							}
						}
						// 0已经交费，开阀门
						if (JFZT == 0) {
							if (dfStatus != null && dfStatus.equals("关") && fmID != null
									&& fmID.equals("0" + fmd + "")) {
								MapUtils.getMapUtils().add("df", null);
								SJtring = "F0160900" + qgID + "040" + fmd + "01FFFF01FFFFFF";
								MapUtils.getMapUtils().add("param", "kFm");

								if (Yhfl != null && Yhfl.equals("重点监控") || Yhfl != null && Yhfl.equals("退费停暖")
										|| roomTemp == 0.0) {
									// 返回读卡器指令
									jaString = "F00F3B00" + DkqId + "" + KhId + "02";
									// 如果查出数据则插入数据库刷卡器表
									int dkqId = Integer.parseInt("" + DkqId + "", 16);
									// 返回读卡器指令
									SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
									String date = df.format(new Date());
									sessionmap = cz(jaString, clientIp);
									
									handerService.InsertSkq(dkqId+"", khId, "语音提示已关闭", "成功", "已交费", date);
									

									logs.info("关阀门--刷卡器发送数据" + jaString);
									cz(jaString, clientIp);
								} else {
									try {
										Thread.sleep(1000);
									} catch (InterruptedException e) {
										e.printStackTrace();
									}
									// 发送开阀门指令
									sessionmap = cz(SJtring, clientIp);
									try {
										Thread.sleep(1000);
									} catch (InterruptedException e) {
										e.printStackTrace();
									}

									String kfm = MapUtils.getMapUtils().get("Kfsuc");
									// 判断开阀门是否成功
									if (kfm == null) {
										// fmId十进制
										SJtring = "F0160900" + qgID + "040" + fmd + "01FFFF01FFFFFF";
										MapUtils.getMapUtils().add("param", "kFm");
										// 发送开阀门指令
										sessionmap = cz(SJtring, clientIp);
									}
									// 停留
									try {
										Thread.sleep(1000);
									} catch (InterruptedException e) {
										e.printStackTrace();
									}

									if (sessionmap == true) {
										MapUtils.getMapUtils().add("Kfsuc", null);
										// 如果查出数据则插入数据库刷卡器表
										int dkqId = Integer.parseInt("" + DkqId + "", 16);
										SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
										String date = df.format(new Date());
										
										handerService.InsertSkq(dkqId+"", khId, "开阀门", "成功", "已交费", date);
										
										try {
											Thread.sleep(3000);
										} catch (InterruptedException e) {
											e.printStackTrace();
										}
										// 返回读卡器指令
										jaString = "F00F3B00" + DkqId + "" + KhId + "01";
										sessionmap = cz(jaString, clientIp);
										logs.info("开阀门--刷卡器发送数据" + jaString);
										try {
											Thread.sleep(1000);
										} catch (InterruptedException e) {
											e.printStackTrace();
										}
										// 读阀门发送指令
										SJtring = "F00F0400" + qgID + "040" + fmd;
										logs.info("读阀门发送指令数据：" + SJtring);
										sessionmap = cz(SJtring, clientIp);
									} else {
										// 如果查出数据则插入数据库刷卡器表
										int dkqId = Integer.parseInt("" + DkqId + "", 16);
										SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
										String date = df.format(new Date());

										handerService.InsertSkq(dkqId+"", khId, "开阀门", "通讯失败", "已交费", date);

									}
								}
							} else if (dfStatus != null && dfStatus.equals("开") && fmID != null
									&& fmID.equals("0" + fmd + "")) {
								if (SFJF != null && SFJF.equals("是")) {
									try {
										Thread.sleep(1000);
									} catch (InterruptedException e) {
										e.printStackTrace();
									}
									// 如果查出数据则插入数据库刷卡器表
									int dkqId = Integer.parseInt("" + DkqId + "", 16);
									// 返回读卡器指令
									jaString = "F00F3B00" + DkqId + "" + KhId + "01";
									SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
									String date = df.format(new Date());
									sessionmap = cz(jaString, clientIp);

									handerService.InsertSkq(dkqId+"", khId, "语音提示已开阀", "成功", "已交费", date);

								} else {

									MapUtils.getMapUtils().add("df", null);

									SJtring = "F0160900" + qgID + "040" + fmd + "00FFFF01FFFFFF";
									MapUtils.getMapUtils().add("param", "gFm");
									// 发送关阀指令
									sessionmap = cz(SJtring, clientIp);
									try {
										Thread.sleep(2000);
									} catch (InterruptedException e) {
										e.printStackTrace();
									}
									String Gfm = MapUtils.getMapUtils().get("Gfsuc");
									if (Gfm == null) {
										SJtring = "F0160900" + qgID + "040" + fmd + "00FFFF01FFFFFF";
										MapUtils.getMapUtils().add("param", "gFm");
										// 发送关阀指令
										sessionmap = cz(SJtring, clientIp);
									}
									try {
										Thread.sleep(2000);
									} catch (InterruptedException e) {
										e.printStackTrace();
									}
									if (sessionmap == true) {
										MapUtils.getMapUtils().add("Gfsuc", null);
										// 如果查出数据则插入数据库刷卡器表
										int dkqId = Integer.parseInt("" + DkqId + "", 16);
										SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
										String date = df.format(new Date());
	
										handerService.InsertSkq(dkqId+"", khId, "关阀门", "成功", "已交费", date);

										try {
											Thread.sleep(3000);
										} catch (InterruptedException e) {
											e.printStackTrace();
										}
										// 返回读卡器指令
										jaString = "F00F3B00" + DkqId + "" + KhId + "02";
										logs.info("关阀门--刷卡器发送数据" + jaString);
										sessionmap = cz(jaString, clientIp);
										try {
											Thread.sleep(1000);
										} catch (InterruptedException e) {
											e.printStackTrace();
										}
										// 读阀门发送指令
										SJtring = "F00F0400" + qgID + "040" + fmd;
										logs.info("读阀门发送指令数据：" + SJtring);
										sessionmap = cz(SJtring, clientIp);

									} else {

										// 如果查出数据则插入数据库刷卡器表
										int dkqId = Integer.parseInt("" + DkqId + "", 16);
										SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
										String date = df.format(new Date());

										handerService.InsertSkq(dkqId+"", khId, "", "通讯失败", "已交费", date);
										

									}
									// 1未交费
								}
							} else {
								// 如果查出数据则插入数据库刷卡器表
								int dkqId = Integer.parseInt("" + DkqId + "", 16);
								SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
								String date = df.format(new Date());
								
								handerService.InsertSkq(dkqId+"", khId, "", "通讯失败", "已交费", date);
							
							}
							try {

							} catch (Exception e) {
								e.printStackTrace();
							}
						} else {
							// 如果查出数据则插入数据库刷卡器表
							int dkqId = Integer.parseInt("" + DkqId + "", 16);
							SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
							String date = df.format(new Date());
							
							handerService.InsertSkq(dkqId+"", khId, "", "失败", "未交费", date);
							
							try {
								Thread.sleep(3000);
							} catch (InterruptedException e) {
								e.printStackTrace();
							}
							// 返回读卡器指令，未交费
							String jaString = "F00F3B00" + DkqId + "" + KhId + "03";
							sessionmap = cz(jaString, clientIp);
						}
					} else {

						// 如果查出数据则插入数据库刷卡器表
						int dkqId = Integer.parseInt("" + DkqId + "", 16);
						SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						String date = df.format(new Date());
						
						handerService.InsertSkq(dkqId+"", khId, "", "失败", "未交费", date);
						
						try {
							Thread.sleep(3000);
						} catch (InterruptedException e) {
							e.printStackTrace();
						}
						// 返回读卡器指令,未交费
						String jaString = "F00F3B00" + DkqId + "" + KhId + "03";
						sessionmap = cz(jaString, clientIp);
					}
				}else{
					
					// 如果查出数据则插入数据库刷卡器表
					int dkqId = Integer.parseInt("" + DkqId + "", 16);
					SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String date = df.format(new Date());

					handerService.InsertSkq(dkqId+"", khId, "", "失败", "未交费", date);
					
					try {
						Thread.sleep(3000);
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
					// 返回读卡器指令,未交费
					String jaString = "F00F3B00" + DkqId + "" + KhId + "03";
					sessionmap = cz(jaString, clientIp);	
					
				}
				try {
					DatabaseUtil.close(Oraclerst, Oracleps, Oracleconnc);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

		} catch (SQLException e1) {

			// TODO Auto-generated catch block
			e1.printStackTrace();
		} finally {
			try {
				MapUtilsSkq.getMapUtils().add("skqfmid", null);
				DatabaseUtil.close(rstS, psS, connc);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public void XCgq(byte[] base) {

		logs.info("修改无线传感器地址接收数据：" + Utils.bytesToHexString(base));
		// 接收的数据
		String stringH = Utils.bytesToHexString(base);
		// 转换为大写
		String stringHandler = CzUtil.Uppercase(stringH).toString();
		// 截取效验数据
		String jy = CzUtil.getJy(stringHandler);
		// 判断开始和结束
		String start = null;
		String end = null;
		start = stringHandler.charAt(0) + "" + stringHandler.charAt(1);
		end = stringHandler.charAt(stringHandler.length() - 2) + "" + stringHandler.charAt(stringHandler.length() - 1);
		// 判断和校验
		String je = CzUtil.getJe(stringHandler);
		if (start.equals("F0") && end.equals("FF") && je.equals("" + jy + "")) {
			String subSutaus = stringHandler.substring(stringHandler.length() - 6, stringHandler.length() - 4);
			if (subSutaus.equals("00")) {
				MapUtils.getMapUtils().add("Xcgq", "success");
				logs.info("修改成功");
			} else {
				MapUtils.getMapUtils().add("Xcgq", "fail");
				logs.info("修改失败");
			}

		} else {
			MapUtils.getMapUtils().add("Xcgq", "fail");
			logs.info("修改失败");
		}
	}

	// 读取阀门ID
	public void DqfmId(byte[] base) {
		logs.info("读取阀门ID：" + Utils.bytesToHexString(base));
		// 接收的数据
		String stringH = Utils.bytesToHexString(base);
		// 转换为大写
		String stringHandler = CzUtil.Uppercase(stringH).toString();
		// 截取效验数据
		String jy = CzUtil.getJy(stringHandler);
		// 判断开始和结束
		String start = null;
		String end = null;
		start = stringHandler.charAt(0) + "" + stringHandler.charAt(1);
		end = stringHandler.charAt(stringHandler.length() - 2) + "" + stringHandler.charAt(stringHandler.length() - 1);
		// 判断和校验
		String je = CzUtil.getJe(stringHandler);
		String fmString = "";
		if (start.equals("F0") && end.equals("FF") && je.equals("" + jy + "")) {
			if (stringHandler.length() > 20) {
				logs.info("读阀成功：" + stringHandler);
				String subString = stringHandler.substring(16, stringHandler.length() - 4);
				for (int i = 0; i < subString.length(); i++) {

					fmString += Integer.parseInt(subString.substring(i, i + 8), 16) + " ";
					i = i + 7;
				}
				MapUtils.getMapUtils().add("fmId", fmString);
				MapUtils.getMapUtils().add("DqfmId", "success");
				logs.info("读阀成功");
			}
		} else {
			MapUtils.getMapUtils().add("DqfmId", "fail");
			logs.info("读阀失败");
		}
	}

	// 添加阀门ID
	public void tjfmId(byte[] base) {
		logs.info("添加阀门ID接收数据：" + Utils.bytesToHexString(base));
		// 接收的数据
		String stringH = Utils.bytesToHexString(base);
		// 转换为大写
		String stringHandler = CzUtil.Uppercase(stringH).toString();
		// 截取效验数据
		String jy = CzUtil.getJy(stringHandler);
		// 判断开始和结束
		String start = null;
		String end = null;
		start = stringHandler.charAt(0) + "" + stringHandler.charAt(1);
		end = stringHandler.charAt(stringHandler.length() - 2) + "" + stringHandler.charAt(stringHandler.length() - 1);
		String je = CzUtil.getJe(stringHandler);
		if (start.equals("F0") && end.equals("FF") && je.equals("" + jy + "")) {
			logs.info("添加阀门ID成功：" + stringHandler);
			logs.info("添加阀门ID成功");
			MapUtils.getMapUtils().add("tjfmId", "success");

		} else {
			MapUtils.getMapUtils().add("tjfmId", "fail");
			logs.info("添加阀门ID失败");
		}
	}

	// 更新区管ID
	public void UpQg(byte[] base) {
		logs.info("更新区管ID接收数据：" + Utils.bytesToHexString(base));
		// 获取发送的时间
		// 接收的数据
		String stringH = Utils.bytesToHexString(base);
		// 转换为大写
		String stringHandler = CzUtil.Uppercase(stringH).toString();
		// 截取效验数据
		String jy = CzUtil.getJy(stringHandler);
		// 判断开始和结束
		String start = null;
		String end = null;
		start = stringHandler.charAt(0) + "" + stringHandler.charAt(1);
		end = stringHandler.charAt(stringHandler.length() - 2) + "" + stringHandler.charAt(stringHandler.length() - 1);
		String je = CzUtil.getJe(stringHandler);
		if (start.equals("F0") && end.equals("FF") && je.equals("" + jy + "")) {
			String jeq = stringHandler.substring(16, 18);
			if (jeq.equals("01")) {
				logs.info("更新区管ID成功：" + stringHandler);
				logs.info("更新区管ID成功");
				MapUtils.getMapUtils().add("UpQg", "success");
			} else {
				logs.info("更新区管ID失败");
				MapUtils.getMapUtils().add("UpQg", "fail");
			}
		}
	}

	// 区管查询
	public void qgCx(byte[] base, String clientIp) {
		String[] ipPortString = clientIp.split(":");
		String IP = ipPortString[0];
		DatabaseUtil dbUtil = DatabaseUtil.getInstance();
		Connection conncsq = dbUtil.getConnection();
		String[] ip = IP.split("/");
		Integer port = Integer.valueOf(ipPortString[1]);
		String Ip = ip[1];
		// 接收数据F00B0501D0D0D0200192FF
		logs.info("区管查询接收数据：" + Utils.bytesToHexString(base));
		String qgId = null;
		SimpleDateFormat Sdate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		// 获取发送的时间
		String time = Sdate.format(new Date());
		// 接收的数据
		String stringH = Utils.bytesToHexString(base);
		// 转换为大写
		String stringHandler = CzUtil.Uppercase(stringH).toString();

		// 截取效验数据
		String jy = CzUtil.getJy(stringHandler);
		// 判断开始和结束
		String start = null;
		String end = null;
		start = stringHandler.charAt(0) + "" + stringHandler.charAt(1);
		end = stringHandler.charAt(stringHandler.length() - 2) + "" + stringHandler.charAt(stringHandler.length() - 1);
		String je = CzUtil.getJe(stringHandler);
		if (start.equals("F0") && end.equals("FF") && je.equals("" + jy + "")) {
			// 截取qgID,
			qgId = stringHandler.substring(8, 16);
			// 截取是否为成功
			String sT = stringHandler.substring(16, 18);

			if (sT.equals("01")) {
				
				handerService.UpdateQg("1", time, qgId);
			
					
					// 根据区管地址更新区管的IP和port

					handerService.UpdateJzq(Ip, port+"", qgId);
				
					logs.info("更新区管地址的IP和Port" + qgId);
					logs.info("区管查询成功：" + stringHandler);
					MapUtils.getMapUtils().add("qg", "success");
					logs.info("区管查询成功");
			

			} else {
				MapUtils.getMapUtils().add("qg", "fail");
				logs.info("区管查询失败");
			}
		} else {
			MapUtils.getMapUtils().add("qg", "fail");
			logs.info("区管查询失败");
		}
		try {
			DatabaseUtil.close(psq, conncsq);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 集中器查询
	public void jzqCx(byte[] base, String clientIp) {
		logs.info("集中器查询状态接收数据：" + Utils.bytesToHexString(base));
		String[] ipPortString = clientIp.split(":");
		String IP = ipPortString[0];

		String[] ip = IP.split("/");
		Integer port = Integer.valueOf(ipPortString[1]);
		String Ip = ip[1];
		SimpleDateFormat Sdate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		// 获取发送的时间
		String time = Sdate.format(new Date());
		// 接收的数据
		String stringH = Utils.bytesToHexString(base);
		// 转换为大写
		String stringHandler = CzUtil.Uppercase(stringH).toString();
		// 截取jzqID
		String JzqId = stringHandler.substring(8, 16);
		DatabaseUtil dbUtil = DatabaseUtil.getInstance();
		Connection conncsJ = dbUtil.getConnection();
		// 截取效验数据
		String jy = CzUtil.getJy(stringHandler);
		// 判断开始和结束
		String start = null;
		String end = null;
		String id = null;
		start = stringHandler.charAt(0) + "" + stringHandler.charAt(1);
		end = stringHandler.charAt(stringHandler.length() - 2) + "" + stringHandler.charAt(stringHandler.length() - 1);
		String je = CzUtil.getJe(stringHandler);
		if (start.equals("F0") && end.equals("FF") && je.equals("" + jy + "")) {

								// 根据集中器ID更新集中器端口

								handerService.UpdateJzqDk(port+"", Ip, "1", time, JzqId);
							

							MapUtils.getMapUtils().add("jzq", "success");
							logs.info("集中器查询状态成功接收数据：" + stringHandler);
		} else {
			MapUtils.getMapUtils().add("jzq", "fail");
		}
		try {
			DatabaseUtil.close(rstJ, psJ, conncsJ);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 阀门故障查询
	public void gzcx(byte[] base) {
		DatabaseUtil dbUtil = DatabaseUtil.getInstance();
		Connection conncsG = dbUtil.getConnection();
		logs.info("阀门故障查询接收数据：" + Utils.bytesToHexString(base));
		// 接收的数据
		String stringH = Utils.bytesToHexString(base);
		// 转换为大写
		String stringHandler = CzUtil.Uppercase(stringH).toString();
		// 截取效验数据
		String jy = CzUtil.getJy(stringHandler);
		// 判断开始和结束
		String start = null;
		String end = null;
		start = stringHandler.charAt(0) + "" + stringHandler.charAt(1);
		end = stringHandler.charAt(stringHandler.length() - 2) + "" + stringHandler.charAt(stringHandler.length() - 1);
		String je = CzUtil.getJe(stringHandler);
		String ycString = "";
		if (start.equals("F0") && end.equals("FF") && je.equals("" + jy + "")) {
			logs.info("阀门故障查询成功：" + stringHandler);
			String fmID = stringHandler.substring(32, 40);
			String dk = stringHandler.substring(40, 42);
			String gb = stringHandler.substring(42, 44);
			String kd = stringHandler.substring(44, 46);
			String kt = stringHandler.substring(46, 48);
			String fmwd = stringHandler.substring(48, 50);
			String cgqtx = stringHandler.substring(50, 52);
			String cgqwd = stringHandler.substring(52, 54);

			SimpleDateFormat Sdate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time = Sdate.format(new Date());
			// 十六进制转换为十进制数
			int fmId = Integer.parseInt(fmID, 16);
			if (dk.equals("01")) {

				ycString += "阀门打开异常,";
			}
			if (gb.equals("01")) {
				ycString += "阀门关闭异常,";
			}
			if (kd.equals("01")) {
				ycString += "阀门开度异常,";
			}
			if (kt.equals("01")) {
				ycString += "阀门壳体拆开,";
			}
			if (fmwd.equals("01")) {
				ycString += "超温报警,";
			}
			if (cgqtx.equals("01")) {
				ycString += "失联,";
			}
			if (cgqwd.equals("01")) {
				ycString += "失联";
			}
			
			handerService.InsertAlarmInfor(fmId+"", ycString, time);	
			handerService.UpdateAlarmInforsX(ycString, time, fmId+"");		
		}

	}

	// 读取传感器地址
	public void dcgq(byte[] base, Connection connc) {
		logs.info("读取传感器地址接收数据：" + Utils.bytesToHexString(base));
		String stringH = Utils.bytesToHexString(base);

		// // 转换为大写
		String stringHandler = CzUtil.Uppercase(stringH).toString();
		String jy = CzUtil.getJy(stringHandler);
		// 判断开始和结束
		String start = null;
		String end = null;
		start = stringHandler.charAt(0) + "" + stringHandler.charAt(1);
		end = stringHandler.charAt(stringHandler.length() - 2) + "" + stringHandler.charAt(stringHandler.length() - 1);
		String je = CzUtil.getJe(stringHandler);

		if (start.equals("F0") && end.equals("FF") && je.equals("" + jy + "")) {

			// 截取阀门ID
			String fmId = stringHandler.substring(22, 30);
			String cgqID = stringHandler.substring(30, 38);
			int fmID = Integer.parseInt(fmId, 16);
			int cgqId = Integer.parseInt(cgqID, 16);
			String Insql = "insert into dcgq values ('" + fmID + "','" + cgqId + "')";
			try {
				ps = connc.prepareStatement(Insql);
				ps.execute();
				MapUtils.getMapUtils().add("dcgq", "success");
				logs.info("读取传感器地址成功：" + stringHandler);
				logs.info("读取传感器地址成功");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else {
			MapUtils.getMapUtils().add("dcgq", "fail");
			logs.info("读取传感器地址失败");
		}
	}

	Calendar dateYear = Calendar.getInstance();

	// 读阀
	public void df(byte[] base) {
		String Insql;
		DatabaseUtil dbUtil = DatabaseUtil.getInstance();
		Connection conncsC = dbUtil.getConnection();
		logs.info("读阀接收数据：" + Utils.bytesToHexString(base));
		String stringH = Utils.bytesToHexString(base);
		if (stringH != null) {
			// 转换为大写
			String stringHandler = CzUtil.Uppercase(stringH).toString();
			String jy = CzUtil.getJy(stringHandler);
			// 判断开始和结束
			String start = null;
			String end = null;
			int tqyb = 0;
			start = stringHandler.charAt(0) + "" + stringHandler.charAt(1);
			end = stringHandler.charAt(stringHandler.length() - 2) + ""
					+ stringHandler.charAt(stringHandler.length() - 1);
			String je = CzUtil.getJe(stringHandler);
			if (start.equals("F0") && end.equals("FF") && je.equals("" + jy + "")) {
				logs.info("读阀成功：" + stringHandler);
				// 区管ID
				String qgID = stringHandler.substring(8, 16);
				// 阀门ID
				String fmID = stringHandler.substring(18, 26);
				// 阀门状态
				String fmState = stringHandler.substring(26, 28);
				// 阀门开度
				String fmkd = stringHandler.substring(28, 30);// 十进制
				// 阀门锁定
				String fmLock = stringHandler.substring(30, 32);
				// 缴费标识
				String fmJF = stringHandler.substring(32, 34);
				// 阀门温度
				String fmTemp = stringHandler.substring(34, 38);// 十进制
				// 室内温度
				String fmRoomTemp = stringHandler.substring(38, 42);// 十进制
				// 调节周期
				String HTemSet = stringHandler.substring(42, 44);// 十进制
				// 设定温度
				String MTemSet = stringHandler.substring(44, 46);// 十进制
				// 调节参数
				String LTemSet = stringHandler.substring(46, 48);// 十进制
				String fms = fmTemp.substring(0, 2);
				String fmf = fmTemp.substring(2);
				String fmRs = fmRoomTemp.substring(0, 2);
				String fmRf = fmRoomTemp.substring(2);
				// 转换十进制
				int Fms = Integer.parseInt("" + fms + "", 16);
				int Fmf = Integer.parseInt("" + fmf + "", 16);
				int FmRs = Integer.parseInt("" + fmRs + "", 16);
				int FmRf = Integer.parseInt("" + fmRf + "", 16);
				int FmID = Integer.parseInt("" + fmID + "", 16);
				int Fmkd = Integer.parseInt("" + fmkd + "", 16);
				int hTemSet = Integer.parseInt("" + HTemSet + "", 16);
				int mTemSet = Integer.parseInt("" + MTemSet + "", 16);
				int lTemSet = Integer.parseInt("" + LTemSet + "", 16);
				String fmS = String.valueOf(Integer.parseInt("" + Fms + ""));
				String fmF = String.valueOf(Integer.parseInt("" + Fmf + ""));
				String fmRS = String.valueOf(Integer.parseInt("" + FmRs + ""));
				String fmRF = String.valueOf(Integer.parseInt("" + FmRf + ""));
				// 阀门温度
				String FmTemp = fmS + "." + fmF;
				// 室内温度
				String FmRoomTemp = fmRS + "." + fmRF;
				if (fmState.equals("00")) {
					fmState = "关";
				} else {
					fmState = "开";
				}
				if (fmLock.equals("00")) {
					fmLock = "否";
				} else {
					fmLock = "是";
				}
				if (fmJF.equals("00")) {
					fmJF = "否";
				} else {
					fmJF = "是";
				}
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String date = df.format(new Date());				
														
						tqyb = handerService.getTqyb();
					
					if (Double.valueOf(FmRoomTemp).intValue() < 40) {
						
						Map<String, Object> map = new HashMap<String, Object>();
						map.put("QgID",qgID);
						map.put("Status",fmState);
						map.put("FamKd",Fmkd);
						map.put("LockSt",fmLock);
						map.put("JFSt",fmJF);
						map.put("valTemp",FmTemp);
						map.put("RoomTemp",FmRoomTemp);
						map.put("HTemSet",hTemSet);
						map.put("mTemSet",mTemSet);
						map.put("LTemSet",lTemSet);
						map.put("RecordTime",date);
						map.put("Tqyb",tqyb);
						map.put("ValAd",FmID);
						handerService.UpdateFmInfo(map);
						
						
					}
					Calendar cale = null;
					cale = Calendar.getInstance();
					String year = String.valueOf(dateYear.get(Calendar.YEAR));
					int yf = cale.get(Calendar.MONTH) + 1;
					Map<String, Object> map1= new HashMap<String, Object>();
					map1.put("FmID", FmID);
					map1.put("fmState", fmState);
					map1.put("Fmkd", Fmkd);
					map1.put("fmLock", fmLock);
					map1.put("FmTemp", FmTemp);
					map1.put("FmRoomTemp", FmRoomTemp);
					map1.put("hTemSet", hTemSet);
					map1.put("mTemSet", mTemSet);
					map1.put("lTemSet", lTemSet);
					map1.put("date", date);
					map1.put("tqyb", tqyb);
					if (year.equals("2018") || year.equals("2019") && yf < 4) {
						map1.remove("table");
						map1.put("table", "T_FmHistory18");
						handerService.InsertFmls(map1);
					} else if (year.equals("2019") && yf >= 3 || year.equals("2020") && yf < 4) {
						map1.remove("table");
						map1.put("table", "T_FmHistory19");
						handerService.InsertFmls(map1);

					} else if (year.equals("2020") && yf >= 3 || year.equals("2021") && yf < 4) {
						map1.remove("table");
						map1.put("table", "T_FmHistory20");
						handerService.InsertFmls(map1);
					} else if (year.equals("2021") && yf >= 3 || year.equals("2022") && yf < 4) {
						map1.remove("table");
						map1.put("table", "T_FmHistory21");
						handerService.InsertFmls(map1);
					}

					
					if (MapUtilsSkq.getMapUtils().get("skqfmid") != null
							&& MapUtilsSkq.getMapUtils().get("skqfmid").equals("" + FmID + "")) {
						logs.info("skq读阀阀门地址----" + MapUtilsSkq.getMapUtils().get("skqfmid"));
						// 获取刷卡阀门状态
						MapUtilsSkq.getMapUtils().add("df", fmState);
						// 获取刷卡阀门地址
						MapUtilsSkq.getMapUtils().add("fmID", fmID);
					}
					if (MapUtilsDf.getMapUtils().get("dFmParam") != null
							&& MapUtilsDf.getMapUtils().get("dFmParam").equals("" + FmID + "")) {
						MapUtilsDf.getMapUtils().add("dFm", "success");
					} else if (MapUtilsDf.getMapUtils().get("PlDF") != null
							&& MapUtilsDf.getMapUtils().get("PlDF").equals("sj")) {
						MapUtilsDf.getMapUtils().add("PldFm", "success");
					}
					logs.info("读阀成功");
				

			} else if (stringHandler.length() > 52) {
				if (stringHandler.contains("FFF")) {
					String[] strings = stringHandler.split("FFF");
					for (int i = 0; i < strings.length; i++) {
						if (i == 0) {
							String string = strings[0] + "ff";
							if (string.length() == 52) {
								cs(string, conncsC);
							}
						} else if (i == strings.length - 1) {

							String string2 = "f" + strings[i];
							if (string2.length() == 52) {
								cs(string2, conncsC);
							}

						} else {
							String string3 = "f" + strings[i] + "ff";
							if (string3.length() == 52) {
								cs(string3, conncsC);
							}
						}
					}

				} else {
					logs.info("读阀失败----");
					MapUtilsDf.getMapUtils().add("dFm", "fail");
					logs.info("读阀失败");
				}
			} else {
				logs.info("读阀失败----");
				MapUtilsDf.getMapUtils().add("dFm", "fail");
				logs.info("读阀失败");
			}
		} else {
			logs.info("超时----");
			MapUtilsDf.getMapUtils().add("dFm", "超时");
			logs.info("读阀超时");
		}
		try {
			DatabaseUtil.close(rstC, psC, conncsC);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void cs(String stringHandler, Connection connc) {
		int tqyb = 0;
		String je = CzUtil.getJe(stringHandler);
		String jy = CzUtil.getJy(stringHandler);
		if (je.equals("" + jy + "")) {
			logs.info("读阀成功：" + stringHandler);
			// 区管ID
			String qgID = stringHandler.substring(8, 16);
			// 阀门ID
			String fmID = stringHandler.substring(18, 26);
			// 阀门状态
			String fmState = stringHandler.substring(26, 28);
			// 阀门开度
			String fmkd = stringHandler.substring(28, 30);// 十进制
			// 阀门锁定
			String fmLock = stringHandler.substring(30, 32);
			// 缴费标识
			String fmJF = stringHandler.substring(32, 34);
			// 阀门温度
			String fmTemp = stringHandler.substring(34, 38);// 十进制
			// 室内温度
			String fmRoomTemp = stringHandler.substring(38, 42);// 十进制
			// 调节周期
			String HTemSet = stringHandler.substring(42, 44);// 十进制
			// 设定温度
			String MTemSet = stringHandler.substring(44, 46);// 十进制
			// 调节参数
			String LTemSet = stringHandler.substring(46, 48);// 十进制
			String fms = fmTemp.substring(0, 2);
			String fmf = fmTemp.substring(2);
			String fmRs = fmRoomTemp.substring(0, 2);
			String fmRf = fmRoomTemp.substring(2);
			// 转换十进制
			int Fms = Integer.parseInt("" + fms + "", 16);
			int Fmf = Integer.parseInt("" + fmf + "", 16);
			int FmRs = Integer.parseInt("" + fmRs + "", 16);
			int FmRf = Integer.parseInt("" + fmRf + "", 16);
			int FmID = Integer.parseInt("" + fmID + "", 16);
			int Fmkd = Integer.parseInt("" + fmkd + "", 16);
			int hTemSet = Integer.parseInt("" + HTemSet + "", 16);
			int mTemSet = Integer.parseInt("" + MTemSet + "", 16);
			int lTemSet = Integer.parseInt("" + LTemSet + "", 16);
			String fmS = String.valueOf(Integer.parseInt("" + Fms + ""));
			String fmF = String.valueOf(Integer.parseInt("" + Fmf + ""));
			String fmRS = String.valueOf(Integer.parseInt("" + FmRs + ""));
			String fmRF = String.valueOf(Integer.parseInt("" + FmRf + ""));
			// 阀门温度
			String FmTemp = fmS + "." + fmF;
			// 室内温度
			String FmRoomTemp = fmRS + "." + fmRF;
			if (fmState.equals("00")) {
				fmState = "关";
			} else {
				fmState = "开";
			}
			if (fmLock.equals("00")) {
				fmLock = "否";
			} else {
				fmLock = "是";
			}
			if (fmJF.equals("00")) {
				fmJF = "否";
			} else {
				fmJF = "是";
			}
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date = df.format(new Date());

				tqyb = handerService.getTqyb();
				
				if (Double.valueOf(FmRoomTemp).intValue() < 40) {

					Map<String, Object> map = new HashMap<String, Object>();
					map.put("QgID",qgID);
					map.put("Status",fmState);
					map.put("FamKd",Fmkd);
					map.put("LockSt",fmLock);
					map.put("JFSt",fmJF);
					map.put("valTemp",FmTemp);
					map.put("RoomTemp",FmRoomTemp);
					map.put("HTemSet",hTemSet);
					map.put("mTemSet",mTemSet);
					map.put("LTemSet",lTemSet);
					map.put("RecordTime",date);
					map.put("Tqyb",tqyb);
					map.put("ValAd",FmID);
					handerService.UpdateFmInfo(map);
				}
				Calendar cale = null;
				cale = Calendar.getInstance();
				String year = String.valueOf(dateYear.get(Calendar.YEAR));
				int yf = cale.get(Calendar.MONTH) + 1;
				Map<String, Object> map1= new HashMap<String, Object>();
				map1.put("FmID", FmID);
				map1.put("fmState", fmState);
				map1.put("Fmkd", Fmkd);
				map1.put("fmLock", fmLock);
				map1.put("FmTemp", FmTemp);
				map1.put("FmRoomTemp", FmRoomTemp);
				map1.put("hTemSet", hTemSet);
				map1.put("mTemSet", mTemSet);
				map1.put("lTemSet", lTemSet);
				map1.put("date", date);
				map1.put("tqyb", tqyb);
				if (year.equals("2018") || year.equals("2019") && yf < 4) {
					map1.remove("table");
					map1.put("table", "T_FmHistory18");
					handerService.InsertFmls(map1);
				} else if (year.equals("2019") && yf >= 3 || year.equals("2020") && yf < 4) {
					map1.remove("table");
					map1.put("table", "T_FmHistory19");
					handerService.InsertFmls(map1);

				} else if (year.equals("2020") && yf >= 3 || year.equals("2021") && yf < 4) {
					map1.remove("table");
					map1.put("table", "T_FmHistory20");
					handerService.InsertFmls(map1);
				} else if (year.equals("2021") && yf >= 3 || year.equals("2022") && yf < 4) {
					map1.remove("table");
					map1.put("table", "T_FmHistory21");
					handerService.InsertFmls(map1);
				}
				if (MapUtilsSkq.getMapUtils().get("skqfmid") != null
						&& MapUtilsSkq.getMapUtils().get("skqfmid").equals("" + FmID + "")) {
					logs.info("skq读阀阀门地址----" + MapUtilsSkq.getMapUtils().get("skqfmid"));
					// 获取刷卡阀门状态
					MapUtilsSkq.getMapUtils().add("df", fmState);
					// 获取刷卡阀门地址
					MapUtilsSkq.getMapUtils().add("fmID", fmID);
				}
				// 获取刷卡阀门状态
				// MapUtilsSkq.getMapUtils().add("df", fmState);
				// // 获取刷卡阀门地址
				// MapUtilsSkq.getMapUtils().add("fmID", fmID);

				if (MapUtilsDf.getMapUtils().get("dFmParam") != null
						&& MapUtilsDf.getMapUtils().get("dFmParam").equals("" + FmID + "")) {
					MapUtilsDf.getMapUtils().add("dFm", "success");
				} else if (MapUtilsDf.getMapUtils().get("PlDF") != null
						&& MapUtilsDf.getMapUtils().get("PlDF").equals("sj")) {
					MapUtilsDf.getMapUtils().add("PldFm", "success");
				}
				logs.info("读阀成功");
		

		} else {
			MapUtilsDf.getMapUtils().add("dFm", "fail");
			logs.info("读阀失败");
		}
	}

	// 当执行开关指令时候执行
	public void kg(byte[] base) {
		logs.info("执行开关指令接收数据：" + Utils.bytesToHexString(base));
		DatabaseUtil dbUtil = DatabaseUtil.getInstance();
		Connection conncK = dbUtil.getConnection();
		// 获取发送的时间
		// 转换为十六进制
		String stringH = Utils.bytesToHexString(base);
		if (stringH != null) {
			String stringHandler = CzUtil.Uppercase(stringH).toString();
			// 截取效验数据
			String jy = CzUtil.getJy(stringHandler);
			// 判断开始和结束
			String start = null;
			String end = null;
			start = stringHandler.charAt(0) + "" + stringHandler.charAt(1);
			end = stringHandler.charAt(stringHandler.length() - 2) + ""
					+ stringHandler.charAt(stringHandler.length() - 1);
			String je = CzUtil.getJe(stringHandler);
			String string = MapUtils.getMapUtils().get("param");

			if (string != null) {
				// 截取状态
				String Status = stringHandler.substring(stringHandler.length() - 6, stringHandler.length() - 4);

				if (string.equals("kFm")) {
					// 截取阀门ID
					String sub = stringHandler.substring(16, 24);
					// 把十六进制数，转换为十进制
					int pm = Integer.parseInt("" + sub + "", 16);
					if (start.equals("F0") && end.equals("FF") && je.equals("" + jy + "")) {
						logs.info("开阀成功：" + stringHandler);
						if (Status.equals("00")) {
							String params = "kFm";
							
							handerService.UpdateStatus("开", pm);
							
								
								logs.info("开阀是否成功====" + rs);
								if (MapUtils.getMapUtils().get("kfSuc") != null && rs == 1
										&& MapUtils.getMapUtils().get("kfSuc").equals("" + pm + "")) {
									// MapUtils.getMapUtils().add("kfSt",
									// "1");
									MapUtils.getMapUtils().add(params, "success");
								} else {
									MapUtils.getMapUtils().add("sb", "fail");

								}
								logs.info("开阀是否成功====" + rs);
								MapUtils.getMapUtils().add("Kfsuc", "kf");
								logs.info("开阀成功");


						} else {
							MapUtils.getMapUtils().add("sb", "fail");
							logs.info("开阀失败");
						}

					} else {
						MapUtils.getMapUtils().add("sb", "fail");
						logs.info("开阀失败");
					}
				}
				if (string.equals("PlKFm")) {
					// 截取区管ID
					String subQg = stringHandler.substring(8, 16);
					String params = "PlKFm";
					if (start.equals("F0") && end.equals("FF") && je.equals("" + jy + "")) {
						logs.info("批量开阀成功：" + stringHandler);
						if (Status.equals("00")) {

							handerService.PlUpdateStatus("开", subQg);

								if (MapUtils.getMapUtils().get("PlKf").equals("" + subQg + "")) {
									MapUtils.getMapUtils().add(params, "success");
								}
								logs.info("批量开阀成功");


						} else {
							MapUtils.getMapUtils().add("sb", "fail");
							logs.info("批量开阀失败");
						}
					} else {
						MapUtils.getMapUtils().add("sb", "fail");
						logs.info("批量开阀失败");
					}
				}
				if (string.equals("PlGfm")) {
					// 截取区管ID
					String subQg = stringHandler.substring(8, 16);
					String params = "PlGfm";
					if (start.equals("F0") && end.equals("FF") && je.equals("" + jy + "")) {
						logs.info("批量关阀成功：" + stringHandler);
						if (Status.equals("00")) {
							
							handerService.PlUpdateStatus("关", subQg);
							
								if (MapUtils.getMapUtils().get("PlGf").equals("" + subQg + "")) {

									MapUtils.getMapUtils().add(params, "success");
								}
								logs.info("批量关阀成功");

						} else {
							MapUtils.getMapUtils().add("sb", "fail");
							logs.info("批量关阀失败");
						}
					} else {
						MapUtils.getMapUtils().add("sb", "fail");
						logs.info("批量关阀失败");
					}

				}
				if (string.equals("gFm")) {
					// 截取区管ID
					String sub = stringHandler.substring(16, 24);
					// 把十六进制数，转换为十进制相加
					int pm = Integer.parseInt("" + sub + "", 16);
					if (start.equals("F0") && end.equals("FF") && je.equals("" + jy + "")) {
						logs.info("关阀成功：" + stringHandler);
						if (Status.equals("00")) {
							String params = "gFm";
							
							 handerService.UpdateStatus("关", pm);

								if (MapUtils.getMapUtils().get("gfSuc").equals("" + pm + "")) {
									MapUtils.getMapUtils().add(params, "success");
								} else {
									MapUtils.getMapUtils().add("sb", "fail");
								}
								logs.info("关阀是否成功====" + rs);
								MapUtils.getMapUtils().add("Gfsuc", "Gf");
								logs.info("关阀成功");
						

						} else {
							MapUtils.getMapUtils().add("sb", "fail");
							logs.info("关阀失败");
						}
					} else {
						MapUtils.getMapUtils().add("sb", "fail");
						logs.info("关阀失败");
					}
				}

				if (string.equals("FsCs")) {
					String params = "FsCs";
					if (start.equals("F0") && end.equals("FF") && je.equals("" + jy + "")) {
						if (Status.equals("00")) {

							MapUtils.getMapUtils().add(params, "success");
							logs.info("发送参数成功");
						} else {
							MapUtils.getMapUtils().add("sb", "fail");
							logs.info("发送参数失败");
						}
					} else {
						MapUtils.getMapUtils().add("sb", "fail");
						logs.info("发送参数失败");
					}
				}

			} else {
				MapUtils.getMapUtils().add("sb", "fail");
				logs.info("失败");
			}
		}
		try {
			DatabaseUtil.close(rstK, psK, conncK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 当连接进入空闲状态时调用̬
	 */
	@Override
	public void sessionIdle(IoSession session, IdleStatus status) throws Exception {
		logs.info("当前连接" + session.getRemoteAddress() + "处于空闲状态:{}" + status);
		// 新增关闭session
		super.sessionIdle(session, status);
		session.close();
	}

	/**
	 * 当消息已经送给客户端后触发此方法
	 */
	@Override
	public void messageSent(IoSession session, Object message) throws Exception {
		logs.info("服务器发送给" + session.getRemoteAddress() + "的消息:" + message);
	}

	/**
	 * 当关闭时调用
	 */
	@Override
	public void sessionClosed(IoSession session) throws Exception {
		@SuppressWarnings("deprecation")
		CloseFuture closeFuture = session.close(true);
		closeFuture.addListener(new IoFutureListener<IoFuture>() {
			public void operationComplete(IoFuture future) {
				if (future instanceof CloseFuture) {
					((CloseFuture) future).setClosed();
					logs.info("sessionClosed CloseFuture setClosed-->" + future.getSession().getId());
				}
			}
		});
		// 新增关闭session
		super.sessionClosed(session);
		sessionMap.remove(session);
		logs.info("关闭当前session：" + session.getId() + session.getRemoteAddress() + "..已移除");
	}

}
