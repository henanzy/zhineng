package com.hnzy.hot.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hnzy.hot.pojo.User;
import com.hnzy.hot.service.UserService;
import com.hnzy.hot.service.YhInfoService;
import com.hnzy.hot.util.MD5Util;
import com.hnzy.hot.util.StringUtil;

import net.sf.json.JSONObject;


@Controller
@RequestMapping("user")
public class UserController {
	
	@Autowired
	private UserService userServer;
	
	@Autowired
	private YhInfoService yhServer;
	@ResponseBody
	@RequestMapping("/login")
	public JSONObject login(HttpSession session,String username,String password,HttpServletRequest request) throws UnsupportedEncodingException{
		JSONObject jsonObject= new JSONObject();
		if (StringUtil.isNoEmpty(username) && StringUtil.isNoEmpty(password)) {
			username=new String(username.getBytes("ISO-8859-1"),"utf-8")+"";
			password=new String(password.getBytes("ISO-8859-1"),"utf-8")+"";
			password=MD5Util.string2MD5(password);
			System.out.println(password);
			User info = userServer.findUserByNameAndMD5(username, password);			
			if(info!=null){
				
				request.getSession().setAttribute("admins", info);
				request.getSession().setAttribute("UserName", info.getUserName());
				request.getSession().setAttribute("PassWord", info.getPassword());
				request.getSession().setAttribute("ID", info.getId());
				
				jsonObject.put("msg","0");
				
			
		}else {

				jsonObject.put("msg", "1"); 
			}

		}
		return jsonObject;
	}
	
	@RequestMapping("updapwd")
	@ResponseBody
	public String updapwd(HttpSession session,HttpServletRequest request,String oldpassword ,String newpassword,String username) throws UnsupportedEncodingException {
//		JSONObject jsonObject=new JSONObject();
		       username=new String(username.getBytes("ISO-8859-1"),"utf-8");
				
				String password11=MD5Util.string2MD5(oldpassword);
				String password12=MD5Util.string2MD5(newpassword);	
				String msg="";
				Integer ID=(Integer) session.getAttribute("ID");

				
				
					if (password11.equals(userServer.findUserPass(ID))) {  
						User user =new User();
						user.setId(ID);
						user.setUserName(username);
						user.setPassword(password12);
						userServer.update(user);
						msg="0";
					}else{
						msg="1";
					} 

				return msg;
	}
	
	//新增登录用户
	@ResponseBody
	@RequestMapping("addYh")
	public JSONObject addYh(HttpServletRequest request,String username,String password) throws UnsupportedEncodingException{
		 username=new String(username.getBytes("ISO-8859-1"),"utf-8");
		JSONObject json=new JSONObject();
		 //根据用户名字查找用户是否存在
		 User user=userServer.findByName(username);
		 if(user!=null){
			 //用户名称已存在
			 json.put("msg","0");
		 }else{
			  password=MD5Util.string2MD5(password);
			 userServer.InsUsePass(username, password);
			 json.put("msg","1");
		 }
		 
		return json;
		
	}	
	
		@RequestMapping("/toLogin")
		public String tologin(){
			return"index";
		}
    	@RequestMapping("/home")
    	public String home(HttpServletRequest reqeust,String fl){
    		reqeust.setAttribute("fl",fl);
    		reqeust.setAttribute("YhList1",yhServer.szt(null));
    		return "home";
    	}
    	//跳转到主页面
    			@RequestMapping("ZHome")
    			public String ZHome(){
    			
    				return "navi";
    			}
    			
    			//跳转到主页面
    			@RequestMapping("map")
    			public String map(){
    			
    				return "map";
    			}
    	@RequestMapping("/left")
    	public String left(HttpServletRequest reqeust,String fl){
    		reqeust.setAttribute("fl",fl);
    		return "left";
    	}

    	@RequestMapping("/error")
    	public String error(){
    		return "error";
    	}

    	@RequestMapping("/form_elements")
    	public String form_elements(){
    		return "ZhiNeng/form_elements";
    	}
    	@RequestMapping("/yunxzk")
    	public String yunxzk(){
    		return "ZhiNeng/yunxzk";
    	}
    	@RequestMapping("/tongjfx")
    	public String tongjfx(){
    		return "ZhiNeng/tongjfx";
    	}
    	@RequestMapping("/yunxsj")
    	public String yunxsj(){
    		return "ZhiNeng/Shuju/yunxsj";
    	}

    	@RequestMapping("/guzxx")
    	public String guzxx(){
    		return "ZhiNeng/Shuju/guzxx";
    	}
   	    @RequestMapping("/caozrz")
    	public String caozrz(){
    		return "ZhiNeng/Shuju/caozrz";
    	}
   	    
