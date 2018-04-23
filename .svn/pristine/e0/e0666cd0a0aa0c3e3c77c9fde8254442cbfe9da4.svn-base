package com.neusoft.server.socket;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.net.Socket;
import java.net.SocketException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;

import com.neusoft.util.SetSpringContext;


public class ThreadSocket extends Thread{
	private static final Logger log = Logger.getLogger(ThreadSocket.class);//日志文件
	private Socket socket;  
	private InputStream  is;
	////////////////以上输入一下输出//////////////////
	private OutputStream os;
	private String key;
	private String charset;
    public ThreadSocket(Socket socket,String charset,String key) {  
        this.socket = socket;
        this.key=key;
        this.charset=charset;
    }  
      
    public void run() {
        try {  
        	is=socket.getInputStream();
        	/////////////////以上是读，以下是写/////////////////////
        	os=socket.getOutputStream();
        	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        while(true){
	        	try{
	        		socket.sendUrgentData(0xFF); // 发送心跳包
		        	int firstChar = is.read();   //只有接收一次才能确定接收的字节数
		        	int length = is.available(); //本次socket接收的字节数，  
		        	byte[] bb = new byte[length+1];   
		        	bb[0] = (byte)firstChar;   //将第一次接收的赋值进来
		        	if(is.read(bb,1,length)!=-1){
		        		String input=new String(bb,this.charset);
//		        		System.out.println(sdf.format(new Date())+"-"+key+"-input："+input);
		        		log.info("input-"+input);
		        		//哈尔滨药店购药特殊处理如果端口是7131执行drugSocket
		        		if(socket.getLocalPort()==7131){
		        			input="drugSocket@"+input;
		        		}
		        		
		        		String [] inputs=input.split("\\@");//第一位是交易bean，第二位是参数
		        		String output=null;
		        		if(inputs.length<2){
		        			output="入参格式有误，请核对后再试！！！";
		        		}else{
		        			ApplicationContext  ac=SetSpringContext.getCtx();
		        			//spring中获取相关配置bean类
		        			SuperSocketHandle sh=(SuperSocketHandle)ac.getBean(inputs[0]);//配置
		        			output=sh.socketHandle(input,socket);//执行标准方法获取出参
		        		}
		        		
//		        		System.out.println(sdf.format(new Date())+"-"+key+"-output："+output);
		        		
		        		byte[] out=output.getBytes(this.charset);//返回报文字节
		        		int le=out.length;//字节长度
		        		String les=le+"";//长度变成string
		        		int qs=6-les.length();//共6位缺少的位数
		        		for(int i=0;i<qs;i++){
		        			les="0"+les;//前位补0
		        		}
		        		output=les+output;//将长度加入报文前
		        		
		        		log.info("output-"+output);
		        		os.write(output.getBytes(this.charset));
		        		os.flush();
		        	}else{
		        		continue;
		        	}
	        	}catch(SocketException e){
//	        		e.printStackTrace();
	        		socket.close();
	        		String key = socket.getInetAddress().getHostAddress() + ":"+ socket.getPort();
	        		log.info("链接: " + key+"断开");
	        		return;
	        	}catch(Exception e){
	        		e.printStackTrace();  
	    	        try {
	    	        	StringWriter sw = new StringWriter();   
	    	            e.printStackTrace(new PrintWriter(sw, true));   
	    	            String strs = sw.toString();   
	    				os.write(strs.getBytes(this.charset));
	    				os.flush();
	    			} catch (Exception e1) {
	    				e1.printStackTrace();
	    			}
	        	}
	        }
	        
	        
        } catch(Exception e) {  
            e.printStackTrace();  
//	        System.out.println("断开链接socket："+key);
	        log.info("断开链接socket："+key);
	        try {
	        	StringWriter sw = new StringWriter();   
	            e.printStackTrace(new PrintWriter(sw, true));   
	            String strs = sw.toString();   
				os.write(strs.getBytes(this.charset));
				os.flush();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
        }finally{
        	try {
				os.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
        	try {
				is.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
        	try {
        		socket.close();
        	} catch (IOException e) {
        		e.printStackTrace();
        	}
        }  
    }  

}
