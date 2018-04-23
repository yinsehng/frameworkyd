package com.neusoft.server.webservice;

import org.springframework.context.ApplicationContext;


public class SuperService {
	
	/***
	 * 通用service接口
	 * 入参格式 ydjy@DMP_021^2222|222|2|2
	 * **/
	public String handle(String inputdata){
		return "0k";
	}
	
	public String[] handles(String input[]){
		return new String[]{"111","2222"};
	}
}