   	   @RequestMapping("/qugxx")
	    public String qugxx(){
	    	return "ZhiNeng/shebei/qugxx";
	    }
   	    @RequestMapping("/rebxx")
	    public String rebxx(){
	    	return "ZhiNeng/shebei/rebxx";
	    }
   	    @RequestMapping("/shuakaxx")
	    public String shuakaxx(){
	    	return "ZhiNeng/shebei/shuakaxx";
	    }
    	@RequestMapping("/jizqxx")
	    public String jizqxx(){
	    	return "ZhiNeng/shebei/jizqxx";
	    }
    	@RequestMapping("/xiaoqxx")
	    public String xiaoqxx(){
	    	return "ZhiNeng/yonghu/xiaoqxx";
	    }
    	@RequestMapping("/yezxx")
	    public String yezxx(){
	    	return "ZhiNeng/yonghu/yezxx";
	    }
    	@RequestMapping("/beizlb")
	    public String beizlb(){
	    	return "ZhiNeng/yonghu/beizlb";
	    }
    	@RequestMapping("/shebgl")
    	public String shebgl(){
    		return "ZhiNeng/shebgl";
    	}
    	@RequestMapping("/xitsz")
    	public String xitsz(){
    		return "ZhiNeng/xitsz";
    	}
    	@RequestMapping("/caidsz")
    	public String caidsz(){
    		return "ZhiNeng/caidsz";
    	}
    	@RequestMapping("/rebxx2")
    	public String rebx2(){
    		return "rebiao/rebwh/rebxx2";
    	}
    	@RequestMapping("/qugxx2")
    	public String qugxx2(){
    		return "rebiao/rebwh/qugxx2";
    	}
    	@RequestMapping("/jizqxx2")
    	public String jizqxx2(){
    		return "rebiao/rebwh/jizqxx2";
    	}
    	@RequestMapping("/rebdz2")
    	public String rebdz2(){
    		return "rebiao/rebwh/rebdz2";
    	}
    	@RequestMapping("/yicfx")
    	public String yicfx(){
    		return "rebiao/yicfx";
    	}
    	@RequestMapping("/shujbb")
    	public String shujbb(){
    		return "rebiao/shujbb";
    	}
    	@RequestMapping("/dangqxx")
    	public String dangqxx(){
    		return "rebiao/dangqxx";
    	}
    	//新建工单
    	@RequestMapping("/xinxgl")
    	public String xinxgl(){
    		return "rebiao/xinxgl";
    	}
    	@RequestMapping("/shujgz")
    	public String shujgz(){
    		return "rebiao/shujgz";
    	}
    	//统计分析
    	@RequestMapping("/tongjfx2")
    	public String tongjfx2(){
    		return "Kefu/tongjfx2";
    	}
    	//客户资料
    	@RequestMapping("/kehzl")
    	public String kehzl(){
    		return "Kefu/kehzl";
    	}
    	//新建工单
    	@RequestMapping("/xinjgd")
    	public String xinjgd(){
    		return "Kefu/xinjgd";
    	}
    	//工单审核
    	@RequestMapping("/gongdsh")
    	public String gongdsh(){
    		return "Kefu/gongdsh";
    	}
    	//工单监控
    	@RequestMapping("/gongdjk")
    	public String gongdjk(){
    		return "Kefu/gongdjk";
    	}
    	//参数设置
    	@RequestMapping("/canssz")
    	public String canssz(){
    		return "Kefu/canssz";
    	}
    	//换热站运行管理
    	@RequestMapping("/yunxgl2")
    	public String yunxgl2(String type){
    		return "huanre/yunxgl2";
    	}
    	/*企业条例国家法规*/
    	@RequestMapping("/qiytl")
    	public String qiytl(String type){
    		return "zhishiku/qiytl";
    	}
    	

    	/*企业条例国家法规*/
    	@RequestMapping("/guojfg")
    	public String guojfg(String type){
    		return "zhishiku/guojfg";
    	}
    	
    	/*企业条例行业知识*/
    	@RequestMapping("/hangyzs")
    	public String hangyzs(String type){
    		return "zhishiku/hangyzs";
    	}
    	
    	/*企业条例行业知识*/
    	@RequestMapping("/xitsm")
    	public String xitsm(String type){
    		return "zhishiku/xitsm";
    	}
    	
    	/*企业条例行业知识*/
    	@RequestMapping("/wentjd")
    	public String wentjd(String type){
    		return "zhishiku/wentjd";
    	}
    	

    	/*员工定位*/
    	@RequestMapping("/shisdw")
    	public String shisdw(){
    		return "dingwei/shisdw";
    	}
    	/*历史轨迹*/
    	@RequestMapping("/lisgj")
    	public String lisgj(){
    		return "dingwei/lisgj";
    	}
    	
}