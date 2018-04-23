package com.neusoft.server.socket.business.zjjs;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neusoft.util.SiInterface;
@Service
public class ZjjsHandler {
	@Autowired
	public SiInterface siInterface;
	public String url="http://172.19.8.35:6666/eapdomain/si/SiInterfaceDrugAction.do?method=siInterface&eap_username=admin&eap_password=1";
	public ZjjsHandler(String url){
		this.url=url;
	}
	
	public ZjjsHandler(){}
	public SiInterface getSiInterface() {
		return siInterface;
	}

	public void setSiInterface(SiInterface siInterface) {
		this.siInterface = siInterface;
	}

	public String businessHandle(String s){
		//s=900019^22222^232323^2332
		//调用医保接口服务
		HashMap<String,String> hm=new HashMap<String,String>();
		
		String data[]=s.split("\\^");
	    String dllParam="888888888888||||"+data[1]+"||"; //68F728AC6FF8||||0001||
	    String dllparm="";
	    String cardInfo=data[8];
	    
	    hm.put("inputData", s);
	    hm.put("dllParam",dllParam);
		hm.put("dllparm",dllparm); 
		hm.put("cardInfo",cardInfo);
		
		String retval=siInterface.send(this.url, hm);//url  |inputdata调用接口
	    String rts[]=retval.split("\\^");//第一位是1则异常；
	    
	    String ret="";
	    if(rts[0].equals("err")){//调用异常按照文档的异常返回格式返回
	    	ret="9999^HTTP：调用接口异常:"+rts[1]+"^99^";
	    }else{
	    	ret=retval;//没有异常直接返回医保接口返回的格式，因为该格式已经是处理过的
	    }
		return ret; 
	}
}
