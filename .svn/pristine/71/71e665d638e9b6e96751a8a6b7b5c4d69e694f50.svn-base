package com.neusoft.server.socket.business.xxhq;

import java.net.Socket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neusoft.server.socket.SuperSocketHandle;

@Service("xxhq")
public class XxhqSocket implements SuperSocketHandle{
	public String localport="7087";//允许运行的端口
	@Autowired
	public XxhqHandler xxhqHandler;
	
	  
	public String socketHandle(String s,Socket socket){
		System.out.println("传人参数："+s);
		String[] inputs=s.split("\\@");//zjjsSocket@900019^22222^232323^2332
		//在这里查询配置是否该端口可以执行该bean
//		String sport=ParamBean.actionmap.get(inputs[0]);//根据业务 bean名称获取是否允许执行的端口号
		if(localport.equals(socket.getLocalPort()+"")){//如果该端口允许业务
			return xxhqHandler.businessHandle(inputs[1]);
		}else{
			return "端口"+socket.getLocalPort()+"不允许执行该业务";
		}
		
	}
}
