package com.neusoft.util;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.apache.commons.httpclient.Cookie;
import org.apache.commons.httpclient.DefaultHttpMethodRetryHandler;
import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;


public class SiInterface {
	public String send(String url,HashMap<String,String> inputMap){
//		System.err.println(url);
		//定义输出参数
		String outputData = null;
		//定义状态码
		int statusCode = 0;
		//定义目标地址的内容
		String responseString = null;
		/**
		 * HttpClient 是 Apache Jakarta Common 下的子项目，用来提供高效的、最新的、功能丰富的支持 HTTP 协议的客户端编程工具包，
		 * 并且它支持 HTTP 协议最新的版本和建议
		 * （1）实现了所有 HTTP 的方法（GET,POST,PUT,HEAD 等） 　　
		 * （2）支持自动转向 　　
		 * （3）支持 HTTPS 协议 　　
		 * （4）支持代理服务器等
		 * 使用 HttpClient 需要以下 6 个步骤： 　　
		 * 1. 创建 HttpClient 的实例 　　
		 * 2. 创建某种连接方法的实例，在这里是 GetMethod。在 GetMethod 的构造函数中传入待连接的地址 　　
		 * 3. 调用第一步中创建好的实例的 execute 方法来执行第二步中创建好的 method 实例 　　
		 * 4. 读 response 　　
		 * 5. 释放连接。无论执行方法是否成功，都必须释放连接 　　
		 * 6. 对得到后的内容进行处理 
		 */
		//创建 HttpClient 的实例 
		HttpClient client = new HttpClient();
		
		//从 HTTPClient 中取得所有的 Cookie 
		Cookie[] cookies = client.getState().getCookies();
		//设置服务器地址和端口
		client.getHostConfiguration().setHost("http://localhost", 8888);
		
		
		/**
		 * 2、调用交易
		 */
     	//利用url构造PostMethod
	    PostMethod post = new PostMethod(url);	 //获取配置文件中的url   
	    post.setRequestHeader("Cookie", cookies.toString());
	    post.addRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=utf-8");
//		String data[]=inputData.split("\\^");
	    
//	    String dllParam="888888888888||||"+data[1]+"||"; //68F728AC6FF8||||0001||
//	    String dllparm="";
//	    String cardInfo=data[8];
	    
	    
		//设置交易输入参数
	    Iterator iter = inputMap.entrySet().iterator();
 		while (iter.hasNext()) {
 			Map.Entry entry = (Map.Entry) iter.next();
 			String key = (String)entry.getKey();
 			String val = (String)entry.getValue();
 			post.setParameter(key, val);
 		}
//		post.setParameter("inputData", inputData);
//		post.setParameter("dllParam",dllParam);
//		post.setParameter("dllparm",dllparm); 
//		post.setParameter("cardInfo",cardInfo); 
		
					
		//使用系统提供的默认的恢复策略,该策略在碰到IOException异常的时候将自动重试3次 
		post.getParams().setParameter(HttpMethodParams.RETRY_HANDLER,new DefaultHttpMethodRetryHandler()); 
		try{
			statusCode = client.executeMethod(post);
			//如果服务端返回地址重定向状态，需重新执行一下新的请求  
			if(statusCode == HttpStatus.SC_MOVED_TEMPORARILY){
				Header responseHeader = post.getResponseHeader("location");
				if(responseHeader != null){
					String location = post.getResponseHeader("location").getValue();
					post = new PostMethod(location);	    
				    post.setRequestHeader("Cookie", cookies.toString());
				    post.addRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=utf-8");
				    					
					//设置交易输入参数
				    Iterator iter2 = inputMap.entrySet().iterator();
			 		while (iter2.hasNext()) {
			 			Map.Entry entry = (Map.Entry) iter2.next();
			 			String key = (String)entry.getKey();
			 			String val = (String)entry.getValue();
			 			post.setParameter(key, val);
			 		}
//				    post.setParameter("inputData", inputData);
//					post.setParameter("dllParam",dllParam);
//					post.setParameter("dllparm",dllparm); 
//					post.setParameter("cardInfo",cardInfo); 
					statusCode = client.executeMethod(post);
				}
			}
			if(statusCode != HttpStatus.SC_OK){
//				Exception e = new Exception("HTTP：调用交易出错，错误原因:" + post.getStatusText());
//				throw e;
				return "err^HTTP：调用交易出错，错误原因:" + post.getStatusText();
			} 
			responseString = post.getResponseBodyAsString();
			
		}catch(Exception e){
//			throw new Exception("HTTP：调用接口异常:"+e.getMessage());
			return "err^HTTP：调用接口异常:"+e.getMessage();
		}finally{
			post.releaseConnection(); 
		}
	    
		return responseString;
	}
	
	public static void main(String[] args) {
//		try {
//			System.out.println(SiInterface.send("172.16.12.10:7011","2410^9997^001^00^20160901152231199973460112^229900^83789777|888877772|12|20160901152311|||0|0|1|0|001|||^1^P00003606|00003606|33^P00003606|00003606|33^"));
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
	}
}
