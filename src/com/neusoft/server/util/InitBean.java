package com.neusoft.server.util;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ServletContextAware;

import com.neusoft.server.socket.SocketServer;
import com.neusoft.util.SetSpringContext;


/**
 * Spring初始化加载类，加载二级代码，配置表等
 * **/
public class InitBean implements InitializingBean,ServletContextAware{

	public String port;//Socket开启的端口
	public String runBeans;//自动运行的bean
	public InitBean(String port,String runBeans){
		this.port=port;
		this.runBeans=runBeans;
	}
	

	public void afterPropertiesSet()  {
		//入参格式8888|GBK,9999|GBK,1111|UTF-8,2222|GBK,3333|UTF-8,4444|GBK
		System.err.println("开启所有socket服务....");
		String[] ports=this.port.split("\\,");
		if(port==null || port.equals("")){
			System.out.println("*******无需开启的socket服务********");
		}else{
			for(String s:ports){
				String[] vs=s.split("\\|");//4444|GBK
				new SocketServer(vs[0],vs[1]).start();
			}
		}
		
		
		/***自动运行bean**/
		String beans[]=runBeans.split("\\|");
		
		ApplicationContext  ac=SetSpringContext.getCtx();
		//spring中获取相关配置bean类
		if(runBeans==null || runBeans.equals("")){
			System.out.println("*********无需自动运行的bean类**********");
		}else{
			for(String bean:beans){
//				InitRun sh=(InitRun)ac.getBean(bean);//配置
//				sh.runHandle();//执行方法；
			}
		}
		
		
	}


	@Override
	public void setServletContext(ServletContext arg0) {
		// TODO Auto-generated method stub
		
	}
	
	

}
