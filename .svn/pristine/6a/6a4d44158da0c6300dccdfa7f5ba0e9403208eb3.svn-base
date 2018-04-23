package com.neusoft.server.socket;

import java.net.ServerSocket;
import java.net.Socket;

import org.apache.log4j.Logger;


public class SocketServer extends Thread{
	private static final Logger log = Logger.getLogger(SocketServer.class);//日志文件
	private int port;
//	private ServerSocket server;
	private String charset;
	
	public SocketServer(String p,String charset) {
		try {
			this.port=Integer.parseInt(p);
			this.charset=charset;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int getPort() {
		return port;
	}

	public void setPort(int port) {
		this.port = port;
	}


	public String getCharset() {
		return charset;
	}

	public void setCharset(String charset) {
		this.charset = charset;
	}

	public void run() {
		try{
			ServerSocket server = new ServerSocket(port);
			log.info("温馨提示：服务开启成功,端口号为: " + port+"，字符集为："+charset);
			while (true) {
				handle(server.accept());
			}
		}catch(Exception e){
			
		}
	}

	private void handle(Socket socket)  {
		String key = socket.getInetAddress().getHostAddress() + ":"+ socket.getPort();
		log.info("端口："+this.port+",字符集："+this.charset+",接入链接socket: " + key);
		new ThreadSocket(socket,charset,key).start();

	}

}
