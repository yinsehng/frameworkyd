package com.neusoft.server.socket.business.zjjs;

import java.net.Socket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.neusoft.server.socket.SuperSocketHandle;

@Controller
public class ZjjsSocket  implements SuperSocketHandle{
	public String localport="22222";
	@Autowired
	public ZjjsHandler zjjsHandler;
	
	public ZjjsHandler getZjjsHandler() {
		return zjjsHandler;
	}
	public void setZjjsHandler(ZjjsHandler zjjsHandler) {
		this.zjjsHandler = zjjsHandler;
	}
	 
	public ZjjsSocket(String localport ){
		this.localport=localport;
	}
	
	
	public ZjjsSocket(){
	}
	
	
	
	
	public String socketHandle(String s,Socket socket){
		String[] inputs=s.split("\\@");//zjjsSocket@900019^22222^232323^2332
		//在这里查询配置是否该端口可以执行该bean
//		String sport=ParamBean.actionmap.get(inputs[0]);//根据业务 bean名称获取是否允许执行的端口号
//		String sport=;//允许执行的端口
		if(localport.equals(socket.getLocalPort()+"")){//如果该端口允许业务
			return zjjsHandler.businessHandle(inputs[1]);
		}else{
			return "999999^端口"+socket.getLocalPort()+"不允许执行该业务^99^";
		}
		
	}
	
	
	

}
